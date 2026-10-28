#!/usr/bin/env python3
"""Orson P1 2026-10-28: full-source ConsistencyBench conjunction-null replay.

Usage: python 2026_10_28_conjunction_null_replay.py /path/to/ConsistencyBench
Read-only. Requires original public results/*.json at exact pinned Git blob SHAs.
No model calls, no synthetic responses. Conditional independence null is NOT a
causal or inferential claim. Run from a local authorized source checkout.
"""
import hashlib, json, sys
from pathlib import Path
from fractions import Fraction

# name vanilla_blob cgd_blob; '-' means vanilla-only
MANIFEST = """
gpt-4o 8196ac51e92737d5a479fb4fca7f85261a7109ec 3f94994e131e25bf9bf52f43867fbe6b229756b1
gpt-4.1 442a2dc4618ecee90f82af14b10abcf6789d8eaf 9ab86f214197d1c60279807850a07d9da75344b8
gemini-2.5-pro a27750ca4d479e224f848eccb2271fbdd24b88b2 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4
claude-opus-4.6 edbef31ca9554e2e2657d58eed55b43b748da97f c9f6e92cc21a30497b2264e17e0b59a3a843b710
claude-3.5-sonnet f7156cb67b80a8ebfe36fdcf29396fce18e8a9e2 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf
claude-sonnet-4.5 e015958d96e7794cb826263fdbe6fabac354dfd5 d259dfa14fcb901323191fd99dc06be0feebc0ac
claude-sonnet-4.6 f0f1587f001ec96e1b62ac25b09f35b3c9687169 a5b440f9d5e9e8b8294d68938d3fb667a83e6a75
deepseek-v3.2 1c15f4d925603bc2a269233ebeebc1dd22e5e139 5dd5ec233d563acdc385f56270b2868c2a439d09
gemini-2.0-flash 2ea399305abba83cd3529c44e354dadcbc18d157 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729
gemini-2.5-flash aebbf1a4be232444e2d6b3df8c55523dd0f9d0c9 abf7a0b99c54ff8155700e80e283d1d7081f09f6
gpt-5-mini cb4426f2b7fa98862470222fa8221e5149eb1cb5 aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b
gpt-5.2 bec5031d53ffa54bb2fe04b6a0c97ce129350f53 acf59928c7d754c78a93f648c76c6497fc7e5b11
gpt-5 75ae23b1eab26f8bce9a1c5dff0bf338c6d1b8c8 25bb4f61e2454467626592396f20384c9858cb6b
llama-3.1-70b 3bbfb9aacfe7694ffd4dcaaa7f63a2c2e4cda3dd b7b9db7ff20a502f25064df9b786507b4d58a6a3
llama-3.3-70b b2e8bbbb0a9a4faa19ffcfa6fa2e825795bfa2b9 c3845de12a952cfe050f1fbab9e91f8ab10a6a36
o3 3d830062bbd99017293da8f3c6f81c2ceaa35959 4f408b9d207d50b2bbbd31b1283f50798173e602
qwen-2.5-72b 0c7d7346db1a45aa3dd62a5f5b6bb9257d1b1c7e 38393e09d44de963d109b00f66a1378f5b431720
deepseek-r1 eacb6a3e997091b8448f11b6a466ed23d0fa464e -
""".strip().splitlines()

def normalize(a):
    a=a.strip().lower()
    if a.startswith("yes"): return "yes"
    if any(t in a for t in ("cannot be determined","cannot conclude",
       "not necessarily","we cannot","insufficient","cannot determine")):
        return "cannot_determine"
    if a.startswith("no"): return "no"
    if a=="unclear": return "unclear"
    return a

def source_blob(raw):
    return hashlib.sha1(b"blob "+str(len(raw)).encode()+b"\\0"+raw).hexdigest()

def score(data):
    groups={}; original=corrected=individual=0
    for item in data["results"]:
        category=item["category"]; answers=item["evaluation"]["results"]
        if category not in groups:
            groups[category]=[0,[0]*len(answers),[0]*len(answers)]
        group=groups[category]; group[0]+=1
        good=good_corrected=1
        for j,answer in enumerate(answers):
            pred=normalize(answer["extracted_answer"])
            key=normalize(answer["expected"])
            fixed=(normalize(answers[0]["expected"]) if category=="negation"
                   and j==2 else key)
            a=int(pred==key); b=int(pred==fixed)
            individual+=a; group[1][j]+=a; group[2][j]+=b
            good*=a; good_corrected*=b
        original+=good; corrected+=good_corrected
    assert len(groups)==6 and all(g[0]==50 for g in groups.values())
    def null(col):
        value=Fraction(0)
        for n,p,q in groups.values():
            product=Fraction(1)
            for k in (p if col==1 else q): product*=Fraction(k,n)
            value+=n*product
        return value
    return original,corrected,individual,null(1),null(2)

def main(root):
    out={}
    for line in MANIFEST:
        model,v,c=line.split()
        for strategy,sha in (("vanilla",v),("cgd",c)):
            if sha=="-": continue
            path=root/"results"/(model+"_"+strategy+".json")
            raw=path.read_bytes()
            assert source_blob(raw)==sha, (path,"SHA_MISMATCH")
            data=json.loads(raw)
            obs,corr,ind,nul,nulc=score(data)
            assert obs==data["metrics"]["set_consistent"]
            assert ind==data["metrics"]["individual_correct"]
            out[(model,strategy)]=(obs,corr,nul,nulc)
    assert len(out)==35
    pairs=[m for m,v,c in (line.split() for line in MANIFEST) if c!="-"]
    assert len(pairs)==17
    sums=[]
    for col in (0,1):
        observed=sum(out[(m,"cgd")][col]-out[(m,"vanilla")][col] for m in pairs)
        expected=sum(out[(m,"cgd")][col+2]-out[(m,"vanilla")][col+2] for m in pairs)
        sums.append((observed,float(expected),float(observed-expected)))
    assert sums[0][0]==339 and abs(sums[0][1]-224.70590)<1e-6
    assert sums[1][0]==281 and abs(sums[1][1]-163.38598)<1e-6
    print(json.dumps({"files":len(out),"original_keys":sums[0],
                      "negation_q3_corrected":sums[1],
                      "status":"PASS_FULL_RAW_SOURCE_REPLAY"},indent=2))

if __name__=="__main__":
    assert len(sys.argv)==2,"Supply original public ConsistencyBench checkout path"
    main(Path(sys.argv[1]))
