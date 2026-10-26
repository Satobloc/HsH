# Mercer | Whirligig solver namespace/admission gate

**Nominal date:** 2026-10-26T15Z  
**Status:** SOURCE_AUDIT_PASS / REUSE_CONTRACT_PROPOSED / NO_CODE_MERGE / NO_PHYSICS_CLAIM. This is relay-represented Mercer work, not authenticated participation by a historical Mercer thread.

## Result

The existing quartic ray–torus **root kernel** may be adapted to the current browser, but the existing Python Whirligig cannot be treated as an equivalent implementation. The current browser is the corrected **inner-wall Analemma** branch; `whirligig.py` is explicitly the older **outer-wall GrAnn** branch. Reuse must stop at the implicit-surface/root-selection boundary.

The present browser `rayHit` samples 100 fixed intervals and bisects only a strict sign-changing bracket. It therefore has no completeness guarantee for an even-multiplicity tangency and can miss two crossings inside one sample interval. This is a source-level limitation, not evidence that any current preset actually fails.

## Provenance and exact source readback

- Browser: `PUBLIC_SITE/instruments/whirligig/index.html`, Git blob `7491cbde27657a23f0bd9e99c77e78910be40f02`, read lines 190–260. Its `rayHit` is the 100-step sign-bracket routine. The surrounding `sample` selects the inner wall and reports positive same-direction rolling spin.
- Current browser contract: `PUBLIC_SITE/instruments/whirligig/ANALEMMA_CORRECTION_2026-10-21.md`, dated 2026-10-21, blob `ac8b47e753911b3ed11df6d37a0d62a1cbec414e`, read completely (source response through its Implementation section). It specifies the inner radial contact, spherical Analemma, true arc-length lock, and unresolved branch-continuation audit.
- Standalone solver: `tools/whirligig_rq/whirligig.py`, blob `151259096e3ac8e5986ac8f61c6bd76ce199901d`, read lines 290–355. `ray_first_torus_hit` forms the torus quartic with `numpy.roots`, filters forward real roots, and chooses the smallest. Its adjacent `frame_and_roll` docstring and equations specify the old outer-wall branch.
- Standalone README: `tools/whirligig_rq/README.md`, blob `c969cb221058656b6b835b50b22beed1af3e9621`, read lines 1–180. It explicitly says the old Python solver is not implementation evidence for the latest HTML.
- Tests: `tools/whirligig_rq/test_whirligig.py`, blob `505355e85d55d51756b33c799cca367265114f80`, read completely (154 lines). The test module does not import or directly unit-test `ray_first_torus_hit`.
- Historical intermediate contract: `tools/whirligig_rq/GRANN_INNER_WALL_ROTATIONAL_LOCK_2026-10-21.md`, blob `76f6f2f92abae56adfa915adf34f11472c426bfa`, read completely. It is itself marked superseded by the Analemma correction and is retained only for provenance.

## Verbatim old SAT.O/Blockwave mathematics

Mersearch-first navigation remains the completed shared request `2026-10-21-orson-nlm-big-haul-math-001` (manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`). No occupied search lane was overwritten. The current receipt-only containment is issue #597; no new search was started while all lanes remain governed by that safety gate.

Direct archive source then read: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATO-BLOCKWAVE_leancheck.txt`, blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, lines 1–120. Preserved verbatim:

```lean
def L_density (rho v Phi) : ℝ :=
  (1/2) * rho * (v.norm_sq)
  - rho * (W Phi)
  - (kappa/2) * (grad Phi).norm_sq
  + lambda * rho * Phi * (div v)
```

```lean
theorem EL_v_Canonical_Momentum :
  (v = grad chi + (lambda / rho) * (grad (rho * Phi))) :=
sorry --
```

These lines are historical source, not compiled Lean and not established physics. The file declares undefined placeholder typeclasses/operators and closes theorems with `sorry`; the definite correction is only to downstream status language: it may be called Lean-shaped archival pseudocode, **not a machine-checked proof**. No source equation is silently rewritten here.

## Namespace/admission contract

| Layer | Reuse status | Required gate |
|---|---|---|
| Torus implicit polynomial | Candidate reusable | Same coordinate frame, `major>minor>0`, coefficient normalization documented |
| Forward real-root enumeration | Candidate reusable | Scale-aware imaginary tolerance plus polynomial residual at each retained root |
| First-positive-root selection | Candidate reusable | Explicit near-zero policy; preserve all positive-root diagnostics before selecting minimum |
| Browser root continuity | Not supplied by Python | Track root identity under parameter continuation and adaptively refine near close/coalescing roots |
| Inner/outer contact choice | Branch-specific; do not reuse | Current browser must remain inner-wall Analemma |
| Rolling sign/orientation | Branch-specific; do not reuse | Enforce current `+R/b` axial sign and current frame contract |
| Material track and closure | Branch-specific; do not reuse | Analemma arclength/minimum-even return only |
| Gimbal/elbow policy | Branch-specific; do not reuse | Preserve current LCM lock and one perpendicular elbow |

## Static audit assertions actually executed

Nine source assertions passed by direct readback:

1. Browser `rayHit` has `steps=100`.
2. Browser acceptance requires a sign-changing bracket.
3. Browser then uses 35 bisection steps.
4. Browser returns the first detected forward bracket.
5. Python constructs a degree-four torus polynomial.
6. Python calls `np.roots` and sorts positive approximately-real roots.
7. Python returns the smallest retained positive root.
8. Python wrapper rejects starts classified outside the torus implicit surface.
9. Current test module neither imports nor directly names `ray_first_torus_hit`.

No numerical geometry fixture was invented and no physical calculation was run. The current source does not justify declaring a demonstrated browser failure, a repaired solver, Sites deployment, or a physical prediction.

## Exact next experiment

Before any interface unification, add a pure, branch-neutral quartic function with tests for: two forward crossings within one former browser bin; a double-root tangency; near-real conjugate roots; origin on surface; non-unit direction; and residual-based rejection. Then compare the root set—not only the chosen hit—against an independent high-precision polynomial solver. Only after those software tests pass should the current Analemma browser adopt the kernel.

## Handoff to Ravel

Review this admission contract adversarially. In particular, decide whether the Python `start_outside` rejection belongs in a neutral kernel or only in a caller policy; specify a scale-aware residual/tolerance contract; and demand a browser-portable solver dependency audit before implementation. Preserve the inner/outer, Analemma/GrAnn, and solver/mechanics namespaces.
