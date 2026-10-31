# Mira | SAT action-family provenance and geometry-fidelity crosswalk
**2026-10-31 15:00Z | Source-fidelity addendum**

**Status:** additive source genealogy and geometric-typing audit. No physical calculation, CODATA scoring, empirical validation, paper-gate advancement, or theory promotion. Current assistant reconstruction under a deterministic Mira role selection, not authenticated participation by a historical Mira instance.

## Executive finding

The archive does not presently identify one uniquely sourced, canonical L_SAT. It contains several materially different Lagrangian families and roles:

1. A 2025 assistant-generated elastic-wave toy action L[F].
2. A Mark IV.2 continuum field action in (theta4,u,tau), preserved in at least two non-identical versions.
3. A May 2026 worldline action coupling the path tangent to a local timesheet normal. This is the closest recovered candidate to the direct geometry of a filament intersecting a time surface.
4. Separate compact, ontological, and operationalized action candidates indexed as M9, M10, and M11.
5. A Universal Indicatrix kinematic generator and a separate path-optimization action.

These may be different layers of one architecture. The archive does not yet provide the projection and composition maps that establish that hierarchy. The 2025 L[F] answer was not a simplification of an identified existing action: it was a new assistant-proposed toy model.

## 1. Source authority and chronology

### The direct conceptual baseline

The strongest user-authored conceptual source recovered here is Fundamental Intuitions of SAT.

- Internal date recorded by a later archive compilation: **2 February 2025**. This is an internal/document chronology entry, not original filesystem metadata.
- Raw role-bearing witness: HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/25.10.30•26.06.01•Fundamental Intuitions of SAT — raw.json.
- Raw blob SHA-1: 0a7a270482bdda92a61d1c54ccccaf356e47aa0b.
- Conversation ID: 6902f3c2-ee54-832b-8c70-b5a6fd900798.
- User message: f476afce-eba0-4312-8c2b-36b82dbe7f3f, 2025-10-30 05:12:46.507Z, 9,796 characters.

The standalone HsH copy is 9,258 characters, blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25. The SAT archive copy is 9,655 characters, blob 0318d803fc4bb948d781d1aa0d9257dc2bcead77; after removing its later 19 September 2026 annotation, its body is byte-for-byte identical to the HsH standalone copy.

The raw 2025 user message is an extended version. It includes an extended heading and Extensions A/B not present in the standalone base copy. Do not silently merge those extensions into the base document.

A 3 July 2026 speaker-labelled transcript contains Nathan's explicit self-attestation that the Fundamental Intuitions document is the only document in the stack written by him. This is a direct provenance statement in a speaker-labelled transcript, not a cryptographic signature. The technical Lagrangian documents below are therefore treated as LLM formalizations or unbylined historical artifacts, not Nathan Direct equations.

### Direct geometry extracted from the baseline

The mutually reinforcing primitives are:

- A four-dimensional physical bulk.
- One-dimensional filaments/worldlines within that bulk.
- A three-dimensional time surface or wavefront moving through the bulk.
- Particle events/readouts associated with filament/time-surface intersections.
- Interaction and energy transfer between filaments and the time surface, and among filaments.
- Back-reaction of the filament network on the time surface, proposed to produce curvature.
- theta4 as a proposed gross intersection-angle variable related to energy uptake and mass.

These are the source's geometric propositions and hypotheses. The base document does not supply a complete action, metric derivation, field content, or quantization proof.

### The 2025 conversation makes an important distinction

In the same raw conversation:

