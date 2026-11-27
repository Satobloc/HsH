# Loom h1151:s3 — a typed 2D boundary-sector candidate for the optional worldsheet

**Disposition:** NORMAL_2_PLANE_SECTOR_CONSTRUCTION_SPECIFIED / MOUTH_AND_WORLDSHEET_NOT_IDENTIFIED / STANDARD_TUBE_COMPARATOR / EXISTING_LEAN_REUSED / NO_PHYSICAL_PREDICTION / PUBLISHED_PENDING

## 1. Selection, authority, and source boundaries

\[
h=1151,\qquad seq=5(1151)+3=5758,\qquad 5758\bmod19=1.
\]

- Selected routing label: **Loom**, index 1.
- Next deterministic label: **Aster**, index 2.
- This is assistant-level execution under a deterministic label, not authentication of a historical Loom instance or current thread.

Loom's historical remit is source tagging, chronology, terminology crosswalks, historical/current distinctions, and continuity maintenance. The workspace README and cumulative tag ledger support that remit. The raw historical charter export path returned an empty payload on this read; I do not claim a fresh raw-export parse. No standalone signed specialist charter or authenticated current Loom thread was recovered. Loom's BOOT/CURRENT_WORK pointers remain older than the latest published work; no worker-local checkpoint was rewritten.

Preflight read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread-first and write-safety rules, current main, recent receipts, Loom workspace and source-tag policy. Mersearch was checked first; no callable Mersearch action was available and all four request lanes remain occupied. No private HSH_RESOURCES payload was opened. Existing Mathlib/Lean PRs, Math Hopper #578 / PR #991, and Whirligig Kernel 0 were checked; no new tooling, fork, dependency, subscription, or expenditure was introduced.

## 2. Direct source and the unresolved object type

Nathan Direct, 2026-11-08T18:05:28.410Z, message bcbe9ee8-b621-4a40-9edb-b34c17783be5, says:

> We are talking about a 4D tube region surrounding a 1D core and bounded by a 3D boundary.

The same message leaves a mouth to the timesheet and a 2D worldsheet mode as possibilities, not mandatory structures. The source is in the verified-word compendium; its raw conversation source was recorded as blob 3053cd16f7522c2949d259cd2ea3053594fac900, SHA-256 de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e.

Nathan Direct message c0520975-02a0-408f-a250-364b88ab7b30 distinguishes the fourth spatial coordinate w from proper time t. Sable h1151:s2 / issue #2724 has already audited the spatial-tube versus spacetime-history ambiguity. This report does not repeat that audit or promote either reading to a settled physical choice.

The new question is narrower: **what explicit map could make an optional 2D surface a well-typed part of the 4D-tube / 1D-core / 3D-boundary construction, without identifying it by analogy with the mouth or the full boundary?**

## 3. Standard comparator: tubular neighbourhood of a 1D core

Start with a smooth embedded curve

\[
e:\Gamma^1\hookrightarrow X^4
\]

in a smooth four-dimensional ambient manifold. Its normal bundle has rank three:

\[
\nu(\Gamma)=TX|_\Gamma/T\Gamma,\qquad \operatorname{rank}\nu=3.
\]

Choose an auxiliary Riemannian metric to realize the normal bundle and a radius smaller than the relevant tubular injectivity radius. The normal exponential map then gives a tubular embedding from a neighbourhood of the zero section into X. For a chosen disk-bundle radius rho, write

\[
W_\rho^4=\operatorname{Exp}^{\perp}(D_\rho(\nu)),
\qquad
B_\rho^3=\operatorname{Exp}^{\perp}(S_\rho(\nu)).
\]

The boundary has S² fibers over the 1D core. This is ordinary tubular-neighbourhood geometry, not an H(s)H-specific prediction. The auxiliary Riemannian metric here is a construction device; it is not a claim about the physical signature or the H(s)H metric.

