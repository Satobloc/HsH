# SATity Blind Survey — WIDE Patient Chunk

**Patient:** broader respectable / pop / casual physics culture  
**Status:** provisional blind first pass; bounded science-news sample only  
**Firewall:** no EXP_ANALYSIS, SAT_IMPACT paradigm analysis, scored feature/prevalence output, or prior SAT-to-mainstream comparison used.

## Primary source route

This run used the repository's own extraction manifest and followed each `source_path` to its `derived/text/<sha256>.txt` full-text extraction, per `HSH_RESOURCES/indexes/AI_START_HERE.md`. This removes the earlier PDF-binary access problem and allows claim-level reading of archived sources.

## Bounded source sample read at claim level

1. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/A new hypothesis could connect two of physics’ greatest mysteries_ dark energy and quantum gravity.pdf`
   - extracted text: `derived/text/90316b0cfebb35db92065020670ed6603b904c3d87d3dba5b6bc2b217d1919ac.txt`
   - minimum evidence: explicitly labels the proposal a hypothesis; links dark energy to quantum gravity acting on spacetime geometry; foregrounds the microscopic/cosmological scale gap rather than hiding it.

2. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/A simple discovery is shaking the foundations of spintronics _ ScienceDaily.pdf`
   - extracted text: `derived/text/5029c5a37bbbbd19b57d24f1228ff306a7ea6e632a8e60c2f7d13dff5fe93873.txt`
   - minimum evidence: dominant SMR interpretation fails in systems where its required mechanism is absent; a simpler two-vector interface-scattering account predicts large single-layer signals, higher-order contributions, and a universal sum rule; prior data are re-read under the new framework.

3. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/Caltech startup unveils physics AI that skips transformers_ No benchmark proof yet.pdf`
   - extracted text: `derived/text/8a2629b53fa64320be96d33246ee317d3e3bb315404a9b0189b670dabc6608ef.txt`
   - minimum evidence: the story explicitly separates architectural claims from benchmark validation; describes a continuous 3+1D field representation rather than token sequences while warning that the headline scale claim is not directly comparable to LLM context windows.

4. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/Chemical physicists quantitatively model electron interactions in real quantum materials.pdf`
   - extracted text: `derived/text/c67b1ea2074323cacb208fb9e9ec58225631741765fa3c02129676b1bc07f2d4.txt`
   - minimum evidence: decades-old simplified qualitative models are replaced by material-specific first-principles treatment; Kondo behavior is used as a benchmark problem; predictions are compared with prior model calculations and intended as a step toward harder correlated-material systems.

5. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/NEWS - Taking dark energy out of the equation…pdf`
   - extracted text: `derived/text/de5ac4dc666eaee37e6191de0a6ecf64021192d9cac85f25cc561a0f12ad7557.txt`
   - minimum evidence: preserves Einstein–Euler machinery while challenging ΛCDM interpretation; argues that instability of Friedmann solutions may yield acceleration without inserting dark energy; explicitly presents a simpler explanation inside Einstein's theory.

6. `OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS/Scientists observe Einstein's gravity in the quantum world.pdf`
   - extracted text: `derived/text/924650a1dde01eaef70e532fb193336a7ed44102c62911f20fd761ea4981b7a1.txt`
   - minimum evidence: calls GR and QM two extraordinarily successful descriptions; states that their relation remains unresolved; reports an experiment testing equivalence-principle behavior on a quantum object rather than treating either framework as disposable.

## WIDE provisional judgments added

### PASS / PRESENT

- `B002 PASS` — same observed phenomena are explicitly reinterpreted under alternative explanatory structures while preserving the observational target. Strongest evidence: UMR under two-vector MR; cosmic acceleration under Einstein–Euler alternative.
- `B006 PASS` — the source culture positively selects simpler accounts when they explain the same or broader evidence with fewer auxiliary mechanisms. Strongest evidence: two-vector MR replaces a growing list of mechanism-specific explanations; Einstein–Euler article explicitly argues for a simpler account than added dark energy.
- `AF002 PASS` — GR is treated as a successful baseline unless evidence forces revision. Strongest evidence: quantum-gravity/equivalence story and Einstein–Euler cosmology both retain Einstein gravity as the reference framework.
- `AF003 PASS` — QM is treated as a successful baseline unless forced otherwise. Strongest evidence: quantum-gravity/equivalence story explicitly calls QM extraordinarily successful and tests its interface with gravity rather than discarding it.
- `AH010 PASS` — ambiguity is preserved when sources do not settle the issue. Strongest evidence: "hypothesis" language for dark-energy/QG linkage, explicit unresolved GR/QM fit, and "No benchmark proof yet" in the physics-AI story.
- `AH011 PASS` — explanatory simplicity is positively valued but only against broader empirical coverage. Strongest evidence: spintronics and dark-energy stories both foreground simpler explanations while discussing concrete constraints.
- `AM019 PASS` — the sampled respectable/pop science culture treats successful mainstream frameworks primarily as constraints/baselines to extend, reinterpret, or connect, not enemies to reject wholesale.

### FAIL / ABSENT on negative-fingerprint items

- `AN018 FAIL` — this WIDE sample does **not** reject mainstream physics wholesale. It repeatedly calls established frameworks successful and builds alternatives from or against their constrained limits.
- `AN020 FAIL` — this WIDE sample does **not** collapse modeled, inferred, speculative, and established status into one category. The sources distinguish hypothesis, dominant theory, alternative model, experiment, prediction, benchmark, and unresolved question.

### Explicit SKIP after review

`B001 B003 B004 B005 B007 B008 B009 B013 B014 B015 AF001 AF004 AF009 AH005 AH009 AE006 AE015 AN010 AN012`

Reason: some are plausible or locally illustrated, but the bounded WIDE sample does not provide clear enough patient-level evidence for the exact checklist wording. In particular, geometric language alone is not enough to score SAT's specific cartographic/worldline predicates.

## Interpretation constraint

The WIDE patient is more rhetorically permissive than CORE: headlines emphasize overturning assumptions, mysteries, bizarre effects, and simpler universal explanations. But in this bounded respectable sample the underlying articles still preserve status distinctions and mainstream constraints. That makes WIDE structurally somewhat more receptive to SAT-like explanatory motifs than CORE without making it methodologically equivalent to the non-accepted fringe.

## Next unreviewed chunk

Use the extraction manifest to open claim-level heterodox primary texts in `EXPOSURE_STATS/MISC_PAPERS` and begin the FRINGE score vector. The extraction-layer route should now bypass the prior binary-PDF blocker.