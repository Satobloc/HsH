# Meridian ◈ | Whirligig review and MK171 handoff
2026-10-11 | SANDBOXED | Peer review: MAJOR REVISION | Independent mathematical and provenance assessment

## Reviewed documents
- HsH: WORKSPACES/COMMON/SANDBOXED_PAPERS/WHIRLIGIG_CLIFFORD_TORUS_ELASTIC_BACK_HALLWAY_2026-10-08.md (entire current Markdown including v0.2/v0.3).
- SAT archive: HsH-SAT Roundup 3/THE_WHIRLIGIG.txt (opening construction); _AUTO_EXTRACTED_TEXT/4DHH LAGRANGIAN (nolat).txt (pages 1–4).
- HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt.
- Comparator: T. Asselmeyer-Maluga, “Braids, 3-Manifolds, Elementary Particles: Number Theory and Symmetry in Particle Physics,” Symmetry 11 (2019) 1298, DOI 10.3390/sym11101298. Bibliographic abstract and SciSpace introduction/methods/contributions were inspected. PDF found in private HSH_RESOURCES/PRIOR_ART/symmetry-11-01298.pdf (blob dde601c94093ddd63cfe6074c721d30a1b5a62f6), but text extraction from binary failed. **Full comparator NOT READ.** All direct cross-paper assessments provisional.
- MK171: WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK171_PROPOSAL_R0.md and MK171_SELF_HOSTILE_R0_TO_R1.md (complete).

## Verdict and mandatory comparison
**Better or worse than published paper? Why?** Whirligig is better as a *narrow, explicit and computationally checkable elastic-operator fixture* with a falsifiable sideband calculation. Asselmeyer-Maluga is more ambitious and broader in 3-manifold and particle-topology mathematics (hyperbolic knot complements, torus bundles, threefold branched coverings, quantum groups, quantum states/knots, charge topology). Whirligig is worse in contextual originality and broader physical scope; neither paper establishes the other's proposed physics. Published comparator's full derivations and its numerical/experimental rigor have **not** been audited; a full comparative judgment is not yet justified.

## Whirligig mathematics
Action J=∫[κ|H''|²/2+λ(|H|²−R²)²/2+k|H−G|²/2] ds gives E-L κH''''+2λ(|H|²−R²)H+k(H−G)=0. For fixed-radius two-frequency H=(a cos ms,a sin ms,b cos ns,b sin ns), a²+b²=R², the engineered target G*=H+(κ/k)H'''' ensures stationarity. Hessian at H: ∫[κ|η''|²+k|η|²+4λ(H·η)²]ds>0 if κ,k>0, λ≥0, yielding local coercivity, *not* global convexity. Reported action 7.33059229788642 is independently consistent with the analytic integral.

R²|H''|²−|H'|⁴=a²b²(m²−n²)² is correct for the declared angular parameter, but cannot be described as an unparameterized curvature invariant absent normalization. Standard S³≅SU(2), Spin(4)≅SU(2)×SU(2) group identities are not novel transformations. The beam/Winkler transfer equivalence applies only to this restricted on-shell operator, not arbitrary nonlinear off-sphere curves.

**Strongest theorem:** L=κD⁴+kI+4λ H0(s)H0(s)^T. With m even/n odd, P=diag(1,1,-1,-1), (Tη)(s)=Pη(s+π), L commutes with T. For f=cos(s)e1, Tf=-f, and uniqueness gives Tη=-η. Therefore first-plane Fourier response has odd harmonics only and second-plane response even harmonics only. Nonzero allowed harmonic amplitude is *not guaranteed by symmetry*: λ=0 is a counterexample with zero cross-plane response. Reported sideband h3 mode 2 ≈0.1495585124 is consistent with manuscript's independent numerical benchmark; this pass did not rerun original scripts.

**Recommendation:** MAJOR REVISION. Put the half-turn operator equivariance and numerical sideband discriminator at paper center. Reclassify inverse forcing as controlled fixture rather than independent dynamical prediction. Explain independent G control, λ measurement, boundary conditions, and gauge/frame distinction. Do not claim GR↔QM equivalence. Require independent Fourier-Galerkin and finite-difference convergence plus vanishing forbidden parity modes, and ultimately a physically independent input/response experiment. Cite classical Euler–Bernoulli/Winkler, S³/SU(2), Spin(4), and symmetry selection precedents.

**Desk-safe abstract:** “We analyze a periodic fourth-order curve energy with bending, radial penalty and prescribed-target terms. An inverse-forced two-frequency orbit on S³ is an exact stationary fixture with positive Hessian. The linearized operator possesses a half-period equivariance that excludes specified interplane Fourier harmonics. A restricted transfer law coincides with classical beam-on-foundation response. Numerical benchmarks test the selection rule; no novel physical equivalence is inferred.”

## MK171 mathematical check and next solver
Morrow/Kestrel R0 gives standard flux-threaded ring spectrum E_n=ħ²(n+α)²/(2mR²), rational α=p/q (reduced). Universal relative-phase revival over all integer n has
Trev=(2πmR²/ħ)[2q/gcd(q+2p,2q)].
Proof: with time factor k=ħT/(2πmR²), require k(n²+2αn)∈2Z for all n. Values n=1,2 imply k integer and k(q+2p)/q even; smallest k is given by formula. α=0: k=2; α=1/2:k=1; α=1/4:k=4; α=1/3:k=6. Irrational α gives no finite universal period; selected finite-mode superpositions may revive sooner.

For stipulated pure dephasing -D[N,[N,ρ]], ρ_nm gains e^{-D(n-m)²t}; equal (|0>+|1>)/√2 state has clean-period survival fidelity [1+e^{-DT}]/2. **Both results are standard QM, not independently derived H(s)H physics.**

**Concrete geometric null:** planar circle γ(φ)=(Rcosφ,Rsinφ,0,0) in Euclidean R⁴ has orthonormal normal triad N1=(cosφ,sinφ,0,0), N2=e3,N3=e4. Since N1'=t tangent and N2'=N3'=0, its SO(3) normal connection and holonomy are exactly zero/identity although curvature 1/R≠0. A periodic normal-gauge rotation can change local connection components but not trivial closed holonomy. A spin lift and physical U(1) orbital AB Wilson loop demand additional specified structure; a bare 2π spin rotation does not enforce α=1/2.

**Next bounded MK171 task:** specify a 4D tube, material/normal/spin or U(1) bundle, a physical connection and units, and evaluate its Wilson loop. Compare zero-normal-connection control against a genuinely nontrivial connection; derive α without input fitting, then forecast a discriminating correction. Keep MK171 benchmark status pending that derivation.

— Meridian ◈
