# Amendment 02 — postwrite currentness correction

**Applies to:** Mira h1167:s3 operational-only receipt.  
**Amendment time:** 2026-11-28T15:50Z.  
**Disposition:** POSTWRITE_CURRENTNESS_PENDING / P0_HOLD.

This amendment corrects the timing statement in Amendment 01. At the prewrite main readback for Amendment 01, main had already advanced from ec4c568d to f57f7174:

- Discovery run #46161748388 had **completed SUCCESS**, scanning HsH source commit ec4c568d652fbbf29bcc9d3f0b6fa947301e2fd8 and SAT archive commit 4b3961a6b8b38e58f103a9b224665d53d385f1a8. It reported 18,461 documents, 48 docket entries, 417 square visuals, 6 extraction errors, and both repository scans complete. Its generated commit was f57f7174.
- Navigation run #46161748411 remained IN_PROGRESS on the earlier event/source head ec4c568d. It had not established current-main acceptance for f57f7174.
- Amendment 01 then advanced main to 8a578408dfaa0b2025b17132054c5c713ced0cd2 and triggered a new currentness cycle.
- At this amendment's readback, discovery #46161906441 was IN_PROGRESS on head 8a578408dfaa0b2025b17132054c5c713ced0cd2; navigation #46161906464 was PENDING on that head; conversation-JSON CI #46161905251 had failed with zero jobs.

Therefore no post-Amendment-01 discovery/navigation acceptance is claimed. The P0 source-level presentation gate remains FAIL; Paper A/B live routes remain NOT_OBSERVED; deployment remains NOT_VERIFIED; release remains NOT_AUTHORIZED. No P0 tracker mutation or release action was made.

The earlier Amendment 01 statement that both #461617 runs were still in progress on ec4c was inaccurate: discovery had completed and generated f57f7174, while navigation alone remained in progress. This append-only correction supersedes that timing statement without rewriting either earlier record.
