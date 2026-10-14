#!/usr/bin/env python3
"""Ariadne s2: topology-sensitive mixed-sign evidence. Synthetic probabilities,
not an authorship, physics, or source-truth inference. Dimensionless.

N=17 binary mentions, p=.9 under H+, .1 under H-; each topology calibrated
to mean pairwise correlation rho=.9. Two independent external negative roots
have reliability .7. Equal prior probability for star and path topologies.
Posterior calculations assume equal prior odds for H+ and H-.
"""
import math,itertools
import numpy as np
from scipy.optimize import brentq
from scipy.special import expit
N=17; p=.9; rho=.9; r=.7

def tree(t):
    E=[(0,j) for j in range(1,N)] if t=='star' else [(j,j+1) for j in range(N-1)]
    d=np.full((N,N),99,dtype=int);np.fill_diagonal(d,0)
    for a,b in E:d[a,b]=d[b,a]=1
    for k in range(N):d=np.minimum(d,d[:,k,None]+d[None,k,:])
    c=brentq(lambda c:np.mean(c**d[np.triu_indices(N,1)])-rho,0,1,xtol=1e-14)
    return E,c

def L(x,E,c,p):
    v=p if x[0] else 1-p
    for a,b in E:
        q=(1-c)*p+c*x[a]
        v*=q if x[b] else 1-q
    return v

def posterior(a,b):return float(expit(math.log(a/b)+2*math.log((1-r)/r)))

def path_dp(p,c):
    dp=np.zeros((N+1,2));dp[0,0]=1-p;dp[1,1]=p
    for _ in range(1,N):
        nxt=np.zeros_like(dp)
        for k in range(N):
            for prev in (0,1):
                q=(1-c)*p+c*prev
                nxt[k,0]+=dp[k,prev]*(1-q)
                nxt[k+1,1]+=dp[k,prev]*q
        dp=nxt
    return dp[15].sum()

T={t:tree(t) for t in ('star','path')}
rows=[]
for neg in itertools.combinations(range(N),2):
    x=np.ones(N,dtype=int);x[list(neg)]=0
    v={t:(L(x,E,c,p),L(x,E,c,1-p)) for t,(E,c) in T.items()}
    plus=sum(z[0] for z in v.values());minus=sum(z[1] for z in v.values())
    mix=posterior(plus,minus)
    avg=sum(posterior(*z) for z in v.values())/2
    rows.append((neg,mix,avg,v))

assert len(rows)==136
for t,(E,c) in T.items():
    for ph in (p,1-p):
        count=sum(L(np.array([int(i not in neg) for i in range(N)]),E,c,ph)
                  for neg in itertools.combinations(range(N),2))
        if t=='star':
            q1=(1-c)*ph+c;q0=(1-c)*ph
            exact=ph*math.comb(16,2)*q1**14*(1-q1)**2+(1-ph)*16*q0**15*(1-q0)
        else:exact=path_dp(ph,c)
        assert abs(count-exact)<3e-14
    x=np.ones(N,dtype=int);x[[0,8]]=0
    assert abs(L(x,E,0,p)-p**15*(1-p)**2)<1e-15
    assert L(x,E,1,p)==0

def show(row):
    neg,mix,avg,v=row
    return dict(negative=neg,star=posterior(*v['star']),path=posterior(*v['path']),
                mixture=mix,naive_posterior_average=avg)
print('edge correlations', {t:c for t,(E,c) in T.items()})
for pair in [(0,1),(0,16),(1,2),(1,16),(7,8)]:
    print('specified',show(next(row for row in rows if row[0]==pair)))
count={t:[sum(row[3][t][j] for row in rows) for j in (0,1)] for t in T}
print('count-only likelihood',count)
print('count-only topology mixture posterior',
      posterior(*[sum(v[j] for v in count.values()) for j in (0,1)]))
print('minimum',show(min(rows,key=lambda z:z[1])))
print('maximum',show(max(rows,key=lambda z:z[1])))
print('maximum posterior averaging error',max(abs(row[1]-row[2]) for row in rows))
print('independent binomial and transfer-DP controls PASS')
