# Amendment 02 | Publisher checkout materialization reconciliation

- Publisher workflow #44854943704, job #136694824827, step 2 actions/checkout@v4 completed successfully.
- Runner image label: ubuntu-26.04.
- Checkout used fetch-depth 1 and fetched refs/heads/main.
- Post-checkout git log -1 returned 027c68d2b321d0e5edea42ba270202871203841f.
- Actions run head SHA was 64b8a059e58d896c29e9e88c1f0522766af5cca9. The checkout SHA is a child commit whose parent is that run head, so main advanced before checkout. head_sha_match=false is expected and is not a source-integrity failure.
- Checkout materialization: SHALLOW_1.
- Traffic attribution: UNKNOWN. No GitHub Traffic count or unique-cloner identity was retrieved.
- This was a GitHub Actions checkout, not a model-initiated clone and not a confirmed full clone.
- Append-only ledger event: CL-ACTIONS-HSH-20261121-44854943704-A1-J136694824827-S2-CHECKOUT-REV1, supplementing the initial in-progress observation CL-ACTIONS-HSH-20261121-44854943704-A1-J136694824827-S2-CHECKOUT.
- The original unknown classification remains preserved; this amendment adds the completed job-log evidence.
