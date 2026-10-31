# Proper Dimensionality: timesheet level set, finite slab, and radial-source amendment

**Status:** source-fidelity amendment to the already published Morrow report, issue #1142. This is not a second report submission, theory integration, or BEDROCK promotion.

**Nominal slot:** h=489; seq=2445; ring index 13 = Morrow; next index 14 = Kestrel. Existing run key: REVROT3-19-20261011:489:s0. The 09:00Z receipt and Kestrel handoff already exist. This 09:28Z pass adds a distinct source/math-fidelity delta; it does not create a duplicate receipt, handoff, issue, task, or schedule.

## 1. Role and control-plane continuity

The recovered Morrow source conversation is 6a9ee7ca-d340-83ea-b99d-6a3097429f36, raw blob 362075c5e32ec9e97579bd1de58fba7f612cb6bb. User-role message 402ade01-7116-4efb-9b14-31e477754458, 2026-09-08T03:25:36.187Z, assigns Morrow the role **Team Archivist**: appraise the corpus, prepare a short flexible action plan, and coordinate with GitKeeper. The assistant-authored title “Archive Synthesis & Dependency Integration Lead” is not the user-authored role.

The live Morrow README and Steering Charter preserve the archive/provenance remit, training standdown, and theory freeze. This pass stays within source genealogy, mathematical type-checking, and documentation QA. No physics integration, prediction, paper drafting, or CODATA scoring was undertaken.

The existing Morrow receipt 2026-10-31T0900Z_s0_morrow.md and optional Kestrel handoff 2026-10-31T0900Z_from_s0_to_s1_kestrel.md were read. Kestrel's inbox already contains that handoff. It was not duplicated or rewritten. No authenticated current Morrow or Kestrel ChatGPT thread was established; no cross-thread delivery or acknowledgement is claimed.

The current main branch was read at 6340ca78 (subsequent routine commits may advance it). The :00 automation remains enabled with its existing ID, hourly schedule, and phase unchanged. No task or cadence mutation occurred.

## 2. Source cluster and attribution classes

| Source | Identity | Attribution/status |
|---|---|---|
| 00 PROPER DIMENSIONALITY .txt | SAT_THEORY_ARCHIVE_2023-25; blob e4836ca1f57e9da5996cf1eaad10ee436e49545a; 74,109 characters | Archive text added 2026-06-10. Embedded date says “Monday, June 1” without a year. Not a raw ChatGPT role export. |
| MATHEMATICO NotebookLM export | HsH; blob 3daab8ceb9cf1dd67a8d5a798bce045b470e4870; 262,507 characters; 62 messages | Every exported message is labelled role=user, including answer-shaped passages. Speaker identity is flattened; message roles cannot authenticate Nathan Direct. |
| Ravel [H(s)H] Syncmathcek raw export | HsH; blob c49367b0faa424491e7b3520a034b9e44fe6897f | Raw role-authenticated September conversation. User messages 3d0ad680-51db-4c79-ad4a-9bbacada24ef (2026-09-07T07:46:38.573Z), 496a15ea-0263-459d-b815-908f52155b90 (2026-09-07T10:06:12.842Z), and a63b981d-d614-4da8-9cd3-7a018ed221e3 (2026-09-06T20:10:29.947Z). |
| WORLDTUBE THOUGTS.txt | SAT archive and HsH mirror; blob 735f2a95e492944a244d1ceba31f33b6b5606119 | Curated dialogue transcript with a “—NM” signature and Nathan/Chat speaker labels. No raw message UUID or reliable turn timestamp. Treat as Nathan-attributed transcript, not raw-role-authenticated. |
| HsH AHA TOPOLOGY.txt | SAT archive and HsH mirror; blob 5283ceb8d06109061543711ebe7c46954efe7ede | Mixed Claude/ChatGPT/NotebookLM analysis. Assistant reconstructions and critiques, not direct equations. No raw role graph. |
| H(s)H MANIFOLDS.txt | SAT archive and HsH mirror; blob 54f2f530697ab6e9c44758ce3406c4144915c73d; 4,740 lines | Multi-generation synthesis, internal date label 2026-07-04, no authenticated author/role graph. The two repository copies are the same Git blob, not independent corroboration. |
| SAT CORE — UI CONFIG.txt | SAT archive; blob 6817caf68943593f31d72d51798e0ba4589624a4 | Historical assistant-style synthesis; no raw Nathan message attribution. |
| UIRadialAngularIdentity.lean | HsH verification branch; blob 652eb44d85dac176682eea948b677a4b4372bbb3 | Existing Lean formalization in open PR #262, not merged to main. Actual CI run #40463470348 succeeded. |

