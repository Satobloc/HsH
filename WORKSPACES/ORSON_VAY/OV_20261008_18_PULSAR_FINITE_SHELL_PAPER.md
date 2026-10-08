# From Volume Thresholds to Rotational Participation
## A Finite-Shell Correction to Geometric Pulsar-Glitch Models

**Orson Vay**  
Independent Researcher  
8 October 2026

### Abstract
An archived SAT pulsar-glitch model used x = omega R / vcrit and D_V = (1 - x^-3) H(x-1). The cubic law is exactly the volume fraction of a spherical body outside the threshold radius r_c = vcrit/omega = R/x. For rotational dynamics, volume is not the correct measure. For a uniform-density sphere the corresponding moment-of-inertia participation is P_I = (1 - x^-5) H(x-1). Eliminating x gives the parameter-free relation P_I = 1 - (1-D_V)^(5/3). In the thin-shell limit P_I/D_V -> 5/3 and D_V/P_I -> 3/5. This 3-to-5 exponent shift is the finite-core correction required when the archived shell-threshold law is used for a rotational observable.

## 1. Archived law as ordinary shell geometry
Let a star of radius R rotate with angular velocity omega. A local tangential-speed threshold vcrit is crossed at
r_c = vcrit / omega.
With x = omega R / vcrit, r_c/R = x^-1.
For a uniform sphere,
D_V = (R^3-r_c^3)/R^3 = 1-x^-3.
Thus the old cubic law is ordinary shell-volume geometry. It does not require a fractal or lattice interpretation.

## 2. Rotational lift
For a uniform sphere,
dI = (8 pi / 3) rho r^4 dr,
so I(<R) = (8 pi rho / 15) R^5.
Therefore
P_I = I_shell/I_total = 1-(r_c/R)^5 = 1-x^-5.

The geometric distinction is:
volume support scales as r^3;
rotational support scales as r^5.

## 3. Parameter-free observable relation
Since 1-D_V = x^-3,
P_I = 1-(1-D_V)^(5/3).
Conversely,
D_V = 1-(1-P_I)^(3/5).

For a thin shell:
D_V ~= 3 delta-r/R;
P_I ~= 5 delta-r/R;
therefore P_I ~= (5/3) D_V.

Numerical benchmarks:
- D_V = 1e-6 -> P_I = 1.6666661e-6.
- D_V = 1e-4 -> P_I = 1.6666111e-4.
- D_V = 0.01 -> P_I = 0.01661105.
- D_V = 0.10 -> P_I = 0.16104722.
- D_V = 0.20 -> P_I = 0.31058090.
- D_V = 0.50 -> P_I = 0.68501974.
- D_V = 0.80 -> P_I = 0.93160096.

## 4. General radial density
For density rho(r),
D_M(r_c) = integral[r_c,R] rho r^2 dr / integral[0,R] rho r^2 dr,
while
P_I(r_c) = integral[r_c,R] rho r^4 dr / integral[0,R] rho r^4 dr.

For rho proportional to r^q:
D_M = 1-x^-(q+3),
P_I = 1-x^-(q+5),
so
P_I = 1-(1-D_M)^((q+5)/(q+3)).

The exponent is therefore a probe of radial weighting, not a free fit parameter.

## 5. Relation to observed glitch amplitude
Let g = DeltaOmega/Omega. Angular-momentum conservation gives schematically
I_c DeltaOmega ~= I_s DeltaOmega_lag,
so
g ~= eta (I_s/I_c), where eta = DeltaOmega_lag/Omega.

Therefore g is not generally equal to P_I. This corrects the archived SAT paper, which identified shell fraction directly with the fractional spin jump. Geometry predicts participating inertia; conversion to observed glitch amplitude requires a lag release and receiving inertia.

## 6. Data-driven application

### 6.1 PSR J1637-4642: converting an inferred inertia reservoir back into geometry
Zhaoyi Wang et al., "Discovery of Three Glitches in the previously quiet pulsar PSR J1637-4642" (arXiv:2608.19555v1), report three glitches with fractional frequency changes approximately

- g1 = 2.7e-6,
- g2 = 2.2e-9,
- g3 = 2.8e-8.

Their vortex-creep Bayesian analysis of the first event infers a superfluid moment-of-inertia fraction approximately

P_I,1 = 0.0187.

The uniform-density shell mapping therefore gives

r_c/R = (1-P_I)^(1/5),

so the equivalent radial shell depth is

delta-r/R = 1-(1-P_I)^(1/5) = 0.00376829325.

The corresponding shell-volume fraction is

D_V = 1-(1-P_I)^(3/5) = 0.01126233316.

