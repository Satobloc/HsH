# Nadir Voss | GP-B measured-data SO(4) representation gate | 2026-10-26 14:24Z

**Status:** SANDBOX / SOURCE-RECONSTRUCTED, not the original Nadir instance; no theory promotion.

## Source recovery and tool reuse
- Nadir charter: `WORKSPACES/NADIR_VOSS/README.md`, blob `e24383016bc94d036474407857bfaf93932fec7e`.
- Original unmodified Nadir code: `WORKSPACES/NADIR_VOSS/stacked_holonomy_commutator_probe.py`, Git blob `deca2a7cdd5a1384d6b39bf828fdfd3b292b049e`. The exact 1,910-byte source was recovered locally and its Git blob verified. Its `run_case()` was reused with **measured** inputs. The source's default toy `main()` was NOT executed.
- Original historical SAT `Donut canon.txt`, blob `be985c292bfcae7352983d596c38e7f172f6029d`, distinguishes pointwise frame mismatch from path-ordered holonomy. It is assistant-authored historical mathematics, not a measured physical connection.
- Previous Nadir Oct 12 receipt `2026-10-12T0436Z_s3_nadir_voss.md`, blob `b7509e7d0e4d7d76907c05d3395c212ec2fc32fc`, already covers Sim+(4) Fourier selection; not repeated.

## Actual physical system and measurement
Gravity Probe B, Everitt et al., *Phys. Rev. Lett.* **106**, 221101 (2011), DOI `10.1103/PhysRevLett.106.221101`. Flight data 2004-08-28 through 2005-08-14. Four-gyro combined results:

| Component | Observed mas/yr | 1σ mas/yr | GR predicted mas/yr | residual / σ |
|---|---:|---:|---:|---:|
| Geodetic | -6601.8 | 18.3 | -6606.1 | +0.234973 |
| Frame dragging | -37.2 | 7.2 | -39.2 | +0.277778 |

Primary published abstract: https://pubmed.ncbi.nlm.nih.gov/21702590/ ; original author-hosted paper: https://einstein.stanford.edu/content/sci_papers/papers/PhysRevLett.106.221101.pdf .

## Executed calculation and negative gate
Map these **measured orthogonal 3D drift-rate components** to `alpha J12 + beta J23` inside an SO(3) subgroup of SO(4), with the fourth coordinate fixed. Convert published rates to angles **per one nominal year of rate units** using `1 mas=pi/(180*3600*1000) rad`.

Measured inputs: `alpha=-3.200642959948934e-5 rad`, `beta=-1.803506893727474e-7 rad`.

The physical measurement provides **simultaneous drift components**, not an ordered sequence. For `H_sim=exp(alpha J12+beta J23)`, the J13 coefficient of `log(H_sim)` is zero (computed -1.05e-19 rad).

The original Nadir script computes `H_seq=exp(alpha J12) exp(beta J23)`; this *chosen sequential order* generates the BCH term `-alpha*beta*J13/2`:
- Original unchanged code: `-2.886190195864514e-12 rad = -0.0005953194615422631 mas`.
- Independent 65-digit leading BCH arithmetic: `-0.0005953195905505018584 mas`.
- Formal propagated product uncertainty, assuming no covariance: `0.0001152349629751006 mas`.
- Artifact magnitude / published 7.2 mas frame-dragging uncertainty: `8.2683e-5`.
- Six executable checks passed: original commutator sign, SO(4) orthogonality, fixed fourth coordinate, no simultaneous J13, BCH agreement, real-input reproduction.

**Result:** the J13 residue is an **ordering artifact** of an unmeasured sequential construction, NOT a new GP-B observation, measured curvature, physical SO(4) holonomy, or H(s)H prediction. Noncommuting rotations alone do not establish a physical path-ordered transport law.

## Controls / unresolved
Real measured system used; no invented input angles. The GP-B covariance was not obtained; no joint test claimed. Published GR predictions are a comparator, not H(s)H. No CODATA quantity directly corresponds to this GP-B drift-rate test; CODATA gate not applicable. No Lean or new manuscript. No BEDROCK promotion.

Mersearch request lane was inspected and is occupied by an existing Indicatrix corpus request; no overwrite, no Mersearch execution. Repository search failed internally, so source discovery is bounded; exact known-path reads and blob checks succeeded. Original Nadir ChatGPT conversation is not authenticated. Next: source a **measured transport path/history** before claiming a physical SO(4) connection.

**Executed local files available in workshop-turn artifact bundle:** `gpb_measured_reuse.py`, original exact `stacked_holonomy_commutator_probe.py`, `results.json`, `stdout.txt`, `plot_classP.py`, Class P PNG, and full `REPORT.md`.
