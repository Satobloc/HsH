# Meridian | Cruller signed secondary winding: correcting the 14-mode false stability inference | 2026-10-21

**Status: SANDBOX / exact 4D geometric fixture, numerical second variation. NOT established SAT material dynamics.** This continuation corrects the previous `SANDBOX_2026-10-21_CRULLER_SECOND_ORDER_VARIATION.md` because that analysis tested positive daughter winding numbers m=+1…+14 **only**; signed chirality is not optional in SO(4).

## Source and assumptions

The recovered historical NLM sources are `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt`, `Interconn.txt`, and `SAT-GIGAPACK.txt`. The history contains bending and tension terms but does NOT yet establish an unambiguous current H(s)H arclength energy law nor the recalled maximum numerical bending energy. The following is an explicitly conditional classical comparator, `E=T L+(B/2) integral kappa^2 ds`, with `B>0` bending rigidity [E*L], `T>=0` tension [E/L], and native ambient R4 geometry. Work in Planck-normalized lengths `R/l_P` and dimensionless `t=T R²/B`.

Parent `C(u)=(cos2u,sin2u,cos3u,sin3u)/sqrt2`, unit radius `S3`. Normal frame `N1=(a1-a2)/sqrt2`, `N2=(3e1-2e2)/sqrt13`, where `a1=(cos2u,sin2u,0,0)`, `a2=(0,0,cos3u,sin3u)`, `e1=a1'/2`, `e2=a2'/3`. Define oriented daughter `V_m=cos(mu)N1+sin(mu)N2` for **signed integers m**, and `X_h=(C+hV_m)/sqrt(1+h²)`, `h=a/R`.

## Exact normal-frame transport

Normal connection on S3 along the parent is `N1'(u)·N2(u)=12/sqrt26=2.3533936216582085` radians per unit u. Therefore the daughter normal covariant derivative contains the **signed shift** `(m+12/sqrt26)` in the phase-gradient channel. Choosing only m>0 falsely removes modes whose winding counter-rotates against the transport of the parent frame. This is frame dependent in its bare value; periodic holonomy modulo 2pi and gauge-covariant derivatives are the invariant content. No physical torque or particle hypothesis is implied.

## Verified numerical second variation for both chirality branches

Computed in Python using 8192-point periodic Fourier differentiation of the full FOUR-dimensional curve, exact ambient curvature from speed and normal acceleration, symmetric amplitude steps h=0.001,0.0005,0.00025, with a convergence audit. L and `I2=int kappa² ds` normalized to R=1. Parent `L0/R=16.0190422444`, `R I2=18.3887230498`.

```text
 m       d²(L/R)/dh²    d²(R I2)/dh²    t_crit=-I2''/(2 L'') where positive
-5          +1.243387        +0.853271         none
-4          -9.337097        +5.509187         0.2950161
-3         -14.988646       +18.650157         0.6221428
-2         -15.711259       +19.408915         0.6176753
-1         -11.504937        +5.117347         0.2223979
+1         +11.694511       +11.706547         none
+2         +30.687634      +118.246743         none
+3         +54.609688      +381.055317         none
+4         +83.460668      +888.459367         none
+5        +117.240573     +1746.984694         none
```

For each mode, `(R/B) E''(h)=t * (L/R)''+(1/2)*(R I2)''`. **Thus m=-1 crosses to a negative directional energy second variation as `t=T R²/B` exceeds 0.2223979**, followed by m=-4 at 0.2950161, m=-2 at 0.6176753 and m=-3 at 0.6221428. This proves the earlier claim 'positive T and B do not destabilize the parent in this daughter family' was **FALSE** once both chiralities are included. Since the model holds S3 radius, it permits perturbations that shorten the filament. If **material arclength is conserved**, the energy variation and admissible perturbations change; NO claim that nature makes superhelices is warranted without that material constraint and actual tube dynamics. Also we have not proved that the candidate m=-1 mode is a genuinely distinct superhelix under the appropriate 4D symmetry quotient. No global ground state or finite nonzero equilibrium amplitude has been established.

The analytic `SO(2)` normal connection highlights why chirality asymmetry is expected, but the quantitative thresholds are **numerical and restricted to this ansatz**. All positive and negative modes m=±1…±14 were evaluated, three perturbation sizes checked, and convergence assertions passed. In particular the previous positive-only table is still numerically correct but had omitted the physically important other winding sign. It must be described as incomplete.

## Next requirement

Derive/locate from original archive the proper **fixed total arclength, conserved SO4 angular momentum and/or material twist/holonomy** constraints, and the actual stiffness and maximum bending energy. Test signed modes under those constraints, accounting for geometric core reach and actual filament-frame choice. Avoid importing old Lagrangian under an untyped lambda or treating the geometric normal-frame rotation as physical stored twist automatically.

**Local reproducibility:** `/mnt/data/cruller_signed_stability_20261021.py`, `/mnt/data/cruller_signed_stability_20261021.png` created with actual Python execution; not represented as committed to repository.

**Archive retrieval discipline:** Current shared Mersearch request belongs to Orson; no claim of a new Mersearch execution. Repository mathematical note committed by Meridian.