Standard reference: the tubular-neighbourhood theorem identifies a neighbourhood of an embedded submanifold with a neighbourhood of the zero section in its normal bundle; see the Freiburg differential-manifolds notes, Theorem 4.54, pp. 79–80, and the nLab tubular-neighbourhood statement. A rank-r metric vector bundle has unit-sphere fibers S^(r-1); see the sphere-bundle definition and Husemoller, Fibre Bundles, 3rd ed., ch. 3. https://home.mathematik.uni-freiburg.de/analysis/2025_WiSe_Lehre/2025_WiSe_DG-I/Differential_Manifolds.pdf · https://ncatlab.org/nlab/show/tubular%2Bneighborhood%2Btheorem · https://knowlpedia.com/fiber-bundles/sphere-bundle/

Thus the source's 4D-region / 1D-core / 3D-boundary dimensions can arise from a standard tube around an embedded curve. Those dimensions alone do not distinguish H(s)H from standard differential geometry.

## 4. New candidate map: a selected circle subbundle of the 3D boundary

The full rank-three normal bundle nu does not select a preferred 2D sheet. One explicit optional construction is:

1. Choose a smooth rank-two subbundle eta contained in nu, with the metric inherited from nu.
2. Form its unit-sphere bundle S(eta). Since eta has rank two, its fibers are S¹.
3. Use the fiberwise inclusion j_eta: S(eta) into S(nu).
4. Compose with the tubular embedding.

\[
S(\eta)\xrightarrow{j_\eta}S(\nu)
\xrightarrow{\operatorname{Exp}^{\perp}}B_\rho^3
\hookrightarrow X^4.
\]

Because the base Gamma is one-dimensional and the fiber is S¹, S(eta) is a two-dimensional bundle total space. Its image is a **candidate 2D boundary sector** inside the 3D tube boundary.

This is a proposed standard-geometric realization, not a Nathan Direct definition. It is not yet a worldsheet. That interpretation additionally requires the 1D base parameter to be an evolution/history parameter. If Gamma is a spatial filament at fixed proper time, the same construction is a spatial boundary surface, not a worldsheet.

The choice of eta is extra structure. It can be specified by a selected normal line and its orthogonal rank-two complement, or directly as a rank-two subbundle. With a metric splitting nu = eta plus L, the normal-frame structure group reduces to the block-preserving subgroup O(2) times O(1). If a unit normal axis is fixed, the residual action on eta is O(2), or SO(2) when eta is oriented. A connection on eta is a further choice; only then can transport and possible SO(2) holonomy be discussed. Tube thickness does not force a preferred plane, nonzero twist, or nontrivial holonomy.

A local normal-plane choice is not automatically a globally defined subbundle. Global patching, transition functions, orientation, and any connection must be supplied. No such data are present in the direct source.

## 5. The mouth and the 2D sector are different candidates

Let Sigma³ be a proposed timesheet hypersurface. A natural mouth/interface candidate is

\[
M^2=B_\rho^3\cap\Sigma^3,
\]

which is two-dimensional only when the two smooth hypersurfaces intersect transversely.

The selected sector

\[
W_\eta^2=\operatorname{Exp}^{\perp}(S(\eta))\subset B_\rho^3
\]

is also two-dimensional, but it is selected by a normal-plane subbundle, not by intersection with the timesheet. Equal dimension does not make W_eta² equal to M².

For equality, the selected sector must satisfy the additional incidence condition

\[
W_\eta^2=B_\rho^3\cap\Sigma^3.
\]

Absent that condition, if W_eta² and M² intersect transversely as surfaces inside the 3D boundary, their intersection is a 1D curve. That curve is a possible trace, not a pre-existing source-defined observable.

A projection q from W_rho⁴ to W² is a third, different construction: it is a quotient/reduction, not an inclusion of a boundary submanifold. It needs specified fibers and a preservation condition for the observable. The existing Nadir fiber-factorization theorem is relevant to that separate question, but it does not construct eta or identify the mouth.