The source panel and NotebookLM material refer to a file named “HsH H0 c.txt”, but that file was not found in the accessible HsH, SAT archive, or HSH_RESOURCES repository listings/searches. The H(s)H Dev + directory contains MANIFOLDS, NOTATION, REWORK, and other files, but no HsH H0 c.txt. The missing source bytes remain a recovery blocker.

## 3. Three representations and the two different reductions

The authenticated 2026-09-07 user message 496a15ea explicitly names three active representations:

1. A conventional Minkowski block-universe diagrammatic representation, deliberately reduced by one dimension, with a lateralized “worldworm” picture. The message warns that a 3D Borromean-link depiction may misrepresent the hollow 4D tube/slinky geometry.
2. The full 4D bulk, treated as a block for construction while allowing dynamics at least at the intersectional surface/thickness and possibly throughout the bulk. It describes time as the outward direction from every point.
3. The actual 4D view together with its 3D slice.

The June NotebookLM passage says “two different flattening strategies,” but its export has no authenticated speaker roles. A careful reconciliation is possible, but it is an interpretation rather than a direct quotation:

- Diagrammatic reduction: a representational map D_diag from the 4D carrier to a 3D Minkowski-style worldworm diagram. Its exact projection, kernel, and retained coordinates are not defined.
- Physical section: intersection of the 4D carrier with an exact 3D timesheet. This is an intersection operation, not the same kind of map as D_diag.
- Native 4D bulk: the source geometry from which both views are constructed.

Therefore, the two reductions should not be treated as interchangeable “flattenings.” One is a diagrammatic projection; the other is a physical section. The exact maps remain unspecified.

The September 7 user message 3d0ad680 adds a useful dimensional constraint: standard Kerr is already a 4D spacetime solution; this construction must choose a spatial Kerr section and extend that section along the filament, rather than treating a 4D Kerr spacetime as the cross-section of another 4D object. The September 6 message a63b981d describes a filament as the totality of a 4D particle trajectory, not merely a trajectory drawn inside a frozen block. These are direct source statements, not assistant reconstructions.

## 4. New dimensional correction: exact timesheet versus finite timeslab

The most consequential discrepancy is in H(s)H MANIFOLDS.txt, lines 75-76. The text calls the object a “3D projection hypersurface” but defines

    S_(t,h) = { x in E_exp : |tau(x) - t| <= h_Sigma/2 }.

For h_Sigma > 0, and assuming tau is a regular scalar coordinate/submersion, this is the preimage of an interval. It has 4D interior in the 4D ambient manifold. It is a finite **4D timeslab**, not a 3D hypersurface.

The corresponding exact level set is

    Sigma_t = tau^(-1)(t),

which is 3D when t is a regular value of tau.

The distinction changes the carrier intersections:

| Carrier / operation | Conditional dimension |
|---|---:|
| 1D centerline gamma intersect exact Sigma_t^3 | 0D point |
| 2D worldsheet intersect exact Sigma_t^3 | 1D curve |
| 3D tube boundary intersect exact Sigma_t^3 transversely | 2D boundary trace |
| Full-dimensional 4D core W^4 intersect exact Sigma_t^3 | 3D mouth |
| Full-dimensional W^4 intersect finite 4D timeslab S_(t,h)^4 | 4D overlap |

The finite slab boundary, when t±h/2 are regular values, consists of two 3D level sets. A 3D mouth can be the exact section W^4 intersect Sigma_t^3; it is not the whole finite-thickness overlap W^4 intersect S_(t,h)^4.

This does not contradict Nathan Direct's use of both “3D slice” and “timesheet thickness.” It identifies a missing type distinction in the assistant's later formula. If the intended thickness is not a scalar-coordinate interval, a different construction must be supplied. Until then, do not label the finite band itself a 3D hypersurface.

