#!/usr/bin/env python3
"""Extract, tag, and score Nathan/user messages from raw ChatGPT conversation JSON.

Automated pre-tagging operates at three independent levels:
  1. MESSAGE: terms and discourse/style signals in the message itself.
  2. ADJACENCY: weighted nearby-message context from both speakers.
  3. CONVERSATION: a whole-conversation topic prior.

Topic/context detection may use BOTH speakers. Nathan quotation eligibility always requires
raw author.role == 'user'. Automated tags are additive triage metadata, never authority claims.
Designed for provenance triage, not theory synthesis.
"""
from __future__ import annotations
import argparse, hashlib, json, math, re, statistics
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

WORDLISTS = {
 "sat": {"sat":8,"scalar angular torsion":10,"h(s)h":10,"hsh":7,"blockwave":8,"filament":7,"filaments":7,"timesheet":10,"time surface":8,"worldline":8,"world line":8,"worldtube":9,"world tube":9,"theta4":9,"θ4":9,"torsion":5,"twist":3,"braid":4,"braids":4,"superhelix":8,"superhelical":8,"nested helix":8,"nested helices":8,"whirligig":10,"donut":6,"graticule":10,"hagalaz":10,"electrogravity":10,"interbraid":10,"finite core":8,"intersection readout":10,"intersection propagation":10,"w-axis":8,"w axis":8,"4dhh":9,"sat-o":8,"holonomy":5,"t-boson":9,"f-boson":9,"macro-bundle":8,"macro bundle":8,"strand":2,"strands":2,"my strings":5,"string theory like":4,"coil":3,"coils":3,"helical worldline":9,"particle worldline":7,"quantized holonomy":9,"filament-time":9,"timesheet drag":10},
 "physics": {"spacetime":4,"minkowski":5,"relativity":4,"general relativity":5,"gravity":3,"particle":2,"electron":3,"quark":3,"photon":3,"neutrino":3,"boson":3,"fermion":3,"mass":2,"momentum":2,"energy":1,"velocity":2,"acceleration":2,"field":1,"metric":3,"manifold":3,"dimension":2,"4d":3,"lorentz":4,"curvature":2,"topology":3,"quantum":3,"qft":4,"gauge":3,"symmetry":2,"spin":2,"phase":2,"wave":1,"cosmology":3,"black hole":4,"kerr":4,"schwarzschild":4,"dirac":4,"clifford":4,"light cone":4,"proper time":4,"world sheet":3,"worldsheet":3,"lagrangian":4,"hamiltonian":4,"action":2,"geodesic":4,"vacuum":2},
 "science": {"geology":3,"paleontology":3,"conodont":5,"stratigraphy":4,"astronomy":2,"planetary":2,"planetology":3,"biology":2,"evolution":2,"genetics":3,"chemistry":2,"molecule":2,"atom":2,"optics":3,"lens":1,"microscope":3,"tem":4,"neuroscience":3,"cognition":2,"ai":1,"computation":2,"algorithm":2,"experiment":2,"observation":1,"measurement":2,"data":1,"hypothesis":2,"model":1,"simulation":2},
 "method": {"method":3,"methodology":5,"assumption":3,"premise":3,"constraint":3,"criterion":3,"test":2,"falsif":4,"compare":2,"control":3,"baseline":3,"derive":3,"derivation":3,"formalize":3,"formalism":3,"parameter":2,"prediction":3,"evidence":3,"empirical":3,"measurement":2,"consistency":2,"contradiction":3,"dependency":3,"independent":2},
 "epistemology": {"epistem":6,"know":1,"knowledge":2,"certainty":3,"uncertain":3,"confidence":2,"claim":2,"reality":2,"real world":3,"represent":2,"interpret":2,"meaning":2,"infer":2,"inference":3,"assume":2,"plausib":2,"possible":1,"necessary":2,"sufficient":2,"ontology":4,"ontolog":4},
 "reasoning": {"reason":2,"because":1,"therefore":2,"so if":2,"if we":1,"implies":3,"entail":4,"follows":2,"relationship":2,"distinction":3,"difference":2,"instead":2,"rather than":2,"in other words":2,"which means":2,"the point is":3,"the way i see it":4},
 "ideation": {"idea":2,"maybe":2,"perhaps":2,"what if":4,"i wonder":3,"could we":2,"try":1,"possibility":2,"candidate":2,"imagine":2,"suppose":2,"consider":2,"might":1,"could be":1},
 "speculation": {"speculat":4,"hypothes":3,"conject":4,"guess":2,"maybe":2,"perhaps":2,"might":1,"could":1,"i suspect":3,"i wonder":2,"seems like":2,"looks like":2},
 "admin": {"repo":3,"repository":3,"github":3,"archive":3,"index":2,"document":2,"file":1,"folder":2,"upload":3,"download":2,"readme":3,"conversation":2,"search":1,"rewrite":2,"commit":3,"branch":3,"json":3,"pdf":2,"markdown":2}
}

