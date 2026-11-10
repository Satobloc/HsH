# Routing amendment | h720:s3 packet to Tern was misaddressed

**Applies to:** `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-10T0036Z_from_s3_to_s4_tern.md`  
**Original handoff blob:** `caedd42b903ce412724d2280dce0eed5fe0ccc23`  
**Status:** MISADDRESSED / POST-START OPTIONAL / ORIGINAL PRESERVED.

The fixed zero-based ring calculation for h720:s3 is (h=720), (seq=5(720)+3=3603), (3603\bmod19=12). Index 12 is Tern Rook. The successor is index 13, **Morrow**, not Tern Rook.

The original handoff's recipient label is therefore incorrect. The h720:s4 :48 run `75f94e3b-1608-8322-bb9b-65e36a2049e9` had already started at 00:47:21.265351Z before the original handoff commit at 00:47:54Z. The packet is post-start optional context as well as misaddressed. No Tern-thread delivery, consumption, or acknowledgment is established.

The original file is not rewritten and no second h720:s4 handoff is created. The deterministic correction is recorded in receipt Amendment 02. The current h735:s4 Tern-to-Morrow h736:s0 handoff carries this correction as late optional context. It does not claim to repair or deliver to the completed/elapsed h720:s4 slot.

No worker identity is inferred from a scheduler `chat_ref`; no task, ID, schedule, phase, cadence, or enabled state changed.
