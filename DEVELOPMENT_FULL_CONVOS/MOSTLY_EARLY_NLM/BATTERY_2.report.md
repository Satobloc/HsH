# BATTERY_2 Static Analysis Report

## Golden Manifest
- **sat_full.py** — exists: `True`, size: `4542` bytes, sha256: `af616b5a6a6265b2a0e8d4954c831e3dafe02132300842688423b72f885927fb`
- **sat_core_report.py** — exists: `True`, size: `5644` bytes, sha256: `97764843ef9fb02e3151860a40cdf5f651a42ec016fe49364621b13cc3bf89d1`
- **LEAN_MODE.md** — exists: `True`, size: `3588` bytes, sha256: `61833a85b31639b14949d50837305f11a2a674cda43d6045f51d2cf4e3db6351`

## Static AST Audit — sat_full.py
- Banned imports: none
- Banned calls: none
- Env reads: 
  - v.get @L108
- Suspicious literals: none

## Static AST Audit — sat_core_report.py
- Banned imports: 
  - import os @L9
- Banned calls: 
  - open @L18
  - open @L27
  - sys.exit @L34
  - sys.exit @L34
  - sys.exit @L53
  - sys.exit @L53
- Env reads: 
  - cosmo_cfg.get @L82
  - v.get @L102
  - t.get @L125
  - v.get @L147
- Suspicious literals: none

## Numerical Risk Heuristics — sat_full.py
- Division denominators at lines: [35, 39, 44, 51, 52, 63, 67, 69, 70, 100, 103]
- Heuristic hints:
  - potential cancellation (x - y): `LEAN-COMPLIANT` @L1
  - potential cancellation (x - y): `LEAN-compliant` @L2
  - potential cancellation (x - y): `re-upload` @L5
  - potential cancellation (x - y): `SAT-FULL` @L8
  - potential cancellation (x - y): `two-point` @L45
  - potential cancellation (x - y): `K_mu - dK_mu_tau` @L55
  - potential cancellation (x - y): `model-dependent` @L64
  - potential cancellation (x - y): `x - x0` @L70
  - division usage: `/ m_star` @L35
  - division usage: `/ m_star` @L39
  - division usage: `/m1` @L44
  - division usage: `/ delta_K` @L44
  - division usage: `/m_e` @L51
  - division usage: `/lam` @L51
  - division usage: `/m_mu` @L52
  - division usage: `/lam` @L52
  - division usage: `/ (` @L63
  - division usage: `/math` @L67
  - division usage: `/max` @L70
  - division usage: `/db` @L103
  - division usage: `/db` @L103

## Numerical Risk Heuristics — sat_core_report.py
- Division denominators at lines: [13, 14, 56, 57, 80, 81, 82]
- Heuristic hints:
  - potential cancellation (x - y): `LEAN-COMPLIANT` @L2
  - potential cancellation (x - y): `LEAN-compliant` @L3
  - potential cancellation (x - y): `re-upload` @L6
  - potential cancellation (x - y): `re-upload` @L52
  - potential cancellation (x - y): `core-in` @L56
  - potential cancellation (x - y): `Kill-Criteria` @L124
  - division usage: `/mnt` @L12
  - division usage: `/data` @L12

## API & Contract Surface — sat_full.py
- Functions:
  - mass_from_theta(m_star, theta4) @L31
  - theta_from_mass(m_star, m) @L34
  - implied_sin2_theta(m_star, m) @L38
  - lambda_from_mass_ratio(m1, m2, delta_K) @L41
  - predict_ratio_from_lambda(delta_K, lam) @L47
  - assign_K_three_masses(m_e, m_mu, m_tau, lam) @L50
  - overlap(delta_K, lam) @L58
  - gminus2_mu_estimate(lam, deltaK_mu_L4, m_mu_GeV, m_L4_GeV, m_H_GeV, prefactor) @L61
  - delta_beta_deg(g_theta_gamma, delta_theta4) @L66
  - theta4_kink_profile(x, x0, width, delta) @L69
  - run_tests() @L73
  - tests_green(results) @L107
- Classes:
  - class FitResult @L27

## API & Contract Surface — sat_core_report.py
- Functions:
  - sha256_of(path, chunk) @L16
  - load_json(path, default) @L25
  - ensure_import() @L31
  - format_table(rows, headers) @L42
  - main() @L50

## Boundary-Value Scaffolds
- Declared/assumed domains: λ ∈ [0,1], masses > 0, angles (0°, 180°).
- Suggested boundary vectors:
  - λ ∈ {0.0, 1e-6, 0.5, 0.999999, 1.0}
  - m_mu scale ∈ {0.999, 1.0, 1.001}
  - tilt ∈ {−0.1°, 0°, +0.1°}
- Expected acceptance: interior points; Expected rejection: λ < 0 or λ > 1, masses ≤ 0, angles ≤ 0° or ≥ 180°.

## Determinism & Purity — sat_full.py
- random_usage: False
- time_usage: False
- global_mutation: False
- module_side_effects: True

## Determinism & Purity — sat_core_report.py
- random_usage: False
- time_usage: True
- global_mutation: False
- module_side_effects: True

## Complexity Hotspots — sat_full.py
- run_tests: 5
- lambda_from_mass_ratio: 2
- assign_K_three_masses: 1
- delta_beta_deg: 1
- gminus2_mu_estimate: 1
- implied_sin2_theta: 1
- mass_from_theta: 1
- overlap: 1
- predict_ratio_from_lambda: 1
- tests_green: 1
- theta4_kink_profile: 1
- theta_from_mass: 1

## Complexity Hotspots — sat_core_report.py
- main: 24 (HIGH)
- sha256_of: 4
- load_json: 3
- ensure_import: 2
- format_table: 2

## Spec/Report Sync
- g_minus_2_window: `3×10` (from report)
- birefringence_threshold: `0.01°` (from report)