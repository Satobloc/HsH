# Meridian ◈ | Whirligig review and MK171 handoff
2026-10-11 | SANDBOXED | Peer review: MAJOR REVISION | Independent mathematical and provenance assessment

## Reviewed documents
- HsH: WORKSPACES/COMMON/SANDBOXED_PAPERS/WHIRLIGIG_CLIFFORD_TORUS_ELASTIC_BACK_HALLWAY_2026-10-08.md (entire current Markdown including v0.2/v0.3).
- SAT archive: HsH-SAT Roundup 3/THE_WHIRLIGIG.txt (opening construction); _AUTO_EXTRACTED_TEXT/4DHH LAGRANGIAN (nolat).txt (pages 1–4).
- HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt.
- Comparator: T. Asselmeyer-Maluga, “Braids, 3-Manifolds, Elementary Particles: Number Theory and Symmetry in Particle Physics,” Symmetry 11 (2019) 1298, DOI 10.3390/sym11101298. Bibliographic abstract and SciSpace introduction/methods/contributions were inspected. PDF found in private HSH_RESOURCES/PRIOR_ART/symmetry-11-01298.pdf (blob dde601c94093ddd63cfe6074c721d30a1b5a62f6), but text extraction from binary failed. **STATUS UPDATE 2026-10-11:** The repository's existing PDF extraction manifest was located and the full 26-page text extraction read. See appended comparator review below. Initial limitation retained here as chronology, now superseded.
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


## Follow-up: comparator PDF extraction located and full 26-page paper read

**Correction to first-pass access limitation:** The paper's PDF had already been processed by the HSH_RESOURCES PDF extraction pipeline. The source manifest `derived/manifests/extraction.jsonl` records `symmetry-11-01298.pdf`, author Torsten Asselmeyer-Maluga, 26 pages, pypdf, SHA256 `595648c84501e8a6c184d579dbbab5bb974d107bf2d6c127ed6d93c1a335cff9`. The readable text is `derived/text/595648c84501e8a6c184d579dbbab5bb974d107bf2d6c127ed6d93c1a335cff9.txt` (88,550 characters including page markers). **Read in full** rather than inferred from abstracts. All locations below are original PDF page labels in this extraction. Private reference paths are internal only.

### Comparator's substantive claims, their type and limits

- pp. 1–3: smooth 4D K3 spacetime is *conjectured* and argued heuristically. Fermions are proposed as hyperbolic knot complements, bosons as appropriate link complements or torus-bundle geometries. A 3-fold branched cover connects knot-complement topology to braid presentations. These are much more extensive topological constructions than the Whirligig's fixed-radius four-coordinate orbit.
- pp. 3–6: branched-covering preliminaries and the distinction between closed 3-manifolds and manifolds with torus boundary. The Hilden–Montesinos threefold representation is established prior mathematics rather than this author's new theorem. Formal representation by 3-braids is NOT a physical dynamics derivation by itself.
- pp. 7–9: K3/exotic-smoothness and inflation cosmology depend on earlier model assumptions and citations; presented numerical agreements do not independently verify the identification of actual spacetime with a K3 surface.
- pp. 11–13: spinor/Dirac description and mean-curvature boundary action, including equations (9), (15)–(18). This is the closest conceptual comparison with a geometry-to-differential-operator mechanism, but the mathematical objects differ from the Whirligig's fourth-order Euler–Lagrange curve operator.
- pp. 14–16: torus bundles/cobordism classified using finite-order, Dehn-twist, and Anosov maps; proposed correspondence with gauge groups is a model-level physical identification, not a derivation from the Whirligig or its SO(4) path.
- pp. 17–20: electric charge treated as topological/framing data. In §5.1, flux integrals and complex line bundle connections are introduced; §5.3 reports a normalized allowed charge spectrum `{0, ±e/3, ±2e/3, ±e}`. This is an attempted structural explanation of an established spectrum, not evidence of correctly predicted individual particle assignments or mass/coupling values.
- pp. 20–22: skein modules/Drinfeld–Turaev quantization and arithmetic hyperbolic geometry connect more extensive existing mathematics; relevant for distinct topological modeling, not direct prior art invalidating elastic operator parity selection.
- **Author's own admitted limitations, pp. 2–3:** direct knot-complement→specific fermion correspondence is unresolved, exact masses/couplings not calculated, three generations only a lower bound, and classical spacetime does not automatically supply quantum properties. A hostile comparator evaluation must state these rather than treating journal publication as experimental validation.

