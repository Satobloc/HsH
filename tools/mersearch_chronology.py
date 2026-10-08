"""Conservative chronology extraction for Mersearch, not authority or proof."""
from __future__ import annotations
import re
from dataclasses import dataclass, field
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

# Provisional, intentionally broad, overlapping windows sourced from the SAT
# historical timeline. Recalibrate against independently timestamped dialogue.
VERSIONS = [
 ("stringing-along", r"\bstringing[\s-]+along\s+theory\b", "2024-01-01", "2025-06-30"),
 ("toy-theory", r"\btoy\s+theory\b", "2024-01-01", "2025-12-31"),
 ("sat-2", r"\bSAT\s*2[.]0\b", "2024-11-01", "2025-04-30"),
 ("sat-mark-iv-2", r"\bSAT\s+Mark\s+IV[.]2\b", "2025-03-01", "2025-06-30"),
 ("sat-mark-iv", r"\bSAT\s+Mark\s+IV\b(?![.]2)", "2025-03-01", "2025-06-30"),
 ("sat-mark-v", r"\bSAT\s+Mark\s+V\b", "2025-04-01", "2025-07-31"),
 ("sat-x", r"\bSAT[\s-]+X\b(?!Y)", "2025-05-01", "2025-08-31"),
 ("sat-xy", r"\bSAT[\s-]+XY\b", "2025-05-01", "2025-08-31"),
 ("sat-z", r"\bSAT[\s-]+Z\b", "2025-06-01", "2025-09-30"),
 ("sat-o", r"\bSAT[.]O(?:\d+)?\b|\bSAT\s+O\b", "2025-06-01", "2025-09-30"),
 ("chronophysical", r"\bchronophysic(?:al|s)\b", "2025-08-01", "2025-12-31"),
 ("sato-blockwave", r"\b(?:SATO[\s/.-]*Blockwave|SAT\s+Blockwave)\b", "2025-09-01", "2026-02-28"),
 ("hsh", r"\bH\s*[(]\s*s\s*[)]\s*H\b", "2026-05-01", "2026-12-31"),
]
RULES = [(n,re.compile(p,re.I),lo,hi) for n,p,lo,hi in VERSIONS]
ISO_DATE = re.compile(r"(?<!\d)((?:19|20)\d\d)[-/]([01]?\d)[-/]([0-3]?\d)(?!\d)")
US_DATE = re.compile(r"(?<!\d)([01]?\d)[-_]([0-3]?\d)[-_]((?:19|20)\d\d)(?!\d)")
RETRO = re.compile(r"\b(previously|earlier|historical|history|timeline|roundup|retrospective|originally|renamed|back in|used to call)\b",re.I)
COMPILATION = re.compile(r"history|roundup|timeline|versioning|compilation|archive[_ -]?index",re.I)

def valid(y,m,d):
 try:return datetime(int(y),int(m),int(d)).date().isoformat()
 except (ValueError,TypeError):return ""

def archive_date(path):
 for part in Path(path).parts:
  for m in ISO_DATE.finditer(part):
   if valid(*m.groups()):return valid(*m.groups())
  for m in US_DATE.finditer(part):
   a,b,c=m.groups()
   if valid(c,a,b):return valid(c,a,b)
 return ""

def message_date(timestamp):
 if not timestamp:return ""
 try:
  d=datetime.fromisoformat(str(timestamp).replace("Z","+00:00"))
  return d.astimezone(timezone.utc).date().isoformat() if d.tzinfo else ""
 except (ValueError,TypeError):return ""

def eras(start,end):
 if not start or not end:return []
 out=[]
 for year in range(int(start[:4]),int(end[:4])+1):
  for tag,lo,hi in [("early","01-01","04-30"),("mid","05-01","08-31"),("late","09-01","12-31")]:
   if f"{year}-{lo}"<=end and f"{year}-{hi}">=start:out.append(f"{tag}-{year}")
 return out

@dataclass
class Chronology:
 path:str
 kind:str=""
 dates:set[str]=field(default_factory=set)
 messages:set[str]=field(default_factory=set)
 captures:set[str]=field(default_factory=set)
 versions:dict[str,dict[str,Any]]=field(default_factory=dict)
 evidence:list[dict[str,str]]=field(default_factory=list)
 retrospective:bool=False

 def mark(self,kind,value,locator,excerpt="",confidence="contextual"):
  if len(self.evidence)<36:self.evidence.append(dict(kind=kind,value=value,locator=locator,excerpt=excerpt[:160],confidence=confidence))

 def observe(self,text,locator="",kind="",timestamp="",capture_timestamp=""):
  if kind:self.kind=kind
  if capture_timestamp:
   d=message_date(capture_timestamp)
   if d:self.captures.add(d);self.mark("capture_timestamp",d,locator,confidence="snapshot-only")
  if kind in ("conversation-message","notebooklm-message"):
   d=message_date(timestamp)
   if d:self.messages.add(d);self.mark("message_timestamp",d,locator,confidence="direct")
  retro=bool(RETRO.search(text));self.retrospective |= retro
  for m in ISO_DATE.finditer(text):
   d=valid(*m.groups())
   if d:self.dates.add(d);self.mark("date_mentioned",d,locator,text[max(0,m.start()-36):m.end()+36])
  for name,pat,lo,hi in RULES:
   for m in pat.finditer(text):
    row=self.versions.setdefault(name,dict(name=name,era_start=lo,era_end=hi,active_mentions=0,historical_mentions=0))
    row["historical_mentions" if retro else "active_mentions"]+=1
    self.mark("historical_version" if retro else "active_version_candidate",name,locator,text[max(0,m.start()-36):m.end()+36],"inferred")

 def result(self):
  mentioned=sorted(self.versions.values(),key=lambda v:(v["era_start"],v["name"]))
  active=[v for v in mentioned if v["active_mentions"]]
  dtype=("structured-conversation" if self.kind=="conversation-message" else
         "secondary-structured-export" if self.kind=="notebooklm-message" else
         "retrospective-or-compilation" if COMPILATION.search(self.path) else "unclassified-text")
  archived=archive_date(self.path)
  if self.messages:
   start,end=min(self.messages),max(self.messages);confidence="direct-message-timestamps"
  elif active and dtype!="retrospective-or-compilation":
   start=min(v["era_start"] for v in active)
   end=max(v["era_end"] for v in active)
   confidence="low-version-inference"
  else:start=end="";confidence="undetermined"
  warnings=[]
  if archived and start and archived<start:warnings.append("archive date precedes inferred origin")
  if dtype=="retrospective-or-compilation" and mentioned:warnings.append("historical compilation; version mentions may span eras")
  return dict(document_type=dtype,archive_date=archived,
   earliest_date_mentioned=min(self.dates) if self.dates else "",
   latest_date_mentioned=max(self.dates) if self.dates else "",
   captured_at=min(self.captures) if self.captures else "",
   earliest_message_at=min(self.messages) if self.messages else "",
   latest_message_at=max(self.messages) if self.messages else "",
   earliest_version_mentioned=mentioned[0]["name"] if mentioned else "",
   latest_version_mentioned=mentioned[-1]["name"] if mentioned else "",
   earliest_version_active=active[0]["name"] if active else "",
   latest_version_active=active[-1]["name"] if active else "",
   version_evidence=mentioned,estimated_origin_start=start,estimated_origin_end=end,
   date_confidence=confidence,era_labels=eras(start,end),
   retrospective_possible=self.retrospective or dtype=="retrospective-or-compilation",
   warnings=warnings,date_evidence=self.evidence)
