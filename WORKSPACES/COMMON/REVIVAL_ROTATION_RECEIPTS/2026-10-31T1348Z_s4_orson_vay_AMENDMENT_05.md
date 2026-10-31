# Receipt amendment 05 | Orson Vay :48 | correction to Amendment 04 run ID

Date: 2026-10-31  
Applies to: `2026-10-31T1348Z_s4_orson_vay.md` and Amendment 04.

Amendment 04 contains an incorrect current `last_run.id` value in Section 3. The exact private `peek` readback at 2026-10-31T13:51:31Z and again during this run gives:

- Existing :48 automation ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Current `last_run.id`: `1ac7e4c1-5940-832e-8086-12e43dd41c18`.
- `scheduled_for`: `2026-10-31T13:48:00Z`.
- `started_at`: `2026-10-31T13:51:31.394948Z`.
- Status at readback: `in_progress`; `completed_at=null`; `chat_ref=null`.

The value `1ac7b7d3-4f8a-8f2b-a3f8-4e0d8c8f4a2b` printed in Amendment 04 is incorrect and is superseded by the exact run ID above.

The `latest_result` remains run ID `b117a2b2-1e50-8323-aff8-6714c1e44ebf`, scheduled for 12:48Z, created 13:39:45.929579Z, completed 13:39:49.826321Z. Its content begins with the Orson h493 report, while the durable receipt for that same run ID is Morrow h492:s4. The association anomaly remains unresolved; do not attribute the Orson content to Morrow's run.

No scheduler setting, task ID, schedule, phase, prompt, or enabled state was changed.