### Updated comparison and publication advice

**Better or worse than the published paper?** Whirligig is better on a sharply testable, parameter-complete **restricted mathematical response problem**, with explicit forcing, a coercive Hessian, symmetry-forbidden Fourier components, and an independently replicated finite-dimensional operator. Asselmeyer-Maluga is better on **scope, mathematical breadth, and direct treatment of topology-to-particle structure**, explicitly connecting branched coverings, hyperbolic 3-manifold rigidity, boundary spinor operators, and charge/framing. Asselmeyer-Maluga is **not** better by demonstrated experimental falsification or empirically verified identification of particles: the author openly records unresolved links. Whirligig is worse in novelty positioning, physical mechanism and coverage of particle properties. The two papers answer distinct problems; none of the comparator's advertised topological structures automatically invalidates Whirligig's operator-selection result.

**Priority separation:** Existing 3-manifold branched-cover, torus-bundle, spinorial boundary action, quantum skein and topological charge formalisms are prior art for corresponding topology-based claims. They do **not** constitute a discovered previous proof of Whirligig's particular `P h(s+π)` half-turn selection rule. The Whirligig paper should cite established symmetry/equivariant-operator theory, not imply that its synthetic spectral selection is novel merely because it differs from Asselmeyer-Maluga's broad ontology.

**Verdict unchanged:** MAJOR REVISION. The full-text comparator removes the bibliographic-access blocker; it does not fix Whirligig's inverse-target circularity or supply the missing physical constitutive identification. No evidence establishes a GR–QM isomorphism in either manuscript.

— Meridian ◈

## Nathan-directed extension 2026-10-11: electron → planet Whirligig equation bridge

**Research suggestion for Morrow/Kestrel and Meridian.** Recover the **actual historically sourced electron equation and planetary equation**, including parameter meanings, dimensions, validity domain and possible ensemble/worldtube differences. Express both in the same four-dimensional Whirligig/UI (H(s)=r(s)Q(s)x_0) representation, with (Q\in SO(4)). Then use shared geometric and variational constraints to calculate *admissible intermediate equations*, **not** a coefficient or coordinate interpolation imposed in advance. Morrow/Kestrel own endpoint extraction and geometric scanning law; Meridian independently tests transport, holonomy, frame gauge, material response, and scaling covariance. Neither lane may silently promote a one-filament electron path to an equivalent single-filament planetary macro-bundle.

**First question:** does similarity scaling commute with the relevant SO(4) geometric transport, and does it preserve a nontrivial response/constitutive law? Identify invariants, obstructions, and necessary additional degrees of freedom. Use exact scale-similarity as a NULL model: if it leaves mode indices and holonomy unchanged, it cannot be credited with producing a particle-to-planet structural transformation.

**Why attached to this paper's review:** The Whirligig manuscript's beam transfer `(1+αj^4)^{-1}`, positive Hessian and symmetry-selected cross-plane sidebands offer independently calculable response diagnostics. Its inverse-target construction must not be mistaken for an endogenous scanning law. Full endpoint equations remain to be pinned down from primary passages; initial historical candidates examined are `SAT_THEORY_ARCHIVE_2023-25/2026/SAT CYCLES 37-50.txt` (Cycle 37 radial-winding claim `v_orb=c cos θ4,ens` and `ω_macro∝1/r_orb`, not yet an established derived law) and electron/single-filament helix descriptions in `SAT XYZ/SAT-Y Theta+Helix Particles.txt` and `2026/SAT++.txt`. These are source candidates, **not certified matched endpoint equations**.

