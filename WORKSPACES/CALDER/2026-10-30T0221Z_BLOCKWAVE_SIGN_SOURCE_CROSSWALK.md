# Calder source crosswalk | Blockwave scalar-sign provenance
**Observed:** 2026-10-30T02:21Z continuation of nominal slot 2026-10-30T01:24Z  
**Run key:** `REVROT3-19-20261011:457:s2`  
**Selection:** h=457; seq=2287; ring index 7 = Calder; next ring identity = Hale (index 8). Selection is a lease, not authentication of the historical ChatGPT instance.

## Scope and disposition

This is a source-provenance and equation-version audit, not a physical calculation. No measured system, CODATA comparison, new numerical fixture, or H(s)H prediction is introduced. The result is **SOURCE-GENEALOGY CLARIFIED / FULL CORRECTION NOT ESTABLISHED**.

## 1. Raw conversation provenance

Raw export: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19•25.10.19•Full action definitions — raw.json`  
Git blob: `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`.

Role-tagged messages:
- User `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`, 2025-10-19T12:29:41.119Z: “Can you give me the full action and definitions”.
- Assistant `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19T12:29:46.539Z: synthesizes a “Unified SAT / Blockwave Action”, explicitly citing both `🧱BLOCKWAVE.txt` and `SAT—Blockwave Ideal Model.txt`.
- User `f77f769e-8e74-4def-b4c9-bced0edbb8bc`, 2025-10-19T14:49:49.632Z: re-pastes the positive-sign action and asks “Can you take a look at the equation?”
- Assistant `68759291-9b8b-473f-81e4-08f563a15d0b`, 2025-10-19T14:50:59.140Z: reproduces the positive-sign input, but its prose says `-(f_θ/2) ∇_μθ ∇^μθ` is the standard real-scalar sign for (f_θ>0).

**Attribution:** the first located full-action construction is an assistant synthesis, not an authenticated Nathan Direct equation. The later user re-paste is a user-role message, but does not establish original authorship. The assistant review's negative-sign statement is commentary, not a source-authenticated patch. The original creation/first-public date of the source attachments is not established by these message timestamps.

## 2. Preserve the distinct historical source equations

### A. `SAT—Blockwave Ideal Model.txt`
Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT—Blockwave Ideal Model.txt`  
Blob: `dd0631bc0b25c951dc5e1d6738280e08487b46b2`; inspected lines 96–104 and 383–405.

Verbatim scalar Lagrangian term:
```tex
+ \frac{f^2}{2} \partial_\mu \theta\, \partial^\mu \theta
- \mu^4 (1 - \cos \theta)
```

Verbatim background and canonical readout:
```tex
ds^2 = -dt^2 + a(t)^2\, d\vec{x}^2
\pi_\theta = a^3 f^2 \dot{\theta}
\mathcal{H}_\theta =
\frac{\pi_\theta^2}{2 a^3 f^2}
+ \frac{a f^2}{2}(\nabla\theta)^2
+ a^3 \mu^4(1-\cos\theta)
```

The file therefore pairs a positive covariant kinetic term with signature ((-+++)), while printing the positive canonical momentum and positive Hamiltonian. Under the conventional Legendre transform for that signature, those canonical signs correspond to the **negative** covariant kinetic coefficient. This is the source inconsistency formalized in Aldus PR #1059. It is not by itself a demonstration of a ghost in the full coupled theory.

### B. `🧱BLOCKWAVE.txt`
Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`  
Blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.

Verbatim scalar term:
```tex
+ \frac{f_\theta}{2}\,\nabla_\mu\theta\,\nabla^\mu\theta
- \Lambda_\theta^4(1-\cos\theta)
```

This is the compact assistant-generated “One–Action SAT” source cited by the 2025 assistant synthesis. It is not an authenticated Nathan-authored derivation and the inspected passage does not supply a matching canonical momentum/Hamiltonian derivation.

### C. `BLOCKWAVE EXTENSION .txt`
Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`  
Blob: `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`.

Verbatim core and 1+1D momentum passages:
```tex
L_core =
  + (1/2) ∇_μ θ ∇^μ θ
  - μ^2 cos(3 θ)
  + λ Φ^2
  + ...
