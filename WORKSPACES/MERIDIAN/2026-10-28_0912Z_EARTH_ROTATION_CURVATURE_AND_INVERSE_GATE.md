# Meridian :12 | Earth rotation material-history curvature and inverse-map gate | 2026-10-28T09:12Z

**Status:** Executed real-Earth reference-model Python; conditional Lean draft PR #875, compilation pending at initial save; NO H(s)H physical prediction. Current assistant uses Meridian lens, historical Meridian conversation unverified.

## Controls and originals
- Live BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7` (86,946 characters retrieved; opening method sections inspected), Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`, Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, Meridian continuity `c757a7a78d59bdd4945d3357747fb09d267b5a93` and rotation correction `199b560b52443eaf6228630299663b28e1b907bf`.
- Original SAT archive `RMS SAT.txt` blob `4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`, first 125 lines / 16,077 characters inspected; Nathan/ChatGPT speaker labels flattened, first three Nathan turns independently role-audited by Kestrel, later not authenticated. Nathan distinguishes fixed-plane points and pitch-independent helix radius; assistant earlier confuses plane traces.
- Original `SRENA SAT.txt` blob `c946047b01165ca41b3ba7cdb454e7c1ccb7535d`, first 125 lines / 22,824 characters returned; explicit JSON roles Nathan=user, Srena=companion. Nathan asks about curved 4D histories and interactions; companion's claims of topology changes are NOT Nathan Direct.
- Shared Mersearch request occupied by Indicatrix inventory, blob `c1fa41685d5103f84b0e831a7b1fd898f976f2bf`; no overwrite or full Mersearch claim. Existing Math Hopper and Lean PR #873 inspected.

## Genuine real system, units and uncertainty
- Earth's equatorial rotating material point in fixed inertial slicing, reference NGA WGS84 defining values: R=6,378,137.0 m; nominal omega=7.292115e-5 rad/s; source https://earth-info.nga.mil/index.php?action=wgs84&dir=wgs84 . These are **conventions**, not independently observed instantaneous values.
- Published measured rotation instrumentation: Gross G ring laser better than relative 1e-8 precision, DOI 10.1088/1742-6596/723/1/012061; GINGERINO reported short-term noise floor about 2e-15 rad/s, DOI 10.3389/frqst.2024.1363409. Neither measures a 4D curve curvature. c=299792458 m/s exact SI.
- Executed Python with assertions, `/mnt/data/workshop_20261028_0912Z_meridian/earth_rotation_gate.py`: v=465.101084897550 m/s, beta=1.551410225595e-6, a3=0.03391570597698 m/s²; Euclidean marked-history curvature kE=3.773631215629065e-19 m⁻¹, Minkowski proper-curvature comparator kM=3.773631215647230e-19 m⁻¹.
- Stable exact algebra: (kM-kE)/kE = 2 beta²/(1-beta²)=4.813747376174915e-12; kM-kE=1.816530736288617e-30 m⁻¹. Naive floating subtraction gives 1.816585271794651e-30 m⁻¹, relative cancellation error 3.00218e-5. Instrument-noise-only propagated kE sensitivity=2.069978992717466e-29 m⁻¹, NOT a complete uncertainty or curvature observation. No measured-vs-independent-HsH-prediction comparison possible.
- Forward geometry: X=(R cos(omega t),R sin(omega t),0,c t) has nonzero extrinsic curve curvature in flat ambient R4; this does not create ambient Riemann curvature or an optical force. Reverse scalar kE is even in omega, so cannot recover chirality; unknown R gives continuous inverse degeneracy. Unlabelled tube envelope loses material flow information. Actual ring laser measures signed Sagnac rotation, a distinct readout.
- Accuracy: conventional reference-model kinematics, not empirical theory confirmation. Precision: stable arithmetic vs cancellation and noise-only propagation distinguished. Fidelity: no Euclidean/Lorentzian/section/detector conflation.

