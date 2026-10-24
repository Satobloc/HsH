# EQ-0016 — Archived silver-isotope precipitation-spacing construction

Worker: Kestrel. Handoff: Meridian. Date: 2026-10-24.

Status: **HISTORICAL SOURCE-PRESERVING AUDIT; ALGEBRA PASSES, PREDICTION CLAIM DOES NOT; ACTIVE VERIFICATION ONLY; NOT H(s)H BEDROCK; NOT ESTABLISHED PHYSICS.**

## Provenance and terminology chain

Primary source read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/GNEW 2.txt`, 531 lines / 38,053 characters, Git blob `2588c591264b6c6cfd7846cac7fc3e46b05e4de8`, archive snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`; path commit `ec6ff6182340346b649f905653fd5f74886d1502`, repository date 2026-06-29T10:18:39Z. Exact construction: lines 294–412.

Related public transcript read completely: `DEBATING AI PODCAST/The New Physics - Chemical-Optical Lab Bench.srt`, 5,056 lines / 89,290 characters, blob `576ffef4bab6e6eae52be7e21e0950bdba91310b`; path commit `02817e2693b5f223ce3f8e2b662b3b0644859c1c`, repository date 2026-09-19T04:27:38Z. Relevant locators: lines 1650–1811, 2065–2071, 2161–2186. These are repository dates, not asserted authorship or episode dates.

Verbatim archived mathematics:

```text
χ_Ag = 1.01376 ± 0.0011
R_mass = 108.9047/106.9051 ≈1.018704
χ_calculated = 1.0 + B*(R_mass - 1.0)
B = 3/(4π)
χ = 1.0 + (3B)*(R_mass - 1.0)
```

The source labels the factor-three step a “self-repairing failure adjustment”: the one-factor result misses the target, after which the multiplier three is introduced. The transcript preserves a materially tighter target, `1.01376 ± 0.00001`, and separately gives a mass-square-root comparator near `1.0093`; another transcript passage writes `1.00093`. The later `±0.0011`, earlier `±0.00001`, `1.0093`, and `1.00093` are retained as conflicting historical records, not silently harmonized or declared superseded.

## Reproduction

Using the literal source values `m107=106.90509 u`, `m109=108.90470 u`, `B=3/(4π)`, and

`χ(k)=1+k B(m109/m107−1)`, the calculation gives:

```text
mass_ratio=1.018704535023
B_3_over_4pi=0.238732414638
chi_k1=1.004465378811
chi_k3=1.013396136432
target=1.013760000000
residual_k1=-0.009294621189
residual_k3=-0.000363863568
early_tol=0.000010000000; pass=False
late_tol=0.001100000000; pass=True
k_required_for_exact_target=3.081485487247
sqrt_mass_ratio=1.009308939336
target_minus_sqrt_ratio=+0.004451060664
```

Thus the factor-three value passes only the later broad envelope; it misses the earlier envelope by 36.386 tolerance widths. The exact continuous multiplier required to hit the displayed target is 3.081485..., so three is neither an exact derivation nor an independent fit-free prediction.

## Dimensions, algebra, limits, sign, topology, numerics

- Dimensions: isotope masses have unit `u`, but their ratio, `B`, `k`, and `χ` are dimensionless. The transcript's description of the spacing-ratio residual as `0.00446 radians` is a unit/type error: the residual is dimensionless.
- Algebra: the affine formula is internally consistent. For every target and nondegenerate `B(R−1)`, however, `k=(χ_target−1)/(B(R−1))` reproduces the target exactly. Therefore the multiplier is a tunable parameter unless independently fixed before observing the target.
- Limits and sign: equal masses or `B→0` give `χ→1`. Positive `B,k` and `m109>m107` give `χ>1`. Swapping isotope order gives `χ=0.986849831358`; the affine expression is orientation-dependent and not exactly reciprocal.
- Topology/model content: the executable code defines `abs(sin x + sin(χx))` but then returns the affine formula; it never detects peaks or measures their spacing. It contains no reaction, diffusion, nucleation, concentration, gel, or isotope-population state and no map from nuclear topology to precipitation kinetics.
- Wave-domain discriminator: `sin x+sin(χx)=2 sin((1+χ)x/2) cos((1−χ)x/2)`. For the factor-three value, the absolute beat period is 469.029659 and the first envelope zero is 234.514830. The plotted source domain ends at 100, containing 0.213206 full absolute-envelope cycles and no envelope zero. The plot therefore cannot exhibit even one complete claimed moiré beat.

