#!/usr/bin/env python3
"""P1 source-pinned exact-question graph replay, standard library only.

Usage: python 2026_10_28_prompt_component_graph.py path/to/consistency_bench_sample.json
       python 2026_10_28_prompt_component_graph.py path/to/consistency_bench.json
Requires actual original JSON bytes; checks Git blob SHA-1 before calculation.
Does NOT administer new LLM calls or observe any actual training/holdout split.
"""
import collections, hashlib, json, math, sys
from pathlib import Path

BLOBS = {
 "consistency_bench_sample.json": "10eb2da27c84c706d8e9e2325afca864fcae6a0d",
 "consistency_bench.json": "3171d2899fd1eb4292794df5952514666b0e2f43",
}

def graph(sets, key):
    n=len(sets); parent=list(range(n)); sizes=[1]*n
    def root(i):
        while parent[i]!=i:
            parent[i]=parent[parent[i]]
            i=parent[i]
        return i
    def join(a,b):
        a=root(a);b=root(b)
        if a!=b:
            if sizes[a]<sizes[b]: a,b=b,a
            parent[b]=a;sizes[a]+=sizes[b]
    keys=collections.defaultdict(list)
    for i,s in enumerate(sets):
        for q in s["questions"]:
            k=q["question"] if key=="question" else (q["question"],s["premise"])
            keys[k].append((i,q["expected_answer"].strip().lower()))
    for group in keys.values():
        for i,_ in group[1:]: join(group[0][0],i)
    components=collections.Counter(root(i) for i in range(n))
    freq=collections.Counter(components.values())
    groups=[v for v in keys.values() if len(v)>1]
    conflicts=sum(len({label for _,label in v})>1 for v in groups)
    h=round(n*.2); den=math.comb(n,h)
    dp=[0]*(h+1);dp[0]=1
    for k,v in freq.items():
        for _ in range(v):
            for j in range(h,k-1,-1): dp[j]+=dp[j-k]
    def cross(k):
        return 1-(math.comb(n-k,h)+math.comb(n-k,n-h))/den
    return {
        "key":key, "sets":n, "holdout_size_hypothetical":h,
        "question_positions":sum(len(v) for v in keys.values()),
        "unique_keys":len(keys), "repeated_key_groups":len(groups),
        "key_conflict_groups":conflicts,
        "components":len(components), "nontrivial_components":sum(v for k,v in freq.items() if k>1),
        "largest_component":max(freq), "component_size_histogram":dict(sorted(freq.items())),
        "expected_crossing_key_groups_uniform_split":
            sum(cross(len({i for i,_ in v})) for v in groups),
        "zero_crossing_probability_uniform_split":dp[h]/den,
        "safe_splits_exact_numerator":str(dp[h]), "all_splits_exact_denominator":str(den),
    }

def main(path):
    raw=path.read_bytes()
    gitsha=hashlib.sha1(b"blob "+str(len(raw)).encode()+b"\0"+raw).hexdigest()
    expected=BLOBS.get(path.name)
    if expected is None or gitsha!=expected:
        raise SystemExit(f"Source identity not verified: {path.name} {gitsha} expected {expected}")
    sets=json.loads(raw)["sets"]
    print(json.dumps({"source":path.name,"blob":gitsha,
        "question_only":graph(sets,"question"),
        "question_plus_premise":graph(sets,"question_premise")},indent=2))

if __name__=="__main__":
    if len(sys.argv)!=2: raise SystemExit(__doc__)
    main(Path(sys.argv[1]))