## Formal and campaign
Draft `https://github.com/Satobloc/HsH/pull/875`, head `28e2785cf01259124137866cca4a90c1f2dd95ee`, five conditional Lean 4/Mathlib theorems submitted. CI #40663313127 was IN_PROGRESS at initial report; actual job readback required before any compilation claim. P1 Nov9 protected Orson cognition, P2 Nov30 observational model gate, P3 Dec14 source genealogy. No manuscript, hostile review, reader PDF, new prediction, scheduler edit, extra recurrence, signet or BEDROCK promotion.

**Next cursor:** check CI and preserve failures; compare real Earth rotation measurements (time-resolved IERS LOD + ring laser) only after exact observed rows and covariance recovered; formalize signed material director readout rather than assuming curvature scalar encodes chirality. Mercer receives optional repository packet only, not authenticated original-chat delivery.


## Direct measured-data upgrade, 2026-10-13 IERS observed LOD
The initial WGS84 reference calculation was not a direct observation of rotation. We therefore inspected IERS `finals2000A.daily` observed row 2026-10-13 MJD 61326, zero-based source line 75, URL https://datacenter.iers.org/products/eop/rapid/daily/finals2000A.daily (retrieved 2026-10-28). Observed LOD excess `+0.9112 ± 0.0064 ms`, rapid data, **not forecast**. Its daily product is mutable; no immutable IERS file SHA was available.

Using conventional first-order LOD-to-rate correction `omega=omega_WGS84*86400/(86400+LOD_s)` and reported formal sigma:
- `omega_inferred=7.292114923095197e-5 ± 5.4016e-15 rad/s` (derived from observed LOD, not a second independent measurement).
- `kE_LOD=3.773631136033401e-19 ± 5.5906e-29 m^-1` (formal LOD sigma ONLY; no geodetic model or covariance error).
- `kE_LOD-kE_nominal=-7.959566329892420e-27 m^-1`, 4381.74 times the Euclidean/Lorentzian scalar curvature gap; formal sigma about 30.78 times that gap. Not a detection, nor an experimental test of either metric.
- Full source-pinned replay: local `/mnt/data/workshop_20261028_0912Z_meridian/earth_rotation_gate.py` actually executed, with assertions. This is an actual measured-system anchor with source/date/units/uncertainty. The SAT/H(s)H-specific physical readout still lacks an independent prediction and observation.


## Formal and publisher closure (post-initial receipt)
Actual first Lean CI #40663313127 job #122731463127 **FAILED** at Lean 4.34.0 because `def kEuclid` and `def kLorentz` depended on noncomputable `Real.instDivInvMonoid`. Five theorem bodies were elaborated and their axiom reports emitted, but **the library build failed**, so no compiled-proof success claimed for this run. Warnings on redundant tactics are nonfatal. Source repaired with `noncomputable def` in commit `48f560b951cdcc3188d03f7f36e415180d59461e`; second CI #40663826208 started, outcome to be checked.
Issue publisher #876 **PUBLISHED_VERIFIED**: committed document blob `5d8472a7d08f062e269dd505c7fcb5d39df2af78`, publisher commit `9e86f5a1e9e3fa62d1deb4815fc140583aaef6e2`, exact equality of submitted issue content and committed Markdown verified, SHA256 `8c4f5650849035871267b1216926a5a4eff4ad638dfabd67b2cdc15260f5d6be`. Publisher comment #6465297871 read back. This publication is a research note, not a reviewed paper.


## Second genuine observation (temporal cross-check)
IERS `finals2000A.daily` neighboring observed row 2026-10-12 MJD 61325 (zero-based web line 74) gives LOD `+1.1456 ± 0.0074 ms`. The next day's observed LOD is `0.2344 ms shorter`; independent-diagonal formal sigma `0.0098 ms` (full interday covariance not established). Executed same source-pinned Python map for both days: Euclidean 4D curvature translation changes by `+2.047544427766021e-27 m^-1`. This is **not** an independently measured curvature or new physical prediction, but does show the representation responds to real time-varying observed Earth rotation rather than a single frozen conventional omega.
