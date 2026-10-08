# MK165 | Contact before memory: a 4D finite-core capstan discriminator

**2026-10-08 | Morrow/Kestrel | SANDBOXED; not canonical theory**

**Source ledger (read):** SAT original `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt`, lines 1–350 and 950–1450 (Nathan's literal 4D physical tubes, prograde/retrograde question, plus assistant reinterpretations); HsH September 30 `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` (entire file); HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt`, lines 1–350. Current onboarding, reference desk, War Room declaration, symbol/citation controls and HSH_RESOURCES reference routers reviewed. No PRIOR_ART exposure. Stable Mersearch guidance read, but no full-corpus checkout/service available in this runtime; no corpus-wide absence claim.

## New exact geometry

LOCAL:MK165 symbols: T=ct (length), R>0 helix radius, ω angular advance per T, β=R|ω|=v/c, N turns, a₀,a₁ Euclidean tube radii, κ_E Euclidean curvature, τ_E signed torsion.

X₀(S)=(S,0,0,0), X₁(T)=(T,R cos ωT,R sin ωT,0), with β<1 for timelike motion.

**Distance theorem:** ||X₁(T)-X₀(S)||²=(T-S)²+R², so minimum 4D Euclidean centerline separation is **exactly R**, independent of winding count. Hard-core contact requires R=a₀+a₁; if R>a₀+a₁, no contact friction is available regardless of N.

**Helix geometry:** κ_E=Rω²/(1+β²), τ_E=ω/(1+β²), ds_E/dT=√(1+β²).

Iκ=∫κ_E ds_E=2πNβ/√(1+β²); Iτ=sgn(ω)2πN/√(1+β²).

**Geometric budget:** Iκ²+Iτ²=(2πN)². Timelike β<1 implies Iκ<2πN/√2 and Iκ<|Iτ|.

## Conditional ordinary mechanics, not derived SAT physics

*If* a physical 4D material filament obeys a static tension/contact/Coulomb-friction constitutive law, p=Fκ_E and |dF/ds_E|≤μ_f p. Integrating gives the capstan bound

**ln(F_high/F_low) ≤ μ_f·2πNβ/√(1+β²)**,

with equality only at incipient slip. Bending cost E_B=B L β⁴/[2R²(1+β²)^(3/2)] is positive, so bending alone does not bind the helix. The bound is chirality-even (ω→−ω); signed torsion is odd. Thus the minimal model predicts **no prograde/retrograde discrimination**, and no spontaneous capture.

**Numerical fixture:** N=3, μ_f=0.4, β=0.1 gives Iκ=1.875600916 and limiting tension ratio 2.117509; β=0.7 gives Iκ=10.809510529 and ratio 75.475206. SymPy curvature/torsion derivation, SciPy tension ODE and independent quadrature agree within 2.2×10^-11 on five test cases.

## Attack / failure condition

No contact at macroscopic separation unless finite-core radii or a mediated timesheet/interbraid mechanism justify it. Static Euclidean 4D rope friction along timelike histories is **not** yet a causal physical law; Lorentzian transport and energy conservation require separate construction. Friction is a retention threshold, not a conservative attraction.

**Next solver:** contact-complementarity + causal material dynamics with controls (noncontact, zero friction, frictional contact, reversed handedness). Test limiting tension ratio, dissipative work, and whether an inward force exists without externally imposed contact/load. If a noncontact interaction survives, derive its mediator explicitly.

**Provenance:** Nathan's physical wrapping is historical source content; exact geometry is new MK165 mathematics; capstan law is a declared conditional adaptation of classical rope mechanics. No historical constants/particle labels used as targets.
