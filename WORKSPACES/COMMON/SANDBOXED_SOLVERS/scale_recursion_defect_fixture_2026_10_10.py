"""SANDBOXED typed scale-recursion defect fixture: mathematical toy, not nuclear binding."""
from __future__ import annotations
import math
import json
Fine = tuple[tuple[float,float,float],tuple[float,float,float],tuple[float,float,float]]
Coarse = tuple[float,float,float]

def coarse(fine:Fine)->Coarse:
    return tuple(sum(bundle)/3 for bundle in fine)

def fine_binding(fine:Fine)->Fine:
    return tuple(tuple(x*x for x in bundle) for bundle in fine)

def coarse_binding(values:Coarse)->Coarse:
    return tuple(x*x for x in values)

def defect(fine:Fine)->Coarse:
    a=coarse(fine_binding(fine)); b=coarse_binding(coarse(fine))
    return tuple(x-y for x,y in zip(a,b))

def variances(fine:Fine)->Coarse:
    return tuple(sum((x-sum(row)/3)**2 for x in row)/3 for row in fine)

def test()->dict:
    examples=[("constant",((2.,2.,2.),(-3.,-3.,-3.),(0.,0.,0.))),
              ("nonconstant",((-1.,0.,2.),(3.,5.,7.),(-4.,0.,4.)))]
    result=[]
    for name,s in examples:
        d,v=defect(s),variances(s)
        assert all(math.isclose(x,y,abs_tol=1e-14,rel_tol=1e-14) for x,y in zip(d,v))
        assert (all(abs(x)<1e-14 for x in d)) == (name=="constant")
        result.append({"case":name,"defect":d,"variance":v})
    return {"status":"PASS","theorem":"C(B_f(x))-B_c(C(x)) = groupwise population variance","tests":result}
if __name__=="__main__":
    print(json.dumps(test(),indent=2))