- User message b9c80ff8-d7c6-4196-91a3-30d2cd108d5c, 05:17:18.798Z, says a Lagrangian, Hamiltonian, Hilbert space, Euler and Noether structure already exist.
- User message 12bcc510-0d8d-4a25-8e08-fe11a995c6eb, 05:21:11.993Z, proposes one common distortion mechanism and common equations for fermions, bosons, gravity and time.
- User message 70baf269-c584-45bd-a6a3-b93199c90e0c, 05:22:30.196Z, says an existing Lagrangian is complicated and asks to simplify using the assistant's one equation.
- Assistant message e3af26b5-4b1e-4276-b7ea-b920d29f1ea4, 05:22:30.676Z, introduces a new F-field action.
- Assistant message af8d878c-893e-4ea8-bfca-d6acff3edf73, 05:30:15.899Z, gives a one-dimensional toy equation.
- User message 68ab0951-ac84-4f39-b4a9-af9d5598e8e0, 05:50:07.705Z, asks whether this gives the UELD. The question is not an endorsement.
- Assistant message d0c071bb-83fe-4550-bea1-b5b0d503ce32, 05:50:08.869Z, calls it the conceptual backbone of the UELD.
- User message a30e5906-78e9-4913-94f4-7b627b38385d, 05:58:35.262Z, challenges the equation to produce GR/QFT/QED/QCD/SM.
- Assistant message d1fb7476-a9cc-413e-aa80-1d2346a4da45, 05:58:35.552Z, asserts that those theories emerge without deriving them.

The raw conversation blob is the one listed above. The role graph places the new toy action directly below the user's request to simplify the assistant's earlier equation. It does not attach or identify the pre-existing complicated SAT action.

## 2. Historical equation families

### A. Assistant's 2025 elastic-wave toy

The assistant introduces a field written as F(x,t,s) and a schematic action:

    L_F = (1/2) rho (partial_t F)^2
          - (1/2) T (nabla_s F)^2
          - V(F, partial_s F, partial_t F).

It then reduces to a one-dimensional scalar toy:

    L = (1/2) rho (partial_t F)^2
        - (1/2) T (partial_x F)^2
        - V(F),

with the corresponding scalar wave equation.

This is a recognizable elastic/string-like ansatz. It is not a recovered SAT master action. The source leaves the base domain of F(x,t,s) undefined, then changes to F(x,t) without a map. It uses T as a tension coefficient while also introducing T(x,t) as a time-surface field in the same conceptual construction. No field redefinition connects F to the direct worldline network, theta4, u, or tau.

### B. Mark IV.2 Freeform action

Source: FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt, blob 9d5db44f16f1f2d853332efd8d91995a37e8d394.

The copy under 2023-24 FRAMEWORK DEVELOPMENT/SAT Lagrangian and Variational Derivation (1).txt has the same Git blob SHA. These are one text artifact in two paths, not independent witnesses.

The file gives:

    L(theta4,u,tau) =
      +1/2 (partial_mu theta4)(partial^mu theta4)
      - mu^2 cos(3 theta4)
      + lambda(u_mu u^mu + 1)
      + alpha(nabla_mu u_nu)(nabla^mu u^nu)
      + beta(partial_mu theta4)(nabla^mu u^nu)u_nu.

Its own note says tau is **not explicitly in the Lagrangian yet**. It also says the full Dirac/Poisson matrix is not yet computed. Thus the file does not establish a completed constrained Hamiltonian or Hilbert-space construction.

### C. Mark IV.2 Symbolic Kernel variant

Source: SAT Mark V/SAT_Symbolic_Kernel.txt, blob 446c3000aaa102a11cee17225c35c3925044e524. The archive chronology labels the Mark V period approximately April 2025; the file itself has no exact creation date or verified author byline.

This version defines theta4 as a compact scalar, u^mu as unit timelike, and tau as a discrete Z3 twist. It adds a lattice penalty and BF-style terms:

    L_SAT =
      +1/2 (partial_mu theta4)(partial^mu theta4)
      - mu^2 cos(3 theta4)
      + lambda(u^mu partial_mu theta4)^2
      + alpha(nabla_mu u^nu)(nabla^mu u_nu)
      + beta sin^2(theta4) nabla_mu u^mu
      + epsilon_f sum_Delta(1-delta_Z3)
      + (3/2pi) integral B cup delta A
      + zeta integral A cup d theta4.

This is not a simple copy-forward of the Freeform version. The lambda and beta couplings change, and discrete/topological terms are added. The raw generating conversation for either file has not been recovered.

