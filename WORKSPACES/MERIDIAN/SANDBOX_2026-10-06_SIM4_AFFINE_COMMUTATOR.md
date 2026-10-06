# SANDBOX — Meridian Run 8 — Sim(4) affine commutator / translation obstruction

**Date:** 2026-10-06  
**Status:** SILOED PLAYGROUND / not canonical theory  
**Role:** Meridian  
**Central question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Sources actually read

### Historical SAT archive
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H 2026 STARTUP DOCS.txt`, lines 1–900.
- Recovered construction: worldline→worldtube transition; UI `Y=rRx0`; normal/frame transport; requirement that the worldtube reduce to the worldline baseline in an appropriate limit.

### Current HsH
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, lines 1–900.
- Recovered current machinery: typed solver ecology; Hagalaz candidate similarity-transform layer; Three-Spheres, frame-history/ordered SO(4), metric-induction and hyperhelix interfaces.

### Mersearch
- Consumed completed request `indexes/mersearch_requests/2026-10-06-meridian-transport-history-holonomy-001/RUN_MANIFEST.json`, produced by `Mercer_Searcher_1.0`, with PRIOR_ART/QUARANTINE excluded.
- Bounded follow-up inspection recovered archive hits including `H(s)H 2026 STARTUP DOCS.txt`, `SAT-TO-STANDARD 2.txt`, and `[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt` for transport/holonomy/SO(4) vocabulary. These were used only after the independent construction existed.

### HSH_RESOURCES familiarization
Reviewed current Reference Desk routing plus `indexes/ai_source_index/HSH_TOOLKIT.md`, `HQ/TOOL_CHEST.md`, `info/TOOLKIT_DIGESTION.md`, `info/NATHAN_PREFERENCES/BOOT.md`, and the opening/current directive portion of `HQ/THE_WAR_ROOM/DECLARATION.txt`; inspected the BigBook content/document indexes. No external formalism was promoted into theory authority.

## Independent construction

Represent a candidate Hagalaz similarity as an orientation-preserving 4D similarity

[
g=(t,a,Q),qquad x\mapsto e^aQx+t,
]

with local log-scale `a`, rotation `Q∈SO(4)`, and translation `t∈R^4`.

Earlier sandbox runs isolated scale-loop and ordered-SO(4) residues. The remaining affine channel is not independent of scale/rotation because Sim(4) is nonabelian.

For dilation `D(a)` and translation `T(v)`:

[
D(a)T(v)D(-a)T(-v)=T((e^a-1)v).
]

For rotation `R(Q)` and translation:

[
R(Q)T(v)R(Q)^{-1}T(-v)=T((Q-I)v).
]

These are exact identities, not small-angle approximations.

Numerical fixture:
- `a=0.35`, `v=(0.7,-0.2,0.4,0.1)`
- computed D/T closure translation exactly matched `(e^a-1)v` to floating zero.
- rotation/translation fixture with `theta=0.6` matched `(Q-I)v` with error `1.00e-16`.
- when both dilation and translation amplitudes scale as epsilon, the closure defect scales as `epsilon^2.0027396`, i.e. the expected bilinear second-order commutator behavior.

## Consequence

A full candidate Hagalaz transform cannot safely report independent scalar `scale + rotation + translation` residues and then combine them additively. Translation is acted on by both scale and rotation. The natural algebraic object is the composed similarity itself, with typed projections/readouts taken afterward.

Candidate grammar:

[
\text{HAG edge}= (t,a,Q),qquad
(t_2,a_2,Q_2)\circ(t_1,a_1,Q_1)
=
(t_2+e^{a_2}Q_2t_1, a_2+a_1, Q_2Q_1).
]

Thus:
- log-scale sector is additive;
- rotation sector is multiplicative/path ordered;
- translation sector is semidirectly transported by both.

This supplies the missing affine obstruction channel suggested by the previous scale/rotation work.

## Important gauge warning

Raw translation residue is origin-dependent. Conjugating a pure linear holonomy by an origin shift leaves its linear block unchanged but can induce a translation column. Numerical test: linear-block difference exactly 0 while a nonzero translation appeared.

Therefore do **not** call a raw translation column a gauge-safe invariant.

Candidate readout order:
1. compose the full Sim(4) loop;
2. inspect scale residue;
3. inspect SO(4) conjugacy data;
4. classify the affine translation only relative to the fixed subspace / image of `I-e^aQ`, or after an explicit origin convention.

That quotient/classification is the next mathematical job.

## Failure conditions

- Any implementation that simply adds translation vectors without applying preceding scale/rotation is wrong for general Hagalaz composition.
- Pure translation residue is not origin-gauge-safe.
- Commuting/identity controls must collapse exactly.
- Subdivision of a fixed continuous transform history must converge to the same composed similarity.
- No physical meaning is assigned to the affine residue until the gauge/origin issue is solved.

## Next solver test

Build a blinded Sim(4) cycle fixture with:
1. pure scale;
2. pure SO(4);
3. pure translation;
4. dilation↔translation commutator;
5. rotation↔translation commutator;
6. combined noncommuting scale+rotation+translation.

Require exact composition, inverse/reversal, subdivision convergence, and invariance of the properly quotiented affine classification under arbitrary origin shifts.

## Visual

Class-P plot generated in the task runtime:
`meridian_run8_sim4_affine_commutator.png`.

— Meridian
