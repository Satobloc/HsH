# Review-MIND cross-lane addendum | Loom Earth–Moon report #1102 | 2026-10-30T1309Z

## Source recovery: Nathan Direct versus assistant reconstruction

Independently fetched the original raw export:
- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.
- File: `Gravitational Changes and Motion — raw.json`.
- Immutable Git blob: `8fbded973df263d24b2c1346f0f96e28ded415e7`.
- Conversation ID: `69fa47d5-01c8-83ea-a5e8-6e622e87624c`.
- 158 mapping nodes.

The May 5, 2026 message `beecbdf8-7324-4de1-8efe-2333c931833c` is a user-role message (author.name null). Nathan-attributed archival wording asks whether a hypothetical rope/tube-like worldtube twist could relate orbital and rotational periods and produce standard-looking tidal evolution. It is a question about a hypothetical effect, not a settled equation or empirical claim.

Subsequent user-role messages in the same raw export:
- `34b4d236-6396-4bf6-baf9-dba85a7851bb`: questions the assistant's introduction of curvature; emphasizes straight legs in the isolated picture and twist as a function of differing tube/rope diameters.
- `109c7b04-0766-4e9f-8b04-083a01056a76`: specifies winding/orbital revolution as the driver and allows curvature only when other bodies are restored to the full system.
- `6bd287bd-209a-4733-8a1c-454fae29395e`: explicitly rejects passive bookkeeping and describes physically continuous four-dimensional filaments/tubes and active winding.
- `3e52745c-d19b-4e66-ba46-82f2b5cb9bdf`: permits force transfer through filament geometry, says history can be physically encoded in configuration, and discusses repeated orbital winding, stored twist, spin-orbit coupling and possible handedness effects.

The assistant's subsequent `G \rightarrow G+\Delta G[history]` and `\Delta G(A,B)=\epsilon\int K(\tau_A,\tau_B)d\tau_A d\tau_B` are assistant reconstruction, not Nathan Direct and not a validated SAT-O/Blockwave equation. The Loom PR comment correctly preserves this boundary. WWRD climbing-rope mechanics remains a first-blush heuristic, not physical equivalence.

## Independent physical calculation replay

Loom report #1102 uses an identifiable real system: Earth–Moon orbital recession measured by Lunar Laser Ranging (LLR).

Primary sources checked:
- Williams, Turyshev & Boggs (2014), *The past and present Earth-Moon system*: +38.08 ± 0.19 mm/year semimajor-axis rate from 43 years of LLR data.
- Williams & Boggs (2015), *Tides on the Moon*: 19,361 LLR ranges spanning March 1970–April 2014; Q values 38 ± 4 at 1 month, 41 ± 9 at 1 year, ≥74 at 3 years, and ≥58 at 6 years.
- The 2015 global fit holds Re(k2) at a GRAIL-derived input rather than adjusting it in the LLR fit. The long-period Q entries are lower bounds, not four independent exact point measurements.

The 2014 and 2015 LLR analyses overlap substantially in the underlying ranging history and are not independent replications.

Using the published 2014 fitted recession rate and the stated comparator inputs:
- GM_E = 398600.435507 km^3/s^2 (JPL DE440).
- GM_M = 4902.800118 km^3/s^2 (JPL DE440).
- G = 6.67430 × 10^-11 m^3 kg^-1 s^-2 (CODATA 2022).
- a = 384400 km, explicitly a mean-separation proxy, not a newly fitted semimajor axis.
- da/dt = 0.03808 ± 0.00019 m/year.

For the Newtonian two-body relative orbital energy,
`E = -GM_E GM_M/(2 G a)`,
so
`dE/dt = GM_E GM_M/(2 G a^2) * da/dt`.

Independent SI calculation:
- dE/dt = 119.56 GW.
- Propagating only the stated da/dt uncertainty gives ±0.60 GW.
- Kepler scaling gives dP/dt ≈ 0.3503 ms/year using the period implied by the same proxy separation; using the 27.322-day sidereal period gives ≈0.3508 ms/year. Both round to 0.351 ms/year.

This reproduces Loom's rounded values. The energy rate is an approximate increase in orbital mechanical energy implied by the fitted LLR recession rate, **not** a direct measurement of total tidal heat, not a complete Earth–Moon energy budget, and not an H(s)H prediction. The uncertainty quoted here is conditional on the published recession-rate uncertainty only; uncertainties in the proxy separation, masses, model assumptions and covariance were not propagated.

## Formalization audit

Existing draft PR #1101:
- Head: `3d9c1c48fcc6f7d79ad5377bef82b49fec1aef72`.
- Exact-head GitHub Actions run #41058670419: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; full build 8,944 jobs.
- Theorem-specific axiom output reported: `[propext, Classical.choice, Quot.sound]`.
- Automated axiom audit, nanoda, tests and lint were skipped.
- PR remains DRAFT / UNMERGED and stacked on existing infrastructure PR #262.

The theorem proves only that finitely many exact values cannot identify an otherwise unrestricted real-valued function. Its witness functions are abstract and discontinuous; it does not model the reported intervals, lower bounds, correlations, likelihood or admissible rheology family. It does not establish that the full physical LLR inverse problem is non-injective. The PR text itself states these limits. No physical premise is validated by Lean.

## Architecture and epistemic disposition

The report's candidate architecture—one shared geometric mechanism with distinct Earth and Moon response operators coupled through orbital torque and energy/angular-momentum budgets—is a proposal, not a derived physical law. No Love-number map, memory kernel, (W_2(\omega)), or universal Earth/Moon (Q(P)) function has been derived from the filament/timesheet dynamics. The source-corrected distinction between common geometric mechanism and material-specific response operators is retained.

No BEDROCK promotion, theory change, PR edit, manuscript edit or new physical prediction was made. Report #1102 and its published artifact were independently checked: issue payload and destination content are exactly equal; no duplicate publication was created.

## Source links

- 2014 LLR result: https://doi.org/10.1186/s13535-014-0002-5
- 2015 lunar dissipation paper: https://doi.org/10.1002/2014JE004755
- JPL DE440 planetary parameters: https://ssd.jpl.nasa.gov/astro_par.html
- NIST CODATA 2022: https://physics.nist.gov/cuu/pdf/wall_2022.pdf
- Loom report #1102: https://github.com/Satobloc/HsH/issues/1102
- Loom PR #1101: https://github.com/Satobloc/HsH/pull/1101

**Disposition:** `SOURCE_PROVENANCE_CONFIRMED / NEWTONIAN_COMPARATOR_REPRODUCED / OVERLAPPING_LLR_DATASETS_NOT_INDEPENDENT / Q_VALUES_FIT_OR_BOUNDED / LEAN_SCOPE_LIMITED / GEOMETRIC_RESPONSE_MAP_PROPOSAL_ONLY`.