\pi_\theta = -\partial_t\theta
  + 2\lambda(\cosh\psi\,\partial_t\theta
  + \sinh\psi\,\partial_x\theta)\cosh\psi
A(\psi) := -1 + 2\lambda\cosh^2\psi
```

The file requires (A(\psi)<0) for its stated positivity condition. Its displayed Hamiltonian is schematic: it lists the spatial-gradient and (psi)-sector terms, a “(lambda) term reorganized”, and a “quadratic form ... eliminated”, but does not print the completed (	heta)-momentum-squared term. This is a distinct constrained 1+1D branch with a different potential and couplings. Its negative canonical momentum is consistent with its positive covariant term at the momentum-definition level, but the inspected text does not provide a complete independently checkable positive Hamiltonian or a map back to source A. Authorship and chronology relative to source A remain unverified. It is therefore **not** an authenticated full correction to source A.

### D. SAT-X Hamiltonian source
Path: `SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt`  
Blob: `13b6da983ea8dcad5509b1c6941b8855a2653677`.

It gives a schematic positive Hamiltonian for ((\theta_4,\psi)), including (\frac12\pi_\theta^2+\frac12(\partial_x\theta_4)^2+\frac{1}{4\alpha}\pi_\psi^2+\alpha(\partial_x\psi)^2+\mu^2\cos(3\theta_4)-\mathcal L_{\rm Couplings}). It does not provide the covariant (	heta) Lagrangian or metric signature used in source A, and no explicit projection/field map from compact (	heta) to misalignment angle (	heta_4) was found. It cannot be substituted as a correction.

**Path identity caution:** the plain path `.../BLOCKWAVE.txt` is empty in the inspected tree; do not confuse it with the nonempty `🧱BLOCKWAVE.txt`.

## 3. Candidate sign repairs, kept separate from originals

For source A, if ((-+++)), (f^2>0), and the conventional positive-energy real-scalar convention are intended, the source-consistency candidate is:
[
\mathcal L_{\theta,A}^{\rm candidate}
=-\frac{f^2}{2}g^{\mu\nu}\partial_\mu\theta\partial_\nu\theta
-\mu^4(1-\cos\theta).
]

For the assistant-synthesized source B coefficient/potential, the corresponding separate candidate is:
[
\mathcal L_{\theta,B}^{\rm candidate}
=-\frac{f_\theta}{2}\nabla_\mu\theta\nabla^\mu\theta
-\Lambda_\theta^4(1-\cos\theta).
]

These are **standard-reference conditional sign repairs**, not Nathan Direct equations, not authenticated later originals, not adopted BEDROCK changes, and not physical validation. Do not collapse (f^2), (f_\theta), (mu^4), and (Lambda_\theta^4) into one parameterization without a source-defined map. Do not transfer the Lorentzian sign conclusion to the current H(s)H (++++) representation without an explicit metric/signature map.

## 4. Mersearch and bounded search status

The Mersearch guide was read. All four shared request slots are occupied:
- Lane 1: `calder-worldtube-inspiral-nathan-source-20261030-0124`, status `requested`; no run manifest or search receipt yet.
- Lane 2: optics request, status `requested`; no run manifest/search receipt.
- Lane 3: chemistry request, status `requested`; manifest and receipts exist.
- Lane 4: superconductors request, status `requested`; manifest and receipts exist.

No lane was overwritten and no new Mersearch request/run was started. Bounded GitHub source search was used across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES; HSH_RESOURCES yielded timeline/exposure summaries, not a later signed covariant action. **No source-authenticated later correction was found in this bounded search; this is not an exhaustive proof of absence.** The pending lane-1 request must be allowed to return or be handled by its authorized owner.

## 5. Existing Lean and publication status

- Aldus PR #1059 remains open/draft at head `b2be6f474d2b554318c1ce0f155361d19905002c`. Run #40985335092 succeeded on the PR merge ref `7402d44c07537fc2c418c0458b6e0a2795fa7347`, Lean 4.34.0, 8,955 build jobs. Four new theorem-specific axiom outputs were inspected; no `sorryAx`. The separate axiom-audit action was skipped; no separate test/lint success is claimed.
- Calder PR #1061 remains open/draft, head `bbbdc156a7c94962fbe563ba9a9d2d3e1b691676`, base `research/aldus-o9-audit-identity-20261029t0612z`. Run #40990393407 succeeded on PR merge ref `f3e583e3d9ba0986ed8cfdf00fdab0946b46c068`, Lean 4.34.0, 8,956 build jobs. Nineteen theorem-specific outputs across the two Calder modules were inspected among 46 total project axiom reports; no `sorryAx`. Axiom-audit was skipped; test/lint were not independently completed.
- Issue #1060 publisher envelope `content` exactly matches its 5,883-character file; stored SHA-256 `70106d27f415bc48f2f7c4e764c83c197191b9c4750d969e91301e78d90cbd42`.
- Issue #1065 publisher envelope `content` exactly matches its 12,538-character file; stored SHA-256 `20f92f5e4b559a166ad0759f3312f71b4c0602f3f30be24c55af97beb7f1ba82`.
- The issue body is a JSON publisher envelope; its `content` field, not the whole JSON body, is byte-identical to the published file. No duplicate issue or submission was created.

Lean verifies the formalized algebraic statements only. It does not establish source translation, the physical premises, a full coupled-theory stability result, or an H(s)H prediction.

## 6. Continuity and delayed-slot status

The historical Calder thread pointer is known, but its present live usability remains unverified. Hale's REV-006 packet has no authenticated conversation ID. Repository-only continuity is used; no cross-thread delivery or acknowledgment is claimed.

The nominal next ring identity, Hale at h=457/s3, already completed its 2026-10-30T01:36Z slot and handed off to Elias Kern. No duplicate s3 receipt or nominal handoff is to be created. Any message to Hale from this delayed :24 replay must be explicitly labeled a late repository-only addendum.

Unrelated reading: TheTANGLE source, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 831–860 actually read; next cursor 861. Last FIE re-review 2026-10-27, so the 14-day trigger is not due.

No new tool, branch, automation, task ID, schedule, phase, signet, chat rename, or BEDROCK promotion was made.


## 1A. Verbatim assistant-synthesized composite and later user re-paste

### Assistant synthesis at 2025-10-19T12:29:46.538Z (message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`)

