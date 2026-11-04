# BR-006 raw-source recovery and equation-provenance clarification

**Date:** 2026-11-04  
**Status:** SOURCE_RECOVERED · PROVENANCE_CLARIFIED · NO_THEORY_PROMOTION  
**Relationship:** Additive correction to HsH issue #1252. No BEDROCK edit or physical validation.

## Primary raw source

- Conversation: `Calculation Relay :36`
- Conversation ID: `6ad065ae-9b8c-83e9-8858-d99dd9a4a5e1`
- File: `LIVE CONVOS/Calculation Relay _36 — raw__chunk_0001_of_0002.txt`
- Git blob SHA-1: `40daedbf045ce16442fd493d2992062487b3c369`

| Role | Message ID | UTC | Finding |
|---|---|---|---|
| User | `4d62333e-9a90-4aee-a3cf-2513149fe84e` | 07:49:42.233 | Every “release revolution” must add braid history; over a sufficiently long term planetary-system rotation must approximate galactic rotation curves |
| Assistant | `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f` | 07:49:43.228 | First scalar formula and exploratory mechanics |
| User | `c293bf0e-6a8a-4f59-8e9a-c76ebb12a1f1` | 07:51:09.865 | Interbraid is the physical constraint on possible worldtube configurations; “that’s the entirety of the theory” |
| User | `3b1c8e0c-871e-438a-96f1-029cb3a84aa3` | 07:52:26.489 | Requests BEDROCK clarification |
| Assistant | `4cdd30a7-ecf5-465c-9edb-a1090ab1ec67` | 07:54:16.834 | BR-006 draft |
| User | `cc6c2d1d-21e4-44bf-9ba3-26df718e81bf` | 07:55:41.886 | Approves draft (“Excellent”) |

## Equation provenance

The scalar expression

\[
B(t)-B(t_0)=\frac{\Phi(t)-\Phi(t_0)}{2\pi}
\]

first appears in assistant message `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f`, not in the verbatim user message. It is then included in the BR-006 draft that the user approves.

**Correct classification:** assistant-formalized representation, subsequently Nathan-approved as part of BR-006; not a verbatim Nathan-authored equation.

The user’s original wording is “release revolution”; the accepted draft normalizes this to “relative revolution.” Preserve both stages. The assistant’s additional exploratory \(a_{\rm IB}\), orbital-balance, Keplerian-winding, and \(r^{-3/2}\) expressions are not in the approved BR-006 draft and are not promoted here.

## Glossary and mapping

| Symbol/term | Status | Meaning or limit |
|---|---|---|
| \(W_i\) | Direct concept | Four-dimensional worldtube history |
| Interbraid | Direct concept | Mutual geometric constraint among worldtubes, not an independently invented force law |
| \(\Phi(t)\) | Assistant-defined, approved | Unwrapped relative orbital phase; frame and observer projection still need definition |
| \(B(t)\) | Assistant-formalized, approved | Continuous accumulated phase count; not automatically a complete braid-group class |
| \(\mathcal C(W_1,W_2)\) | Proposed type | Configuration space of admissible worldtube pairs; not source-defined |
| \(\beta\) | Standard mathematical candidate | Braid-group element, only after configuration space and admissible equivalences are specified |
| \(R_{\rm gal}\) | Direct required outcome | Planetary-to-galactic rotation behavior; no exact law or timescale supplied |

**Mapping schematic only, not a precise geometric plot and not Factory Floor eligible:**

```text
4D worldtube histories W1,W2
        |
        | M1: admissible-pair/configuration-space map
        v
configuration path gamma(t) in C(W1,W2)
        |                         |
        | M2: observer projection | M3: closure, framing,
        v                         |     no-collision and
unwrapped phase Phi(t)            |     allowed deformations
        |                         v
        v                    braid class beta
scalar winding B(t)                |
        +-------------+------------+
                      |
                      | M4: geometric constraint -> response
                      v
           resistance / hysteresis / orbital evolution
                      |
                      | M5: cross-scale observable map
                      v
          planetary and galactic rotation behavior
```

M1–M5 are required maps, not established maps. M2 must not be assumed to preserve all four-dimensional information; M3 must establish invariance under the allowed deformations.

## Discrepancy ledger

1. **Scalar versus topology:** \(B(t)\) is a continuous unwrapped phase-count coordinate. It is not automatically an integer winding invariant or a full braid-group element. A physical-to-topological map still needs configuration space, finite-core/framing rules, observer projection, endpoint/closure conditions, collision exclusion, and admissible deformations.
2. **Required outcome versus derivation:** planetary rotation approaching galactic rotation-curve behavior is a direct required cross-scale outcome. BR-006 leaves its exact law, rate, tolerance, and timescale to be derived and tested.
3. **Inspiral:** BR-006 lists inspiral as a required calculation. The preceding conversation raises eventual inspiral as a question; it does not establish its sign or inevitability.
4. **Exploratory force equations:** the assistant’s extra acceleration and orbital-balance equations were not included in the approved BR-006 draft. They remain unpromoted.
5. **BEDROCK provenance:** the concept is Nathan Direct; the scalar equation is assistant-formalized and Nathan-approved, rather than verbatim Nathan-authored.

The BEDROCK commit `0404351fe41b882da0ec16c20526bba43c3e0110` is attributed to Nathan in Git metadata but is unsigned, not cryptographic signature verification.

## Formal and physical status

PR #1064 (abstract \(C_3\) phase/holonomy) and PR #1066 (abstract \(B_3\) word versus endpoint permutation) remain open, draft, and unmerged. Their Lean 4.34.0 CI runs succeeded on merge-reference builds; neither proves the physical map from four-dimensional worldtube histories to a braid object. No new Lean theorem was created; no local Lean/Lake/Elan executable was available.

No measured system, dataset, units, uncertainty budget, physical calculation, CODATA scoring, or observational validation was used. No BEDROCK edit or theory promotion was made. No verbatim SAT-O/Blockwave equation with this exact scalar form was found in the bounded three-repository search.

## Next deeper cursor

Define the explicit map from finite-core four-dimensional worldtube histories to a braid object in a specified configuration space. State projection, framing, endpoint/closure, no-collision, and admissible-deformation conditions; then prove the map is well-defined and distinguish its invariant from the continuous phase coordinate.

Only then derive mechanical response and cross-scale rotation behavior, beginning with identifiable measured systems, real data, provenance, units, and uncertainties. No data-free physical fixture is authorized.
