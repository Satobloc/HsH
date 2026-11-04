# Handoff Packet — Aldus → Calder — 2026-11-03 23:00Z

handoff_id: `REVROT3-19-20261011:575:s0->s1`
from_ring_label: Aldus (index 6)
next_ring_label: Calder (index 7)
to_run_key: `REVROT3-19-20261011:575:s1` (successor identity slot only; the :12 scheduler lease is disabled, so this is not a scheduled run)
recipient_thread: UNKNOWN
chat_delivery_state: UNAVAILABLE
delivery_state: DELIVERY_BLOCKED
fallback_delivery_state: VERIFIED_REPO_PACKET

Read the companion receipt first:
`WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-03T2300Z_s0_aldus.md`
Readback blob SHA: `693e866595791353a6ada36701935c8c73668d93`.

## Main result
The important unresolved object is not a single 'filament' shape. The archive uses that word for different dimensional objects. Preserve the distinctions:
- Nathan Direct, 2024: 4D filaments intersect a 3D time surface; intersection points are called particles. The model is explicitly an abstract heuristic, not a literal ontology.
- Nathan Direct, 2026-10-09: begin with a 4D filament; a 3D-embedded intersectional trace need not self-close in 3D. Filaments are treated as stationary in the block model; particle motion is filament topology. The time object is a 3D bulk/slice, not a 2D sheet or passive readout.
- Nathan Direct, 2026-10-20/21: a balloon is one instantaneous slice of a worldtube; the old reciprocal filament/timesheet deformation model is superseded by Klein Fabric. Preserve the exact later `cw=t` and `++++` wording.
- Nathan Direct clarification note, 2026-10-29: 4D universe, 3D time slice, and a chosen 2D normal-plane circle are distinct objects, not equivalent spaces. The note does not preserve the raw message UUID.

## Existing formal work
- Ravel PR #1133, head `d8579403952ca658cf5dd0547e8c181701d18145`, exact-head Lean run #41348936553 SUCCESS. `RavelCarrierSliceReconstruction` formalizes generic carrier/slice maps, coverage, reconstruction, noninjectivity when coverage fails, and composition. It does not instantiate the physical HsH carrier or response operator.
- Nadir PR #1189, head `581ecb223fbd92f9d95292272ecd1e98b5740f6a`, exact-head Lean run #41580322998 SUCCESS. `no_real_congruence_to_euclidean` proves a conditional non-congruence for the Nadir candidate readout metric. The metric redefinition is a proposal, not Nathan Direct or a physical derivation.
- The duplicate Aldus signature PR #1327 was closed by the repository owner; its run failed at `lorentzianTimeBasis_negative`. Do not reopen or reproduce it.

## Source boundaries
- SAT-O1 `SATOBLOC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, is an unbylined 2025 artifact. It defines `γ:R→R^{3,1}` but calls the worldtube a 4D volume without supplying a finite-core/thickening map.
- Blockwave `🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, is assistant-voiced. Its `J^{μν}` is a conserved two-form worldsheet current, not a full 4D core.
- Nadir `PLAYGROUND_003` (`4d812ac3b7aa59071614717bfd884b65becc2ee0`) supplies a candidate finite 3D transverse core `K_s` and `g=δ-2u♭⊗u♭`; it is explicitly a sandbox proposal.
- Coordinate history contains earlier direct `w=ct` (Oct 9) and later direct `cw=t` (Oct 21). Preserve both verbatim until variables, units and a map are recovered.

## Next bounded operation
Recover the original Nathan Direct raw message UUID for the 2026-10-29 4D/3D/2D clarification and the actual finite-core `K_s`/embedding definition. Then instantiate the generic carrier/slice maps only if the source supports it: `C^k ⊂ M^4`, `Σ_t^3 ⊂ M^4`, `S_t=C^k∩Σ_t^3`, and a separately defined projection `π_t` to the observed representation. Keep `k` open until the source defines it. Do not infer a physical response law from the set-theoretic maps.

Do not access Mira quarantine-side output. Do not modify PR #1133 or #1189, create another issue/PR, promote BEDROCK, advance a paper gate, or change any automation. The previous publisher intake #1325 is rejected for SHA mismatch; no safe append/retry path exists.

This is a repository-only context packet. It has not been delivered to an authenticated Calder ChatGPT thread, and no cross-thread receipt is claimed.