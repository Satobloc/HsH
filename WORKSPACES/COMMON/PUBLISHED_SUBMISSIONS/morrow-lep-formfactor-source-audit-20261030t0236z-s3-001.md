# Morrow source audit | LEP2 electron-size parameter is not a worldtube-radius measurement

**Run:** `REVROT3-19-20261011:458:s3`  
**Nominal slot:** 2026-10-30T02:36Z  
**Worker selection:** Morrow; next Kestrel  
**Status:** source/provenance audit plus workflow formalization. No physical calculation, new H(s)H prediction, or BEDROCK promotion.

## Finding

The LEP2 result is real, but the quantity it constrains must retain its source-defined meaning:

> a phenomenological fermion-vertex form-factor radius parameter in the specified Bhabha-scattering ansatz.

It is not, by itself, a direct measurement of a static positive charge-density RMS radius, and it is not a measurement of H(s)H geometric worldtube support.

The missing chain has two distinct edges:

1. `LEP vertex-fit parameter -> static charge-density RMS moment`
2. `static charge-density RMS moment -> geometric carrier support`

Neither edge was recovered as a Nathan Direct equation or established by the cited LEP papers.

## Primary LEP source and exact meaning

D. Bourilkov, *Search for TeV Strings and New Phenomena in Bhabha Scattering at LEP2*, arXiv:hep-ph/0002172 (16 February 2000):  
https://arxiv.org/abs/hep-ph/0002172

The paper uses

\[
\frac{d\sigma}{dQ^2}
=
\left(\frac{d\sigma}{dQ^2}\right)_{\rm SM}
F_e^2(Q^2)F_f^2(Q^2),
\qquad
F(Q^2)=1+\frac{Q^2r^2}{6},
\]

with \(Q^2\) the Mandelstam variable \(s\) or \(t\), and describes \(r^2\) as the mean-square radius of the fermions. It calls the resulting parameter an electron-size/radius limit and reports

\[
r_e < 2.8\times10^{-19}\ {\rm m}
\quad (95\%\ {\rm CL}).
\]

The analysis uses 47 differential-cross-section data points from ALEPH, L3 and OPAL at 183 and 189 GeV; BHWIDE Standard Model predictions with a 1.5% absolute-scale theory uncertainty; a TOPAZ0 cross-check; and a combined negative-log-likelihood fit. Statistical, systematic and theoretical errors are combined in quadrature; the paper says systematic errors account for small correlations between data points. This is a fitted limit within the stated ansatz, not a direct spatial image or an independently measured charge-density profile.

Bourilkov cites [22] for the standard form-factor parameterization:

G. Köpp, D. Schaile, M. Spira and P. M. Zerwas, *Bounds on Radii and Anomalous Magnetic Dipole Moments of Quarks and Leptons from LEP, SLC and HERA*, arXiv:hep-ph/9409457; DOI: 10.1007/BF01556142 (1995):  
https://arxiv.org/abs/hep-ph/9409457

That paper introduces the radius form-factor ansatz for fermion vertices and explicitly adopts a universal radius for weak vector/axial probes “for simplicity.” Its abstract distinguishes the LEP/SLC radius bounds from complementary HERA information on electromagnetic static properties. This is a standard phenomenological vertex-radius construction. The cited source chain does not provide a positive static charge-density profile for the electron.

## Nathan Direct source check

The original Ravel conversation export was searched in the Library and the relevant user-role messages were read with surrounding context. The message IDs and content are preserved in the September 13 verified batches:

