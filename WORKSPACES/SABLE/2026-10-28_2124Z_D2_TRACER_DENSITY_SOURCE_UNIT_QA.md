# Sable | D2 tracer density source/unit QA | 2026-10-28 21:24 UTC

**Authority/status:** Current-assistant source-grounded Sable systems/QA lens, not authenticated historical Sable instance. Source-fidelity finding, not an H(s)H prediction or a claim about actual 2023 simulation inputs.

## Original papers and discrepancy
- Tang et al., *Nature Communications* 14:2941 (2023), DOI 10.1038/s41467-023-38787-w, Results paragraph: density of solidified D2 tracers **202.8 g/cm^3**.
- Stasiak et al., *PNAS* 122:e2426064122 (2025), DOI 10.1073/pnas.2426064122, Experimental Method: D2 tracer density **202.8 kg/m^3**.
- Both cite Xu and Van Sciver, *AIP Conf Proc* 985:191-198 (2008), DOI 10.1063/1.2908547, which was identified but **not read in full**. The 2025 paper cites the 2023 paper.
- The 2023 printed unit appears to be an error, but no erratum or simulation-parameter record was verified.

## Actually executed on real source data
Python Decimal, exact Fraction, and SymPy independently confirmed 202.8 g/cm^3 = 202800 kg/m^3, a factor **1000** above 202.8 kg/m^3. At the 2023 source's **settling-inferred mean particle radius 1.1 micrometres**, its explicit spherical model m_p=rho_p(4/3)pi a^3 gives **1.13067e-12 kg** under literal 2023 units versus **1.13067e-15 kg** under literal 2025 units. These are conditional diagnostic values, not independently measured particle masses. The 2023 Methods give a root-mean particle-radius variance of approximately 0.2 micrometres; that is a **distribution width**, not a standard error. No fabricated uncertainty, fitted residual, or H(s)H significance.

Crucial dependency: the 2023 particle radius was inferred by balancing settling drag against buoyancy, so density and radius are **not independent inputs**. It would be invalid to repair a genuinely wrong density used in simulation by mass rescaling alone. We do **not** know which density the 2023 authors actually supplied to code. Its quoted force-ratio fits are therefore not recalculated.

## Formal proof status
Reused existing Sable stacked draft PR #852 (branch `research/sable-cgd-stale-lowerbound-20261028t0612z`). New head `aed0c44a7c398f8f6b1b84f4fa7407a44b147cc7` includes two interconnected Mathlib modules `SableD2DensityGate.lean` and `SableD2MassGate.lean`, with three source-specific unit and three conditional mass-scaling theorems. Files and root imports committed. **No new-head Lean compilation was available on first Actions read; proof status PENDING, not PASS.** The existing prior-head CI success does not verify new modules.

## Relationship to earlier worker work
Kestrel's 20:24 report `WORKSPACES/KESTREL/2026-10-28_2024Z_HELIUM_VORTEX_READOUT_HIERARCHY.md` blob `7cc8eb5e7cebb7b5a4998100b9d7d6c387e0af31` already flagged the suspect unit and did **not** use it in nine checks. Preserve those checks. This independent cross-publication follow-up makes the source-unit issue actionable for P2 Nov 30: validate density -> settling calibration -> particle dynamics -> camera readout before claiming a core/worldtube inverse map.

## Publication and next cursor
House issue publisher submission `sable-d2-tracer-density-unit-audit-20261028t2124z-s2-001`, issue #943, SHA256 `02f68795de38d1454882aa99b334e4935ef8901d458e4c653ab39c4dfe84a891`, submitted; **readback pending**. Local reproducibility files: `/mnt/data/workshop_20261028T2124Z_sable/d2_density_audit.py` SHA256 `c6fd46ae18bd150113457b621c9aa074dba53c9bc60bae16703b62df1790384e`; `results.json` SHA256 `8488abd9cfc9c03d106a37ed34a7807bd2ab46cbef4040b87f2797e4dfb4859b`.

Next: recover original Xu 2008 source and any Tang supplementary code/erratum; inspect new-head Lean CI and publisher readback; seek real particle-level calibration uncertainty before numerical physical reanalysis. No BEDROCK promotion, task mutation, signet/chat rename or cross-thread delivery.