## Versioned atomic-mass check and independent-vs-tuned status

NIST's Atomic Weights and Isotopic Compositions table lists `106.9050916(26) u` for Ag-107 and `108.9047553(14) u` for Ag-109. Propagating only those mass uncertainties gives:

```text
nist_mass_ratio=1.018705037057 +/- 0.000000028024
nist_chi_k3=1.013396495988 +/- 0.000000020070
nist_target_residual=-0.000363504012
nist_target_residual_sigma=18111.378
```

The last number is only the residual divided by uncertainty propagated from the mass inputs; it is **not** an experimental significance because no independently measured `χ_Ag` dataset or target uncertainty provenance was found in the source. CODATA is not the appropriate authority for an empirical precipitation spacing ratio; the relevant versioned standard input is the NIST isotope-mass table. Updating the masses barely changes the result.

The simple square-root mass comparator evaluates to `1.009308939336`, close to the transcript's `1.0093`, but that comparator is only a transcript-stated mass scaling, not a validated Liesegang law. Published Liesegang work treats spacing as reaction–diffusion patterning and reports dependence on reagent concentrations and electrolyte conditions. No independent isotope-separated Ag-107/Ag-109 ring-spacing measurement was located. Exact search for `1.01376` with silver/Liesegang terms found only the SAT/H(s)H record, not an external experiment.

Classification: the factor-three branch is **tuned/postdictive** because it was introduced after the one-factor miss. It cannot be scored as an independent prediction. The construction remains in active verification, not promotion.

## Formal test

Lean file `ArchiveEQ0016.lean` proves the equal-mass limit, positive sign, exact target tunability, broad-envelope acceptance, and tight-envelope rejection. It is on draft verification PR #388 at head `192fdd8e7df9b682b31c3a2ffe691bb5bb804efc`. Local Lean was unavailable; GitHub CI is the authoritative compile check.

Python SHA-256: `050beb6ff281ea6703dc1d4b5988787c63bed4c683f0133415b18109bf5715ad`.

Lean SHA-256: `5669cf3600abb8f37b58591eaf5564a061ae812bf194fa4d817999967726a130`.

Exact reopening discriminator: preregister all concentrations, gel chemistry, temperature, imaging/peak algorithm, isotope purities, and the multiplier rule; then measure blind Ag-107 and Ag-109 spacing ratios with uncertainty and compare against `1.0133965` without retuning. A second held-out chemistry is required to distinguish isotope-mass scaling from concentration/diffusion effects.

## Required reading round

Live `BEDROCK.md`: full 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Subordinate `STATE_OF_THE_THEORY.md`: full 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Shared Mersearch request blob `662e4a99e47a48e1e573cf0dddffaf1329dd60dd` remained occupied by `2026-10-21-orson-nlm-big-haul-math-001` and was not overwritten.

Fresh random draw: candidate set was 85 retrievable archive-root `.txt`/`.md` files sized 20,000–250,000 bytes; `Math.random()=0.7723707255283767`, index 65, selected `SCRATCH 3.txt`. It was read completely: 215 lines / 25,899 characters (26,299 repository bytes), blob `deede80148544ce97a9aa21dc44f48435c685ddc`, snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`. Honest takeaway: this is an exploratory human–AI dialogue in which braid-of-braids, persistent-coil/transient-excitation, neutrino-precession, historical-tug gravity, chondrule, and dark-matter ideas are repeatedly praised as solutions without equations or discriminating tests. It is useful as provenance for terminology and conjecture generation, but not as mathematical evidence; its strongest audit lesson is that narrative coherence and model flattery must not substitute for derivation or held-out prediction.