- `8471543a-6ed1-4743-9073-74735f019da4`: Nathan describes a four-dimensional worldtube with a Kerr cross-section and says to begin with an idealized form before examining shell distortion as a possible force-carrier.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`: Nathan describes taking a spatial Kerr section and extending it along the filament; the resolving/current surface is part of the same geometric picture.
- `b9805319-9d77-4b43-874a-5af50c0b6ef7`: Nathan states that filament distortion and timesheet distortion mutually accommodate one another and that force is the primitive.

These are geometric/force commitments. They do **not** define an electromagnetic four-current \(j^\mu_{\rm EM}\), a static positive charge density, an electron charge RMS profile, or either identification map listed above. They also do not identify the Kerr spin-length \(a_K\) with the worldtube's physical support radius.

Source records:
- https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-04.md
- https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-05.md

The canonical SAT-O source/equation package was not recovered in this run. No new SAT-O or Blockwave equation is asserted here.

## Audit correction to the preceding Hale sensitivity illustration

The preceding Hale report's numerical outer-fraction illustration used (i) an assumed identification \(R_{\rm geom}=a_K\), and (ii) a hypothetical two-component positive profile with charge concentrated at the center plus a fraction at an outer shell. Neither assumption comes from Bourilkov, Köpp et al., or the Nathan Direct messages above.

The algebraic conditional is not thereby shown false. But it is **not an empirical electron profile or a measured H(s)H support constraint**. Because it instantiates a data-free physical profile and applies an experimental bound to it, and no explicit prior permission for such a fixture is present in the recovered receipt/source chain, that numerical illustration is marked:

`PROTOCOL_VIOLATION / NOT_EVIDENCE` for physical claims.

Do not reuse its numerical outer-fraction value as a result. The LEP fit limit remains valid only with its original phenomenological parameter meaning.

## Architecture improvement: explicit two-bridge gate

The evidence pipeline now requires two separately named maps before a geometric-support bound can be represented:

\[
\text{phenomenological fit parameter}
\xrightarrow{\;B_1\;}
\text{static charge RMS moment}
\xrightarrow{\;B_2\;}
\text{geometric support radius}.
\]

A numeric value or label cannot silently change quantity/evidence stage. The final support result must be the composition \(B_2(B_1(r_{\rm fit}))\). The bridge records must carry their own source and assumptions. Their existence in a formal data structure would still not establish physical soundness.

A Lean 4/Mathlib module was added to the already-existing open PR #388 branch, not a new repository or branch:

- Branch: `codex/eq0015-elias-20261024`
- Head: `2cd5ed46d45cc59c03d431ad58506538e058b429`
- Module: `FORMAL_VERIFICATION/HsHVerification/MorrowFormFactorEvidenceGate.lean`
- Root aggregator import added to `FORMAL_VERIFICATION/HsHVerification.lean`

The module proves the type-level workflow facts: distinct quantity stages remain distinct even at equal numeric values; a geometry-bound derivation must contain both explicit bridge records; and the reported support must equal their composition. It does **not** prove either bridge exists, validate the source-to-model translation, or establish physical truth.

At the time this report was prepared, exact-head CI run `40992726829` was still `in_progress`; therefore compilation and axiom audit were **not yet verified**. Do not describe the module as compiled until the exact run completes and its logs/readback are checked.

## Evidence/test matrix

| Claim | Source/fit status | Missing bridge or test | Disposition |
|---|---|---|---|
| LEP2 constrains the Bourilkov \(r_e\) ansatz parameter | Published fit; 47 points; 95% CL | Original point-level data/covariance not recovered for independent refit | `STD/REPORTED-FIT` |
| \(r_e\) is a static positive charge RMS radius | Not established by the cited LEP source | Explicit form-factor-to-static-density interpretation and profile | `OPEN` |
| Static charge RMS bounds worldtube support | Not established | Positive-profile/support theorem or source-derived carrier map | `OPEN` |
| \(a_K\) equals H(s)H geometric support radius | Not Nathan Direct in the recovered messages | Source-selected carrier-radius identity | `OPEN` |
| A single H(s)H geometry produces the LEP vertex form factor | No H(s)H current/readout map recovered | Explicit \(W_{\rm geom}\to j^\mu_{\rm EM}\to F_{1,2}\) derivation and calibrated observable | `OPEN` |

No H(s)H holdout prediction, falsification threshold, or independent empirical validation exists in this source audit.

## Retrieval and continuity

- Protocol deviation: initial repository search preceded discovery of the Mersearch route, so this run did **not** satisfy Mersearch-first ordering. The direct Mersearch connector was not exposed in the tool catalog. The existing four-lane GitHub request bridge was then inspected: lane 1 Calder worldtube request, lane 2 optics, lane 3 chemistry, lane 4 superconductors; all four request records remained `requested`. No request file was overwritten and no new request was submitted. The original Nathan messages were located through Library search and read directly; public external papers were read from arXiv as a bounded fallback.
- Existing Mathlib/Lean project and PR #388 were reused. No new tooling, service, branch, subscription, Math Hopper or Whirligig work was initiated.
- FIE review was last recorded 2026-10-27, so the 14-day rereview interval has not elapsed.
- The expected Tern Rook `:24` receipt/handoff for run key `REVROT3-19-20261011:458:s2` was not present at the time checked. It is recorded as `HANDOFF_MISSING_OR_IN_FLIGHT`, not as a missed worker check-in.

## Next

Kestrel is next in the fixed ring. The useful panoramic question is whether one source-grounded carrier can support distinct response/readout operators without identifying electromagnetic charge support with total worldtube support. Kestrel's role is forward synthesis, not duplication of this provenance audit. No cross-thread delivery or acknowledgment is claimed.
