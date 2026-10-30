# Helion CODATA and Zemach Cross-Channel Audit

**Execution:** 2026-10-30 22:28Z  
**Rotation:** `REVROT3-19-20261011:478:s2`  
**Worker label:** Ravel  
**Next:** Orson Vay, `REVROT3-19-20261011:478:s3`  
**Scope:** read-only source and measured-system audit in Ravel's workspace. No public publication, PR edit, branch change, or BEDROCK promotion.

## 1. Source and provenance status

Mersearch-first was attempted. No Mersearch action is exposed in this runtime. The live lane-3 request remains `SUBMITTED_NOT_VERIFIED`; it was not overwritten or retriggered. Direct GitHub source retrieval was used as a bounded fallback.

The earliest located direct geometry anchor is the 2024-03-22 **DIMENSIONAL GRAVITY** conversation, conversation ID `6a39839c-0d50-83ea-b76f-6805ece3ee9f`, raw blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`. Two user-role messages at 16:57:54Z and 17:07:55Z describe a tentative, explicitly vague early intuition: strings intersecting a three-dimensional time surface, with the present treated as an intersection point and the surface compared to a propagating wavefront. This is historical intuition, not a complete worldtube/current construction.

The September 2026 Ravel conversation is identified as `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`, raw-export SHA recorded in Ravel continuity as `c49367b0faa424491e7b3520a034b9e44fe6897f`. The connector returned an empty body for that large raw export in this run, so it was not independently reparsed. Its role-verified user excerpts remain available in `NATHAN_VERIFIED_WORDS_COMPENDIUM.md`, blob `84d333479a224a82df6f1265dd443662322656f6`, including:
- 2026-09-07 03:39 EDT, message `8471543a-6ed1-4743-9073-74735f019da4`: four-dimensional extension of a worldtube with Kerr cross-section, initially idealized, with shell distortion explicitly left as a question.
- 2026-09-07 03:46 EDT, message `3d0ad680-51db-4c79-ad4a-9bbacada24ef`: choose a spatial Kerr section and extend it along the filament; the ER-mouth/timesheet relation remains qualified.
- 2026-09-07 06:06 EDT, message `496a15ea-0263-459d-b815-908f52155b90`: multiple representations must be kept distinct; an induction-current connection within timesheet thickness is proposed tentatively, not defined mathematically.

The October 29 4D/3D clarification file is an assistant transcription, not a raw Nathan witness. The September Kerr construction is historical and provisional under Ravel's specialist charter; it is not promoted as a canonical physical core.

### SAT-O / SAT4D / Blockwave source separation

- **SAT-O1 4D:** archive blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; file-index creation 2025-06-09 18:44:50. The file gives (S[\gamma]=\int d\lambda\,\mathcal L), with (\mathcal L=\tfrac12 m v^\mu v_\mu-V_{\rm tension}(\gamma)). It describes a worldtube as the volume swept by a vibrating filament, but does not define a finite-core current or its charge normalization.
- **SAT4D live draft:** blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; file-index creation 2025-06-09 18:53:29; header names Nathan McKnight. It first defines (J_\mu(x)) as a filament-flux/linking average, then writes an inhomogeneous Maxwell equation whose right-hand side is a scalar average despite the free (\nu) index on the left. Later it writes (J_\nu=e\bar\psi\gamma_\nu\psi), a Dirac bilinear, without deriving that current from the earlier geometric average.
- **SAT4D covariant equations:** blob `c2493431c743ab14e677aae0a18bce7fb32880da`; file-index creation 2025-06-19 03:58:02; author line says SAT Framework Team. It defines (J^\mu=e\bar\psi\gamma^\mu\psi). This is not a raw Nathan-authored current law.
- **Blockwave full action:** raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`. User request `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a) is at 2025-10-19 12:29:41Z; the full action is assistant message `3039b226-02d4-41a3-a2d3-c338e25204a9) at 12:31:03Z. Its (J^{\mu\nu}) is a conserved two-form worldsheet current, (\nabla_\mu J^{\mu\nu}=0). It is assistant-authored, not Nathan Direct. Related blobs: ideal model `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, compact action `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, extension `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce). Their independent creation dates are not established.

## 2. CODATA 2022 is not an independent helion-moment confirmation

The 2022 CODATA adjustment is a global least-squares evaluation, not a new direct measurement or simple average. It uses 133 input data to adjust 79 constants and applies documented covariance and expansion-factor treatment.

Its input datum D45 is the Schneider et al. bound-state result (\mu_h(^{3}{\rm He}^+)/\mu_N=-2.1275498035(17)), with relative standard uncertainty (8.1\times10^{-10}). The adjusted free-helion recommendation (\mu_h/\mu_N=-2.1276253498(17)) and (g_h=-4.2552506995(34)) therefore incorporate the same Schneider measurement plus shielding and other adjusted constants. CODATA must not be cited as an independent replication of that measurement.

The CODATA paper explicitly derives the free-helion moment using adjusted ratios and the shielded proton moment while accounting for correlations. The exact pairwise covariance needed for any further combined uncertainty was not retrieved here; no zero-covariance assumption is made. The 2025 muonic-helium measurement postdates the 2022 adjustment and was not available as an input to it. The latest published CODATA set remains 2022; the 2026 adjustment's stated data cutoff is 2026-12-31.

## 3. Elastic Zemach radius versus effective Zemach radius

A critical observable-type distinction corrects a tempting but invalid substitution.

- Schneider et al. (Nature 606, 878-883, 2022) report an HFS-derived value (2.608(24)\,\mathrm{fm}).
- Patkóš, Yerokhin and Pachucki, arXiv:2303.13335v2 (2023), explicitly distinguish the **elastic** Zemach radius (r_Z=2.528(16)\,\mathrm{fm}) from the **effective** radius (\widetilde r_Z), which includes the inelastic nuclear-polarizability contribution. Their refined HFS extraction gives (\widetilde r_Z=2.600(8)\,\mathrm{fm}), and (\widetilde r_Z-r_Z=0.072(18)\,\mathrm{fm}). They interpret this difference as the polarizability contribution and estimate it at about 3% of the total nuclear correction.
- The 2023 paper's nuclear-theory value (2.539(3)(19)\,\mathrm{fm}) is consistent with the elastic electron-scattering value, not with treating the HFS-derived effective radius as purely elastic.

Scripted independent-error checks reproduce:
- (2.608-2.528=0.080\,\mathrm{fm}), or (2.77\sigma) using the two quoted uncertainties in quadrature.
- (2.600-2.528=0.072\,\mathrm{fm}), or (4.02\sigma) using the quoted uncertainties in quadrature, matching the paper's (0.072(18)\,\mathrm{fm}).

The CREMA 2025 muonic-helium paper uses the elastic (r_Z=2.528(16)\,\mathrm{fm}) in its elastic Zemach term, (\Delta E_Z=2.5836\,\mathrm{meV/fm}\times r_Z=6.53(4)\,\mathrm{meV}), and reports a nuclear-structure HFS contribution (6.25(10)\,\mathrm{meV}) and polarizability contribution (-0.28(10)\,\mathrm{meV}).

A deliberately tested but **invalid** substitution of the HFS-derived (2.608\,\mathrm{fm}) into the CREMA *elastic* Zemach term would shift that term by (0.206688\,\mathrm{meV}). It is rejected: (2.608(24)) is an HFS-derived effective quantity, not a replacement elastic form-factor radius. The 2023 separation explains why this substitution is a type error, not an updated measurement.

## 4. The charge-radius result is theory dominated

CREMA reports (r_h=1.97007(12)_{\rm exp}(93)_{\rm theo}\,\mathrm{fm}). Scripted quadrature gives total (0.0009377\,\mathrm{fm}); the theoretical component contributes 98.36% of the variance, while the experimental component contributes 1.64%. The quoted total relative uncertainty is (4.76\times10^{-4}). The paper's prose also states (7\times10^{-4}); the printed components imply (4.76\times10^{-4}), so the components are retained and the prose discrepancy flagged for source/supplement review.

The measured transition frequencies are empirical. The extracted radius is theory-dependent. The HFS-derived nuclear-structure and polarizability quantities share transition data and theory; no joint covariance matrix was retrieved in this audit.

## 5. Minimal external readout contract for H(s)H

For a spin-1/2 nucleus, the standard external interface is:
\[
G_E(Q^2)=F_1(Q^2)-\tau F_2(Q^2),\qquad
G_M(Q^2)=F_1(Q^2)+F_2(Q^2),\qquad
\tau=\frac{Q^2}{4M_h^2},
\]
\[
r_E^2=-6\left.\frac{dG_E}{dQ^2}\right|_{Q^2=0},\qquad
\frac{\mu_h}{\mu_N}=G_M(0).
\]
The elastic Zemach radius is a convolution of the electric and magnetic form factors. The effective HFS radius adds an inelastic response term.

A minimal **proposal**, not a derived H(s)H law, is therefore:
\[
W_{\rm finite\ core}
\longrightarrow
\mathcal J_3\;\text{or a defined conserved }j^\mu
\longrightarrow
(F_1,F_2)\longrightarrow(G_E,G_M)
\longrightarrow(r_E,\mu_h,r_Z^{\rm elastic}),
\]
with a separate responsive-medium susceptibility/spectral map to nuclear polarizability and the inelastic HFS contribution. The timesheet projection and every composition map require explicit support, orientation, normalization, units, and conservation conditions.

In four dimensions the Hodge star maps a 2-form to a 2-form, not to an electromagnetic 1-form current. A 3-form current can be Hodge-dual to a 1-form under a specified metric and orientation. The Blockwave (J^{\mu\nu}) therefore cannot become (j^\mu) by a bare Hodge dual. The SAT4D geometric (J_\mu), the Dirac bilinear, and the Blockwave two-form remain distinct objects until an explicit source-derived map is supplied.

A standard Maxwell type-correction would be (\nabla_\mu F^{\mu\nu}=\mu_0 j^\nu) in SI conventions. This repairs the free-index/type requirement only; it does not derive (j^\nu) from the worldtube. No new SAT equation is asserted.

## 6. Formalization and operational status

- Ravel measured-system branch PR #993 remains open/draft at head `5842fcaf77d4de85a969bebcca3c3a5580e5f07a`; exact-head Lean CI run #40997062623 succeeded. The existing conditional radius/arithmetic modules built; theorem-specific `sorryAx` was absent. Automated axiom audit was disabled/skipped.
- Separate Blockwave/projector PR #1008 remains open/draft at head `2fbb064d46ef6f47aca981d9b16e6c354f306539`; its exact-head CI run #40872622624 succeeded. It is not an electromagnetic-current proof.
- Local runtime has no Lean/Lake executable. No new Lean module, branch, PR, or physical fixture was created. The H(s)H current map is not yet a well-typed source-derived proposition; formalization is deferred rather than filled with invented premises.
- Code Grurple remains ACTIVE. No public issue submission, manuscript edit, reader-route probe, or paper-gate advancement was made.
- This addendum is internal Ravel workspace material, not a public paper or BEDROCK promotion.

**Next research gate:** obtain a source-authorized, typed worldtube-to-conserved-current map; then test its elastic (G_E/G_M) readout against independent scattering data and its inelastic response against the measured HFS/polarizability channels, with shared-data covariance preserved.
