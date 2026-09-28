"""STORYO deterministic story-morph skeleton.

Pipeline: record -> connect -> mutate -> propagate -> classify -> render
Budding is opt-in and bounded.
"""
from __future__ import annotations
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Set, Optional, Tuple
import copy, json

class Relation(str, Enum):
    CAUSES="causes"; REQUIRES="requires"; CONTRADICTS="contradicts"
    CONFIRMS="confirms"; SUPERSEDES="supersedes"; ATTRIBUTES="attributes"
    REVEALS="reveals"; MOTIVATES="motivates"; ECHOES="echoes"

@dataclass
class Record:
    id: str
    text: str
    kind: str = "event"
    tags: Set[str] = field(default_factory=set)
    provenance: Optional[str] = None
    active: bool = True

@dataclass(frozen=True)
class Connection:
    source: str
    relation: Relation
    target: str
    note: str = ""

@dataclass
class ConsistencyRule:
    id: str
    description: str
    required_ids: Set[str] = field(default_factory=set)
    forbidden_pairs: Set[Tuple[str,str]] = field(default_factory=set)

@dataclass
class Mutation:
    id: str
    target: str
    field: str
    old: object
    new: object
    rationale: str = ""

@dataclass
class Bud:
    id: str
    parent: str
    text: str
    depth: int
    enabled: bool = False

@dataclass
class StoryState:
    records: Dict[str,Record] = field(default_factory=dict)
    connections: List[Connection] = field(default_factory=list)
    rules: List[ConsistencyRule] = field(default_factory=list)
    buds: Dict[str,Bud] = field(default_factory=dict)
    history: List[dict] = field(default_factory=list)
    def clone(self): return copy.deepcopy(self)

def dependents(state, record_id):
    out=set(); frontier=[record_id]
    propagating={Relation.CAUSES,Relation.REQUIRES,Relation.REVEALS,
                 Relation.MOTIVATES,Relation.SUPERSEDES}
    while frontier:
        cur=frontier.pop()
        for edge in state.connections:
            if edge.source==cur and edge.relation in propagating and edge.target not in out:
                out.add(edge.target); frontier.append(edge.target)
    return out

def apply_mutation(state, mutation):
    nxt=state.clone(); rec=nxt.records[mutation.target]
    actual=getattr(rec,mutation.field)
    if actual != mutation.old:
        raise ValueError(f"{mutation.id}: expected {mutation.old!r}, got {actual!r}")
    setattr(rec,mutation.field,mutation.new)
    nxt.history.append({"mutation":mutation.id,"target":mutation.target,
                        "field":mutation.field,"old":mutation.old,"new":mutation.new,
                        "affected":sorted(dependents(nxt,mutation.target))})
    return nxt

def classify_consistency(state):
    problems=[]
    active={rid for rid,r in state.records.items() if r.active}
    for rule in state.rules:
        missing=sorted(rule.required_ids-active)
        if missing:
            problems.append({"rule":rule.id,"type":"missing-required","records":missing})
        for a,b in rule.forbidden_pairs:
            if a in active and b in active:
                problems.append({"rule":rule.id,"type":"forbidden-pair","records":[a,b]})
    for edge in state.connections:
        if edge.relation==Relation.CONTRADICTS:
            a=state.records.get(edge.source); b=state.records.get(edge.target)
            if a and b and a.active and b.active:
                problems.append({"type":"explicit-contradiction","records":[a.id,b.id],"note":edge.note})
    return problems

def try_mutation(state, mutation):
    candidate=apply_mutation(state,mutation)
    problems=classify_consistency(candidate)
    return {"mutation":mutation,
            "status":"commit" if not problems else "block",
            "problems":problems,
            "candidate":candidate if not problems else None}

def bounded_bud(state,parent,text,depth,max_depth=1,enabled=False):
    if not enabled or depth>max_depth: return None
    bid=f"bud:{parent}:{len(state.buds)+1}"
    bud=Bud(bid,parent,text,depth,True); state.buds[bid]=bud
    return bud

def render_ledger(state):
    lines=["# STORYO state ledger",""]
    for rid,r in state.records.items(): lines.append(f"- [{rid}] {r.kind}: {r.text}")
    lines += ["","## Connections"]
    for e in state.connections:
        lines.append(f"- {e.source} --{e.relation.value}--> {e.target}" + (f" :: {e.note}" if e.note else ""))
    lines += ["","## History"]
    for h in state.history: lines.append(f"- {json.dumps(h,ensure_ascii=False)}")
    return "\n".join(lines)
