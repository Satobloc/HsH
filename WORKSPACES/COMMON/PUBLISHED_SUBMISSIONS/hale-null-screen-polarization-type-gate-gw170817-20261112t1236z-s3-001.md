# Hale | Null-screen representation gate for worldtube-to-GW readout

**Run key:** `REVROT3-19-20261011:780:s3`  
**Selection:** h=780, seq=3903, ring index 8 = Hale; next index 9 = Elias Kern. These are deterministic labels, not authenticated worker/thread identities.

**Disposition:** `SOURCE-TO-SCREEN-MAP-TYPED / REPRESENTATION-MISMATCH-IDENTIFIED / GW170817-CANDIDATE-TEST / NOT-TEST-READY / NO-PHYSICAL-CALCULATION / NO-THEORY-PROMOTION`.

## 1. New architectural result

A 3D timesheet, a 3D spatial section of a 4D worldtube, and a 2D null screen are different objects. The missing stage after the HsH core/timesheet description is the observer's null screen, not simply “the detector.”

```text
K^4  finite-core worldtube (current HsH working target)
  └─ intersect Σ_t^3 → S_t^3 (regular 3D spatial section)
       └─ Φ_emit: core state → outgoing null direction/radiation
                    [MISSING HsH MAP]
            k^μ
             └─ Π_null: k⊥ / span{k} → S_k^2
                            (standard GR null screen)
                  └─ R_spin2: HsH state → STF²(S_k)
                                 [MISSING HsH MAP]
                       h_AB (screen polarization)
                        └─ D_I^{AB} detector response
                             → d_I(t) (calibrated strain)
```

The standard null screen is not the 3D timesheet or a 3D normal fiber. The source-to-radiation map and the HsH screen-polarization map remain unspecified. A detector response cannot repair a missing source map.

## 2. Representation-type obstruction

The accessible Blockwave-derived proposal uses an antisymmetric two-form current \(J^{\mu\nu}\) associated with a worldsheet. Gravitational-wave polarization is a symmetric trace-free rank-2 tensor \(h_{AB}\) on the 2D null screen.

On a 2D screen, an antisymmetric 2-form has one independent component and is an oriented area-form/scalar under screen rotations. A symmetric trace-free rank-2 tensor has two independent components, plus and cross, transforming with spin weight 2. Therefore a projected \(J_{AB}=-J_{BA}\) is not automatically \(h_{AB}=h_{BA}\), \(h^A{}_A=0\). A constitutive/radiation map with the correct screen-rotation transformation law is required. This is a type constraint, not a claim that Blockwave is false.

The timelike core's 3D normal-frame structure and the null screen's 2D structure also require a ray-dependent reduction. Massive \(SO(3)\) and massless \(ISO(2)\) little groups are not interchangeable. The screen rotation subgroup is \(SO(2)\); the full massless little group also contains translations.

## 3. Source and symbol boundaries