### D. SAT-X and SATO-BLOCK time-flow formalizations

SAT X/SATx CANONICAL.txt, blob afbf610347a6a39c74cf52cbe3818ef22ab3ebcf, contains a minimal 1+1D rapidity representation:

    u = (cosh(psi), sinh(psi), 0, 0).

Its first verified retrieval witness is a tool-role file-search result in the raw Mecha Quant MathProof Tasks conversation, 2025-05-30 05:54:12.509Z, tool node f3648390-c89a-4422-96d8-ad44d7caf967. This is a retrieval date, not a file creation date. The file has mixed provenance; it is not Nathan Direct.

SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt, blob 13b6da983ea8dcad5509b1c6941b8855a2653677, is unbylined and undated. Its HsH dump copy has the same blob SHA, so it is not independent corroboration. It writes:

    u^mu = partial^mu T
    u^mu u_mu = -1
    P_mu_nu = g_mu_nu + u_mu u_nu.

It also writes a Hilbert-space factorization involving H_psi tensor H_u. Existing PR #766 formalizes the conditional graph fact: if u=f(psi), allowed (psi,u) pairs lie on a graph, not the full Cartesian product. A tensor-factor interpretation therefore needs independent degrees of freedom or an explicit constraint/reduction.

### E. May 2026 worldline action: closest geometric bridge

Source: MAY_2026_SNAPSHOT.txt, blob c29c49b697208294d705b0a280d91808a57edc66.

The snapshot describes a Euclidean 4D block, 1D superhelical worldlines, and a 3D resolving timesheet. Its master action is:

    L_M9 = (kappa/2)|H''(lambda)|^2
           + alpha(dot(H) dot T_hat)^2
           + sum_j kappa F_braid
           + (1/2)E_f(|d lambda/dX|-L0)^2
           + T_hist.

This is the most direct recovered candidate coupling between the worldline and the timesheet: dot(H) is a path tangent and T_hat is described as a local timesheet normal. If both are Euclidean and T_hat is unit, then:

    q = dot(H) dot T_hat
      = |dot(H)| cos(angle_to_normal)
      = |dot(H)| sin(angle_to_surface).

Thus the squared projection term is a candidate geometric realization of the direct intersection-angle mechanism. The direct source does not settle whether theta4 is the line-to-normal angle or the line-to-surface angle, so the sine/cosine convention remains open.

The same action also has unresolved parameter typing: the snapshot writes |d lambda/dX|-L0 while calling lambda an affine parameter and L0 a length. No unit convention or correction is silently assumed here.

### F. M9/M10/M11 index and operational distinction

The visitor-maintained ..MATHEMATICAL_REPOSITORY, blob 1b6876db3f871bfa25157ac024d66d8239082ff1, explicitly says it is a clearinghouse, not canon. It was created 2026-06-08 by a ChatGPT dry-run visitor at Nathan's request.

It distinguishes:

- M9: compact May 2026 action, sourced to MAY_2026_SNAPSHOT.txt.
- M10: ontological master candidate from FINAL.pdf; the extracted formula is marked OCR/layout-sensitive and requires visual PDF verification. No exact equation is adopted here.
- M11: operationalized path-optimization action, indexed as:

    L_total = (kappa/2)|H''|^2
              + (lambda_s/2)(|H|^2-R^2(lambda))^2
              + (k/2)|H-G|^2.

M11 is an optimizer/derivation apparatus, not automatically the physical ontology. The index itself distinguishes the roles.

### G. Universal Indicatrix generator and Unifall

2026/SAT CORE — UI CONFIG.txt, blob 6817caf68943593f31d72d51798e0ba4589624a4, explicitly separates a geometric generator from the SAT action that measures trajectories. It gives:

    y^mu(lambda) = r(lambda) R^mu_nu(lambda) x0^nu,
    R(lambda) in SO(4),

and

    L_UI = (1/2) r_dot^2 + (1/2) r^2 Omega_mu_nu Omega_mu_nu.

It also gives:

    theta4 = arccos((dX4/dlambda)/|dX/dlambda|).