# Discourse families intentionally broad. These are retrieval cues, not psychological labels.
DISCOURSE_PATTERNS = {
 "CORRECTIVE": [r"\bnot exactly\b",r"\bnot quite\b",r"\bactually\b",r"\bmore accurately\b",r"\bthat's not (?:right|accurate|what i mean)\b",r"\bwhat i mean is\b",r"\bi mean\b",r"\bcorrection\b"],
 "NEGATION_COUNTERMAND": [r"\bno[,.! ]",r"\bdon't\b",r"\bdo not\b",r"\bstop\b",r"\bforget that\b",r"\binstead\b",r"\brather than\b",r"\bmust not\b",r"\bcan't\b",r"\bcannot\b"],
 "CLARIFICATION_NUANCE": [r"\bto be clear\b",r"\bclarif",r"\bnuance",r"\bthe distinction\b",r"\bthe difference\b",r"\bspecifically\b",r"\btechnically\b",r"\bprecisely\b",r"\bin point of fact\b",r"\bmore precisely\b"],
 "HESITANCY_QUALIFICATION": [r"^\s*well[,.… ]",r"\balthough\b",r"\bhowever\b",r"\bi'm not sure\b",r"\bi am not sure\b",r"\bmy feeling is\b",r"\bthe way i see it\b",r"\bi think\b",r"\bi suppose\b",r"\bprobably\b",r"\bperhaps\b",r"\bmaybe\b"],
 "ENTHUSIASTIC_AGREEMENT": [r"\bprecisely\b",r"\bexactly\b",r"\bcorrect\b",r"\bthat's right\b",r"\bthat is right\b",r"\bi agree\b",r"^\s*yes\b",r"\byes[!,. ]"],
 "URGENCY_INSISTENCE": [r"\bmust\b",r"\bneed to\b",r"\bhave to\b",r"\bimportant\b",r"\bcrucial\b",r"\bpriority\b",r"\bfirst and foremost\b",r"\bdo this\b",r"\bnow\b"],
 "DIDACTIC_POINTED": [r"\bthe point is\b",r"\bremember\b",r"\bunderstand\b",r"\bnotice\b",r"\bthe key is\b",r"\bwhich means\b",r"\bthat means\b",r"\bby definition\b"],
 "ADVERSARIAL_CHALLENGE": [r"\bchallenge\b",r"\bwhy (?:would|should|is|are|does|do)\b",r"\bhow can\b",r"\bthat doesn't\b",r"\bthat does not\b",r"\bwrong\b",r"\bnonsense\b",r"\bcontradict"],
 "GENTLE_REDIRECTION": [r"\blet's (?:instead|focus|drop|look|try)\b",r"\bwhat about\b",r"\bmaybe (?:we|you)\b",r"\bi'd rather\b",r"\bcan we\b"],
 "COMPLAINT_FRICTION": [r"\bannoy",r"\bfrustrat",r"\bproblem with\b",r"\bwhy (?:didn't|did not|aren't|are not|isn't|is not)\b",r"\bi hate\b",r"\bridiculous\b"],
 "COARSE_EMPHASIS": [r"\bdamn\b",r"\bhell\b",r"\bshit\b",r"\bfuck\w*\b",r"\bbullshit\b"],
}


def norm_text(x:str)->str: return re.sub(r"\s+"," ",x.lower()).strip()
def extract_text(message:dict[str,Any])->str:
 parts=(message.get("content") or {}).get("parts") or []; out=[]
 for p in parts:
  if isinstance(p,str): out.append(p)
  elif isinstance(p,dict) and isinstance(p.get("text"),str): out.append(p["text"])
 return "\n".join(out).strip()

def phrase_hits(text:str,vocab:dict[str,int]):
 t=norm_text(text); score=0.; hits=[]
 for phrase,weight in vocab.items():
  # stems ending in obvious truncation are substring cues; normal phrases use boundaries.
  if phrase.endswith(("falsif","epistem","ontolog","plausib","speculat","hypothes","conject")):
   n=t.count(phrase)
  else:
   n=len(re.findall(r"(?<!\w)"+re.escape(phrase)+r"(?!\w)",t))
  if n: score += weight*(1+math.log1p(n-1)); hits.append(f"{phrase}:{n}")
 return score,hits

