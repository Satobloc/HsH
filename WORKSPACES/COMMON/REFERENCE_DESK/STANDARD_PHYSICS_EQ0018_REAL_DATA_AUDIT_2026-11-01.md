# EQ-0018 — Independent Real-Data Reproduction

**Date:** 2026-11-01  
**Status:** independently reproduced numerical claims; upstream dimensional failure retained; no H(s)H physical validation.

## Source chain

**Direct user statement:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Paper Restructuring Plan — raw.json`, blob `4e49650f2a0b6960d5ce99d6484825b463637828`, message UUID `54674374-f032-4c85-a3b0-35cf1584d13c`, author role `user`, 2026-03-21T18:40:11.069Z, serialized lines 2185–2202. It supplies B, the claimed He-3-anchored ell_f expression and approximate m0.

**Later downstream formula:** `MAY_2026_SNAPSHOT.txt`, blob `c29c49b697208294d705b0a280d91808a57edc66`, section III.2, gives `hbar=m0 c ell_f B`. This is an archive snapshot, not a raw user-role message; it is not attributed to Nathan Direct.

## Real measured system and constants

- System: (^3He^+) ground-state zero-field hyperfine splitting.
- Schneider et al., *Nature* 606, 878–883 (2022), DOI [10.1038/s41586-022-04761-7](https://doi.org/10.1038/s41586-022-04761-7), report signed (Delta E_{HFS}^{exp}=-8,665,649,865.77(26)_{stat}(1)_{sys}) Hz. The magnitude is used as positive (f_{He3}).
- NIST 2022 CODATA: h and c are exact SI constants; (alpha=7.2973525643(11)	imes10^{-3}). [NIST CODATA 2022](https://physics.nist.gov/cuu/pdf/all.pdf).

## Executed reproduction

The Python script was executed in this turn using the measured hyperfine frequency and CODATA constants, plus the approximate source values (m_0=1.0073	imes10^{-27},kg), (ell_f=0.7937,fm), and (B=3/(4pi)). No fitted inputs or parameter adjustment were introduced.

### Upstream claimed filament scale

The source expression is:

[
ell_f=left(rac{hc}{2pi f_{He3}alpha^2}ight)^{1/3}.
]

Its radicand does **not** have dimensions of length cubed. The cube-root dimension is (M^{1/3}LT^{-1/3}), not (L). Evaluating the numeric coordinates in SI base units yields (4.091868697466030	imes10^{-11}), but that number is **not a length**. If incorrectly labelled metres it would read 40,918.686975 fm, not 0.7937 fm. Because the expression is dimensionally invalid, this numerical coordinate has no physical length interpretation and changes with the chosen base units.

<badge color="danger">Dimensional failure retained</badge>

### Downstream reduced-Planck relation

For the later archive relation (hbar_{model}=m_0cell_fB):

| Quantity | Reproduced value |
|---|---:|
| (hbar_{model}) | (5.721992811678646	imes10^{-35}) J s |
| NIST exact-SI (hbar=h/(2pi)) | (1.054571817646156	imes10^{-34}) J s |
| Relative residual | −0.457410797830 |
| Model/reference ratio | 0.542589202170 |

The numerical reproduction agrees with the retained #410 worker report. The approximate (m_0) and (ell_f) inputs have no stated uncertainties, so no meaningful statistical pull can be calculated. The direct user message provides the upstream (ell_f) formula and approximate scale; the downstream (hbar) relation belongs to the later snapshot and must remain a separate provenance layer.

## Gate

- **Numerical reproduction:** PASS.
- **Upstream (ell_f) dimensional validity:** FAIL.
- **Downstream (hbar) numerical agreement:** FAIL at the stated inputs.
- **Statistical comparison:** unavailable; input uncertainties absent.
- **Physical interpretation:** unresolved; no candidate or validation promotion.

## Reproducibility files

- [Python script](eq0018_real_data_reproduction_2026-11-01.py)
- [Machine-readable inputs and outputs](eq0018_real_data_reproduction_2026-11-01.json)