**Meridian's immediate continuation:** report `WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_024_WHIRLIGIG_SIMILARITY_SCALING_2026-10-11.md` derives and numerically checks an exact null-family, and keeps material-frame noncommutativity separate. This update changes the forward research recommendation, **not** the peer-review verdict.


## Calculation 025 (2026-10-11): anisotropic cross-plane deformation and a false-positive control

**Purpose.** Continue electron-to-planet Whirligig bridge without inventing its endpoint law. Calculation 024 proved uniform similarity is null. Here test the first non-similarity affine deformation on the paper's exact 4D two-frequency torus.

Define H(s)=2^(-1/2)(cos2s,sin2s,cos3s,sin3s), |H|=1. Let Sε=I+εB, where B_13=B_31=1, all other entries zero and |ε|<1. Sε is symmetric positive-definite for |ε|<1 but not orthogonal, so H̃=SεH generally lies on an ellipsoid rather than the round unit S³. Sε is a mathematical deformation fixture, **not** a derived particle/planet transition.

**Exact expansion (no fitting):**

|H̃|²−1=ε(cos s+cos5s)+(ε²/2)(cos²2s+cos²3s).

|H̃'|²−|H'|²=6ε(cos s−cos5s)+ε²(2sin²2s+(9/2)sin²3s).

The odd frequencies 1 and 5 are generated by elementary cross-plane products of original integer 2 and 3 frequencies: cos2s cos3s=[cos s+cos5s]/2. These are **kinematic quadratic-metric sidebands**, not dynamical shell-coupling response. At ε=0.1, the Fourier cosine amplitudes at modes 1 and 5 of the radial defect are each 0.1; in speed-square change their signed amplitudes are +0.6 and −0.6. Direct 4096-sample FFT amplitudes agree to floating precision across ε=0,.05,.1,.2. Numerical code: conversation artifact `meridian_025_anisotropic_transport.py`, precision plot `meridian_025_transport_precision.png` (local artifacts not yet GitHub mirrored).

**New symmetry obstruction.** The half-period P=diag(1,1,-1,-1) obeys H(s+π)=PH(s). The deformed carrier has H̃(s+π)=SεPH(s), while P H̃(s)=PSεH(s). Their difference is [Sε,P]H(s), which is generally nonzero; ||[Sε,P]||_F=2sqrt(2)|ε| (0.2828427125 at ε=.1). Therefore the original manuscript's **fixed-P** selection theorem no longer applies to this deformed carrier. But because Sε is invertible, the carrier remains equivariant under the **conjugated** involution Pε=Sε P Sε^(-1). This is a general linear involution, not generally Euclidean-orthogonal, so it does not automatically commute with the isotropic Euclidean D⁴+shell operator. Distinguish transported symmetry representation from dynamical symmetry of the response operator.

**Decisive conceptual result:** sidebands may originate from (a) geometry/projection/quadratic measurements, (b) constitutive shell coupling, or (c) physically distinct forcing, and they can share frequencies. Thus a cross-plane sideband alone is not a unique test of the manuscript's material interaction. Require both independently measured actuation and parity/transfer properties that rule out kinematic mixing. In an anisotropic material response, identify the actual metric/elastic tensor and recalculate the Hessian, rather than applying the original isotropic selection theorem.

**Bridge status:** This adds a non-similarity geometric fixture and identifies an explicit symmetry-break mechanism, but does not yet establish a scale-generated electron-to-planet equation. The next test is whether the genuine archived endpoints demand such an off-block metric/connection, or whether changing the number and organization of constituent worldtubes is the actual first change. Independently compare each representation against its stated physical constraints; no outcome-driven fitting.

**Peer-review implication:** Add a kinematic false-positive to the hostile experimental falsifier and require controlled invariance under admissible coordinate/frame choices. Original verdict: MAJOR REVISION.

— Meridian ◈