def length_adjust(raw,chars): return raw/max(1.,math.sqrt(max(chars,40)/160.))
def discourse_tags(text:str):
 t=norm_text(text); tags={}
 for fam,pats in DISCOURSE_PATTERNS.items():
  hits=[p for p in pats if re.search(p,t,re.I)]
  if hits: tags[fam]=len(hits)
 # Precision punctuation/structure signals.
 punct={"EM_DASH_PRECISION":text.count("—"),"PARENTHETICAL_PRECISION":text.count("(")+text.count(")"),"BRACKET_PRECISION":text.count("[")+text.count("]"),"ELLIPSIS":len(re.findall(r"(?:\.\.\.|…)",text))}
 tags.update({k:v for k,v in punct.items() if v})
 clauses=len(re.findall(r"[,;:]|\b(?:although|however|because|which|whereas|unless|while|but)\b",t))
 if len(text)>=350 and clauses>=7: tags["DENSE_NESTED_CLAUSING"]=clauses
 if len(text)>=1200: tags["LONG_FORM"]=len(text)
 return tags

def load_conversation(path:Path):
 obj=json.loads(path.read_text(encoding="utf-8"))
 if isinstance(obj,list):
  convs=[x for x in obj if isinstance(x,dict) and "mapping" in x]
  if len(convs)!=1: raise ValueError(f"Expected one conversation mapping in {path}; found {len(convs)}")
  obj=convs[0]
 title=obj.get("title") or path.stem; rows=[]
 for node_id,node in (obj.get("mapping") or {}).items():
  msg=(node or {}).get("message")
  if not isinstance(msg,dict): continue
  text=extract_text(msg)
  if not text: continue
  author=msg.get("author") or {}
  rows.append({"node_id":node_id,"message_id":msg.get("id") or node_id,"parent":node.get("parent"),"role":author.get("role"),"author_name":author.get("name"),"create_time":msg.get("create_time"),"text":text})
 rows.sort(key=lambda r:(r["create_time"] is None,r["create_time"] or 0,r["node_id"]))
 return title,rows

def score_conversation(path:Path,window:int=4):
 title,rows=load_conversation(path)
 if not rows:return []
 for r in rows:
  r.update(title=title,source_path=str(path),chars=len(r["text"]),scores={},hits={})
  for fam,vocab in WORDLISTS.items():
   raw,hits=phrase_hits(r["text"],vocab); r["scores"][fam]=length_adjust(raw,r["chars"]); r["hits"][fam]=hits
  r["message_discourse_tags"]=discourse_tags(r["text"])
  r["message_topic_tags"]=[f"MESSAGE_{k.upper()}" for k,v in r["scores"].items() if v>0]
 # conversation-level tags use all speakers and prevalence, not merely mean term density.
 conv_scores={fam:statistics.fmean([r["scores"][fam] for r in rows]) for fam in WORDLISTS}
 conv_presence={fam:sum(r["scores"][fam]>0 for r in rows)/len(rows) for fam in WORDLISTS}
 conv_tags=[f"CONVERSATION_{fam.upper()}" for fam in WORDLISTS if conv_scores[fam]>0 or conv_presence[fam]>=.01]
 conv_sat=conv_scores["sat"]; conv_phys=conv_scores["physics"]; conv_admin=conv_scores["admin"]
 prior=math.log1p(conv_sat+.35*conv_phys)-.20*math.log1p(conv_admin)
 for i,r in enumerate(rows):
  lo,hi=max(0,i-window),min(len(rows),i+window+1); idx=range(lo,hi); ws=[1/(1+abs(j-i)) for j in idx]
  def wav(fam): return sum(rows[j]["scores"][fam]*w for j,w in zip(idx,ws))/sum(ws)
  r["adjacency_scores"]={fam:wav(fam) for fam in WORDLISTS}
  r["adjacency_tags"]=[f"ADJACENT_{fam.upper()}" for fam,v in r["adjacency_scores"].items() if v>0]
  r["conversation_tags"]=conv_tags; r["conversation_scores"]=conv_scores
  r["local_sat"]=r["adjacency_scores"]["sat"]; r["local_physics"]=r["adjacency_scores"]["physics"]; r["local_science"]=r["adjacency_scores"]["science"]; r["local_admin"]=r["adjacency_scores"]["admin"]
  r["sat_evidence"]=.55*r["scores"]["sat"]+.95*r["local_sat"]+.12*r["local_physics"]-.06*r["local_admin"]+.25*prior
 # broad retrieval score: independent channels accumulate rather than one channel vetoing another.
 for r in rows:
  direct=sum(min(v,12) for k,v in r["scores"].items() if k!="admin")
  adjacent=sum(min(v,8) for k,v in r["adjacency_scores"].items() if k!="admin")
  discourse=len(r["message_discourse_tags"])
  levels=int(direct>0)+int(adjacent>0)+int(bool(conv_tags))
  r["relevance_levels_hit"]=levels
  r["bulk_winnow_score"]=direct + .75*adjacent + 1.25*discourse + 2.5*levels
  r["auto_tags"]=r["message_topic_tags"]+r["adjacency_tags"]+r["conversation_tags"]+[f"DISCOURSE_{x}" for x in r["message_discourse_tags"]]
  if r["role"]!="user": r["candidate_class"]="CONTEXT_ONLY_NONUSER"
  elif r["scores"]["sat"]>0:r["candidate_class"]="DIRECT_HIT"
  elif r["local_sat"]>0:r["candidate_class"]="ADJACENCY_SURFACED"
  elif conv_sat>0 and (direct>0 or discourse>0):r["candidate_class"]="CONVERSATION_SURFACED"
  elif direct>0 or discourse>=2:r["candidate_class"]="BROAD_WINNOW"
  else:r["candidate_class"]="LOW_SIGNAL"
 return rows

