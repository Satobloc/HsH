# Receipt Amendment 01 | Exact readback and scheduler preservation | h787:s3 Mira label

This amendment records the post-write verification of the canonical receipt and its linked operational records.

## 1. Exact readback

| Artifact | Commit | Readback blob SHA | Verification |
|---|---|---|---|
| Tern observation | ef5000b619ef367fdc0f2963aede46f237c1701e | a6ba2d56a5110bcb80077bce6880bdc56ed73f24 | exact path fetched; all five run IDs and the 304.331117s right-censored lower bound present |
| Tern inbox append | 66206bcdd78d2154234022d958549fe5aac3731f | 9392779974903ce939d4b4d8a38ad1042b7c91c8 | observation marker occurs exactly once; observation link present |
| Aldus Common handoff | 171d640dfee0855e6028136fbe232bbdf8d3b691 | 62a2250c7b0d43989fda610325511f88c1070649 | POST_START_OPTIONAL_CONTEXT_ONLY; no assignment; no direct delivery |
| Canonical receipt | a001ab9dbe30dda5380bdd58f931072ae90c06df | 0a71ae02c0d2226a6bccc37449654f0bc4900ad4 | no Mira private workspace/charter access claimed; publisher status and no-sixth-task controls present |

## 2. Public publisher verification

Issue #1651 remains PUBLISHED_VERIFIED. Publisher comment #6834201486 reports the canonical artifact path, commit efb7e124225bbe4f570b2ec281caef1210dcc176, and SHA-256 1192b34ad957ea98b347de6061aeb4a64d1dc7f1fabd307b2b2fd6fcd7104b5f. Workflow run #43293606568, job #131445935719, concluded SUCCESS. The fetched artifact content matched the issue payload exactly. No duplicate issue or retry was created.

## 3. Final scheduler readback

The :36 task remains enabled under the original task ID 6a9f52b69ec08191b0a2ba24a074f781 and the exact original hourly America/New_York :36 VEVENT. Its current run remains cf01f09b-c548-8328-8b47-8da4cee7846f, IN_PROGRESS, completion null, run-level chat_ref null; latest_result still belongs to prior Sable h786:s3 run 8c6c113e-32c8-8331-a84b-7c1c98a294fb.

The :48 task remains enabled under its original task ID and exact hourly schedule. Its current run remains e4feb729-45b0-8325-a3da-04a3a5de0286, IN_PROGRESS, completion null, run-level chat_ref null; latest_result still belongs to prior Loom h786:s4 run 0c580540-a6ec-832e-b6e7-b8b70c348cb5. The :12 task remains disabled. No task ID, prompt, schedule, phase, cadence, enabled-state, ownership, or task graph was changed. No sixth task was created.

The :48 h787 run began before the Common Aldus handoff was created. The handoff remains post-start optional repository context only. No cross-thread delivery, consumption, or acknowledgment is claimed.

## 4. Final repository state

Main branch head at this verification: a001ab9dbe30dda5380bdd58f931072ae90c06df.

The current :36 scheduler record remains IN_PROGRESS. Repository work, publication, and readbacks are complete; scheduler-wrapper completion is not claimed.