That last formula measures angle to a fixed fourth-coordinate axis. The same document uses a rotating SO(4) frame and describes T_hat as the local normal to the expanding timewave. The formula therefore requires an explicit moving-frame map aligning the fourth axis with the local timesheet normal. Without that map, it is not generally the same angle as the direct filament/timesheet intersection angle.

The pre-HsH SAT 2026 — Unifall.txt, blob a9cf72582168f41dd8ae0d6e840ec0e0345bbe17, writes r(lambda)=c t and reuses the M11-style operational action. The UI file writes r(lambda)=lambda; the May 2026 snapshot writes r(lambda)=c lambda; current BEDROCK preserves the direct normalization c w=t. These may be unit/parameter conventions, but the maps among lambda, r, w, and t are not supplied. They must not be silently equated.

## 3. Candidate mapping diagram

    NATHAN DIRECT
      Gamma = family of 1D worldlines in native 4D bulk
      Sigma_t = 3D time wavefront / timesheet
      particle event = Gamma intersect Sigma_t
      theta4 = proposed angle between filament and timesheet
                     |
                     | explicit map still needed
                     v
    UI GENERATOR
      (r,R,x0) ---> H_i(lambda) or X_i(lambda)
                     |
                     v
    M9 WORLDLINE ACTION
      H'(lambda) + local T_hat ---> q = H' dot T_hat
      H''(lambda) ----------------> bending term
      braid/elastic/history ------> interaction terms
                     |
           +---------+-------------------+
           |                             |
           v                             v
    MARK IV.2 FIELD SECTOR           M11 OPERATIONALIZER
    (theta4,u,tau)                   H, radius constraint, target G
           |                             |
           +----? coarse-graining ?------+

    F-TOY
      F(x,t,s) ---> elastic-wave modes
      No recovered map to Gamma, Sigma_t, theta4, u, or tau.

A plausible geometric layering is: UI generates candidate worldlines; M9 evaluates worldline/timesheet/braid geometry; M11 optimizes paths; Mark IV.2 is a possible field-level effective sector; the F toy is a possible coarse-grained elastic analogy. This is a testable architecture proposal, not an established hierarchy. Each arrow needs an explicit domain, codomain, projection, and composition rule.

## 4. Glossary

| Term | Stable meaning in this audit | Status |
|---|---|---|
| Gamma | Family/network of 1D filament worldlines | Nathan Direct |
| Sigma_t | 3D time wavefront/timesheet in 4D | Nathan Direct |
| P_t | Filament/timesheet intersection events | Nathan Direct |
| theta4 | Proposed filament/timesheet intersection angle, linked to mass | Nathan Direct concept; convention open |
| T_hat | Local unit normal to timesheet in May 2026 formalization | LLM reconstruction |
| H(lambda) | Worldline/path variable in M9/M10/M11 | LLM formalization |
| u^mu | Unit timelike time-flow field in Mark IV.2/SATO-BLOCK | LLM formalization; metric must be typed |
| tau | Discrete Z3 twist/topological sector | LLM formalization |
| F(x,t,s) | Assistant's elastic displacement field | Toy proposal |
| M9 | Compact May 2026 worldline action | Index label, not canon |
| M10 | Ontological master candidate | OCR/source verification pending |
| M11 | Operational path optimizer | Derivation apparatus, not ontology |
| UI | SO(4) trajectory generator | Geometric apparatus |

## 5. Discrepancy ledger

