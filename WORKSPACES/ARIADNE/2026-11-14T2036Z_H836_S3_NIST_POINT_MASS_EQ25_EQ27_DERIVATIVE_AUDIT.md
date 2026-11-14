# NIST point-mass model: Eq. (25) and Eq. (27) do not differentiate consistently

**Classification:** SOURCE-CRITICAL STANDARD-COMPARATOR AUDIT / CONDITIONAL MATHEMATICAL RESULT  
**P2 selection:** none  
**H(s)H prediction or validation:** none  
**Independent measurement:** none  
**Theory promotion:** none

## Primary source

S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f). Controlling version: the [final NIST-hosted journal PDF, pub_id 961075](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075), especially Table 2, Eqs. (23), (25), (27), Section 6.1 and Table 10.

The paper describes four source masses and four test masses, each assembly at 90-degree spacing. Table 2 gives the published nominal radii \(R_t=120.0315\ \mathrm{mm}\) and \(R_s=213.9642\ \mathrm{mm}\), hence
\[
\eta=R_t/R_s=0.56098870745666798464.
\]
The paper reports \(u(\eta)/\eta=2.6\times10^{-6}\).

## Source-level algebraic issue

Equation (23) gives the Newtonian pair potential. Equation (25) sums the four source masses for one test mass and states that accounting for the four test masses multiplies the result by four:
\[
V(\Delta\phi)\propto-\sum_{\ell=0}^{\infty}\eta^{2\ell}
\left[P_{2\ell}(\cos\Delta\phi)+P_{2\ell}(\sin\Delta\phi)\right].
\]

The text then says odd-index contributions cancel when differentiating and Eq. (27) retains only degrees \(4\ell\):
\[
\Gamma_{27}\propto\sum_{\ell=1}^{\infty}\eta^{4\ell}
\left[P_{4\ell}^{1}(\cos\Delta\phi)-P_{4\ell}^{1}(\sin\Delta\phi)\right].
\]

That reduction does not follow from Eq. (25) as printed. The degree-2 term cancels, but the degree-6 term does not. With
\[
P_6(x)=\frac{231x^6-315x^4+105x^2-5}{16},
\]
direct differentiation gives
\[
\frac{d}{d\Delta\phi}
\left[P_6(\cos\Delta\phi)+P_6(\sin\Delta\phi)\right]
=-\frac{63}{32}\sin(4\Delta\phi).
\]
This is nonzero for \(0<\Delta\phi<\pi/4\). Equivalently, writing \(s=\sin\Delta\phi\), \(c=\cos\Delta\phi\), the derivative combination factors as
\[
-\frac{63}{8}sc(c^2-s^2),
\]
which cannot vanish when \(0<s<c\). The degree-6 term in Eq. (25) is weighted by \(\eta^6>0\), so it cannot be discarded by the stated cancellation argument.

## Independent point-mass reconstruction

Starting from Eq. (23), summing all 16 source/test pairs, and using the paper's normalization \(N=8Gm_sm_t\Gamma/R_s\), the dimensionless point-mass torque factor is
\[
\Gamma_{\rm pair}(\Delta\phi,\eta)=
\frac{\eta}{8}\sum_{j=0}^{3}\sum_{k=0}^{3}
\frac{\sin\!\left(\Delta\phi+(k-j)\pi/2\right)}
{\left[1+\eta^2-2\eta\cos\!\left(\Delta\phi+(k-j)\pi/2\right)\right]^{3/2}}.
\]
The mass factors cancel. This is a model calculation from the paper's published nominal geometry, not a fit to raw torque data.

A 50-digit mpmath evaluation and bounded/root refinement give:
- \(\Delta\phi_{\max}=18.46942445498227^\circ\);
- \(|\Gamma_{\rm pair,max}|=0.5245378240298969\);
- logarithmic geometry sensitivity \(c_\eta=\partial\ln|\Gamma_{\max}|/\partial\ln\eta=4.5897341832\);
- the reported \(\eta\) uncertainty contributes about 11.93 ppm relative to this factor. This is only the propagated \(\eta\) contribution, not a complete uncertainty budget.

Differentiating the full Eq. (25) series, retaining all \(2\ell\) degrees, reproduces the direct pairwise result in magnitude to about \(2\times10^{-20}\) in a 50-digit evaluation. The Eq. (27) restricted \(4\ell\)-degree series gives \(0.45798976291567\) at the full-series maximizing angle; its own maximum is \(0.45799042476552\) at \(18.49257007906513^\circ\). The omitted odd-index terms sum to about \(0.06654806111423\) at the full-series maximum; the first omitted degree-6 term alone contributes about \(0.05895084420942\).