The assistant-origin 2025 two-form worldsheet-current notation recorded in Kestrel PR #873 is also not evidence that Nathan's optional 2026 worldsheet mode is that same object. Source authorship and geometric type remain separate.

## 6. What is forced, optional, and still missing

| Item | Standing |
|---|---|
| 4D tube region, 1D core, 3D boundary | Nathan Direct provisional geometry |
| Rank-three normal bundle | Follows conditionally from a smooth embedded 1D core in a 4D ambient |
| Disk-bundle tube and S²-fiber boundary | Standard tubular-neighbourhood construction |
| Preferred rank-two normal subbundle eta | Optional additional structure |
| 2D circle-bundle boundary sector S(eta) | Conditional construction, not source-defined |
| Calling that sector a worldsheet | Requires a history/evolution interpretation of the base |
| Mouth B³ intersect Sigma³ | Optional intersection candidate; requires embeddings and transversality |
| Identifying mouth with S(eta) | Additional incidence condition, not implied by dimension |
| Twist / SO(2) holonomy | Requires a specified connection and a measurable readout |
| Responsive-medium coupling / contact law | Still undefined |
| Detector-level observable | Still undefined |

The standard tube is the null comparator. To distinguish H(s)H, a preferred eta, a connection/holonomy, or a contact/medium law must be fixed independently and produce a readout that the standard tube does not already allow. If eta can be selected after seeing the result, the construction is too flexible to be a discriminator.

## 7. Conditional test design — no physical test performed

| Element | Candidate requirement |
|---|---|
| Hypothesis | A preselected eta contained in nu defines a 2D boundary sector |
| Standard comparator | Generic tubular neighbourhood with full S²-fiber boundary and no preferred eta |
| Shared parameters | Core embedding, normal metric, tube radius, timesheet embedding, readout |
| Calibration | Core/radius reconstruction, normal-frame and connection calibration, timesheet registration |
| Predicted observable | A predeclared 1D trace W_eta² intersect Sigma³, or a specified holonomy-sensitive readout |
| Holdout | Independent acquisition not used to choose eta or the connection |
| Falsification | Reject this construction if the predeclared sector/trace is absent outside the measured uncertainty region, or if eta is only selected post hoc |
| Threshold | Not assigned: no admitted measured system, calibration record, uncertainty model, or holdout exists |

This is a test-design template, not a physical prediction, fit, numerical calculation, or independent measurement. No dataset was accessed.

## 8. Lean verification boundary

Existing Kestrel PR #873, exact-head Actions run #44090154878, built head 94b6d96c91806a95505260a3c52220f4af294185 successfully. Its KestrelIntersectionDimensionGate module proves the finite-dimensional tangent-subspace identity under explicit linear transversality and includes the conditional corollaries:

- 3D boundary with 3D timesheet in 4D: 2D tangent intersection;
- 2D sheet with 3D timesheet in 4D: 1D tangent intersection.

The general theorem also supports the 2D-with-2D-in-3D boundary intersection count when the corresponding tangent subspaces are transverse.

**Limits:** this is a linear tangent-space theorem, not a proof of the tubular-neighbourhood theorem, existence of a global eta, smoothness of the resulting sphere subbundle, physical embedding, actual transversality, or a detector response. The PR remains OPEN / DRAFT / UNMERGED. No new Lean module or run was created; the existing exact-head build was reused. No #eval or new bundle-construction proof is claimed.

## 9. Required unrelated-source reading completed

Read HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt, lines 1721–1760. The SAT archive counterpart at 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt has the same Git blob f33eb29fbac65efa1db054239bb9c28a04a13a42 and identical excerpt.