- **Nathan Direct:** the September 2026 raw-source cluster describes one physical helical core, a hollow outer second-order superhelix, and an active 3D timesheet/slice. See [Orson's source-fidelity record #1631](https://github.com/Satobloc/HsH/issues/1631).
- **Historical SAT-O:** June 2025 SAT4D/SAT-O artifacts contain a normalized tangent/time-direction \(\theta_4\) expression. This is historical document evidence, not by itself a direct user-role message.
- **Assistant reconstruction:** Blockwave-derived \(J^{\mu\nu}\) current/action material and the proposed \(g=\delta-2u\otimes u\) metric bridge. Neither is adopted Nathan Direct.
- **Standard reference:** null-screen quotient, detector response, Wigner little groups and spin-2 polarization.
- **Independent measurement:** GW170817 H1/L1/V1 strain and published polarization analysis. No new reanalysis here.

The h773 source-custody amendment corrects an earlier attribution: “SAT is worldlines. H(s)H is worldtubes” was a cross-post, not a verified Nathan Direct statement. See [Hale issue #1625 and its source-custody amendment](https://github.com/Satobloc/HsH/issues/1625).

There is a **symbol namespace collision**: SAT-O1's \(\theta_4\) expression and the Symbol Registry's `LOCAL:TRISWALE` \(\theta_4\) (a complementary plane-tilt angle) are not the same definition. No global alias is authorized. The candidate \(g=\delta-2u\otimes u\) bridge is a Meridian sandbox proposal, not an adopted metric or GR field equation. No causal-angle threshold is calculated.

The Calder Mersearch lane 1 is already requested for SAT-O/Blockwave source fidelity and exact equation custody. It was not overwritten or retriggered. Existing source custody is recorded in [issue #1301](https://github.com/Satobloc/HsH/issues/1301). No corrected equation is issued here.

## 4. Candidate real-data test contract: GW170817 polarization

This is a candidate contract, not a P2 system selection.

| Element | Required contract |
|---|---|
| Hypothesis | A specified HsH core/twist state produces a definite screen polarization tensor or additional mode after an explicit source-to-screen map. |
| Shared parameters | Same binary masses, spins, tidal parameters, distance, inclination, sky location, waveform family, calibration and noise treatment as GR. No channel-specific retuning. |
| Calibration | Published GW170817 H1/L1/V1 strain and calibration products as a pilot; freeze the forward map and nuisance treatment before holdout. |
| Holdout | Independent BNS events with adequate network geometry and polarization sensitivity. No event list selected. Do not treat detector bins as independent events. |
| Observable | \(h_+,h_\times\), relative phase/transport, and any explicitly predicted scalar/vector modes. Timing/dispersion remains a separate domain. |
| Comparator | GR two tensor polarizations, null propagation, same detector response/calibration model. |
| Falsification | Preregister a posterior-predictive or likelihood threshold from actual joint noise/calibration covariance and event-level holdout. No numeric threshold before the HsH forward map and covariance exist. |

GWOSC provides H1/L1/V1 GW170817 strain products, including 2048 s products and 4096/16384 Hz sample-rate variants; strain is dimensionless. The published LIGO/Virgo polarization analysis favors GR's two tensor modes and finds no evidence for modified dispersion. These results constrain output space; they do not directly measure \(\theta_4\), a core normal connection or a Blockwave current.

The observed GW/GRB arrival difference is a separate timing observable. The existing [Hale timing gate #681](https://github.com/Satobloc/HsH/pull/681) keeps the \(1.74\pm0.05\,\mathrm{s}\) arrival difference distinct from any assumed source-emission lag. No timing calculation is repeated here.

**Data status:** dataset and published analysis identified; no raw strain downloaded, no independent likelihood rerun, no fit, no numerical HsH prediction, no new independent measurement, and no calibration covariance reconstructed.

## 5. Existing work reused, not duplicated

- [Issue #1009](https://github.com/Satobloc/HsH/issues/1009) covers Blockwave projector/C1-C2 constraint fidelity against GW170814. This report adds the 2D screen representation-type gate, not the prior Bayes-factor work.
- [Issue #1243](https://github.com/Satobloc/HsH/issues/1243) is the GW170817 posterior/data-witness bundle. No duplicate bundle or fit is created.
- [Issue #1301](https://github.com/Satobloc/HsH/issues/1301) is the generic joint-readout identifiability gate. This report adds the specific 3D-timesheet → 2D-screen → spin-2 boundary.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133) contains conditional deterministic readout-factorization results; its successful build is merge-reference evidence, not proof that an HsH radiation map exists.
- [PR #1387](https://github.com/Satobloc/HsH/pull/1387) contains a measurement-domain compatibility contract; it does not validate the new screen map.
- [Issue #1221](https://github.com/Satobloc/HsH/issues/1221) preserves the spin/flavor source distinctions.

## 6. Proof and epistemic status

No new Lean theorem, module, branch or PR was created. The representation-type observation is not yet formalized in Lean. Formalization should follow a stable definition of the screen module, its \(SO(2)\) action, the source representation and the proposed map. Formalizing an unapproved physical map would encode an assumption rather than test it.

Existing Lean results remain conditional: Ravel's factorization theorem tests a specified map; Hale's measurement-domain theorem tests typed compatibility; neither establishes the missing HsH source-to-screen map. The Meridian metric bridge remains sandbox-only.

No physical calculation, synthetic fixture, data-free simulation, fit, parameter estimate, numerical prediction, equation correction, BEDROCK change, theory promotion or paper-gate advancement was performed.

## 7. References

- [GWOSC GW170817 data release](https://gwosc.org/eventapi/html/GWTC-1-confident/GW170817/v3/)
- [LIGO/Virgo GW170817 polarization analysis, LIGO-P1800059](https://dcc.ligo.org/LIGO-P1800059/public)
- [LIGO/Virgo GW170817 timing analysis, LIGO-P1700308](https://dcc.ligo.org/LIGO-P1700308/public)
- [Reduced phase space optics for GR, arXiv:1811.10917](https://arxiv.org/abs/1811.10917)
- [Wigner little-group reference, arXiv:hep-th/0101009](https://arxiv.org/abs/hep-th/0101009)

**Next obligations:** receive Calder's pending Mersearch result; define the core-to-radiation and source-to-screen maps; specify the \(J\)-to-\(h_{AB}\) representation map; formalize only after definitions stabilize; then select an event-level holdout and compare against GR with shared parameters and full calibration covariance.

**Final status:** `MAP_INCOMPLETE / NOT_TEST_READY / GW170817-CANDIDATE-ONLY / NO-P2-SELECTION / NO-NEW-LEAN-PROOF / NO-PHYSICAL-CALCULATION / NO-THEORY-PROMOTION`.
