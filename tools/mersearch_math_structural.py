"""Conservative equation extraction and structural matching for Mersearch.
Optional SymPy dependency. Never executes arbitrary input or silently assumes symbol values.
"""
from __future__ import annotations
import re
from dataclasses import dataclass

@dataclass(frozen=True)
class MathMatch:
    relation: str
    query: str
    candidate: str
    explanation: str

def extract_math(text):
    """Yield (start,end,raw) preserving source offsets."""
    patterns = [r'\\\[(.*?)\\\]', r'\$\$(.*?)\$\$', r'\$(?!\$)(.+?)\$(?!\$)', r'\\\((.*?)\\\)']
    spans = []
    for pat in patterns:
        for m in re.finditer(pat, text, re.S):
            spans.append((m.start(), m.end(), m.group(1)))
    for m in re.finditer(r'(?m)^.{0,200}(?:=|≈|\\frac|\\sqrt|√|\^).{0,200}$', text):
        if not any(m.start() >= a and m.end() <= b for a,b,_ in spans):
            spans.append((m.start(), m.end(), m.group()))
    return sorted(spans)

def _prepare(s):
    s=s.strip().replace('−','-').replace('π','pi').replace('√','sqrt')
    s=re.sub(r'\\(?:left|right)', '', s)
    for _ in range(8):
        t=re.sub(r'\\frac\s*\{([^{}]+)\}\s*\{([^{}]+)\}',r'(\1)/(\2)',s)
        if t==s:break
        s=t
    s=re.sub(r'\\sqrt\s*\{([^{}]+)\}',r'sqrt(\1)',s)
    s=s.replace('\\pi','pi').replace('\\cdot','*').replace('{','(').replace('}',')')
    return s

def _parse(s):
    import sympy as sp
    from sympy.parsing.sympy_parser import parse_expr, standard_transformations, implicit_multiplication_application, convert_xor
    from sympy.parsing.sympy_parser import auto_symbol
    # Restrict to a small grammar: no arbitrary function calls, attribute access or indexing.
    s=_prepare(s)
    if not re.fullmatch(r'[A-Za-z_0-9\s+*/().=^,-]+',s):
        raise ValueError('unsupported mathematical syntax')
    identifiers=set(re.findall(r'[A-Za-z_][A-Za-z_0-9]*',s))
    allowed={'sqrt','pi'}
    if any(x.startswith('_') or '__' in x for x in identifiers):
        raise ValueError('unsafe identifier')
    if any(x in s for x in ('**','//')):
        raise ValueError('unsupported operator')
    local={x:sp.Symbol(x) for x in identifiers-allowed}
    local.update({'sqrt':sp.sqrt,'pi':sp.pi})
    transforms=standard_transformations+(implicit_multiplication_application,convert_xor)
    def one(v):
        return parse_expr(v,local_dict=local,global_dict={'Symbol':sp.Symbol,'Integer':sp.Integer,'Float':sp.Float,'Rational':sp.Rational,'Add':sp.Add,'Mul':sp.Mul,'Pow':sp.Pow},transformations=transforms,evaluate=False)
    if s.count('=')==1:
        lhs,rhs=s.split('=')
        return ('equation',one(lhs)-one(rhs))
    if '=' in s:raise ValueError('multiple equals')
    return ('expression',one(s))

def compare(query,candidate,assumptions=None):
    """Return a typed relationship; assumptions are explicit substitutions only."""
    try:
        import sympy as sp
        qtype,q=_parse(query);ctype,c=_parse(candidate)
        if qtype!=ctype:return MathMatch('UNPARSED',query,candidate,'expression/equation type mismatch')
        if _prepare(query)==_prepare(candidate):
            return MathMatch('NOTATION-EQUIVALENT',query,candidate,'same normalized notation')
        # Equation residuals may differ by a nonzero constant factor.
        ratio=sp.cancel(q/c) if c!=0 else None
        if sp.simplify(q-c)==0 or (qtype=='equation' and ratio is not None and ratio.is_number and ratio.is_zero is False):
            return MathMatch('ALGEBRAICALLY-EQUIVALENT',query,candidate,'symbolic identity; equations compared by zero sets')
        if assumptions:
            sub={sp.Symbol(k):_parse(str(v))[1] for k,v in assumptions.items()}
            qq=sp.simplify(q.subs(sub));cc=sp.simplify(c.subs(sub))
            if sp.simplify(qq-cc)==0:
                return MathMatch('CONDITIONALLY-EQUIVALENT',query,candidate,'requires explicit substitutions: '+repr(assumptions))
        return MathMatch('NO-PROVEN-EQUIVALENCE',query,candidate,'no supported identity established')
    except Exception as e:
        return MathMatch('UNPARSED',query,candidate,type(e).__name__+': '+str(e)[:160])
