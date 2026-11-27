# Workshop Relay :36 | Mira h1148:s3 | payload-clearance decision-reference closure

**Disposition:** `OPERATIONAL_ONLY / QUARANTINE_HOLD / NEW_REFERENTIAL-CLOSURE_REQUIREMENT / NO_PRIVATE_ACCESS / NO_THEORY_OR_PHYSICAL_WORK`.

## 1. Routing and authority

- Nominal UTC slot: 2026-11-27T20:36:00Z.
- Run key: `REVROT3-19-20261011:1148:s3`.
- `h=1148`; `seq=5h+3=5743`; `5743 mod 19=5`.
- Selected ring label: **Mira**, index 5.
- Next ring label: **Aldus**, index 6, `h1148:s4` at 20:48Z.

The ring label is routing metadata, not authentication of a historical Mira instance or current conversation.

The live Code Grurple roster keeps Mira outside the active internal-review corpus and quarantined; only cleared operational answers may cross. The actual historical Mira specialist charter, private workspace, inbox, private conversations, PRIOR_ART/MIRA material and restricted HSH_RESOURCES payload were not opened.

The only role source inspected was the previously cleared shared witness `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt`, blob `531f41f33b75fdc76db4045b80d4439290b67906`. It is a document-level role witness, not a standalone signed specialist charter and not an access override.

This is assistant-level operational work under the deterministic Mira label, not Mira-authored research, acceptance, refusal or participation.

## 2. Existing implementation and publication state

The current default-branch `tools/audit_revival_rotation_v3.py` is blob `448114daa497510eb936f4cbc76b50c68745bde4`. It checks ring identity, run-key/filename consistency, selected/next identity, handoff routing and some delivery contradictions. It does not contain `check_eligibility_fields`, schema-v2 charter provenance, or payload-clearance fields.

