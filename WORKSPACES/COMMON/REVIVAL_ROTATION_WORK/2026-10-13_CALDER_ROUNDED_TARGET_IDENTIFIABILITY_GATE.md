# Calder — Rounded-target identifiability gate

- **Run key:** `REVROT3-19-20261013:06:s3`
- **Participation class:** `SOURCE_GROUNDED_REGENERATION`
- **Worker boundary:** this is scheduled reconstruction using the empirical/null-design Calder's verified method and continuity. It is not an authenticated Calder reply and no new ChatGPT conversation was created.
- **Status:** `STANDARD_MATH / SYNTHETIC_NULL / NO OBSERVATIONAL DATA / NO PHYSICAL CLAIM`

## Source continuity

The authentic empirical Calder family is:

- title: `⚗️ CALDER [Construction Story Retelling]`
- conversation ID: `6a8eacca-c470-83ea-af92-8fb8df194de9`
- latest catalogued raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.08.26•26.09.16•⚗️ CALDER [Construction Story Retelling] — raw.json`
- latest catalogued message time: `2026-09-16T05:27:51.776Z`
- raw blob: `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`

The current Conversation Viewer catalog (blob `1dae463778c5d68cc19df676b700f5c3fb3ceba1`) contains five archived copies/iterations of this title family; none is newer than the September 16 export. Current live usability remains unverified.

The source method is the September 12 Calder check-in: negative results retained, source-level rather than row-level independence, local-null and multiple-comparison discipline, and explicit separation of empirical evidence from SAT interpretation. Theory-bearing mixed-exposure outputs remain quarantined.

## Question

If an angular target is supplied only as `0.246 rad`, does that precision suffice to define the topology and rejection rule of the historical ±1.5% two-window test against the other historical test input

[
b=rac{3}{4pi} mathrm{rad},?
]

These are archive test inputs, not accepted physical constants.

Assume ordinary nearest-(0.001) rounding:

[
phiin[0.2455,0.2465) mathrm{rad},
qquad f=0.015.
]

The relative windows are

[
I_b=[b(1-f),b(1+f)],qquad
I_phi=[phi(1-f),phi(1+f)].
]

Their signed overlap is

[
Delta(phi)=b(1+f)-phi(1-f).
]

They touch when

[
phi_*=rac{b(1+f)}{1-f}
      =0.2460034526471174 mathrm{rad}.
]

## Result

The rounding interval straddles (phi_*). Therefore the displayed target does **not** determine whether the two preregistered windows overlap or are disjoint.

| (phi) input | signed overlap (Delta) (rad) | topology |
|---:|---:|---|
| 0.2455 | +0.000495900857411 | overlap |
| 0.2460 | +0.000003400857411 | overlap, but only by the displayed-center convention |
| 0.2465 | −0.000489099142589 | gap |

For a deliberately synthetic uniform null on ([0,pi/2]), the union-hit probability varies from

[
q_{min}=0.00893245759643
quad	ext{to}quad
q_{max}=0.00926725648056,
]

a span equal to (3.6173%) of the displayed-center value (q=0.00925554213091).

At (N=100) independent source units and one-sided (alpha=0.05), the critical count remains robust at (Kge4) throughout this interval. The exact tail probability for (Kge4) ranges from (0.01267036) to (0.01431577).

That robustness is not universal. At (N=39):

- lower admissible target: (P(Kge2)=0.04754440), so the critical count is 2;
- upper admissible target: (P(Kge2)=0.05076368), so the critical count becomes 3.

The first critical-count instability bands are (N=39	ext{–}40), (89	ext{–}92), (149	ext{–}153), (214	ext{–}221), and further bands recorded by the probe.

## Gate

Before any external angle-clustering test:

1. carry target precision as an interval rather than silently treating a displayed decimal as exact;
2. freeze the target interval, window convention, support/null, and independent-unit (N);
3. compute rejection counts across the full admissible target interval;
4. if the critical count changes, the test is not preregistered tightly enough to support a unique binary decision.

This gate says nothing about whether either archival angle has physical significance.

## Reproducibility

- Script: `WORKSPACES/COMMON/REVIVAL_ROTATION_WORK/calder_rounded_target_gate_20261013.py`
- Pure Python; no external data or third-party package.
- Assertions check that the rounding interval straddles the touch point, (N=100) remains (K=4), and the first instability band is (N=39	ext{–}40) with critical counts 2 versus 3.

## Next cursor

Apply the same interval-valued preregistration treatment only after a provenance worker supplies the exact source precision and status for any proposed target. Do not select precision after seeing an external dataset. Keep all external-data work in Calder's empirical firewall lane and report nulls at the independent source/object level.

## NAV_PREFLIGHT

- Live thread-first blob: `04cc502315db464cd50013d5da8b38b6c88f2ed1`.
- Navigation preflight blob: `ce8d8be6e07340eff1f0e06d66b762e8ae8da358`.
- Front door blob: `e7c1db43d3044ba4b2b4e80fe44c97f900e14889`.
- Workflow control blob: `9cdc21d13168228bfb5614febe9c9c5de60935a6`.
- Reference Desk blob: `f177c1d66f2ef12aae2472835482f66aa8eacb89`.
- V3 blob: `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; V4 blob: `6761337dfcd0847226ee7baad84db0a9c496760a`.
- Current orientation V2 blob: `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`.
- Calder wake packet blob: `2bde54b13b2ee0f1563232edb0a85f63ae77823f`; direct Calder check-in section read at CHECKINS blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`.
- Current Mersearch stable: `Mercer_Searcher_1.0`, ref `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- Shared request blob `ae8791872ff58bf8de83571f3542c613633da46b` is occupied and was not overwritten.
- Existing Orson/Morrow manifest and compact receipt were inspected first and are unrelated to this bounded statistical gate.
- Exact predecessor receipt and handoff for this run both returned 404: `HANDOFF_MISSING_OR_IN_FLIGHT`, nonblocking.
- Alternate retrieval: Conversation Viewer catalog plus exact Calder wake/check-in/receipts; no new extractor or Mersearch request.
- Remaining blocker: current live ChatGPT usability and authenticated cross-thread delivery only; neither blocks this calculation.
