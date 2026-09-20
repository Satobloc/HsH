#!/usr/bin/env python3
"""Deterministic acceptance tests for Mercer_Searcher_1.0 query semantics.\n\nThis fixture is intentionally synthetic: it tests search mechanics without reading archive content.\n"""
from pathlib import Path
import importlib.util
import sys

HERE=Path(__file__).resolve()
TOOL=HERE.parents[2]/"tools"/"search_archive_content.py"
spec=importlib.util.spec_from_file_location("mercer_searcher",TOOL)
m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)

def rec(text, speaker="user", role="user", date="2026-06-15T12:00:00+00:00", title="Fixture"):
    return m.Record("fixture.json","conversation-message",text,title,"cid-1","mid-1",speaker,role,date,"message:mid-1")

def check(label,query,want,r=None,near=10):
    got=m.evaluate(r or rec("alpha beta gamma delta epsilon"),query,near)
    assert got.ok is want,(label,query,want,got.ok,got.trace)
    return got

# Boolean + implicit AND
check("and","alpha AND beta",True)
check("implicit-and","alpha beta",True)
check("or","missing OR beta",True)
check("not","alpha AND NOT missing",True)
check("paren","alpha AND (missing OR gamma)",True)
check("precedence","alpha OR missing AND absent",True)
check("precedence-negative","missing OR beta AND absent",False)

# Exact phrase and NEAR windows, with auditable actual distance.
check("phrase",'"alpha beta"',True)
check("phrase-order",'"beta alpha"',False)
x=check("near-pass","alpha NEAR/3 delta",True)
assert x.near[-1]["distance_tokens"]==3,x.near
check("near-fail","alpha NEAR/2 delta",False)
check("near-default-pass","alpha NEAR delta",True,near=3)
check("near-default-fail","alpha NEAR delta",False,near=2)

# Fields.
r=rec("star shaped derivation reaches closure",speaker="Nathan",role="user",date="2026-06-15T12:00:00+00:00",title="SAT成果展望")
check("author","author:Nathan AND closure",True,r)
check("role","role:user AND closure",True,r)
check("title",'title:"SAT成果展望" AND closure',True,r)
check("date-range","date:2026-06-01..2026-06-30 AND closure",True,r)
check("date-range-fail","date:2026-07-01..2026-07-31 AND closure",False,r)


# Mersearch inventory/body fields and wildcard Boolean combinations.
ri=m.Record("SAT_CONVOS_20/Derivation Notes 2026.txt","text-line","star shaped derivation reaches closure",
            "Derivation Notes 2026","","","Nathan","user","2026-06-15T12:00:00+00:00","line:7")
check("body-field",'body:"star shaped derivation"',True,ri)
check("quoted-title-spaces",'title:"Derivation Notes 2026" AND closure',True,ri)
check("name-glob",'name:*2026.txt',True,ri)
check("name-glob-prefix",'name:Deriv*.txt',True,ri)
check("name-glob-negative",'name:26*.txt',False,ri)
check("name-boolean",'name:*26.txt OR name:26*.txt',True,ri)
check("path-glob",'path:*SAT_CONVOS_20* AND ext:txt',True,ri)
check("ext-negative",'ext:json',False,ri)
check("kind",'kind:text-line',True,ri)
check("has-text",'has:text-source',True,ri)
check("has-conversation-negative",'has:conversation-source',False,ri)
rc=rec("closure",speaker="Nathan",role="user")
check("has-conversation",'has:conversation-source AND has:message-id AND has:conversation-id',True,rc)


# Conservative math normalization: notation variants, not algebraic equivalence.
rm=m.Record("math_notes.txt","text-line",r"B = \frac{3}{4\pi}; theta = θ; x · y = z",
            "Math Notes","","","Nathan","user","2026-06-15T12:00:00+00:00","line:1")
check("math-frac-latex",'math:"B=3/(4*pi)"',True,rm)
check("math-pi-unicode",'math:"4π"',True,rm)
check("math-theta-alias",'math:"theta=theta"',True,rm)
check("math-multiply-glyph",'math:"x*y=z"',True,rm)
check("math-no-false-equivalence",'math:"4*pi*B=3"',False,rm)

# Sorting.
hs=[
 m.Hit("q","b","k","Z","c","m","Assistant","assistant","2026-07-01","l","e",[],"","s",[],[],[],[]),
 m.Hit("q","a","k","A","c","m","Nathan","user","2026-06-01","l","e",[],"","s",[],[],[],[])]
m.sort_hits(hs,"date",False);assert [h.timestamp for h in hs]==["2026-06-01","2026-07-01"]
m.sort_hits(hs,"date",True);assert [h.timestamp for h in hs]==["2026-07-01","2026-06-01"]
m.sort_hits(hs,"author",False);assert [h.speaker for h in hs]==["Assistant","Nathan"]

# Exclusion policy is part of 1.0's safety contract.
assert "QUARANTINE" in m.DEFAULT_EXCLUDES
assert "PRIOR_ART" in m.DEFAULT_EXCLUDES

print("PASS: Mercer_Searcher_1.0 synthetic acceptance suite")