def sha256(path):
 h=hashlib.sha256()
 with path.open("rb") as f:
  for chunk in iter(lambda:f.read(1024*1024),b""):h.update(chunk)
 return h.hexdigest()
def discover(root): return sorted(p for p in root.rglob("*") if p.is_file() and p.suffix.lower()==".json" and "raw" in p.name.lower())

def main():
 ap=argparse.ArgumentParser(); ap.add_argument("root",type=Path); ap.add_argument("--out",type=Path,default=Path("nathan_sat_candidates.jsonl")); ap.add_argument("--examples",type=Path,default=Path("nathan_sat_examples.md")); ap.add_argument("--window",type=int,default=4); ap.add_argument("--limit-files",type=int,default=None); args=ap.parse_args()
 files=discover(args.root); files=files[:args.limit_files] if args.limit_files else files
 by_sha=defaultdict(list)
 for p in files:by_sha[sha256(p)].append(p)
 all_rows=[];errors=[]
 for digest,copies in by_sha.items():
  try:
   rows=score_conversation(copies[0],args.window)
   for r in rows:r["source_sha256"]=digest;r["duplicate_archive_paths"]=[str(x) for x in copies[1:]]
   all_rows.extend(rows)
  except Exception as exc:errors.append((str(copies[0]),repr(exc)))
 # Recurrence is tagged, never silently deleted.
 groups=defaultdict(list)
 for i,r in enumerate(all_rows):
  if r["role"]=="user":groups[hashlib.sha256(norm_text(r["text"]).encode()).hexdigest()[:16]].append(i)
 for key,idxs in groups.items():
  for i in idxs:all_rows[i]["duplicate_text_group"]=key if len(idxs)>1 else None
 args.out.parent.mkdir(parents=True,exist_ok=True)
 with args.out.open("w",encoding="utf-8") as f:
  for r in all_rows:f.write(json.dumps(r,ensure_ascii=False)+"\n")
 users=[r for r in all_rows if r["role"]=="user"]
 ranked=sorted(users,key=lambda r:r["bulk_winnow_score"],reverse=True)
 with args.examples.open("w",encoding="utf-8") as f:
  f.write("# Nathan Corpus Multi-Level Auto-Tag Tuning Sample\n\n")
  f.write(f"Files discovered: {len(files)}; unique-by-SHA: {len(by_sha)}; rows: {len(all_rows)}; user rows: {len(users)}\n\n")
  f.write("Candidate counts: "+json.dumps(Counter(r["candidate_class"] for r in users),ensure_ascii=False)+"\n\n")
  if errors:
   f.write("## Parse errors\n\n"+"\n".join(f"- `{p}` — `{e}`" for p,e in errors)+"\n\n")
  for r in ranked[:100]:
   ex=r["text"].replace("\n"," "); ex=ex[:697]+"..." if len(ex)>700 else ex
   f.write(f"### {r['title']} — {r['message_id']}\n- class: `{r['candidate_class']}`; winnow={r['bulk_winnow_score']:.2f}; levels={r['relevance_levels_hit']}\n- tags: `{'`, `'.join(r['auto_tags'][:40])}`\n> {ex}\n\n")
 print(json.dumps({"files_discovered":len(files),"unique_file_shas":len(by_sha),"messages":len(all_rows),"user_messages":len(users),"candidate_counts":dict(Counter(r["candidate_class"] for r in users)),"parse_errors":len(errors),"out":str(args.out),"examples":str(args.examples)},ensure_ascii=False,indent=2))
if __name__=="__main__":main()
