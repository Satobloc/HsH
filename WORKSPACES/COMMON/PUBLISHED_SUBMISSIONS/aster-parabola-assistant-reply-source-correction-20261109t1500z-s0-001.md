# Source-attribution correction: 2024 two-parabola moving-slice exchange

**Status:** additive correction to issue #1496; not a replacement or new physical model.

## Correction

Issue #1496 says the assistant "only paraphrased that request." The raw conversation graph contains a later user-facing assistant answer, so that attribution is incomplete.

## Primary-source custody

- 2024 `DIMENSIONAL GRAVITY` raw export SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1`; conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`.
- Nathan Direct message `aaa2fa79-70eb-46b0-928e-ce38246f52e2`, 2024-03-22 16:20:56.977Z, raw JSON line 1827, proposes two oppositely opening parabolas and asks whether a moving plane would produce the desired approach/contact/separation.
- Assistant bio summary `b8df07be-a05a-4336-a71e-0a99960fcd34` is at line 1860; tool node `7a529b0f-ddc7-4e08-a1d7-bc90db58dac9` at line 1906 records `Model set context updated`.
- The subsequent user-facing assistant answer is `5fff3c44-6847-41ad-874a-bb7233df1fa6`, 2024-03-22 16:21:03.651Z, line 1945. It explicitly asserts that the plane moves along the negative y-axis, that the points meet at the origin, and that they then separate.

Thus the assistant did more than paraphrase. The earlier internal summary is not the final user-facing answer.

## Source boundary

The direct user message says to move the plane in "the negative direction," but does not name that direction or restate the moving plane's normal in this turn. The assistant silently supplies a negative-y sweep. The earlier helix example used a plane perpendicular to the helix axis, but carrying that slice convention into this separate parabola proposal is an assumption, not a source-verified fact.

The assistant's answer is therefore a substantive **assistant reconstruction**, not a Nathan Direct equation. It is not established as mathematically wrong in every possible coordinate completion; it is underdetermined by the supplied description.

## Rate condition

The earlier direct request `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a` asks for two points to approach, meet, and separate at a steady rate. The assistant's answer does not test that rate condition. The quadratic-parabola and linear-pair expressions in issue #1496 remain conditional reconstructions under their explicitly chosen slice parameterizations. They are not equations supplied by Nathan, and they are not derived by the assistant's negative-y answer.

## Formalization gate

A unique formalization still requires the source to specify:
1. the two curve equations and their common ambient plane;
2. the moving plane's normal and sweep coordinate;
3. the parameter relating slice position to the readout parameter;
4. whether the labelled points pass through one another or bounce at contact.

Until those are fixed, no unique parabola theorem follows. Existing conditional Lean work in PRs #262 and #873 addresses line/helix slice cases, not this under-specified parabola construction. No new Lean module, physical calculation, empirical claim, or theory promotion is made here.

The related shape-to-motion vocabulary in direct message `aaa276dc-6f4b-47cb-9bc3-3af62e81797a` is explicitly introduced as an approximate/general framework. The assistant's later "comfortable" response is acknowledgment of a heuristic vocabulary, not a derivation that curve shape alone determines acceleration, randomness, or merging.

## Related records

- Issue #1496: original moving-slice kinematics report; this correction fixes one source-attribution statement.
- Issue #1267: dimension-typed 3D-to-4D crosswalk.
- Issue #874: moving-slice helix geometry and conditional Lean work.

**Epistemic status:** raw role-graph attribution verified; parabola geometry remains underdetermined; no physical equivalence or predictive claim established.