The existing SableCurrentSupportDegreeGate work in PR #1098 formalizes conditional dimensions for an exact transverse hypersurface. It does not prove the dimension of this finite slab, nor identify the physical timesheet. The theorem must not be stretched beyond its formalized hypotheses.

## 5. Radial geometry: useful existing proof, incomplete source-to-model bridge

SAT CORE — UI CONFIG.txt gives the assistant-style ansatz

    Y(lambda) = r(lambda) R(lambda) x_0,
    x_0 in S^3, R(lambda) in SO(4),

with a radial/angular velocity split. Its notation uses r(lambda)=lambda. The later H(s)H MANIFOLDS compilation instead writes r(lambda)=c lambda while locally describing lambda as worldline arc-length. If c is physical speed and lambda is length, c lambda is not a length. The parameter type and units are not stable across these assistant-generated sources.

The existing UIRadialAngularIdentity theorem proves the conditional algebraic identity

    ||dY/dlambda||^2 = (dr/dlambda)^2
                       + r^2 ||du/dlambda||^2

given ||u||^2=1 and u dot du/dlambda=0, where u=R x_0. This is a valid radial/angular decomposition. It compiled in actual CI run #40463470348 on the PR #262 verification branch. It does **not** derive the unit and orthogonality hypotheses from differentiable R(lambda) in SO(4), prove the full hyperspherical metric, or establish that the physical filament follows this ansatz.

The next proof target is the missing implication: differentiable R(lambda) in SO(4) and unit x_0 imply u=R x_0 remains unit and u dot du/dlambda=0. Then the existing identity can be composed with the radial map. No new Lean code was written; local lean/lake/elan executables are absent. Existing CI evidence is not a new run in this turn.

Two further internal errors occur in H(s)H MANIFOLDS.txt:

- Line 112 uses P = I + u tensor u while u is treated as a unit Euclidean vector. That sends u to 2u, so it is not the orthogonal projector onto the tangent space of S^3. Later sections (for example line 918) use P = I - u tensor u, which is the correct Euclidean projector under ||u||=1. This is a version conflict inside one unbylined synthesis.
- Line 2530 states R^4 is equivalent to R^+ times S^3. For positive radial coordinate, (0,infinity) times S^3 describes punctured R^4, not all of R^4. The origin must be added as a cone point with all S^3 directions collapsed. The UI ansatz with r>0 is a parameterization of the punctured space; it does not by itself settle the origin.

## 6. H0+c source genealogy: unit bridge is not a dynamics choice

The “—NM”-signed passage in WORLDTUBE THOUGTS says H0 and c can be made comparable by reference to the size of the universe and a corresponding time/length scale. It does not specify a unique comparison length or a final equation. Its attribution is stronger than an unlabelled summary, but it remains a curated transcript without raw message UUID/timestamp.

HsH AHA TOPOLOGY contains assistant-authored dimensional critique and candidate repairs:

    H0 L + c       (velocity units)
    H0 + c/L       (inverse-time units)

Its later ChatGPT reasoning correctly separates three questions: unit conversion, comparison-length choice, and expansion dynamics. It explicitly says dimensional analysis settles only the first.

That same transcript distinguishes two inequivalent dynamics:

    Model G: rdot_gamma - rdot_m = c,  rdot_m/r_m = H0
    Model A: Rdot_s = H0 R_s,  Rdot_t = H0 R_t + c

Model A does not preserve a constant c velocity gap after the radii separate. These are assistant-proposed alternatives, not Nathan-approved equations. The earlier “Reasoner” recommendation to lock H0 L + c is an assistant proposal; no user acceptance was found.

The H(s)H MANIFOLDS synthesis later reuses H0+c and dual-shell equations without carrying a declared comparison length through every expression. Its shell narrative is therefore not an authenticated resolution of the original dimensional problem. The referenced HsH H0 c.txt source remains missing. No CODATA scoring or physical calculation was performed.

## 7. Discrepancy ledger

