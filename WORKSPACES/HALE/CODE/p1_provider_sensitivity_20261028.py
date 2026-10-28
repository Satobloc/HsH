#!/usr/bin/env python3
"""Observed-data secondary reaggregation; no new LLM trials or physical fixtures.

Source: HsH WORKSPACES/ORSON_VAY/2026-10-27_0712Z_P1_35FILE_KEY_SENSITIVITY.md
Git blob ddf615c2e0fd4cce2599ee0fc13c647a623f6f99.
Model pairs each use 300 archived question sets per condition.
"""
from collections import defaultdict
from fractions import Fraction
import json

rows = [
    ("GPT-4o","OpenAI",59,42), ("GPT-4.1","OpenAI",22,-1),
    ("Gemini 2.5 Pro","Google",28,30), ("Claude Opus 4.6","Anthropic",27,35),
    ("Claude 3.5 Sonnet","Anthropic",14,25), ("Claude Sonnet 4.5","Anthropic",4,5),
    ("Claude Sonnet 4.6","Anthropic",42,46), ("DeepSeek V3.2","DeepSeek",28,24),
    ("Gemini 2.0 Flash","Google",15,15), ("Gemini 2.5 Flash","Google",14,17),
    ("GPT-5 Mini","OpenAI",15,11), ("GPT-5.2","OpenAI",35,16),
    ("GPT-5","OpenAI",6,8), ("Llama 3.1 70B","Meta",-6,-18),
    ("Llama 3.3 70B","Meta",8,8), ("o3","OpenAI",27,19),
    ("Qwen 2.5 72B","Alibaba",1,-1),
]
assert len(rows)==17 and len({x[0] for x in rows})==17
assert sum(x[2] for x in rows)==339 and sum(x[3] for x in rows)==281
by=defaultdict(list)
for name,provider,old,new in rows:
    by[provider].append((name,old,new))
assert len(by)==6
groups=[(p,len(rs),sum(r[1] for r in rs),sum(r[2] for r in rs)) for p,rs in sorted(by.items())]
assert sum(g[3] for g in groups)==281
assert sum(g[3]>0 for g in groups)==4
provider_balanced=sum((Fraction(g[3],g[1]) for g in groups),Fraction())/6/3
model_balanced=Fraction(281,17*3)
leave_one_out={g[0]:float(Fraction(281-g[3],(17-g[1])*3)) for g in groups}
result={
  "source_git_blob":"ddf615c2e0fd4cce2599ee0fc13c647a623f6f99",
  "original_gain_sets":339, "corrected_gain_sets":281,
  "positive_models":sum(r[3]>0 for r in rows), "positive_providers":4,
  "model_weighted_gain_pp":float(model_balanced),
  "provider_balanced_gain_pp":float(provider_balanced),
  "provider_groups":[{"name":p,"models":n,"old_gain_sets":o,"corrected_gain_sets":c,
    "corrected_mean_gain_pp":float(Fraction(c,n*3))} for p,n,o,c in groups],
  "leave_one_provider_out_gain_pp":leave_one_out,
  "status":"SECONDARY_DESCRIPTIVE_REANALYSIS_NOT_INDEPENDENT_LLM_TRIAL"
}
print(json.dumps(result,indent=2))
