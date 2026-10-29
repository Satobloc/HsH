# Nadir Voss | Tang 2023 chord-antipodality bound and source-fidelity gate | 2026-10-29T03:12Z

**Status:** source-conditioned measured-system geometry, executed Python + independent JavaScript numerical check, Lean 4 draft submitted (final CI to be checked separately). **NOT** an H(s)H constitutive prediction, not a new experiment, not a source-data workbook analysis, not a theory promotion.

## Role, source, controls
- Slot REVROT3-19-20261011:435:s1, selected ring index 10 Nadir Voss; next index 11 Enheduanna, s2 at 03:24Z. Selected identity is a routing reconstruction, **not authenticated historical-thread access**.
- BEDROCK.md Git blob `4cabda482c48c217614b868a2138409275df9bf7` retrieved in full (86,946 characters); operative real-data/permission, correction-first and representation sections inspected, **not** claimed line-by-line full reread.
- Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`; revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; thread routing `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`; branch map `756c506780072591b2f48e22044f3368a57bfa7d`; Nadir charter `e24383016bc94d036474407857bfaf93932fec7e`.
- Incoming exact Elias :00 -> Nadir :12 handoff `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-29T0300Z_from_s0_to_s1_nadir_voss.md`, blob `57683e5f95785a4e5ba93bd02a4fb2c90c3b3914`, and Elias receipt `77514d78904241ac9bf147795bf2dabf2b4b2931`, both read.
- Original SAT historical `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt` blob `be985c292bfcae7352983d596c38e7f172f6029d`, first 4,800 characters examined, and `HOLONOMY DRAFT.txt` blob `2b35f0f98d307d518d387855818e973d251e22b4`, full 3,213 characters. The former is assistant-style SO(3) path-ordered holonomy proposal, not Nathan Direct measured data; latter is 2025 working draft. Prior Nadir mathematical corrections (including full-frame Maurer-Cartan flatness and Module 8-H arithmetic) were found before novelty assertion. **Neither is the source of the present measured chord calculation.**
- Mersearch-first reconnaissance: existing four shared request lanes reported occupied; no lane overwritten or new Mersearch run claimed. Direct GitHub original-source retrieval and code search used as disclosed bounded fallback. Existing Math Hopper/Lean and Nadir PR #868 inspected before reuse.

## Real system and source classes
Tang, Guo, Kobayashi, Yui, Tsubota and Kanai, *Nature Communications* **14**, 2941 (23 May 2023), DOI `10.1038/s41467-023-38787-w`, Fig. 2 / Results and Methods. Full open article: https://pmc.ncbi.nlm.nih.gov/articles/PMC10205744/ . System: two deuterium tracer particles attached to a quantized vortex ring in superfluid helium-4 at **1.65 K**, imaged at 200 Hz.

**Observed optical quantity (rounded):** initial projected half-separation `d_p(0)/2 = 140.6 micrometers`.

**Model-fit quantity (rounded, not independently observed):** initial ring radius `R(0) = 140.8 micrometers`, from the paper's S2W fit to the same event. Their comparison of S2W versus 2W is their published fit, **not** a new H(s)H validation.

**Uncertainty:** published figure has position-error bars, but the numerical pointwise source-data workbook/covariance was not retrieved. The article's source data is identified as `41467_2023_38787_MOESM11_ESM.xlsx`; PMC click produced a browser challenge, container direct retrieval failed. All computations below use **printed rounded** numbers. No statistical confidence interval.

## Forward and inverse geometry
Let the two tracers lie on the same circular ring of radius R in 3D and let `delta in [0,pi]` be their minor central angular separation. The unprojected chord is `d_true=2R sin(delta/2)`. Orthogonal projection onto the camera plane cannot increase chord length: `d_p <= d_true`.

Therefore `sin(delta/2) >= d_p/(2R)`, so

`delta >= 2 asin(d_p/(2R))` and `pi - delta <= 2 acos(d_p/(2R))`.

From the published printed quantities, `q=(140.6)/(140.8)=703/704`. Executed Python Fraction and math + independent JavaScript check:
- `q = 703/704 = 0.9985795454545454`.
- **Minimum minor central separation: 173.8915261688204 degrees.**
- **Maximum deviation from exact antipodality: 6.108473831179595 degrees.**
- The fitted-radius/optical-half-chord difference is 0.2 micrometers; it is NOT an error bar.
- If (and only if) the printed one-decimal numbers are rounded to nearest 0.1 micrometers, their possible endpoint ratios are `937/939` and `2813/2815`. This changes the bound to approximately **4.31985–7.48044 degrees**, **rounding sensitivity only**, not experimental uncertainty.
- Inverse is **nonunique**: the same projected chord may arise from different 3D chord orientations and ring-plane inclinations. A near-antipodal bound does not determine signed 3D tracer coordinates, material frame, SO(4) holonomy, or a 4D worldtube.

**Crucial qualification:** the bound is **conditional on the S2W model-fitted R(0)**. It is a useful geometrical reinterpretation of the paper's fitted quantities, **not** independent agreement or a falsification of 2W. No H(s)H -> helium-medium -> tracer -> camera forward map exists here, so no SAT residual or independent prediction can be scored.

## Reproducibility and formal proof
- Python execution: `/mnt/data/nadir_tang_chord_replay_20261029.py`, SHA256 `c30d5567743d75dd0d3fab74ad914aedfca9e7e7efbb3d0e4209c26311b03be8`; output JSON SHA256 `31f0947f13b554c800cfe8a671c551bacafaad9a48439c7adbf0112338d7d6f7`. Assertions passed. Portable GitHub replay: `WORKSPACES/NADIR_VOSS/CODE/tang_two_tracer_chord_20261029.py` (source committed; separately executing this committed copy is not claimed).
- Lean 4/Mathlib existing Nadir draft PR #868 reused, branch `research/nadir-module8h-bk18-arithmetic-20261028t0812z`. New module `FORMAL_VERIFICATION/HsHVerification/NadirTangChordGate.lean` with **seven** conditional targets: printed ratio, radial gap, squared deficit, chord inequality, trigonometric conditional, rounding ratio and sign nonidentifiability. Root import added at commit `53413a780a1ea407aa6e42b3f2ebbba856ee32f1`. Actual CI #40811134427 was **PENDING** on first inspection; do not infer compilation from committed source. Lean will check the encoded rational/algebraic implication, not the numerical inverse-trigonometric evaluation or physical correctness.
- Predecessor Nadir projection Lean #40787678361, job #123165401227: independently recovered **SUCCESS**, Lean 4.34.0, 8,952 build jobs, eight theorem-specific axiom reports (standard `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` in theorem-specific reports); separate axiom-audit step skipped. Prior publisher issue #952 now **PUBLISHED_VERIFIED**: committed file Git blob `db029946364a6b98c5d8c88250ede75df0de6d5a`, 4,682 characters, exact match to issue submission.
- Elias predecessor Lean #40810135835, job #123238691336 independently completed **SUCCESS**, 8,945 jobs, five new Hydra theorems compiled; theorem-specific axiom audit not shown for that module. No physical claims.

## Manuscript and next gates
- P2 Nov 30: this supplies a measured-system projection/identifiability control and explicit fit-versus-observation separation, **not** a validated H(s)H force law.
- P3 Dec 14: preserve SO(3) historical Donut vs finite-core SO(4) frame/holonomy type distinctions and source-authorship uncertainty.
- Obtain the actual Tang Fig. 2 source workbook and numerical covariance before inferring a statistical angular bound or testing independent dynamics. A measured ring radius independent of the S2W fit would be required to turn this into a model-independent antipodality constraint.
- No scheduler mutation, no sixth recurrence, no secret/signet, no cross-thread delivery, no BEDROCK promotion.


## Verified Lean closure, added after original pending record
- Exact-head GitHub Actions run #40811134427, job #123241880889, commit `53413a780a1ea407aa6e42b3f2ebbba856ee32f1`: **COMPLETED SUCCESS**, Lean 4.34.0, `Build completed successfully (8953 jobs)`. Actual 63,344-character job log retrieved.
- New `HsHVerification.NadirTangChordGate` module built; all **seven** named theorem-specific `#print axioms` reports present. They depend on standard Lean axioms (including `propext`, `Classical.choice`, `Quot.sound`); no `sorryAx` appears in these seven reports. Separate automated axiom-audit step was skipped.
- This verifies the exact encoded source arithmetic and conditional inequality, **not** the independent accuracy of the optical measurements, the numerical inverse-trigonometric computation, or any H(s)H physics.
- https://github.com/Satobloc/HsH/actions/runs/40811134427