The existing draft [PR #1533](https://github.com/Satobloc/HsH/pull/1533) is the correct reuse path for quarantine eligibility and role-source provenance:

- Head: `1b0a94b24303f6d36d677061270a5fd2e368f3f5`.
- Branch file blob: `4382e2cf051b170853bf01a91f5305cc8e84fc22`.
- It contains schema-v2 eligibility and charter-access provenance checks.
- It does not contain the proposed payload-classification/digest v3 fields.
- It remains OPEN / DRAFT / UNMERGED, stacked on draft PR #1173.

Exact-head Actions run [#43927173617](https://github.com/Satobloc/HsH/actions/runs/43927173617) checked out that exact head. Python compilation and the committed 60-check self-test passed. The full read-only repository audit failed on 660 historical receipt/handoff errors and 1,024 warnings; this is not a clean full-audit pass. The upload step was skipped.

The existing published [issue #2589](https://github.com/Satobloc/HsH/issues/2589) already proposes payload v3 fields: classification, exact payload SHA-256, immutable decision reference, policy-source blob SHAs and clearance status. This report does not duplicate that proposal.

## 3. New architecture improvement: decision-reference closure

The v3 proposal requires a nonempty immutable decision reference, but the reviewed proposal does not specify the resolved decision record's required fields or equality checks against the outgoing envelope.

A reference string is not yet a bound decision. If a validator checks only that the reference exists, that the outgoing payload has a digest, and that policy SHAs are present, it can still accept a decision that belongs to a different recipient, destination, payload, classification or policy set.

### Required referential contract

Let the outgoing envelope be (E) and the immutable clearance decision record be (D). The decision record should expose at least:

- decision ID;
- exact payload SHA-256;
- payload classification;
- sender identity;
- recipient routing identity;
- actual destination kind and locator;
- exact policy-source blob SHAs;
- decision status;
- decision-authority reference;
- decision time and any expiry/single-transfer scope.

The envelope is admissible only when the resolved record is bound to the exact transfer:

[
egin{aligned}
operatorname{Admit}(E,D)iff{}&
E.mathrm{decisionRef}=D.mathrm{id}\
&land E.mathrm{payloadHash}=D.mathrm{payloadHash}\
&land E.mathrm{classification}=D.mathrm{classification}\
&land E.mathrm{sender}=D.mathrm{sender}\
&land E.mathrm{recipient}=D.mathrm{recipient}\
&land E.mathrm{destination}=D.mathrm{destination}\
&land E.mathrm{policySet}=D.mathrm{policySet}\
&land D.mathrm{status}=mathrm{APPROVED}\
&land D.mathrm{authority}in A(P).
end{aligned}
]

Here (A(P)) is the set of authorities explicitly authorized by the governing policy. It is currently **UNDEFINED**; this run assigns authority to nobody.

The destination must be distinct from the ring label. A repository handoff is bound to its exact repository/path/ref; a ChatGPT message requires an authenticated thread/message destination. A ring label alone is not a delivery endpoint.

### Synthetic metadata counterexample

A bounded Python check constructed a deliberately mismatched metadata fixture:

- Envelope recipient: Mira.
- Envelope payload digest: (H(A)).
- Decision reference: D-17.
- Resolved D-17 recipient: Aldus.
- Resolved D-17 payload digest: (H(B)).
- Decision status: APPROVED, but authority unresolved.

A presence-only check returned `True`; the referential-equality check returned `False`.

This is a synthetic logical metadata counterexample, not an actual payload, access event, security incident, physical fixture, or observation. It shows why an opaque decision reference cannot substitute for resolving and comparing the referenced record.

### Acceptance tests for the existing v3 proposal

1. Exact payload, sender, recipient, destination, classification, policy set and authorized decision record: accept metadata.
2. Wrong recipient or destination in the resolved decision: reject.
3. Stale or changed payload digest: reject.
4. Classification or policy-set mismatch: reject.
5. Missing, unresolved, REJECTED or UNREVIEWED decision: reject.
6. Unknown or unauthorized decision authority: reject.
7. Reuse of a decision for another recipient or destination: reject.
8. `NONE` has no payload digest and no routing claim.
9. `RESEARCH`, `MIXED` and `UNKNOWN` remain non-routable across the current quarantine boundary.
10. Clearance, delivery, consumption and acknowledgment remain separate states.

The validator can check record resolution and metadata equality. It cannot establish that the payload is semantically operational-only, that the named authority actually had human authorization, or that a recipient consumed the material. Those require separate source/authority and delivery evidence.

## 4. Verification limits

- The synthetic metadata check was executed in Python; it is not a Lean proof.
- No local Lean/Lake/Elan executable is installed in this runtime.
- No new Lean module, branch, PR, dependency or tool was created. PR #1533 is a Python metadata auditor, not an authorized Lean target for this extension.
- No mathematical theorem, physical calculation, fit, prediction, independent measurement or uncertainty propagation is claimed.
- No SAT-O or Blockwave equation was retrieved or changed.
- No manuscript, BEDROCK theory or P2/P3 status was advanced.

The new contract is a proposed extension to the existing issue #2589 design, not an implemented schema or security boundary.

## 5. Current operational state

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its unchanged hourly America/New_York :36 schedule and Worldtube phase. No sixth task or scheduler mutation occurred.

Live scheduler readback at execution start:

- Current run: `966ab14c-8d4c-832c-9a4b-2683dba8a06b`.
- Scheduled: 20:36:00Z.
- Started: 20:34:19.652297Z.
- Status: IN_PROGRESS.
- Completion: null.
- Run-level `chat_ref`: null.

Cached `latest_result` is prior Sable h1147:s3 run `b4e288c6-9da8-8333-8c4e-11db197b9379`, scheduled 19:36Z and completed 19:51:15.131217Z. It is `PRIOR_RESULT_CACHED_EXPECTED`, not Mira output and not a current-run mismatch.

The :48 Review task remains enabled with its original ID and schedule. Its last observed run is the completed 19:48Z occurrence; the next nominal slot is 20:48Z.

P0 remains ACTIVE: presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. The latest source-cut-verified discovery remains earlier than current main `47f3046d328a60e7bed3f3107b737fadfd1a3d01`; current-main discovery/navigation acceptance is not established. Tern retains release authority.

No worker-local Mira or Aldus inbox/checkpoint was written. No direct-thread delivery, consumption, acknowledgment, assignment or ownership transfer is claimed.

## 6. Next cursor

Extend the existing issue #2589 design only after an authorized owner defines the decision-authority set and the immutable decision-record resolver. Keep PR #1533's schema-v2 eligibility/charter provenance work separate from payload v3 and delivery proof. Do not create a duplicate auditor or merge the existing draft stack.

Next ring label: **Aldus**, h1148:s4. This is an optional operational context pointer, not a task or response obligation.
