"""Exact 4D product-torus surface-energy toy, no physical claim."""
import math
A=5.0                 # m, fixed large circle
kappa=0.5             # J, bending modulus
sigma=0.24            # J/m^2, surface tension
core=0.1              # m, finite-core thickness

def area(R): return 4*math.pi**2*A*R

def bend_integral(R): return 4*math.pi**2*(R/A+A/R)

def energy(R): return sigma*area(R)+0.5*kappa*bend_integral(R)

def derivative(R): return 4*math.pi**2*sigma*A+2*math.pi**2*kappa*(1/A-A/R**2)

def second(R): return 4*math.pi**2*kappa*A/R**3
Rstar=math.sqrt(kappa*A*A/(2*sigma*A*A+kappa))
assert core<Rstar<A
assert abs(Rstar-1)<1e-14
assert abs(derivative(Rstar))<1e-12
assert second(Rstar)>0
for ratio in (.9,1.1): assert energy(ratio*Rstar)>energy(Rstar)
# With both radii free, uniform scale q multiplies area by q^2,
# but leaves the bending integral unchanged; hence no absolute size selection.
for q in (.5,.1):
    E_scaled=sigma*q*q*area(Rstar)+.5*kappa*bend_integral(Rstar)
    assert E_scaled<energy(Rstar)
# For fixed Rstar, thickness itself is not selected by this functional.
# Normal-meridian clearance holds only at e > core + buffer.
eps=.3; buffer=.05
assert eps>core+buffer
print('Rstar_m',f'{Rstar:.12f}')
print('area_m2',f'{area(Rstar):.12f}')
print('bending_integral_dimensionless',f'{bend_integral(Rstar):.12f}')
print('E_star_J',f'{energy(Rstar):.12f}')
print('E_0.9R_J',f'{energy(.9*Rstar):.12f}')
print('E_1.1R_J',f'{energy(1.1*Rstar):.12f}')
print('E_second_J_per_m2',f'{second(Rstar):.12f}')
print('E_halfscale_J',f'{sigma*.25*area(Rstar)+.5*kappa*bend_integral(Rstar):.12f}')
print('E_tenthscale_J',f'{sigma*.01*area(Rstar)+.5*kappa*bend_integral(Rstar):.12f}')
print('meridian_clearance_m',f'{eps-core:.12f}')
print('PASS fixed-A local stability; FAIL global size selection')
