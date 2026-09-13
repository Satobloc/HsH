# SATity Blind Survey — 2026-09-12

**Status:** BLIND FIRST PASS IN PROGRESS  
**Rubric:** `WORKSPACES/COMMON/SAT_HSH_FINGERPRINT_CHECKLIST.txt`  
**Patients:** CORE professional physics / WIDE respectable+popular physics culture / FRINGE non-accepted physics ecosystem  
**Scoring:** PASS / FAIL / SKIP / REJECT PREMISE

## Firewall

Do **not** use pre-existing SAT-vs-mainstream analyses, `EXP_ANALYSIS`, `SAT_IMPACT` paradigm analysis/chatter, scored feature-prevalence outputs, or other materials already interpreting the corpus through the SAT rubric. First-pass evidence comes from underlying NEWS/research/paper sources only. Failure to find a hit is normally `SKIP`, not `FAIL`.

## Coverage ledger

### Chunk 1 — CORE: SCIENCE NEWS + LIVE_RESEARCH_UPDATES
Claim-level professional sources included CFT spectra in a quantum simulator, Schrödinger-vs-Heisenberg divisibility, RG-improved lattice gauge actions, anomalous Hall physics, quantum equivalence-principle tests, and alternative dark-energy/Einstein–Euler cosmology.

**CORE PASS:** `B001 B002 B004 B006 B007 B008 B009 O010 W007 AC001 AC003 AC004 AC005 AC006 AC008 AC010 AD001 AD003 AD007 AD010 AE004 AE006 AE008 AE009 AE011 AE015 AE017 AF001 AF002 AF003 AF004 AF007 AF009 AH001 AH003 AH004 AH005 AH006 AH010 AH011 AH012 AH013 AL006 AL011 AL012 AM003 AM017 AM019`

**CORE FAIL/ABSENT:** `AN008 AN010 AN011 AN012 AN013 AN018 AN020`

**Explicit CORE SKIP retained:** stronger SAT-specific worldline/resolver, photon-neutrino, braid-QCD, Electrogravity/Interbraid, SAT-number, and home-grown-tool predicates; also `B003 B005 AM022 AC007 AC014 AM004 AM005 AM007 AM010 I002` after direct review.

Key calibration: geometry, emergence, topology, exotic representation, wormholes/holography, phase structure and quantum-gravity reformulation are not fringe markers by themselves in professional physics.

### Chunk 2 — source hygiene / access
`EXPOSURE_STATS/MISC_PAPERS` mixes professional work, independent proposals, internal SAT material, duplicates and unrelated captures. `Unifall.txt` is SAT-internal and excluded. `story.txt` is unrelated and excluded. Duplicate SHA lineages count once.

The archive extraction route `derived/manifests/extraction.jsonl -> derived/text/<sha>.txt` is now the preferred claim-level path for PDFs.

### Chunk 3 — WIDE respectable/pop/casual physics
Detailed record: `WORKSPACES/COMMON/SATITY_BLIND_SURVEY_RUN3_WIDE.md`.

Bounded science-news sample included quantum-gravity/dark-energy reporting, spintronics reinterpretation, continuous-field physics AI, first-principles Kondo modeling, Einstein–Euler cosmology, and quantum tests of gravity.

**WIDE PASS:** `B002 B006 AF002 AF003 AH010 AH011 AM019`

**WIDE FAIL/ABSENT:** `AN018 AN020`

**Explicit WIDE SKIP:** `B001 B003 B004 B005 B007 B008 B009 B013 B014 B015 AF001 AF004 AF009 AH005 AH009 AE006 AE015 AN010 AN012`.

Calibration: respectable popular physics is rhetorically more permissive than CORE, but the sampled sources still distinguish hypothesis/model/prediction/experiment/benchmark and retain successful GR/QM constraints.

### Chunk 4 — FRINGE primary-text pass
Detailed record: `WORKSPACES/COMMON/SATITY_BLIND_SURVEY_RUN4_FRINGE.md`.

#### Claim-level sources read
1. `EXPOSURE_STATS/MISC_PAPERS/ssrn-6469929.pdf` -> `derived/text/6709a309b4779144400af595a2e26310d1623f097ece947ae8b5ec7ec72e0a0e.txt` — Selection–Stitch geometric foundations.
2. `EXPOSURE_STATS/MISC_PAPERS/physical-spacetime.pdf` -> `derived/text/62044c693c64837a526fd880cc172ec240a2f718b3358ef2defd3ffb6bfacd39.txt` — D4 physical spacetime / lattice-QCD construction.
3. `EXPOSURE_STATS/MISC_PAPERS/THE UNIFIED COMPRESSION-BASED FIELD THEORY- THE FINAL EDITION …pdf` -> `derived/text/725ac5c79e7efdec28ea919d34ecf4187601ef80c70c3f58091e3b426e354c8e.txt`.
4. `EXPOSURE_STATS/MISC_PAPERS/The Neutrinoverse Hypothesis…pdf` -> `derived/text/d2bba14f39bfeba2356c867ee76c79287470c7073a56919166ccd80b316eba85.txt`.
5. `EXPOSURE_STATS/MISC_PAPERS/OTHER - (99+) Heraclitean Extended Relational Field Dynamics…pdf` -> `derived/text/66dd58df8520fc0419a65e98219ba388571e92162fcaf37b3b30581f7fc11550.txt`; only readable first-page summary used because later extraction is garbled.

