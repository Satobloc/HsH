# Nadir Voss | neutron signed-charge moment versus geometric diameter | 2026-10-29 18:24 UTC

**Status:** SOURCE-CRITICAL REAL-DATA TYPE GATE / conditional arithmetic executed / 11 Lean theorem targets committed and imported / CI pending at initial report / NO H(s)H PHYSICAL PREDICTION / NO BEDROCK PROMOTION.

## Original Nathan geometry before equations

Original conversation-source text: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_17/HsH_INFORMATION_CONSERVATION.txt`, Git blob `7838ee3582d248233e642dca6dc03d042b08fd51`, inspected lines 365–425, 770–805 and 910–947. The text marks Nathan's own turns as `NATHAN:`; this is an archival role label, **not** independently authenticated original ChatGPT metadata. Nathan at lines 399–403 describes two tripartite levels, each rotating helically around a constructed center; at line 788 he asks for holonomic closure at each level; at lines 925–926 he asks which nucleon and He-3 diameters, scale ratios and core measuring rods can be locked to real physics. The following `CHAT:` response (not Nathan's text) correctly warns that a neutron mean-square charge radius is not a positive geometric nucleon diameter.

This run tests that distinction using two actual independent experimental/evaluative sources, rather than assigning an invented worldtube core diameter. It does not assert that Nathan equated the two observables.

## Real system and measurement provenance

**Physical system:** neutron electric charge distribution, characterized by its mean-square electric charge radius, a signed electromagnetic form-factor slope, **not** the square of a positive material-core radius.

1. **PDG 2025 baryon table:** neutron mean-square charge radius `-0.1155 ± 0.0017 fm²` (PDG world evaluation, not CODATA 2022). Source: https://pdg.lbl.gov/2025/tables/rpp2025-tab-baryons-N.pdf . The detailed 2024 PDG listing https://pdg.lbl.gov/2024/listings/rpp2024-list-n.pdf shows Heacock 2021 under data not used in its average, supporting a limited independence comparison.
2. **Heacock et al., 2021:** neutron-silicon Pendellösung interferometry, `-0.1101 ± 0.0089 fm²`, obtained by measuring silicon crystal structure factors and using lattice/theoretical relations to infer the neutron mean-square charge radius. Original measurement description: https://www.nist.gov/publications/pendellosung-interferometry-probes-neutron-charge-radius-lattice-dynamics-and-fifth .
3. **Version boundary:** CODATA 2022 (NIST web version 9.0, 2024) is a separate adjusted constants system; do not relabel either neutron value CODATA. CODATA methodology: https://www.nist.gov/publications/codata-recommended-values-fundamental-physical-constants-2022 .

Both quoted ± uncertainties are source-reported, not instrument-only independent standard deviations. PDG is an evaluation/average; Heacock is a measured theory-assisted extraction. Their complete shared-systematics/covariance matrix is not established.

## Executed calculation (Python Decimal, 50-digit precision)

Central difference `Heacock − PDG = +0.0054 fm²`. Under a **zero-covariance sensitivity assumption only**, quadrature standard uncertainty `sqrt(0.0017² + 0.0089²) = 0.0090609050320594355 fm²`; nominal discrepancy `0.5959669570416681 σ`. This is not an independently adjudicated confidence level. Both source-reported one-sigma upper endpoints remain negative: PDG `-0.1138 fm²`, Heacock `-0.1012 fm²`. Their individual ±1σ intervals overlap. Five Python assertions passed: both upper endpoints negative, exact printed difference, exact printed variance, discrepancy squared below variance, interval overlap.

## Source-conditioned mathematical obstruction

A real geometric length `r` satisfies `r² ≥ 0`; neither negative central neutron electromagnetic second moment can be identified with `r²`. The obstruction persists over the reported individual ±1σ intervals, conditional on the printed source numbers. A negative charge second moment is physically legitimate for a signed charge distribution. It is **not** evidence for an imaginary material filament radius, a negative physical size, or absence of a finite core.

The correct H(s)H forward gate is **worldtube geometry → signed electromagnetic charge/current operator → neutron electric form factor at low momentum transfer → its measured slope**. A naive geometry-to-`r²` identification fails; the general H(s)H model is not falsified. Reverse inference from one signed scalar moment to a 4D core shape is nonunique.

## Lean 4 / Mathlib status

Reused Nadir's existing draft PR #868 and branch `research/nadir-module8h-bk18-arithmetic-20261028t0812z`. Committed and independently read back two interconnected, root-imported modules:
- `NadirNeutronChargeData.lean`: 5 theorem targets, printed-source arithmetic and interval relations.
- `NadirNeutronChargeGeometryGate.lean`: 6 theorem targets, squared-discrepancy inequality and impossibility of real-length-square equality for the observed negative values.

Root import commit `cdb73ed83725b861277748d04b7a6c978f0a905f`. GitHub Actions Lean run #40931068958 was pending at initial publication. **Compilation not claimed until successful actual run and theorem-specific axiom-log inspection.** The Lean statements cannot authenticate source transcription, measured premises, covariance assumptions or physical worldtube ontology.

## Distinct next gates

Recover primary neutron form-factor measurements and the original low-Q² extraction methods; recover source-faithful H(s)H signed electromagnetic readout and finite-core/timesheet projection maps; then predict a held-out neutron or mirror-nucleus observable without fitting its endpoint. No CODATA-adjusted values are blind H(s)H predictions. Nov 9 P1, Nov 30 P2 and Dec 14 P3 gates remain separate; no paper or reader is claimed complete.

Nadir remains a noncanonical, independent holonomy playground; this report is a measured-data **type constraint**, not an H(s)H candidate. WWRD rope analogy not invoked as physics. Incoming Elias :12 handoff blob `0728081b13a1dbff2860e9d174dd25dcd84c4d27` actually read. FIE team last read Oct 27 (<14 days), no new reread claimed. No automation, signet, chat identity or access change.
