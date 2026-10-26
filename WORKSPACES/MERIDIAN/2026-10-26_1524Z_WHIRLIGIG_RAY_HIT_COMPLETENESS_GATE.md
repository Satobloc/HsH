# Meridian | Whirligig ray/torus intersection completeness gate | 2026-10-26 15:24Z

**Status:** SOURCE-VERIFIED SOFTWARE CORRECTNESS LIMITATION; **not** an observed numerical failure of the current presets, a physical calculation, or an H(s)H result. Source-grounded continuation of the solver Meridian workspace, **not** authenticated participation by an original ChatGPT worker.

## Exact source and controlling representation

- Current browser: `PUBLIC_SITE/instruments/whirligig/index.html`, Git blob `7491cbde27657a23f0bd9e99c77e78910be40f02`, function `rayHit` near line 221.
- Current Analemma browser contract: `PUBLIC_SITE/instruments/whirligig/ANALEMMA_CORRECTION_2026-10-21.md`, blob `ac8b47e753911b3ed11df6d37a0d62a1cbec414e`. This **supersedes** the historical GrAnn terminology and older outer-wall contact specification.
- Existing independent Python ray/torus solver: `tools/whirligig_rq/whirligig.py`, blob `151259096e3ac8e5986ac8f61c6bd76ce199901d`, `ray_first_torus_hit` near lines 312–335. Its **outer-wall** rolling branch is NOT equivalent to the current inner-wall browser apparatus.
- Historical primary sources actually fetched: SAT archive `WHIRLIGIG -- REDEFINING SUCCESS.txt` blob `fa7d8d419eb1e7c1b356816d73eec5453915ae10` (opening original question and response read; 263,740 characters fetched); `HsH-SAT Roundup 3/THE_WHIRLIGIG.txt` blob `e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057` (opening mathematical construction read); `_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt` blob `a788b5cc415f90de2d0382d3596ef07d68604687` (opening and Whirligig references inspected). SAT-O `SAT O Core Modules/SAT.O Official Directives.txt` blob `167136310cdf33ca8f986f33634692314c1a0946` first 120 lines read; HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATO-BLOCKWAVE_leancheck.txt` blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc` inspected; contains `sorry` and unproved declarations, not a Lean success.
- BEDROCK `4cabda482c48b... ` fetched in full; controlling real-data and nonpromotion rules consulted. Steering `d086da524760b722090fb8209dc798c94f65f5eb`, campaign `bad9627ce11f7fffcb82fbd48eb03a6bb651d0a9`, onboarding `004e3302226e0c140ec206b396cf1d7828aaa0b2`, rotation `90863a2a2b82b2d8e37ba1bd9f796389066f5409`, task graph `80e267cdd7dd3a4c61044357cd346ff49c805e23` fetched.
- Selected solver identity: `WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md` blob `921a2dee3b1405ff89681f36fa866a947b2a8cc9` and `MERIDIAN_CONTINUITY_2026-10-21_CRULLER_NLM_ROTATION.md` blob `c757a7a78d59bdd4945d3357747fb09d267b5a93`. Distinct `CONSULTANTS/MERIDIAN/INSTANCE_SPEC.md` names Alden Cross, a separate provenance consultant; do **not** silently merge the two identities.

## Finding: sign-bracketing does not guarantee first positive ray/torus root

The **browser** implementation fixes `steps=100`, samples the continuous torus implicit function along a ray, and enters bisection only when the endpoint signs differ:
```js
if((lastf<0&&f>=0)||(lastf>0&&f<=0)){ /* bisect */ }
```
It returns `null` when no sign-changing interval is found. This establishes a **completeness limitation**: an even-multiplicity tangency may touch the torus without changing sign; an interval containing two crossings can also have matching endpoint signs. Therefore the code cannot in general guarantee either detection of every forward hit or selection of the first positive hit. This is a source-level mathematical/algorithmic conclusion, **not** an observed failure of any current displayed R/Q preset.

The **existing Python** solver constructs the actual torus quartic coefficients and calls `np.roots(poly)`, filtering and sorting forward real roots. It is a reusable source of root-selection logic, but its `start_outside` rejection and old outer-wall rolling geometry must be reviewed before adapting it to the browser. Do not replace the entire current Analemma mechanism with the legacy solver.

## Actually executed static source checks

A JavaScript audit ran against the **fetched current GitHub file contents**:
1. `rayHit` function found.
2. Fixed 100-interval sampling present.
3. Both sign-change-only conditions present.
4. No tangency/derivative/discriminant branch in `rayHit`.
5. No actual polynomial root-solver invocation in `rayHit`.
6. `return null` fallback present.
7. Python `np.roots(poly)` present.
8. Python positive-root sorting present.
9. Python solver belongs to legacy outer-wall branch.
10. Current spec identifies spherical Analemma and live Sites deployment as unverified.
11. Browser reports only total hit count, not root completeness or tangency coverage.

**Final source-check result: 11/11 PASS.** Initial lexical check falsely flagged a comment containing the word `quartic` as if it were a root-solver call (10/11); a corrected check tested actual solver invocation and passed. This is an audit of implementation features, **not** numerical execution of the browser, a tangency reproduction, or a real-browser test. No data-free physical or geometric calculation was run; BEDROCK requires specific prior permission for such a calculation without measured physical inputs.

## Existing capabilities / next exact action

**REUSE FIRST:** the standalone Python quartic root-selection routine and existing Whirligig test infrastructure. For a code owner with an authorized test plan, adapt only the polynomial-root identification into the **current** browser geometry; preserve inner-wall Analemma, R/Q controls, elbow locking and diagnostic outputs. Independently test tangencies, multiple positive roots, first-root ordering, null-hit behavior, and browser performance **under applicable real-data or explicitly authorized geometry test conditions**. Do not report the fix as done until actual code and tests execute.

No source file was modified. No new tool, theory coefficient, physical dataset, CODATA result, Lean proof, manuscript, issue publication, or website deployment is claimed.

## Search and publication limits

All four Mersearch request lanes were inspected and occupied by existing Oct 25–26 requests (Indicatrix, optics, chemistry, superconductors). None was overwritten. Historical source discovery therefore used bounded GitHub search and exact primary-file fetches, **not Mersearch execution or complete three-repository coverage**. This note is public-safe, source-only. No protected signet, private repository source, or Nathan-only material reproduced.

**Gate:** `STATIC_SOURCE_AUDIT_PASS / ROOT_COMPLETENESS_UNPROVEN / EXISTING_QUARTIC_REUSE_FOUND / NUMERIC_TEST_NOT_EXECUTED / CURRENT_BROWSER_DEPLOYMENT_UNVERIFIED / NO_BEDROCK_PROMOTION`.
