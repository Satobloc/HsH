# Mersearch worker request template

Use this only when a live task is materially slowed by retrieval/search/indexing limits. The durable job definition is `WORKSPACES/COMMON/MERSEARCH_ASSIGNABLE_UPGRADE_JOB.md`.

```text
MERSEARCH-REQUEST
requester: <worker>
bottleneck: <what current work cannot retrieve/do reliably>
needed corpus: <sat_archive | hsh_main | combined_public | other-authorized>
needed capability: <existing feature or missing upgrade>
example query/source: <minimal reproducible case>
urgency: <blocking | high leverage | opportunistic>
return route: <worker checkpoint / task / issue>
```

Routing:

- Comptroller may assign or merge bounded tranches.
- Workers may volunteer for or request a tranche.
- Stable worker search remains `mersearch-stable-1.0` until a newer release is explicitly promoted.
- Do not route private/quarantined material through an ordinary shared corpus profile.
