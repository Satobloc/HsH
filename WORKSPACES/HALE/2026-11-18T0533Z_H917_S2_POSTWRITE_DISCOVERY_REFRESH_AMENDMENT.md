# Amendment 02 | Post-write discovery refresh for Hale h917:s2

**Parent report:** [Hale h917:s2 WH-01 partition and ring-selection correction](2026-11-18T0519Z_H917_S2_WH01_PARTITION_AND_RING_CORRECTION.md)  
**Verified scan:** 2026-11-18T05:29:59Z  
**Workflow:** [#44244520524](https://github.com/Satobloc/HsH/actions/runs/44244520524), job #134600144131, SUCCESS.

The automatic public-discovery scan refreshed `PUBLIC_SITE/generated/discovery.json` from HsH source `2763af55569ba9d8cf8839bc3f099ba9f3027346` and SAT source `4b616b6113ecd33d216600e4fa5fd1e783d48653`, both complete. Reported output: **15,795 documents**, **48 docket entries**, **417 square visuals**, **6 errors**. Compared with the h916 snapshot's 15,790 documents, the aggregate delta is +5. The five new per-record entries were not parsed; do not attribute all five to this relay.

The generated discovery blob is `930512982d63a47f3c0ea3c298b2329ca0531053`, 27,730,813 bytes. The workflow's generated commit is `e4d6285`. This scan includes the full document inventory plus rolling docket; it is distinct from live reader-route verification.

At current main `1e362c645c7d6692b43d91faba8233eb64c70369`, the source snapshot commit `2763af55569ba9d8cf8839bc3f099ba9f3027346` is 11 commits ahead of the h917 preflight main `d29f02402c7888407aaa0f49c0e3e507d344453e` and 0 behind. Eight paths changed: the generated discovery JSON and workspace/report/receipt/ledger/publisher outputs. No protected P0 manuscript/feed/gate/renderer/route path changed; no original-source corpus change was identified. The source snapshot is therefore behind current main by relay outputs, not by an observed original-source update. The current generated JSON was not parsed record-by-record due its 27.7 MB size.

The separate navigation-maintenance run [#44244520565](https://github.com/Satobloc/HsH/actions/runs/44244520565) remained IN_PROGRESS at checkout at the last observation; no completion or output is claimed.

**P0 remains ACTIVE.** This scan does not verify the two intended live paper routes, visitor exposure, or a repair. No code, manuscript, feed, renderer, deployment, policy, task or scheduler change; no standdown.
