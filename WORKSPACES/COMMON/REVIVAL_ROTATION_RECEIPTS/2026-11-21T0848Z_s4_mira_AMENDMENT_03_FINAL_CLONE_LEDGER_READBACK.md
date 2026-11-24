# Amendment 03 | h992:s4 | final clone-ledger readback correction

This amendment corrects one stale blob-SHA reference in Amendment 02. It does not change the publication result or any task state.

- The final clone-ledger readback is 162 valid JSONL rows, blob SHA `600918ae44306304dc6b6c1f45485f80f5f5ce5b`.
- The four h992:s4 events are:
  - `h992-s4-l48-hsh-api-20261121t091140z-001`
  - `h992-s4-l48-sat-api-20261121t091140z-001`
  - `h992-s4-l48-hshres-api-20261121t091140z-001`
  - `h992-s4-l48-publisher-checkout-20261121t092757z-001`
- The earlier Amendment 02 value `91399d9169e2579355b769acdbd853437e892c8b` was an intermediate blob and is superseded. The final readback SHA is `600918ae44306304dc6b6c1f45485f80f5f5ce5b`.
- The PWH queue's final readback includes both the h992:s4 observation and the h993:s2 :24 run in progress; blob SHA `ac2eab6b781bed0ce81f02c35c5fed385c64fa0f`.
- The postrun optional Aldus packet and HANDOFFS index remain read back, with packet blob SHA `4026126a7c0ea81c7d14ea9819839ba8ec0b01fe` and index blob SHA `26871335ce45257d385de1d1b8a660473be835ea`.
- Publisher #2270 remains PUBLISHED_VERIFIED, with exact workspace/canonical artifact match and no duplicate or retry.
- The :48 task remains enabled with its exact ID and recurrence. Last observed :48 run remains IN_PROGRESS with `chat_ref=null`; no terminal completion is claimed.