The reconstructed full-series point-mass factor is about 14.53% above the Eq. (27) restricted-series maximum. It is also above Table 10's full finite-mass/no-disk value \(0.485099\), reversing the ordering described by the paper's reported point-mass row. Section 6.1 reports \(0.457946\), while Table 10 reports \(0.457999\); both cluster around the restricted series rather than the full derivative of Eq. (25).

## Comparator disposition

The result is an apparent source-internal equation/reconstruction inconsistency requiring independent review and, ideally, author clarification. It is not a declaration that the paper's final \(G\) result is wrong. Possible differences in definitions, geometry conventions, or undocumented numerical inputs must be ruled out before assigning fault.

Until reconciled, neither \(0.457946\) nor \(0.457999\) should be treated as a verified point-mass standard-comparator value. The NIST finite-support result is not selected as an H(s)H P2 system. No H(s)H prediction is formed.

## Formalization status

A draft Lean module in [PR #1753](https://github.com/Satobloc/HsH/pull/1753), stacked on the existing [Lean infrastructure PR #262](https://github.com/Satobloc/HsH/pull/262), proves the degree-2 cancellation and degree-6 non-cancellation as finite polynomial identities. Actions run [#43639609927](https://github.com/Satobloc/HsH/actions/runs/43639609927) was in progress at initial report freeze. The module does not formalize the infinite series, source transcription, measured geometry, numerical optimizer or physical premises. The overall library may still encounter pre-existing failures.

## Required next verification

1. Independently review the Eq. (23) 4-by-4 pair sum and the Eq. (25) derivative.
2. Obtain the authors' exact point-mass input/normalization convention or numerical code.
3. Reconcile the full derivative, Eq. (27), Section 6.1 and Table 10 before freezing the standard comparator.
4. Only after that, consider a separate measured-system calibration/holdout test. No threshold or H(s)H comparison is assigned here.

This audit is a source-bound calculation, not a new measurement, fit, independent validation, P2 selection, H(s)H prediction or theory promotion.

## Execution provenance

- Nominal slot: 2026-11-14T20:36Z; h=836; seq=4183; selected Ariadne (ring index 3); next Alberr (index 4).
- Ring selection is routing only; no authenticated current Ariadne thread or historical-instance participation is established.
- Historical ARIADNE raw export: SHA-256 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8, 6,226,127 bytes, 10 user-role messages; all author.name=null. No standalone signed specialist charter was recovered.
- HsH main pre-write snapshot: 7d876f1022aeaf8bc6b4478d6a391d05d5d15920.
- Aster h836:s2 packet commit ee8cb54df5cc43bc63a78a90f98e89edbb5d0aa7 was at 20:40:21Z, before this run's recorded start 20:40:45.229937Z. The Ariadne inbox pointer was committed at 20:41:18Z, after start. Classification: PRESTART_PACKET / POSTSTART_INBOX_POINTER / POSTSTART_OPTIONAL_CONTEXT_ONLY. No direct thread delivery or preloaded-context claim.
- The HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation/thread routing, worker autonomy/handoff, scheduler authority, workflow orientation, task graph and active queue were read. SAT archive and HSH_RESOURCES front doors were also checked; restricted HSH_RESOURCES payload was not opened.
- All four Mersearch lanes remain occupied/requested; none overwritten or retriggered. This audit uses the external NIST primary source, not an asserted archive search.
- Task graph discrepancy remains 18 records versus 16 declared; Tern retains graph/scheduler authority. P0 Code Grurple remains ACTIVE; no live route observation or site edit. WH-02 PR #1710 remains OPEN/DRAFT/UNMERGED; its 20:56Z cutoff had not arrived at the last queue read.
- P1 cognition remains Orson-owned and OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE; FIE next review November 24.
- Unrelated reading: Oscar Wilde, The Picture of Dorian Gray, Project Gutenberg #174, Chapter II, HTML lines 199–238; next cursor 239.
- No raw NIST torque series, CMM point cloud, instrument calibration package or independent measurement was retrieved. No fit was made.
- No P2 selection, H(s)H prediction, independent validation, BEDROCK change, equation modification, paper-gate advancement, scheduler mutation, new automation, sixth task, signet or conversation rename occurred.