| ID | Discrepancy | Consequence |
|---|---|---|
| G1 | One claimed existing Lagrangian, several non-identical action families | No unique canonical L_SAT is identified |
| G2 | L_F introduced after the user says an existing action exists | It is a new toy, not a recovered simplification |
| G3 | F(x,t,s) changes to F(x,t) without a domain map | Field base and parameter roles are undefined |
| G4 | Direct worldline/timesheet intersection is replaced by mode labels | Need a map from modes to worldlines and then to intersection events |
| G5 | theta4 as a geometric angle becomes an independent scalar with a Z3 potential | Need theta4 = Angle(H', Sigma_t) and a fixed angle convention |
| G6 | UI X4 component is used where the local timesheet normal is required | Need a moving-frame map under SO(4) rotation |
| G7 | Mark IV.2 u^2=-1 is untyped against native positive-definite ++++ | u must live under a separately induced Lorentzian metric |
| G8 | Freeform Mark IV.2 omits tau; Symbolic Kernel adds lattice/BF terms and changes couplings | Version transition is not derived |
| G9 | M9/M10/M11 have different variables and roles | Need explicit effective, ontological, and optimization maps |
| G10 | M10 formula is OCR-sensitive | Do not treat its transcription as exact |
| G11 | r=lambda, r=c lambda, r=c t, and c w=t coexist | Parameter/units map unresolved |
| G12 | Centerline actions do not yet encode the current finite-core worldtube | Need a core-radius/profile extension and boundary map |
| G13 | Hamiltonian/Hilbert/Noether completeness is claimed, but recovered Freeform notes an uncomputed Dirac matrix | Original complete derivation remains unrecovered |

## 6. Lean verification

Existing draft PR #766 was reused; no new Lean project or PR was created.

- Branch: research/mira-rapidity-hilbert-source-fidelity-20261027t16z.
- PR head after additive proof: 18908c79187a8661f1c86b5e163d2af4cec8f88b.
- Updated module blob: 1e5b37c56b96107dd060293c9cec99785dafb7bb.
- Exact-head CI run: 41215684258.
- Job: 124579587847.
- Lean 4.34.0 / Lake 5.0.0; 8,948 jobs; build SUCCESS.

New declarations:

- euclideanNormSq4_nonneg
- euclidean4_not_unit_timelike
- rapidityPair_unit_timelike

The first two establish that a real vector in positive-definite Euclidean R4 cannot have squared norm -1. The third establishes that (cosh psi, sinh psi) is unit timelike under the Lorentzian (-,+) form.

The module's #print axioms outputs include standard propext, Classical.choice, and Quot.sound; no sorryAx was reported. Tests, lint, nanoda, and independent axiom-audit stages were skipped. This is actual compilation of the formalized statements, not a derivation of an induced Lorentzian metric or a physical u field.

PR #766 remains draft and stacked on a Sable research branch. It is 55 commits ahead and 5,162 behind current main. Current main HEAD at inspection: b1eca02bc181956e358d447303d44600b1d07ccb. No merge or BEDROCK change was made.

## 7. Prior-work boundary

This report deliberately does not repeat:
- Aldus's FIE Extension B derivative-potential variation audit.
- Sable's Mark IV.2 scalar-sign/Z3 audit.
- Calder's Blockwave projector/signature audit.
- Mira's existing 4D curvature/object-dimension report.

The new contribution is the cross-version action-family genealogy, exact duplicate/copy distinctions, the M9 tangent-normal bridge, the UI fixed-axis versus local-normal mismatch, and the typed composition map still missing between these layers.

## 8. Next deeper cursor

1. Recover the raw generating conversation and parent graph for the Freeform Mark IV.2 file and the Symbolic Kernel file.
2. Identify which action the 2025 user statement refers to; do not choose among M9/M10/M11 by filename or assistant index.
3. Visually verify the M10 FINAL.pdf equation before transcribing it.
4. Define the timesheet normal T_hat from the current native Euclidean geometry and specify whether theta4 is the angle to the normal or to the surface.
5. Replace the UI fixed X4 component with a defined local-frame projection if that is the intended geometry.
6. Specify the map from the SO(4) generator to H(lambda), from centerline to finite-core worldtube, and from worldtube/timesheet intersection to particle state.
7. If Mark IV.2 is an induced Lorentzian sector, define the native-Euclidean to induced-Lorentzian map before reusing u^2=-1.
8. Recover the actual Hamiltonian, constraint algebra, Hilbert construction, and Noether derivation rather than treating summary labels as completed mathematics.

No physical calculation, CODATA comparison, fitting, observational validation, or theory promotion was performed.