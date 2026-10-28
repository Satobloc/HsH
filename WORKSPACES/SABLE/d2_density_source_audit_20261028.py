"""Sable source-specific QA, 2026-10-28. No H(s)H physical prediction.
Tang et al. 2023 Nat Commun 14:2941 (10.1038/s41467-023-38787-w)
print 202.8 g/cm^3. Stasiak et al. 2025 PNAS 122:e2426064122
(10.1073/pnas.2426064122) print 202.8 kg/m^3. Both cite Xu
and Van Sciver 2008 (10.1063/1.2908547), not fully read.
The radius is the 2023 settling-inferred mean 1.1 micrometres;
its 0.2 micrometre population width is not a mean error bar.
"""
from decimal import Decimal, localcontext
from fractions import Fraction
import sympy as sp

with localcontext() as ctx:
    ctx.prec = 50
    a = Decimal("1.1e-6")
    rho_2023 = Decimal("202.8") * Decimal("1e-3") / Decimal("1e-6")
    rho_2025 = Decimal("202.8")
    v = Decimal(4) / 3 * Decimal(str(sp.N(sp.pi, 55))) * a**3
    m23, m25 = rho_2023*v, rho_2025*v
    assert rho_2023/rho_2025 == Decimal(1000)
    assert m23/m25 == Decimal(1000)
    assert Fraction(2028, 10)*Fraction(1000,1)/Fraction(2028,10) == 1000
    assert sp.simplify(sp.Rational(2028,10)*1000/sp.Rational(2028,10)-1000)==0
    print("rho_2023_literal_SI_kg_m3", rho_2023)
    print("rho_2025_literal_SI_kg_m3", rho_2025)
    print("source_density_ratio", rho_2023/rho_2025)
    print("nominal_spherical_mass_2023_literal_kg", m23)
    print("nominal_spherical_mass_2025_literal_kg", m25)
    print("conditional_mass_ratio", m23/m25)
    print("checks PASS: Decimal, Fraction, SymPy, mass scaling")