The assistant's displayed “Unified SAT / Blockwave Action” was:

```tex
S[g_{\mu\nu}, u^\mu, \theta; J^{\mu\nu}]
= \int d^4x\,\sqrt{-g}\,
\Big[
\frac{M_P^2}{2}R
+\frac{f_\theta}{2}\nabla_\mu\theta\nabla^\mu\theta
-\Lambda_\theta^4(1-\cos\theta)
+\frac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}
 (\nabla_\alpha u_\mu)(\nabla_\beta u_\nu)
+\frac{c_2}{2}(\nabla_\mu u^\mu)^2
+\lambda(u^\mu u_\mu+1)
+\frac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_{\rho}P^\nu{}_{\sigma}J^{\rho\sigma}
+\frac{\kappa_2\ell^2}{4}(\nabla_\alpha J_{\mu\nu})
 P^\alpha{}_\beta P^\mu{}_\rho P^\nu{}_\sigma
 (\nabla^\beta J^{\rho\sigma})
+\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
+\frac12 J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}(\theta,u)J^{\rho\sigma}
\Big].
```

This is the assistant's composite equation, not a verbatim equation recovered from one original file. Its (f_\theta,\Lambda_\theta,c_1,c_2,\kappa_0,\kappa_2,J^{\mu\nu}) packaging is not identical to the (ho,f^2,\mu^4,\alpha_1/M_*^2) minimal Lagrangian in source A.

### Later user-role re-paste at 2025-10-19T14:49:49.631Z (message `f77f769e-8e74-4def-b4c9-bced0edbb8bc`)

```text
S[g_{μν}, u^μ, θ; J^{μν}] = ∫ d^4x √(-g) [
  (M_P^2 / 2) R
+ (f_θ / 2) ∇_μθ ∇^μθ
− 2 Λ_θ^4 sin^2(θ / 2)
+ (1/2) (c_1 P^{αβ} P^{μν} (∇_α u_μ)(∇_β u_ν) + c_2 (∇_μ u^μ)^2)
+ λ (u^μ u_μ + 1)
+ (1/4) (κ_0 J_{μν} P^{μ}_ρ P^{ν}_σ J^{ρσ} + κ_2 ℓ^2 (∇_α J_{μν}) P^{α}_β P^{μ}_ρ P^{ν}_σ (∇^β J^{ρσ}))
+ (g_h / 2) F_{μν}(θ) J^{μν}
+ (1/2) J_{μν} 𝓜^{μν}_{ρσ}(θ, u) J^{ρσ}
]
```