Thus the paper's inferred 1.87 percent moment-of-inertia reservoir corresponds, in the minimal uniform-shell geometry, to an active shell occupying about 1.126 percent of the volume and 0.3768 percent of the stellar radius.

For an illustrative R = 12 km, the equivalent shell depth is 45.22 m. The dimensionless depth is the actual prediction; 45.22 m merely rescales it to a representative radius.

The observed first-glitch amplitude gives an effective release factor

eta = g1/P_I,1 = 1.44385027e-4

under the schematic angular-momentum relation g ~= eta P_I.

If the same eta is used only as a controlled within-star comparison for the two smaller events, their equivalent participating inertia fractions are

P_I,2 = 1.52370e-5,
P_I,3 = 1.93926e-4.

The corresponding uniform-shell depths are

delta-r2/R = 3.04743e-6,
delta-r3/R = 3.87882e-5.

At R = 12 km these are 0.0366 m and 0.465 m, respectively.

These centimetre-to-metre numbers are not claimed as literal crust fracture depths. They are geometric equivalents conditional on one shared release efficiency and uniform density. Their value is that the three-event hierarchy is now explicit and can be attacked with a realistic stellar density and coupling model.

### 6.2 PSR J0205+6449: observation operator, not volume proxy
Wen-Tao Ye et al., "Discovery of Short-Term gamma-Ray Pulsed Radiation Variations Following a Glitch in PSR J0205+6449" (arXiv:2605.25205v1), report a glitch with

Delta-nu/nu = 1761(7)e-9

and successive gamma-ray pulse-profile changes. The strongest reported change is a >5-sigma decrease in peak separation during one post-glitch interval, while the flux variation is only marginal in another interval.

This is important because it prevents a naive identification of gamma-ray response with shell volume. A pulse-profile observable is an observation operator on magnetospheric geometry, not a direct volumetric measure.

Therefore J0205+6449 is not yet a clean test of

P_I = 1-(1-D_V)^(5/3)

unless the gamma-ray emission weighting is explicitly modeled. Instead it supplies a sharper requirement: the same internal shell event must be pushed through a concrete magnetospheric readout map before comparing with pulse separation, peak ratio, or flux.

The old SAT practice of assigning one geometric fraction simultaneously to spin jump and luminosity is therefore too strong.

## 7. Comparison with current neutron-star mechanics
Giliberti and Cambiotti (2026) model vortex pinning and crustal elasticity using the local Magnus force per unit vortex length, a density-dependent pinning cap, coarse-grained vortex body force, and elastic response. Their construction is dynamically richer than the present geometric shell map.

The point of the 3-to-5 correction is narrower: it identifies the correct measure before any constitutive dynamics are added. A realistic implementation should replace the hard threshold with the density-dependent loading and pinning structure of neutron-star matter, then ask whether the resulting active region still admits a compact radial participation law.

This comparison sets the next required import: not another SAT constant, but an explicit force/elasticity law tied to density and lag.

## 8. Archive repair
The archived 1-x^-3 expression contained useful geometry but the wrong observable assignment.
The finite-core correction is:
1-x^-3 -> 1-x^-5
whenever the target observable is rotational participation rather than volume participation.
The cubic law remains appropriate for volume-weighted quantities.

## 9. Falsification
The minimal construction fails if:
1. one radial threshold cannot describe both rotational and shell-sensitive observables;
2. the inferred P_I(D) relation is incompatible with 5/3 where the uniform-shell approximation should apply;
3. realistic density requires arbitrary event-by-event functions;
4. the angular-momentum reservoir is geometrically disjoint from the proposed threshold shell.

## 10. Immediate quantitative prediction
P_I = 1-(1-D)^(5/3).
For small events:
P_I = 1.666666... D + O(D^2),
or
D = 0.600000... P_I + O(P_I^2).

The numbers 5/3 and 3/5 are not fitted. They are the dimensional weights of the same finite shell viewed through volume and rotational inertia.

## 11. Next calculation
Replace uniform density by realistic neutron-star profiles for PSR J1637-4642 and compute the shell geometry corresponding to the paper's inferred 0.0187 inertia reservoir. Then replace the hard threshold with a density-dependent Magnus/pinning/elastic loading law and determine whether the three glitches can be represented by one constitutive family without event-specific arbitrary functions. Treat J0205+6449 separately through an explicit gamma-ray observation operator rather than a luminosity-volume shortcut.

## Provenance
Internal construction recovered from SAT archive PULSAR_PAPER, PULSAR GLITCH (Nolat), SAT-TO-STANDARD 2, and ELECTROGRAVACOUSTICS, plus HsH September-30/current synthesis material.

External comparison targets are in HSH_RESOURCES/OUTSIDE RESEARCH LIBRARY/PULSAR GLITCH/.

**Status: sandbox paper.**