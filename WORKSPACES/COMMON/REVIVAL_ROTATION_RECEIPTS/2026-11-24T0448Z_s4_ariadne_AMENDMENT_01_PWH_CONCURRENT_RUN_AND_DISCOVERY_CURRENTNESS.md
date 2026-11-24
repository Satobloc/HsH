# Amendment 01 | h1060:s4 Ariadne receipt
**Scope:** PWH concurrent-run count and post-refresh main-branch currentness only. The canonical receipt remains unchanged.

## PWH concurrency correction
The canonical receipt correctly recorded four positively visible completed worker activations after Tern h1058:s4, but its sentence assigning the fifth completion specifically to h1060:s4 was too narrow because h1060:s2 was also still in progress.

At the later re-peek:
- h1059:s2 :24, run `f2292a77-b70c-832f-9c2a-0f5000104620`: completed.
- h1059:s4 :48, run `e68aceb5-ba08-8320-9560-0fc808ede1c6`: completed.
- h1060:s0 :00, run `f89eef42-6b18-8333-a616-c1f70a582bc4`: completed.
- h1060:s3 :36, run `cc816b31-2788-832e-84a2-81c8f9f305c4`: completed.
- h1060:s2 :24, run `d868c709-8d68-8326-883b-3d015c0150b8`: still in progress, `chat_ref=null`.
- h1060:s4 :48, run `305f1cdb-a010-832b-b2e6-f9e70f4ed955`: still in progress, `chat_ref=null`.

Therefore four completed activations are positively visible. The first of the two in-progress runs to complete will be the fifth. The next verified activation after that threshold should perform the PWH deep review; Tern retains queue and task-graph authority. Do not infer completion from commits, reports or publisher artifacts alone.

## Discovery currentness
The last verified generated-discovery refresh remains commit `2876dd9385456692f774d41571237ee40df7de87`, blob `151c584980995324b3c8740ed8937b683c957653`. Main subsequently advanced through non-discovery commits to `3fade5deecd1ea19144ed9d7c76fa54486dae20d`. No later generated-discovery refresh was observed on main, and no workflow run was returned for the receipt, CURRENT_WORK or README commits. The discovery snapshot is therefore not certified current to main. P0 record safety remains unresolved/failing; no live reader-route acceptance is established.

## No other changes
No task, ID, prompt, schedule, phase, PWH queue, task graph, PR, code, publisher submission, handoff or theory state was changed by this amendment. The original report and publication remain as previously verified.
