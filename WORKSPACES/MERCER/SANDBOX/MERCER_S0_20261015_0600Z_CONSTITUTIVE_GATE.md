# Mercer s0 (2026-10-15 06Z): 4D finite-core constitutive harmonic gate
**SANDBOX.** Geometry/elasticity test only, not established physics. Reproduced from the conversation-inline authoritative artifact. Python source and numerical output are committed beside this note; Figure reproducible from the script.

## Parameters and geometry
Coordinates in Euclidean R^4, u∈[0,1]:
c_(A,n)(u) = (A sin(2πnu), H cos θ(u), H sin θ(u), Tu),
θ=π(3u²−2u³), H=√3 ℓ/2, T=3πH/2,
ℓ=1 m, B=1 J*m, τ=1 J/m, κ_max=2/ℓ.
Assumed elastic functional: E=(B/2)∫κ² ds+τ∫ds.
Curvature is κ²=|c''|²/|c'|⁴−(c'·c'')²/|c'|⁶.
Define S=T²+H²θ'², Q=H²(θ'^4+θ''²), D=H²θ'θ'', k=2πn.
Then |c'|²=S+A²k² cos²(ku), |c''|²=Q+A²k⁴sin²(ku),
c'·c''=D−A²k³sin(ku)cos(ku).

## Derived high-frequency asymptotics
Let A=c/n². The slope perturbation is O(n^-2), whereas the
acceleration perturbation remains O(1). Hence
ΔE_B→[B(2π)^4 c²/4] I3, I3=∫S^-3/2 du;
ΔE_T∼[τ(2π)²c²/(4n²)] I1, I1=∫S^-1/2 du.
At the curvature cap:
c*=min_u S/(4π²)*sqrt(4/ℓ²−κ_0²) ≈0.735482538952 m
(grid-determined; not interval certified),
I3=0.008624662879 m^-3, I1=0.202087855997 m^-1.
Thus ΔE_B,crit→1.817801024034 J and
n² ΔE_T,crit→1.078908699711 J.
At fixed amplitude bending stiffness K_B∝n^4; tension K_T∝n².
Generalized critical force Fcrit=K_B Acrit∼4.943152087944 n² J/m.

## Reproducible computed fixtures
n | n²Acrit (m) | ΔEB (J) | ΔET (J) | KB (J/m²) | KT (J/m²)
2 | .942817872 | 2.241607969 | .416673621 | 98.04693 | 15.97507
4 | .812263814 | 2.078368432 | .081209523 | 1684.79521 | 63.82783
8 | .764037822 | 1.932061191 | .018140362 | 27387.13092 | 255.30009
16| .746547355 | 1.865972759 | .004339268 | 439898.22797 | 1021.19807
32| .740100407 | 1.839010451 | .001066714 | 7045175.33047 | 4084.79173
64| .737550933 | 1.827622038 | .000264878 |112750007.88974|16339.16677

Executed locally again 2026-10-15: all programmed controls passed:
zero-amplitude baseline; second-order stiffness expansion;
six cap-root checks; no-double-normal sufficient check;
large-n tension decay. Outputs and plot reproducible with
python mercer_s0_constitutive_gate.py (NumPy/SciPy/Matplotlib).
Numerics use Simpson grid 32,769 points; root via brentq.
Not interval-certified and no physical claim.

## Conclusion and Ravel handoff
Curvature saturation alone does NOT force a finite harmonic cutoff:
at Acrit∝n^-2, the bending cost approaches a constant, though
fixed-force response falls as n^-4. Ravel should test self-distance,
nonlocal core interaction, and excitation-force spectral decay.
