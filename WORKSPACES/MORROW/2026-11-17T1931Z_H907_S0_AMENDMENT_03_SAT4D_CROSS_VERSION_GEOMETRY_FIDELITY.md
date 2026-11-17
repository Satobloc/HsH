# H907:s0 Amendment 03 | SAT4D cross-version geometry and source-fidelity ledger

**Amendment time:** 2026-11-17T19:31Z observation  
**Parent run key:** `REVROT3-19-20261011:907:s0`  
**Selected identity:** Morrow, ring index 13; next Kestrel, index 14  
**Classification:** INTERNAL SOURCE-FIDELITY AMENDMENT / NOT A NEW RUN / NOT A THEORY-INTEGRATION PASS

This amendment extends the existing h907 report rather than creating a second report or issue. It records additional cross-version source surfaces recovered after the original submission. It does not change the original SAT-O1 or Blockwave equations.

## 1. Historical remit, access, and limits

The raw Morrow source conversation was fetched by its known Git blob:

- Conversation ID: `6a9ee7ca-d340-83ea-b99d-6a3097429f36`
- Raw export blob: `ee394b446b2e36d35fd1e5ecd004685c0422457b`
- Parsed size: 3,013,273 characters; 697 mapping nodes; 17 user-role messages.
- This is one conversation snapshot, not independent corroboration.

The original user-role messages establish:

