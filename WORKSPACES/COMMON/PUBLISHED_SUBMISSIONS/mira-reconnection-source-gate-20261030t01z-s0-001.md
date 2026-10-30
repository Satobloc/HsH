# Mira :00 | Reconnection phase information and simulation/experiment provenance | 2026-10-30T01:00Z

**Status:** Original-source fidelity and bibliography audit; new source-conditional Lean file COMMITTED, exact-head compilation PENDING. No CODATA scoring, physical prediction, fabricated data, BEDROCK promotion, authenticated Mira chat access or cross-thread delivery.

## Primary sources and source classes

1. Nathan's actual user-role March 22, 2024 original: HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22...DIMENSIONAL GRAVITY - raw.json`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, parsed 466 nodes and read first 24 user-role turns with neighboring assistant messages. User IDs `aaa211f1-462b-4426-b163-0bb0fe0df40f`, `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`, `aaa2a868-90fa-439f-9d9d-4cf95519ab91`: moving plane produces apparent contact; later the 3D-curve/2D-film grammar is lifted to 4D carriers/3D time sections. Contact of observed points is not a force law. Mercer #917 already analyzed the crossing/bounce ambiguity; no novelty claim.
2. Later NATHAN/CLAUDE-labeled historical source: SAT archive `HsH AHA TOPOLOGY.txt`, blob `5283ceb8d06109061543711ebe7c46954efe7ede`, lines 237-273. Nathan-labeled question asks whether coincident vibrations at a particular rotational phase can trigger cutting/gluing; assistant treats bare crossing as sufficient for vortex reconnection and worldsheet genus increase. The later labels/date are NOT independently authenticated native ChatGPT roles.
3. SAT O19 `EARLY LOGGED/SATO-scattering.txt`, blob `535beb77594982ad0020d841c79810135d18401c`, full 3,375 chars read. `S_{alpha->beta}=Amplitude(Initial Topology alpha -> Final Topology beta)` defines a name, not an actual computed scattering matrix.
4. SAT O action plan `SAT O Derivations/ACTION PLAN.txt`, blob `06d9a5142ba4521de970d81bde3564fa31ad0d40`, full 3,860 chars read. Verbatim normalized mathematical content: `A_{Gamma_out,Gamma_in}=sum_pi exp[-sum_e(T*l_f^2*DeltaC(e)+alpha_top(x_e))]`. The original is retained unchanged; the conditional audit below is separate.
5. **Actual external paper (numerical simulation):** Koplik and Levine, *Vortex reconnection in superfluid helium*, *Phys Rev Lett* 71, 1375 (30 Aug 1993), DOI 10.1103/PhysRevLett.71.1375. Publisher abstract explicitly states nonlinear-Schrodinger **numerical simulation** and reconnection when filaments approach within a few core lengths. It is NOT a direct measurement.
6. **Actual experiment:** Bewley, Paoletti, Sreenivasan and Lathrop, *Characterization of reconnecting vortices in superfluid helium*, *PNAS* 105, 13707 (2008), DOI 10.1073/pnas.0806002105. This study reports first **tracer-inferred experimental observations** of reconnection in superfluid helium, using solid-hydrogen particle motions and a post-event separation exponent near 1/2. It does not directly image the atomic-scale core surgery. Neither checked primary paper establishes a universal reconnection rate law in crossing angle and relative speed.

## Typed mapping and proposition comparison

`C_i` = 2024 3D curves; `P_z` = 2D film; `W_i` = 4D finite-core carriers; `Sigma_t` = 3D timesheet; `I` = geometric near-contact; `phi_i` = vibrational phase; `G` = candidate phase/energy gate; `K` = actual reconnection pairing/surgery; `b0` = section component count; `g` = surface genus; `L` = linking number; `O` = optical tracer observation. All have distinct types.

```text
2024 curves C_i -> intersect film P_z -> observed point contact
                       | 4D lift/projection NOT GIVEN
finite-core W_i -> intersect Sigma_t -> apparent particles
       | near-core I + possible phase gate G(phi) + dynamics K
       v
topology change -> section count b0 / genus g / linking L (DISTINCT)
       |
       +-- tentative correspondence, NOT identity --> GP vortex cores
                                    | numerical 1993 / optical 2008
```

Nathan-labeled 2026 **proposal**: crossing plus possible phase alignment triggers reconnection. Assistant **translation**: bare crossing automatically reconnects and raises genus. That is not established by the cited sources. Ravel's Oct 28 source audit had already flagged crossing/genus and Euler connected-sum defects; this run adds a specific bibliographic correction and tests the historical SAT O weight's ability to carry phase information.

**Conditional mathematical finding:** If the SAT O path set is finite and each path cost in the displayed formula is real, each exponential is positive, hence the sum is nonnegative. If two candidate phase states produce identical allowed paths and identical real costs, the sum cannot distinguish their phases. The inspected formula contains no explicit complex phase factor or defined map from `phi` into `DeltaC` or `alpha_top`. It cannot independently implement Nathan's phase-selective hypothesis under these stated assumptions. This does not exclude a later corrected amplitude with phase-dependent costs or interference, and is NOT a physical falsification.

## Formalization, ledger, next cursor

Three Lean 4/Mathlib theorems were actually committed to existing Mira draft PR #885, `FORMAL_VERIFICATION/HsHVerification/MiraReconnectionWeightGate.lean`, with root import at commit `1a840109f080fcbd6ee43e631bd8d2691791e316`. Exact-head CI #40983509297 **PENDING** at last check. File presence is not compilation; proof would only establish formalized real-exponential facts, not source fidelity or physical truth.

Discrepancy ledger: (1) 1993 simulation misrepresented as experimental measurement, VERIFIED; (2) near-core approach upgraded to unconditional crossing sufficiency, OVERREACH; (3) worldline/worldsheet/genus conflation, KNOWN RAVEL; (4) rotational phase gate only a Nathan-labeled question, SOURCE-AUTHENTICATION OPEN; (5) historical positive-real path weights lack explicit phase discrimination, CONDITIONAL; (6) O19 S-matrix is uncomputed, OPEN; (7) 2008 observations are tracer-inferred, VERIFIED; (8) 3D-film -> 4D-finite-core -> interaction map, OPEN; (9) measured angle/velocity rate-law attribution, UNVERIFIED; (10) exact-head Lean compilation, PENDING.

**Next:** check CI and theorem-specific axioms; recover original native-role 2026 message and the dated original phase resonance equation; retrieve measured vortex-reconnection dataset and uncertainties before any physical calculation; write explicit contact, phase, pairing, and projection maps; keep Nov 9 P1, Nov 30 P2, Dec 14 P3 manuscript gates independent. Mersearch request lanes were occupied; bounded GitHub code search across all three roots was fallback, NOT a completed three-root Mersearch run. No new tool built, scheduler changed, sixth task created, or historical chat notified.
