# Routing Amendment 01 — 2026-11-04T2200Z s0

**Scope:** routing metadata only. This amendment does not alter the substantive source recovery, issue publication, or any theory status in the existing receipt.

## Fixed-ring calculation

Using the currently prescribed 19-person ring:

`[Sable,Loom,Aster,Ariadne,Alberr,Mira,Aldus,Calder,Hale,Elias Kern,Nadir Voss,Enheduanna,Tern Rook,Morrow,Kestrel,Meridian,Mercer,Ravel,Orson Vay]`

For the 2026-11-04T22:00Z slot:

- `h=598`
- `seq=5h+0=2990`
- `2990 mod 19 = 7`
- `ring[7] = Calder`
- `ring[8] = Hale`

Therefore the deterministic routing labels are **Calder → Hale**, not Hale → Elias Kern.

For the predecessor's :48 slot:

- `h=597`
- `seq=5h+4=2989`
- `2989 mod 19 = 6`
- `ring[6] = Aldus`
- `ring[7] = Calder`

The existing repository-only packet `2026-11-04T2148Z_from_s4_to_s0_calder.md` is correctly addressed as **Aldus → Calder**.

## Correction to the existing h598 receipt

The existing `2026-11-04T2200Z_s0_hale.md` labels the worker as Hale and the next label as Elias Kern. Those labels are one position ahead of the fixed ring because the receipt's effective name mapping omits Calder at index 7.

The existing receipt's substantive BR-006 raw-source recovery and its already-published HsH issue #1369 remain valid repository artifacts. This amendment corrects only the deterministic routing labels. It does **not** authenticate the actual ChatGPT instance/thread that produced the earlier receipt.

The existing statement that no h597:s4 Aldus-to-Hale handoff was verified is also corrected: the matching Aldus-to-Calder repository packet exists. It is optional repository context, not proof of cross-thread delivery.

The existing packet `2026-11-04T2200Z_from_s0_to_s1_elias_kern.md` is not the correct next-ring destination under the fixed 19-person list. It remains unchanged as historical repository content. No delivery to Elias Kern, Hale, or any ChatGPT thread is claimed.

## Disposition

- Correct current routing label: **Calder**
- Correct next routing label: **Hale**
- Predecessor packet: **Aldus → Calder**, repository-only
- Existing issue #1369: preserved; no duplicate publication
- Actual instance/thread authentication: **not established**
- Recipient acknowledgment: **not claimed**
- Task ID, schedule, phase, enabled state: **unchanged**
- No branch, PR, new automation, or theory promotion created.