#### FRINGE judgments added

**PASS/PRESENT:**
- `F001` — common substrate/grammar for vacuum and matter recurs across independent specimens.
- `G002` — light as excitation/wave of underlying medium/network recurs.
- `G004` — force phenomena compressed into modes/transitions of a common substrate recurs.
- `K001` — common geometric/mechanical origin for electromagnetism and gravity recurs.
- `M001` — quantum/discrete state structure repeatedly sought as emergent from deeper geometry/topology; broad predicate only, not SAT's holonomy mechanism.
- `O001 O002 O010` — particle identities/properties repeatedly translated into geometry/defects/readouts of one substrate.
- `R001` — same structural grammar extended from quantum/particle scales to gravity/cosmology.
- `AC001` — standard mathematics is assembled modularly even in highly non-accepted work.
- `AE002` — explicit anti-free-parameter / anti-tuning aspiration recurs (`no free parameters`, `zero dimensionless free parameters`).
- `AM005 AM006 AM007 AM008 AM017` — geometry-zoo, common-force-regime, emergent-quantum, common-substrate and anti-tuning compound motifs recur strongly.

**FAIL/ABSENT on negative fingerprint:**
- `AN004` — sampled fringe does not reject geometric/topological particle explanations on principle.
- `AN005` — sampled fringe does not treat every particle species as fundamentally unrelated ontology.
- `AN006` — sampled fringe does not require vacuum and matter to be ontologically distinct substances.

#### FRINGE explicit SKIP after review
`A001-A020 F004 G005-G008 H001-H010 I001-I013 M002-M015 AF001-AF010 AH005 AH006 AH009 AH010 AH015 AN007 AN018 AN020 AM019`.

Important mixed cases:
- `M012` / `AN007`: Selection–Stitch, D4 and UCBF explicitly use fundamental discrete substrates, while HERFD says physical spacetime is not fundamental. Do not equate fringe with fundamental discreteness.
- `AF...` / `AM019`: some fringe papers explicitly recover/compare mainstream limits; others use replacement-oriented rhetoric.
- epistemic-status criteria are mixed: Neutrinoverse calls itself falsifiable hypothesis; D4 lists unresolved technical items; UCBF uses much stronger closure/truth language.

### Chunk 5 — FRINGE robustness controls outside the initial lattice-heavy cluster
Detailed record: `WORKSPACES/COMMON/SATITY_BLIND_SURVEY_RUN5_FRINGE_ROBUSTNESS.md`.

Claim-level controls:
1. `Relaxation-Driven Cyclic Cosmology (RDCC) v21.0` -> `derived/text/2476ab0d85bbea62b1db95b220216431cf8b8dd5ffa90dd4c39a2c3ede621039.txt`.
2. `Lehew-2026-Pascal-Anti-Diagonal Alpha-Letter.pdf` -> `derived/text/09132162cc00c4f12afc21908f59d819fa86e0b7cd5de8ff8e8cd0f2bbb397f9.txt`.
3. `Dark Matter as a Trapped K=6 Remnant` -> `derived/text/e1fc1adec5a285d6f42cf0058ed5cfafd0313b0391683a7172dd73973dc093e7.txt`; counted only as a same-family consistency check, not an independent ecosystem specimen.

**FRINGE marks strengthened cross-family:** `AE002 AM017 R001 AC001`.

- RDCC preserves standard GR plus a small field content while trying to explain several cosmological phenomena through one two-sector mechanism, explicitly labels predictions testable/falsifiable, and uses a single controlling infrared parameter.
- Pascal anti-diagonal work explicitly claims pre-anchored inputs, zero free parameters and falsification conditions while attempting a highly nonstandard constant recovery. It therefore strengthens the anti-tuning aspiration but simultaneously warns against equating anti-tuning rhetoric with successful methodology.

**Important robustness correction:** the stronger Run-4 SAT-like ontology cluster (`F001 G002 G004 K001 M001 O001 O002 O010 AM005 AM006 AM007 AM008`) is **not independently reproduced by every non-FCC control**. Keep those PASS marks as sample-supported, but do not call them universal fringe traits. RDCC is strongly unificatory without a vacuum/matter geometric substrate; the Pascal construction is mainly a constant-recovery program.

**Additional FRINGE SKIP retained/added:** `AE009 AE015 AH010 AF002 AF003 AM019 AN010 AN011 AN012 AN013 AN020` because the control sample is methodologically mixed.

### Current comparative observation
The sampled FRINGE patient is substantially closer to SAT than CORE on several **structural ontology/unification motifs**: one substrate, geometry-as-particle-identity, vacuum/matter unification, emergent quantum structure, common force mechanisms and aggressive parameter elimination. The robustness controls narrow that claim: maximal unification and anti-parameter aspiration recur across independent fringe families, while the more specific common-substrate/geometry-zoo motifs are concentrated in particular families rather than universal across fringe physics. Methodological quality remains heterogeneous, so no blanket `fringe = epistemically undisciplined` score is justified.

## Next unreviewed chunk

1. Re-audit the broad CORE PASS list against exact patient-level wording and demote overbroad marks to `SKIP` where evidence only shows existence in professional physics rather than a property of CORE-as-a-whole.
2. Freeze the internal first-pass comparison after that calibration.
3. Then begin clearly separated external validation windows: last year / last month / last week, preserving any changes rather than rewriting the blind pass.