The passage is a language-guessing game. It is a transcript, not a raw role-bearing conversation export. Tags: LATERAL-READING, UNRELATED-LANGUAGE-GUESSING-GAME, TRANSCRIPT-ONLY, SPEAKER-LABELS-NOT-RAW-ROLE-METADATA, LANGUAGE-RELATEDNESS-CLAIM-UNVERIFIED. The assistant's Dom/Ganda and Yuchi/Muskogee statements were not externally validated here. Next cursor: line 1761. This was a reading break, not a claim of physical movement. FIE rereview remains due December 8 and was not reset.

## 10. Current governance and P0

Sable h1151:s2 / issue #2724 completed the overdue PWH deep review read-only. The canonical PWH queue and task graph were not updated; Tern retains integration authority. The queue cursor remains h1081:s3. The graph remains 18 records against 16 declared branches, with one parent-only edge.

Main before this report: 9306606b8bd33b40d61aa0e32f9523bc2c7d69ea. The Loom tag-ledger Section AS and cursor correction were committed and independently read back; this report and receipt will advance main again.

- Discovery run #46084020300: SUCCESS at HsH source cut 027c0ea51e219c618d3beb43b3ea535421cd6f56 and SAT archive source 4b3961a6b8b38e58f103a9b224665d53d385f1a8; 18,295 documents, 48 docket entries, 417 square visuals, 6 extraction errors; generated commit 43c1655. Later tag-ledger commits mean postwrite discovery freshness is pending.
- Navigation run #46084020371: FAILURE on event head 48e97910c3a42a09f51935dd1c8851ac57c363b9. Its date-tag audit reported 1,040 correctly dated, 0 needing renaming, 0 unresolved collisions, 2 undatable conversations, and 883 skipped non-conversations/bad JSON; fully_tagged=false. No current-main navigation acceptance.
- Separate conversation-JSON CI run #46084019103: FAILURE with zero job records.

P0 remains active: source-level presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. Meridian's issue #2722 is now PUBLISHED_VERIFIED, but it is an acceptance report, not a live route probe or release authorization.

Campaign gates remain separate: P1 cognition overdue/frozen/Orson-owned; P2 November 30 HOLD; P3 December 14 incomplete. Mersearch lanes remain occupied. No PWH queue/graph write, worker-local checkpoint, Paper A/B edit, SAT-O/Blockwave equation edit, manuscript advancement, physical calculation, theory promotion, or release action occurred.

## 11. Closeout

The new contribution is a specific, typed candidate for the optional 2D boundary structure: a unit-circle bundle of a chosen rank-two subbundle of the rank-three normal bundle. It is distinct from both the full 3D tube boundary and the 2D mouth/timesheet intersection. The choice of plane, its connection, and its physical interpretation are additional assumptions, not consequences of finite tube thickness.

Next deterministic label: **Aster**. Aster remains REVIEW FROZEN / CROSS-READ OPEN; no authenticated current thread was established. No worker-local inbox write or optional packet was made because this geometry note does not belong in Aster's protected Paper A/B review lane. No direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.

The existing :36 Worldtube task context and repository roster still specify task ID 6a9f52b69ec08191b0a2ba24a074f781, enabled, hourly America/New_York at :36, DTSTART 2026-10-01T14:36, phase Worldtube. No scheduler mutation occurred. The separate Automations lookup returned 404, so no independent live task readback is claimed. No sixth task was created.

**TICK:** explicit normal-2-plane subbundle candidate and map signatures; mouth/worldsheet distinction; standard comparator and test-design contract; existing Lean theorem/run reconciled; unrelated-source read completed and tagged.

**TOCK:** no Lean proof of the sphere-bundle construction; no physical embedding, calibration, medium/contact law, detector readout, or holdout; P0 remains active; PWH integration remains Tern-owned.

**Next cursor:** specify a source-authorized global eta (or reject the 2D-sector construction), define its connection and its relation to the timesheet, then supply a measured readout before any physical prediction. Keep MAP_OR_NORMAL_PLANE_UNSPECIFIED until those inputs exist.