| Item | Nathan Direct / source evidence | Historical translation | Finding |
|---|---|---|---|
| Three representations | Raw Sept 7 user message 496a15ea | June NotebookLM “two flattenings” | Three representations authenticated; two-reduction mapping is interpretive. |
| 3D slice | Raw user says actual 3D slice of 4D view | Assistant later gives finite interval band and calls it 3D hypersurface | Exact level set is 3D; finite band is 4D under the stated formula. |
| Timesheet thickness | Raw user mentions intersectional surface/thickness | Assistant chooses scalar-coordinate slab | Physical meaning of thickness still unspecified. |
| Radial world manifold | Raw Sept user says time points outward from every point | NotebookLM/assistant introduces radial-origin formalism | Directional statement authenticated; exact radial metric/origin construction not. |
| r(lambda) | No recovered raw direct equation fixing its units | UI CONFIG uses r=lambda; MANIFOLDS uses r=c lambda with lambda called arclength | Parameter type/units conflict. |
| SO(4) radial split | No recovered raw direct equation | UI CONFIG ansatz and Lean identity | Algebraic identity compiled conditionally; SO(4) hypotheses not derived in Lean. |
| Euclidean projector | No direct equation recovered | MANIFOLDS uses both plus and minus | Plus form is not a projector for unit Euclidean u; later minus form is correct. |
| R4 radial product | No direct global topology statement recovered | MANIFOLDS writes R4 ~ R+ x S3 | Correct only for punctured R4; origin is cone point. |
| H0+c | —NM-attributed transcript hints at a universe-size conversion | Claude/ChatGPT propose L bridge and distinct dynamics | Unit bridge and physical dynamics must remain separate. |
| Morrow successor archive | Checkpoint names 6acb7c01... | Library citation elsewhere names 6ac6cff4... | Two distinct IDs with same title; raw exports not located. |

## 8. Morrow archive-accounting correction

The existing checkpoint says the Morrow + Kestrel Free Quarry archive has 222 mapping entries, comprising 157 user/assistant messages and 64 tool messages. Those categories sum to 221, leaving one mapping entry unclassified. A null/root node is plausible but cannot be asserted without the raw export.

A Library search did not recover that raw archive. It did find a separate context citation in the raw “Naming A New Feeling” file to a same-title Morrow + Kestrel Free Quarry conversation ID 6ac6cff4-ded8-83ea-9ec9-c14e424d982f, published 2026-10-07T23:03:45.464Z. The checkpoint's 6acb7c01-3e14-83ea-a977-a958991e35cc is a different ID, dated 2026-10-11 through 2026-10-15 in the checkpoint. Do not conflate the two or call either an active Morrow destination. This is a continuity discrepancy, not a theory claim.

## 9. Mersearch, publication, and next cursor

All four shared Mersearch request lanes remain occupied/unreleased. The current connector set exposes no direct Mersearch execution tool. No request was opened or overwritten. Bounded GitHub search and direct repository-file reads were used as fallback; this is not represented as a Mersearch run.

Issue #1142 is already PUBLISHED_VERIFIED. This amendment belongs on that existing issue as a supplemental comment; no new issue or duplicate artifact is warranted. The original published submission remains unchanged.

Next source/proof cursor:

1. Recover the missing HsH H0 c.txt bytes and any raw user message behind the —NM transcript.
2. Recover the speaker metadata or underlying raw ChatGPT source for NotebookLM messages 33-40.
3. Recover the raw October 29 source behind the paraphrased geometry intake.
4. Define tau, exact Sigma_t, finite h_Sigma, and whether thickness is a 4D slab or a different object.
5. Separate W^4, its 3D boundary, the 1D centerline, the 3D mouth, and the diagrammatic projection.
6. Extend Lean from the existing exact-slice and radial/angular modules: derive unit/orthogonality from SO(4); then formalize the level-set versus finite-slab distinction. Actual compile/run required before claiming proof.
7. Resolve the two Free Quarry conversation IDs and the 222-versus-221 mapping count from the raw export.

The previous unrelated reading break remains current: Jacoby, *Practical Talks by an Astronomer*, lines 541-620; return cursor 621. FIE was last reviewed 2026-10-27, so the 14-day rereview threshold is not due. November 9, November 30, and December 14 paper gates remain separate and unchanged.

**Disposition:** source-fidelity amendment only. No physical calculation, CODATA scoring, new Lean code, new Mersearch request, theory integration, BEDROCK promotion, research PR, new issue, new receipt for the same run key, task/ID/cadence change, signet, chat rename, or cross-thread delivery claim.
