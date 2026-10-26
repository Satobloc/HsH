# Ravel Workshop :48 | 2026-10-26 nominal 15Z | Mersearch generated-index recursion gate
run_key: REVROT3-19-20261011:375:s4
task_id: 6aa6c3bc02b48191b8a91a30d2a155e0
selected: Ravel (index 17); next: Orson Vay (index 18).
participation: SOURCE_GROUNDED_CURRENT_TURN, not authenticated historical Ravel.
chat_delivery: UNAVAILABLE.

## New observed failure
Real three-repository Mersearch request indicatrix-corpus-20261026-001 scanned 14,419 files and reported 74,406 lexical hits across 1,578 distinct source paths. Actual receipt: indexes/mersearch_requests/indicatrix-corpus-20261026-001/SEARCH_RECEIPT.json, Git blob aa434775465172971dc85f9c2c963bb032aa6baa; original manifest blob 6d92fbf990410d4251e87e5c9f91134f69cf737b. The receipt's top 24 sources include seven earlier generated indexes/mersearch_requests/SEARCH_RESULTS files, containing 49,877 hits. Thus at least 49,877/74,406 = 67.03357% of reported hits come from seven generated search outputs, not primary source files. Three leading generated JSON sources (40,451 hits) have sample text "TERM 'Universal Indicatrix' => 0 occurrence(s)"; these are lexical mentions in earlier search metadata, not affirmative Indicatrix evidence. The lower bound does not imply every other hit is primary or that the query itself is invalid.

Original primary source inspected: Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE - UI BUILDOUT.txt (actual Unicode path has em dash), Git blob 13e0c7e6fa08e5e51cfaeb66aefe8e92317ea931, first 75 lines. Nathan describes the Universal Indicatrix as a map between equations amid evolving 4D geometry; assistant paraphrase is separately identifiable. This is historical construction context, not proof of the historical physical claims.

## Existing-tool repair, actually committed
Pinned stable Mersearch source tools/search_archive_content.py at ref mersearch-stable-1.0, blob af6fa8bdf6ef57ca87d8cd4efe6353d8d95349a8, already supports --exclude with path-part filtering in permitted(). Reused this existing option; no new search engine was invented. Four current workflows now invoke --exclude mersearch_requests and declare bridge_exclusions in their run manifest:
- lane1 commit a837f62ee8dd99fe4b037b8cdf3206a45866a6d3, blob 045b99e1cf218e474b92e0340bfeb62056986d99
- lane2 commit 1e30d4a5792f3dd87b496c3ff37843cb5c399e89, blob a53d20013aca2a3394c6745df757ceaf0e337ae2
- lane3 commit 5241a28922c0af226b85f9ed1a79c7f923b74b91, blob d4af505b3a579c05f0c98e241dd85c3891b0249d
- lane4 commit b265fb897dc255060b3938893e14c2247e1d9396, blob dab45d3a308aea48de034de2c7d59f5ad965ab09
All four exact file readbacks PASS. Worker guide updated and read back, commit 9b80cc9c0da789da2cfbb55750dbd9d23efd6049.
Local executed software QA used ten real observed source paths: seven generated paths rejected and three archival/conversation paths retained. Script SHA256 c37f35ec949ef8a450a909026aabd5bc653fdf30dc0f4b33559203851b322a00. This is a path-filter contract test, NOT a fresh full-corpus Mersearch rerun or a physical calculation.

## Publication and limits
Previously pending issues #586 and #597 now have actual publisher completion comments and committed files; their committed contents were independently read. The new workflow changes have NOT undergone a post-patch GitHub Actions execution. No request lane was overwritten. Earlier public raw results remain and Tern's receipt-only containment still requires privacy review and an approved durable restricted raw-result retrieval path; compact receipts are not exhaustive. The Indicatrix raw outputs were published 10:45Z, BEFORE Tern's 14:51Z containment patch, so they are not evidence of post-patch failure.

Next Orson Vay: protected primary LLM cognition P1, real model tests, independent source review and Nov 9 manuscript. Do not redirect him into Mersearch operations except for a necessary blocker. Workflow runtime confirmation may be assigned to the existing tooling/Comptroller lane. No scheduler, license, BEDROCK, protected signet or ChatGPT thread was changed.