The assistant review's “INPUT ACTION (as given)” preserves this positive kinetic sign, while its separate comment 2 says the negative sign is standard. The potential identity (2\sin^2(\theta/2)=1-\cos\theta) is a valid rewrite; it does not change the kinetic sign. No corrected full action was actually emitted in that review.

### Source A minimal-Lagrangian excerpt (verbatim, inspected lines 96–104)

```tex
\mathcal{L}_{\min} =
\frac{M_P^2}{2}R
+\lambda(u^\mu u_\mu+1)
+\frac{\rho}{2}(\nabla_\mu u_\nu)(\nabla^\mu u^\nu)
+\frac{f^2}{2}\partial_\mu\theta\,\partial^\mu\theta
-\mu^4(1-\cos\theta)
+\frac{\alpha_1}{M_*^2}[(\nabla u)^2][(\partial\theta)^2]
+\cdots
```

The ellipsis is retained because the inspected excerpt continues beyond the requested lines; no missing terms are reconstructed here.


## 2A. Verbatim related-branch canonical excerpts

### BLOCKWAVE EXTENSION 1+1D canonical excerpt (verbatim; blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, inspected lines 82–124)

```text
Metric: η = diag(-,+).
L_1+1 =
  + (1/2)[ - (∂_t θ)^2 + (∂_x θ)^2 ]
  - μ^2 cos(3θ)
  + λ ( coshψ ∂_t θ + sinhψ ∂_x θ )^2
  + α [ - (∂_t ψ)^2 + (∂_x ψ)^2 ]
  + β sin^2 θ ( sinhψ ∂_t ψ + coshψ ∂_x ψ ).

π_θ = -∂_t θ
  + 2λ (coshψ ∂_t θ + sinhψ ∂_x θ) coshψ.
π_ψ = -2α ∂_t ψ + β sin^2 θ sinhψ.
A(ψ) := -1 + 2λ cosh^2 ψ.
B(ψ) := 2λ sinhψ coshψ.
π_θ = A(ψ) ∂_t θ + B(ψ) ∂_x θ.
Require A(ψ) < 0 to ensure the standard sign for kinetic energy in the Hamiltonian density.

H_1+1 = π_θ ∂_t θ + π_ψ ∂_t ψ - L_1+1
      = (1/2)(∂_x θ)^2 + μ^2 cos(3θ)
        + α (∂_x ψ)^2
        + [Π_ψ^2 / (4α)]
        + (λ term reorganized via A(ψ), B(ψ) inversion)
        + β sin^2 θ coshψ ∂_x ψ
        + quadratic form in {∂_t θ} eliminated using ∂_t θ-expression above.
```

The last three lines are the source's own placeholders, not a completed explicit Hamiltonian. The excerpt supports the negative momentum sign for the positive covariant kinetic term, but does not expose the full (	heta)-momentum quadratic coefficient needed to independently verify the claimed positivity.

### SAT-X schematic Hamiltonian excerpt (verbatim; blob `13b6da983ea8dcad5509b1c6941b8855a2653677`, inspected lines 46–67)

```tex
\mathcal{H} \sim \frac{1}{2}\pi_{\theta}^2
+ \frac{1}{2}(\partial_x \theta_4)^2
+ \frac{1}{4\alpha}\pi_{\psi}^2
+ \alpha(\partial_x \psi)^2
+ \mu^2\cos(3\theta_4)
- \mathcal{L}_{\text{Couplings}}
```

The source itself calls this a **schematic** leading-order expression for the 1+1D SAT-X minimal viable model. Its field is (	heta_4), explicitly described as a misalignment angle, rather than the compact Blockwave phase (	heta). No covariant signature/action or explicit (	heta_4\leftrightarrow\theta) projection map is supplied in this file.