- `402ade01-7116-4efb-9b14-31e477754458` (2026-09-08): provisional Team Archivist remit, broad archive appraisal, source comparison, and a warning not to treat the initial priority list as exhaustive.
- `934e87de-4e61-4622-a0ea-e5047aa235c6` (2026-09-13): explicit instruction to stop work on the theory and quarantine unique artifacts.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557` (2026-09-13): later invitation to an archive/maintenance/reconstruction trial, expressly allowing source comparison, theory-material reading and note-taking, mathematical/equation checking, provenance, chronology and constructive critique.

The later invitation does not expressly lift the theory stop. It authorizes bounded source work, not theory integration, physical prediction or paper production. No standalone signed specialist charter was recovered; these primary user messages are the authority. The September 9 messages `87cf1b1c-5ed7-4082-a0fe-6ed5c79dce3b` and `fa3afa98-8d69-4bf1-878a-4d148d4473d2` further distinguish RMS from SAT and describe the archive as preserved developmental history rather than a settled policy manual.

Browser tab access failed because this runtime did not have the originating browser context. No authenticated current Morrow thread was found, reopened, or messaged. This is assistant-level source-grounded work, not participation by the historical Morrow instance.

Mersearch was checked first but no callable Mersearch action was available. The four canonical request files remain occupied/requested; no request was overwritten, released, or retriggered. GitHub and the Library raw export were bounded fallbacks, not a Mersearch execution or exhaustive three-repository search. HSH_RESOURCES was limited to its root README; no private research payload was opened.

## 2. Interrelated primary-source cluster

| Artifact | Source status and date | Git blob SHA-1 | Additional identity |
|---|---|---|---|
| `SATOBLOC/SAT O1 4D.txt` | Unbylined; file-index created 2025-06-07 08:38:16, modified 2025-06-09 18:44:50 | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | Recorded SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` |
| `SATOBLOC/SAT4D_LIVE_DRAFT.txt` | Document-level byline Nathan McKnight; header June 2025; explicitly DRAFT / development bible / theory to be redeveloped | `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | Recorded SHA-256 `c3f90cdeda667f20c7ab9ab33eea2e23c5245d94c1e4f99f3aec5e3e7f1f6cb7` |
| `SATOBLOC/SAT O4 4D.txt` | Unbylined; file-index created 2025-06-07 09:28:41, modified 2025-06-09 18:45:20 | `32462848d9927619624928df3a1df35feb0f126d` | Separate O4 stability-claim artifact |
| `SAT 4D Theory Work/SAT4D_4.txt` | Byline SATO.4D Coherence Project; document date July 2025 | `efc88f4523b2fd616e64898737c2aa45e5f39b9a` | Glossary / mathematical vocabulary |
| `SAT 4D Theory Work/SAT4D_6.txt` | Unbylined; document date July 2025 | `167136310cdf33ca8f986f33634692314c1a0946` | Deployment / derivation constraints |
| `SAT 4D Theory Work/SAT4D_8.txt` | Byline SATO.4D Coherence Project; document date July 2025 | `6a1ef773c40f805aace5fd61e3584ba50c21241d` | Interpretive-mode definitions |
| `SAT 4D Theory Work/SAT4D_9.txt` | No author attribution; date field is `\\today` | `19610d8eb16878ace3a2cf50047bff9319ed1b27` | Derivation index with placeholders |
| `SAT 4D Theory Work/SAT4D_3.txt` / `SAT4D_7.txt` | July 2025 status documents | `f2a2540da5bb399ed4218d65a65e3b983dc00d01` / `597060293196a8017fbbb144a3393733e76ee267` | Both mark O4 complete; this is not proof of its claimed theorem |

The O1 body embedded at lines 133–207 of the larger live draft matches the 58 nonblank body lines of the standalone O1 file after heading and whitespace normalization. These are not independent mathematical witnesses. The larger draft's document-level byline does not establish Nathan Direct authorship of every embedded equation.

### Original equation custody — unchanged

The standalone O1 source contains:

~~~tex
\gamma^\mu(\lambda) =
\left(\lambda,
A_x \sin(k_x\lambda+\phi_x),
A_y \sin(k_y\lambda+\phi_y),
A_z \sin(k_z\lambda+\phi_z)\right)

v^\mu(\lambda) = \frac{d\gamma^\mu}{d\lambda}

S[\gamma] = \int d\lambda\,L(\gamma^\mu,v^\mu)

L = \frac{1}{2}m v^\mu v_\mu - V_{\text{tension}}(\gamma)
~~~

O4 asserts the following stability function:

~~~tex
\mathcal{S}(n) =
\begin{cases}
1, & n = 2, 3,\\
0, & n \geq 4.
\end{cases}
~~~

Its accompanying prose identifies \(n=2\) with a Hopf link, \(n=3\) with a Borromean link, and \(n\geq4\) with unstable interlocks. It then maps those claims to meson/baryon stability and rapid decay of higher-constituent exotics. This is an asserted model proposition, not a recovered derivation.

The separately user-supplied Blockwave attachment remains an independent source object with unresolved embedded authorship. Attachment event: 2025-09-16; earliest accessible HsH repository copy: 2025-09-18. Git blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; recorded SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.

Its original central strings remain:

~~~tex
J^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma

\nabla_\mu J^{\mu\nu}=0

A_\mu(\theta)=\alpha_*\nabla_\mu\theta

F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta)
~~~

No SAT-O1, O4, or Blockwave equation was corrected or substituted in this amendment. No corrected-equation set is proposed.

## 3. Nathan Direct geometry recovered from the November 8 raw conversation

The Library raw export `ND Workshop Relay _24 _ Geometry - raw(1).json` is 8,331,175 bytes and contains conversation `6aecede1-4c08-83e9-abc4-da64f59a4f51`; the prior source-custody record identifies raw-export SHA-256 `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`.

Three user-role messages are especially relevant:

- `bcbe9ee8-b621-4a40-9edb-b34c17783be5`, 2026-11-08 18:05:28.410Z: working hypothesis of a four-dimensional tube region around a one-dimensional core, bounded by a three-dimensional boundary; a possible mouth opening onto the timesheet; and a two-dimensional worldsheet as a possible simplification, not a settled identity.
- `f9356192-0ec6-4a9c-ab53-ab76bf75c42e`, 18:36:17.730Z: pair-of-pants is a particular split, not the generic straight-vacuum or coiled-matter tube. The worldsheet reduction is explicitly unresolved; it may be an approximation, and need not discard information.
- `c0520975-02a0-408f-a250-364b88ab7b30`, 20:18:10.172Z: \(w\) is described as a fourth spatial dimension, distinct from proper time \(t\); time moves along \(w\). Several time-surface / bosonic-wavefront / Crullerverse interpretations remain alternatives or tentative constructions. The message also states a preference to remain in a four-dimensional universe and proposes, without formal definition, that a sufficiently convolutable line could map arbitrarily complex information.

These are direct user-authored geometry statements with explicit tentative language. They are not retroactive definitions of the June O1 action. In particular, the June \(\mathbb{R}^{3,1}\) curve, July \(M^4\) glossary, November \(w\)-spatial description, and current native \(++++\) convention remain distinct representations until a source-authorized map connects them.

## 4. Stable glossary and typed objects

| Term | Source-grounded meaning | Fidelity / missing condition |
|---|---|---|
| \(M^4\) | July SAT4D smooth four-dimensional manifold | SAT4D_4 says no metric, gauge field, or connection is assumed a priori |
| \(\gamma^1\) | One-dimensional filament / core / parameterized path | June O1 uses \(\gamma:\mathbb R\to\mathbb R^{3,1}\); November Direct describes a 1D core |
| \(T^4\) | Four-dimensional tube region / swept support | No source-authorized thickening or sweep map from \(\gamma^1\) is supplied in O1 |
| \(\partial T^3\) | Three-dimensional boundary of the four-dimensional tube | November Direct names it; boundary construction and incidence remain unspecified |
| \(\Sigma_t^3\) | Propagating three-dimensional timesheet / wavefront | Its relation to the tube mouth, boundary, and observable trace remains open |
| \(W^2\) | Possible two-dimensional worldsheet / string-like simplification | Not identical to \(T^4\); reduction, projection, and information behavior are unresolved |
| \(u^\mu\) | Local time-flow vector field described as normal to \(\Sigma_t\) | “Normal” requires a metric, or a separately declared transverse-field convention |
| \(\theta_4\) | Misalignment angle between filament tangent \(v^\mu\) and \(u^\mu\) | Requires a specified metric/bilinear form, causal types, and normalization convention |
| \(S_{\mu\nu}\) | SAT4D strain tensor \(\nabla_\mu u_\nu+\nabla_\nu u_\mu\) | Requires a connection and a lowering map / metric not supplied by the glossary |
| \(\lambda\) | O1 affine parameter | Also occupies the first coordinate of \(\gamma^\mu(\lambda)\); no explicit map to coordinate time \(t\) or proper time is declared |
| \(\mathcal S(n)\) | O4 asserted stability function for an \(n\)-filament bundle | The ambient space, embedding, link object, invariant, and derivation are absent |
| Mode 1 | True Block: fixed resolved 4D manifold; motion/change as projections from filament structure intersected by \(\Sigma_t\) | SAT4D_8 says this is the default for SAT.O modules |
| Mode 2 | Semi-Dynamic Block: localized constrained filament adjustments | Must be explicitly marked and confined to non-core derivations/simulations |
| Mode 3 | Solidification Front | SAT4D_8 prohibits it in falsifiability-grounded SAT.O modules |
| \(T,A,Q\) | O4/SAT4D tension, rigidity, and topological suppression vocabulary | Operational definitions and dimensions are not supplied in the inspected glossary |

## 5. Mapping diagram: original objects versus assistant translations

~~~text
JUNE O1
  gamma^1 : R -> R^(3,1)
       |
       |  thickening / normal-bundle / cross-section / sweep map
       |  NOT DEFINED IN O1
       v
  claimed 4D worldtube T^4
       |
       |  slice / closure / link-support map NOT DEFINED
       v
  Hopf / Borromean / higher-n interlock claim
       |
       |  O4 stability assertion S(n), derivation not recovered
       v
  particle-stability predictions


JULY SAT4D
  M^4 + gamma^1 + Sigma_t^3 + u^mu
       |
       |  metric / connection / normal convention not supplied
       v
  theta_4 and S_(mu nu)


NOVEMBER 8 NATHAN DIRECT
  1D core gamma^1
       |
       |  proposed tube construction; exact map still open
       v
  4D tube T^4
       |
       v
  3D boundary partial T^3
       |
       |  possible mouth / interface map open
       v
  3D timesheet Sigma_t^3

  Optional W^2 worldsheet:
  a possible lower-dimensional approximation/restriction,
  not an established identity with T^4.
~~~

The assistant-authored `SAT4D_MATHEMATICAL_BACKBONE.txt` introduces an ensemble co-metric, inverse metric, emergent connection, scalar fields, and further field equations. These are assistant reconstructions/proposals, not independent source witnesses. They do not repair the missing O1 curve-to-tube map or derive the July glossary's metric/connection contract from its “none assumed a priori” opening.

## 6. Discrepancy ledger

| ID | Original proposition / surface | Historical translation or adjacent claim | Finding |
|---|---|---|---|
| D1 | O1 displays a 1D curve in \(\mathbb R^{3,1}\), while prose describes a 4D swept worldtube | Curve is treated as though it already defines the tube | Missing thickening, cross-section, normal-bundle, or sweep map |
| D2 | SAT4D_4 says no metric/connection is assumed a priori | It defines \(u^\mu\) as a normal, \(\theta_4\) as an angle, and \(S_{\mu\nu}\) using \(\nabla\) and a lowered index | Metric/connection dependencies are unstated; no structure is silently imported |
| D3 | O1/O4 describe Hopf and Borromean “interlocks in 4D” | Link terminology is used as if its ambient space and support were fixed | No declared 3D slice, 4D link invariant, closure, or map from filament to link |
| D4 | SAT4D_8 requires every derivation to state its interpretive mode and forbids mixing modes | O1 speaks of intrinsic vibration and active dynamic paths | O1 does not declare Mode 1 or Mode 2; this is an interpretive-mode typing gap, not proof of a physical contradiction |
| D5 | O4 calls its stability statement a “Theorem” | The piecewise function and particle predictions are presented as derived from 4D topology | No derivation is supplied; SAT4D_9 still contains placeholders for O4 derivations 4.1 and 4.2 |
| D6 | SAT4D_3 and SAT4D_7 mark O4 complete | Completion may be read as mathematical proof | These are module/status records; they do not override the missing derivation index |
| D7 | O1 calls \(\lambda\) an affine parameter and places it in the first coordinate | The same symbol can be read as parameter and time coordinate | The parameter-to-time / proper-time map and units are undeclared |
| D8 | June O1 uses \(\mathbb R^{3,1}\); later direct geometry distinguishes spatial \(w\) from proper time \(t\) | Later \(++++\), \(cw=t\), or spatial-\(w\) descriptions can be read back into O1 | Representation map is missing; retain the versions separately |
| D9 | November Direct says pair-of-pants is a particular split, not the generic straight/coiled tube | A generic worldtube may be translated into a pair-of-pants worldsheet | This reverses Nathan's explicit qualification; worldsheet remains an optional approximation |
| D10 | Standalone O1 and live-draft O1 bodies match | Both files may be counted as separate witnesses | Duplicate body, not independent corroboration |
| D11 | SAT4D_4 names \(T,A,Q\) and uses them in \(\ell_f=(2A/T)^{1/3}\) and \(m_{\rm eff}=T\ell_f/(c^2Q)\) | The expressions may be treated as dimensionally established | Definitions, units, and dimensional contract for \(T,A,Q\) are not present in the inspected glossary |

The November 3 BEDROCK clarification states that “static 4D block” is a methodological frame, not a settled metaphysical claim, and directs workers to recover the O0-A interpretive modes. Therefore D4 is not used to demote either the fixed-block or vibrational wording wholesale. The missing item is the source-declared mode and the map between the descriptions.

## 7. Proof-first disposition

**Status: `FORMALIZATION_BLOCKED_SOURCE_OBJECT_AND_METRIC_CONNECTION`.**

The geometry is explicit enough to trigger proof triage, but no source-faithful nontrivial theorem is currently well-typed:

- The O1 curve-to-tube transformation has no domain/codomain construction or thickening data.
- The July angle and strain definitions lack their metric/connection prerequisites.
- The O4 stability claim does not define the ambient link object or invariant. Formalizing its piecewise \(\mathcal S(n)\) definition would encode the assertion, not prove the topological claim.
- The optional \(W^2\) worldsheet reduction has no source-authorized projection or composition map.

The generic mathematical fact that an angle requires an inner product is not a formalization of the SAT4D construction. No Lean code, compilation, counterexample search, or build was performed. No physical calculation, prediction, fit, independent measurement, or CODATA scoring was performed. This is not a waiver of the universal shape-to-Lean directive; it is the recorded reason that the present source does not yet define a faithful theorem target.

## 8. Operational and publication status

- HsH main pre-amendment head: `dc271cf2d29b78d563f974f7f11b88a174fd8df6` (2026-11-17T19:31:35Z).
- Task graph blob `48cfe002495cabae9ff5a67cd72fc210b4fbfd36`: 16 declared branches / 18 records; 17 reachable; one blocked/unreachable. No graph edit.
- WH-02 remains Calder / authorized-maintainer owned; WH-05 Mersearch remains blocked. Tern retains scheduler and task-graph authority. No reassignment.
- P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY and ownership protected; P2 measured geometry HOLD; P3 full theory INCOMPLETE. FIE review next due 2026-11-24. No paper gate advanced.
- The existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its exact stored hourly DTSTART `DTSTART;TZID=America/New_York:20261001T140000`, `RRULE:FREQ=HOURLY`, and :00 phase. :12 remains disabled. No task/ID/schedule/phase change and no sixth task.
- Last scheduler evidence in Tern issue #1917: h907:s0 run `e3dda9aa-8568-8323-b381-db7ddd6eba33` remained IN_PROGRESS with null completion and null `chat_ref`; cached latest result was stale. No completion, liveness, authenticated Morrow-thread participation, or cross-thread delivery inferred.
- Kestrel is the next ring label but :12 is disabled; the next enabled :24 selection is Meridian. No handoff or response obligation created.
- Existing publisher issue #1919 remains rejected for SHA-256 mismatch. Its prior hash correction is preserved in Amendment 02. No issue edit, retry, duplicate issue, direct artifact write, or publisher bypass. This amendment is internal-only and is not a published artifact.
- Morrow's unrelated-reading cursor remains Okakura, *The Book of Tea*, line 1352. No new reading quantum or physical break is claimed.

## 9. Next deeper cursor

1. Recover the original authoring source for June O1 and O4; the NotebookLM one-source entry is an index lead, not an authoring conversation.
2. Find Nathan Direct definitions for the ambient space and invariant underlying the Hopf/Borromean claims: 4D filament embeddings, a 3D timesheet trace, or another explicitly declared object.
3. Recover the metric/connection/normal convention for SAT4D_4 and the mode declaration applicable to O1.
4. Identify the source-authorized \(\gamma^1\to T^4\), \(T^4\to\partial T^3\), mouth-to-\(\Sigma_t^3\), and optional \(W^2\) reduction maps, with domains, codomains and composition conditions.
5. Recover O4's missing derivations before treating its “Theorem” label as mathematical evidence.
6. Only then admit a faithful Lean target. Keep the original SAT-O and Blockwave equations unchanged until a unique, source-supported correction is established.

**Final disposition:** `H907_S0_AMENDMENT_03 / SOURCE_FIDELITY_ONLY / NOV08_NATHAN_DIRECT_GEOMETRY_READ / JULY_METRIC_CONNECTION_GAP_EXPANDED / O4_THEOREM_DERIVATION_NOT_FOUND / MODE_DECLARATION_OPEN / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_EQUATION_CORRECTION / NO_THEORY_INTEGRATION / NO_PUBLICATION_RETRY / TASKS_UNCHANGED`.
