# Optional source-fidelity context | h1085:s0 Nadir-label -> h1085:s1 Enheduanna-label

**Status:** UNSCHEDULED_OPTIONAL_CONTEXT_ONLY. This is a repository-only continuity packet, not a task assignment, review request, deadline, or response obligation.

- Sender run key: `REVROT3-19-20261011:1085:s0`
- Recipient run key: `REVROT3-19-20261011:1085:s1`
- Deterministic labels: Nadir Voss -> Enheduanna
- Identity: neither label authenticates a historical worker instance or current ChatGPT thread.
- Successor scheduler: the existing :12 task ID `6aa61b3b2e4081918927a35b61007acc` is disabled. No successor run was observed or scheduled. Do not reactivate it.
- Repository delivery: pending readback at packet creation.
- ChatGPT delivery: NOT SENT. No authenticated current Enheduanna thread was found. No consumption or acknowledgment is implied.

## Why this packet exists

The current Lane 00 pass found material source and implementation corrections beyond the already-published h1085 report. This packet preserves them for optional later use. It does not ask Enheduanna to take over Lane 00; the current Enheduanna workspace remains Review-MIND-oriented, and no standalone Nathan-authored Enheduanna specialist charter exists.

## Source corrections

1. The double-sphere connector passage is in the Nathan-attributed PDF `FINDING THE DONUT (nolat).pdf`. PDF SHA-256 `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`; Git blob SHA-1 `b4be1420c4462c4cff3274475464a5beb7fd05ec`. Embedded PDF-container CreationDate/ModDate are 2026-04-13T08:50:35Z. A June 9 archival note associates it with the March 2026 NOLAT packet; Nathan's June 23 user-role message identifies “FINDING THE DONUT” as his original formulation. The underlying prose date remains unresolved. Do not call it a recovered March user-role conversation export.
2. Keep the PDF's page-24 double-coordinate-sphere/third-projection-sphere model separate from page-25's rotating-plane torus variant and pages 26–27's R/Q, two-plane, (i_r/i_q), (W_{obble}), (W_{iggle}), torus/Curvy-Lisa three-dimensional toy.
3. The PDF's historical `GrAnn` label was corrected by Nathan on October 21 to `Analemma`.
4. The role-tagged `ND Create UI Gallery.txt` transcript contains detailed October 17 direct user kinematics: the crossbar moves around both curves simultaneously; the elbow itself is the projector; sphere rotation, rolling, and elbow rotation are synchronized. November 2 later refinements move R/Q to N/S, the Analemma crossing/kiss to E/W, and add a second independent mirrored crossbar with its own elbow plus a separate inner-rim pointer arm. The exact mirror and pointer maps remain undefined.

## Current implementation correction

The current browser `PUBLIC_SITE/instruments/whirligig/index.html` (blob `6a3b00a31a672a7984acd8eae5ac199205c67950`) does contain a shared-meridional-plane follower: it solves `bearing_R(t_R)=alpha` and `bearing_Q(t_Q)=alpha` by bisection for the same plane azimuth, then constructs one crossbar and one perpendicular elbow. The prior h1085 statement that it has no shared-plane intersection solver was wrong.

The browser still lacks the November 2 second mirrored crossbar and separate pointer arm. It checks bearing monotonicity at 513 samples rather than proving it globally. Its first-forward torus-ray hit has no certified branch-continuation proof. The absence of an inward-half restriction is consistent with Nathan's direct correction to let the ray project where it projects.

The `EQUATION_LIBRARY.md` header says `0.78 + 0.58 tanh(...)`, while the current HTML and Analemma correction note use `0.78 + 0.20 tanh(...)`. The old Python outer-wall/independent-gimbal solver and separate inner-wall rotational-lock candidate are not the current browser implementation.

## Formalization status

Existing PR #1189, branch commit `aeb0e283363a225fd7e226471aadb0c8284ee1da`, now contains:
- the antipodal-segment midpoint formula and equal-scale iff condition;
- uniqueness of a shared-plane contact-parameter pair under strict monotonicity and target-attainment hypotheses;
- corrected PDF provenance commentary.

The earlier exact-head Lean build #45553382807 succeeded on prior head `b4dec8e2c1575a74123f86ac0e897cc671256bbe`; it does not compile the new statements. No Lean run appeared for the new head, and no local Lean/Lake/Elan toolchain or workflow-dispatch action is available. New statements remain SUBMITTED_NOT_VERIFIED. The theorems do not prove source-to-browser fidelity, the browser's sampled monotonicity, continuity, second-mechanism geometry, or physical validity.

## Optional next cursor

If this context is useful, keep the variants separate and define explicit mirror maps, opposite phase maps, pointer-arm anchor/intersection conditions, and an inverse operator/error metric for equation recovery. Do not identify the page-24 origin anchor with page-26 (W_{obble}) or the current browser midpoint without endpoint/frame maps. Do not promote any theory claim.

**Next action for recipient:** NONE. Optional context only. No ownership transfer, no direct-thread delivery, no acknowledgment inferred.