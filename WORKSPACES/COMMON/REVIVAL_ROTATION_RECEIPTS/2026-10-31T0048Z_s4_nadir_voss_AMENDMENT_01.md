# Amendment 01 — Lean CI reference qualification
**Correction to 2026-10-31T0048Z Nadir receipt**

The primary receipt's phrase “exact-head GitHub Actions runs” is incorrect. The retrieved job logs show synthetic pull-request merge refs, not the PR head commits. The primary receipt is preserved; this amendment is authoritative for CI identity.

| PR | PR head SHA | Run / job | Checked-out merge commit SHA | Correct status |
|---|---|---|---|---|
| #262 | 61cc8b65ffed70296e0121dbae067892a79c81d4 | #40463470348 / #122053714715 | 44df186f012dbb3280790d2317498de8d1266b8b | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #715 | 4467282fd4276d40089ff2743d33316d354cf5f6 | #40480990700 / #122110951029 | 184736b34227b14fa2dfb0b4a48be41844e06646 | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #773 | e7e2f7a0e03865f784e917ff8728c87ffc2cc3c2 | #40547227487 / #122340968909 | d78c5948b27108a655cbc984419f5ccd5327c1b7 | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #868 | 59e2a398680655724845a33428a342bd096161f5 | #40964376757 / #123764987528 | 0d7b2220961790626d4bc63a698dfb3c0b2cc6eb | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #744 | 7a3add552cebd8a9fa7f2b758f729b3d72d58bcc | #41185475361 / #124491418084 | 4063694d59d0b96f70fd7f3ec19b3df38b2f55cf | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #1064 | 08a7cc355137b55159e2a1848681dfe1c291768b | #40990019212 / #123849889813 | a37cbb15a43746b85ed788ddcdee6f8739ad2a47 | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #1066 | d2a792ef642a4ee9c7a908e32243fac0233986b4 | #40992150303 / #123857058479 | 2b08fb0b1523b0e3a4e1089ce65bb67aed276cdc | MERGE_REF_BUILD_SUCCESS; exact head unverified |

Each log contains checkout of refs/remotes/pull/<number>/merge and a “Merge <head> into <base>” commit. These are valid integration builds of the PR head combined with its base, but not standalone exact-head builds.

The inspected workflow config sets the separate axiom-audit stage false. Some modules emit explicit #print axioms output; PR #1064 and #1066 do not emit theorem-specific axiom reports in the retrieved logs. The absence of a sorryAx string in a compile log is not a substitute for the disabled full axiom audit.

PR #262 also has later merge-ref build #41234431736 in PR #1163's context, merge commit 29fd4ace755a5757c7fccc15e99019ff597c501c; this is not an exact-head run of PR #262.

No branch, PR, workflow, or theory state was changed.
