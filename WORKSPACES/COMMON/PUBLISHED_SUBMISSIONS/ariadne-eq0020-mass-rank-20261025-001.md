# EQ-0020 — SATO/Blockwave mass-spectrum rank defect

Worker: Ariadne. Handoff: Alberr. Date: 2026-10-25 (Eastern).

Status: **HISTORICAL GENERATED CONSTRUCTION PRESERVED; DIMENSIONALLY TYPED; CALIBRATION CLAIM FAILS ALGEBRAIC IDENTIFIABILITY AND THREE-ANCHOR CONSISTENCY; SOURCE NUMBERS REPRODUCE A TACHYONIC ELECTRON; NOT MATHEMATICALLY CLEARED; NOT AN H(s)H CANDIDATE; NOT BEDROCK; NOT ESTABLISHED PHYSICS.**

## Retrieval and source

Mersearch-first was attempted through the shared request surface. It remains occupied by `2026-10-21-orson-nlm-big-haul-math-001`, status `requested`; therefore bounded direct GitHub retrieval was used, without claiming comprehensive ancestry.

Primary audited record: `SAT_THEORY_ARCHIVE_2023-25/DEV CONVERSATION/detailed versioning.txt`, full read 1,324 lines / 78,032 characters, blob `4f059df586b6fac6d0cbf41b70895d361f7bb6f4`. The file first entered the repository in commit `e1bfd666c45fb80d53118a9d894e6efacbe42e48`, 2026-05-31T23:41:25Z; audit snapshot commit `8d49183464ad8fb2411d5b8e13c6408eecd39e18`, 2026-10-23T14:18:13Z. Genre: NotebookLM/generated synthesis, so provenance/maturity is `GEN/HISTORICAL`, not Nathan Direct and not proof.

Verbatim mathematical content:

```text
* m² = k (N + β Q² - a)
...
Setting N=0 for these ground states, we establish a system of three linear equations:
1. m_e² = k (β(1)² - a) = k(β - a)
2. m_π² = k (β(2)² - a) = k(4β - a)
3. m_p² = k (β(3)² - a) = k(9β - a)
Solving this system of equations for the parameters k, β, and a by calibrating to the known masses yields the following values:
* k = 581,025 (MeV/c²)²
* β = 0.1852
* a = 0.2469
```

The same source later acknowledges that this parameter set makes the `Q=1,N=0` ground state “Tachyonic (unphysical)” and gives `535.2` and `907.7 MeV/c²` for the other ground states. This internal correction is retained; it does not repair the earlier calibration claim.

## Earliest unsupported edge: rank and consistency

At `N=0`, define `A=kβ` and `C=ka`. Then

`m(Q)^2 = A Q^2 - C`.

Ground states contain only two identifiable combinations, not three independent parameters. For every nonzero `t`, the transformation

`(k,β,a) -> (tk, β/t, a/t)`

leaves every ground-state mass unchanged while changing the excited-state spacing from `k` to `tk`. Thus three ground anchors cannot identify `k`, `β`, and `a`; an excited level or independent tension scale is required.

There is a stronger failure. Exact agreement at `Q=1,2,3` requires the three points `(Q²,m²)` to be collinear:

`(m_π²-m_e²)/3 = (m_p²-m_π²)/5`.

Using NIST 2022 CODATA electron/proton mass energies and the PDG 2025 charged-pion fit gives respectively `6493.210881608165` and `172174.924007717200 MeV²`, a factor `26.516145424354` apart. Therefore no exact values of `k,β,a` can satisfy the claimed three equations.

## Dimensions, signs, limits, topology

- Dimensions pass only conditionally: `k` has mass-squared units and `N,Q,β,a` are dimensionless.
- Reality/sign gate: `N+βQ²-a >= 0` is required for real mass. The source values violate it for `N=0,Q=1`: `m²=-35849.2425 MeV²`.
- For `k>0`, `m~sqrt(kN)` as `N->infinity`; adjacent `m²` levels differ by `k`.
- `k<0` would make sufficiently high levels non-real, so the advertised unbounded oscillator ladder requires `k>0`.
- `Q=L_wind+L_link+W_writhe` is typed as dimensionless, but the source does not prove that this sum is a conserved topological invariant under the admissible worldtube moves; writhe is geometric and generally deformation-dependent. The separate identification `Q=filament count` is also asserted, not derived.
- Current H(s)H guards prohibit direct `Q->m` control and automatic `Q<=3`; no transfer to finite-core H(s)H is licensed.

## Versioned benchmark comparison

Benchmarks: NIST 2022 CODATA `m_ec²=0.51099895069(16) MeV`, `m_pc²=938.27208943(29) MeV`; PDG 2025 `m_pi±=139.57039±0.00018 MeV`.

The source parameter set gives:

- electron: negative mass-squared, no real mass;
- pion: `535.69417348 MeV`, not `139.57039 MeV`;
- proton: `908.29367360 MeV`, not `938.27208943 MeV`.

These are calibration residuals, not independent predictions. Because the calibration system itself is inconsistent and rank-deficient, no CODATA verification program can be entered for the excited ladder. A least-squares fit would be a new, explicitly tuned model and would still need an independent observable fixing `k`.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Audit archived SATO/Blockwave mass law m^2=k(N+beta Q^2-a)."""
from math import sqrt
me, ume = 0.51099895069, 0.00000000016
mpi, umpi = 139.57039, 0.00018
mp, ump = 938.27208943, 0.00000029
k_src, beta_src, a_src = 581_025.0, 0.1852, 0.2469
def m2(k, beta, a, N, Q): return k * (N + beta * Q * Q - a)
def mass_or_nan(k, beta, a, N, Q):
    x = m2(k, beta, a, N, Q)
    return sqrt(x) if x >= 0 else float("nan")
A12 = (mpi**2 - me**2) / 3
A23 = (mp**2 - mpi**2) / 5
C12 = A12 - me**2
C23 = 4*A23 - mpi**2
print(f"electron_CODATA2022_MeV={me:.11f} +/- {ume:.11f}")
print(f"pion_PDG2025_MeV={mpi:.5f} +/- {umpi:.5f}")
print(f"proton_CODATA2022_MeV={mp:.8f} +/- {ump:.8f}")
print(f"source_A=kbeta={k_src*beta_src:.6f} MeV^2")
print(f"source_C=ka={k_src*a_src:.6f} MeV^2")
for Q, name, obs in [(1,'electron',me),(2,'pion',mpi),(3,'proton',mp)]:
    print(f"source_{name}_m2={m2(k_src,beta_src,a_src,0,Q):.6f} MeV^2; mass={mass_or_nan(k_src,beta_src,a_src,0,Q)}; observed={obs}")
print(f"slope_Q1_Q2_A12={A12:.12f} MeV^2")
print(f"slope_Q2_Q3_A23={A23:.12f} MeV^2")
print(f"slope_ratio_A23_over_A12={A23/A12:.12f}")
print(f"collinearity_defect={A23-A12:.12f} MeV^2")
print(f"C_from_e_pi={C12:.12f} MeV^2")
print(f"C_from_pi_p={C23:.12f} MeV^2")
t=7.0; k2,beta2,a2=t*k_src,beta_src/t,a_src/t
for Q in (1,2,3): assert abs(m2(k_src,beta_src,a_src,0,Q)-m2(k2,beta2,a2,0,Q))<1e-8
print(f"rescaling_t={t}: ground_states_identical=PASS")
print(f"excited_spacing_original_k={k_src:.6f} MeV^2")
print(f"excited_spacing_rescaled_k={k2:.6f} MeV^2")
print("dimension_check: PASS if k has mass^2 and N,Q,beta,a are dimensionless")
print("large_N_limit: m~sqrt(kN), requires k>0")
print("reality_condition: N+beta*Q^2-a >= 0")
print("topology_check: integer Q is typed but Q=winding+linking+writhe is not proved invariant here")
assert k_src*(beta_src-a_src)<0
assert abs(A23/A12-26.516145424354)<1e-9
assert C12 != C23 and k2 != k_src
print("ALL_ASSERTIONS_PASSED")
```

Executed output, exit 0:

```text
electron_CODATA2022_MeV=0.51099895069 +/- 0.00000000016
pion_PDG2025_MeV=139.57039 +/- 0.00018
proton_CODATA2022_MeV=938.27208943 +/- 0.00000029
source_A=kbeta=107605.830000 MeV^2
source_C=ka=143455.072500 MeV^2
source_electron_m2=-35849.242500 MeV^2; mass=nan; observed=0.51099895069
source_pion_m2=286968.247500 MeV^2; mass=535.6941734796077; observed=139.57039
source_proton_m2=824997.397500 MeV^2; mass=908.2936735990182; observed=938.27208943
slope_Q1_Q2_A12=6493.210881608165 MeV^2
slope_Q2_Q3_A23=172174.924007717200 MeV^2
slope_ratio_A23_over_A12=26.516145424354
collinearity_defect=165681.713126109040 MeV^2
C_from_e_pi=6492.949761680558 MeV^2
C_from_pi_p=669219.802266116720 MeV^2
rescaling_t=7.0: ground_states_identical=PASS
excited_spacing_original_k=581025.000000 MeV^2
excited_spacing_rescaled_k=4067175.000000 MeV^2
dimension_check: PASS if k has mass^2 and N,Q,beta,a are dimensionless
large_N_limit: m~sqrt(kN), requires k>0
reality_condition: N+beta*Q^2-a >= 0
topology_check: integer Q is typed but Q=winding+linking+writhe is not proved invariant here
ALL_ASSERTIONS_PASSED
```

Python SHA-256 `f1f493c980ca2d9a56b344f1f46bce3f85f8e3d146d9dfbe1351c4faf53cc09c`; output SHA-256 `232f23284028eb25c3d16bf389d4c2b14d38ee3faac108089f88f6c532a09528`.

## Lean verification

```lean
import Mathlib
namespace HsHVerification.ArchiveEQ0020
def massSq (k β a : ℝ) (N Q : ℝ) : ℝ := k * (N + β * Q^2 - a)
theorem ground_reparametrization (k β a t Q : ℝ) (ht : t ≠ 0) :
    massSq (t*k) (β/t) (a/t) 0 Q = massSq k β a 0 Q := by
  field_simp [massSq, ht] <;> ring
theorem excited_spacing (k β a N Q : ℝ) :
    massSq k β a (N+1) Q - massSq k β a N Q = k := by ring
theorem source_electron_is_negative :
    massSq 581025 (1852/10000) (2469/10000) 0 1 < 0 := by
  norm_num [massSq]
theorem three_anchor_slopes_disagree :
    (((13957039/100000 : ℚ)^2 - (51099895069/100000000000 : ℚ)^2) / 3) ≠
    (((93827208943/100000000 : ℚ)^2 - (13957039/100000 : ℚ)^2) / 5) := by
  norm_num
theorem multiplying_k_changes_excited_spacing (k t : ℝ) (ht : t ≠ 1) :
    t*k - k = (t-1)*k := by ring
end HsHVerification.ArchiveEQ0020
```

Formal commit: `cf90011facfd3b80c13ef4abe6b184141badd0d2`, cumulative verification branch. CI receipt is tracked separately; the proof checks only stated algebra/order facts.

## Required reading round

- Full live `BEDROCK.md`: 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`.
- Full subordinate `STATE_OF_THE_THEORY.md`: 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Actual random draw: `Math.random()=0.42392243946343544` from 254 text/Markdown/JSON blobs sized 20–180 kB after excluding obvious SAT/HsH/theory/math-name matches; index 107 selected `FREEFORM DISCUSSION/BULBEK.txt`. Full read: 1,135 lines / 50,098 characters, blob `8a2ea6cb4a2e969ca2fa067c70afcc82bbad7822`. Honest takeaway: this is non-SAT Oxbow/Bulbek worldbuilding. Its useful methodological lesson is not physics but source discipline—the user's corrections repeatedly replace plausible AI elaboration with the intended cultural mechanics; generated fluency is not source authority.

## Verdict and reopening discriminator

`Syntax/dimensions: CONDITIONAL PASS.` `Ground calibration: FAIL.` `Parameter identifiability: FAIL.` `Topology-to-mass bridge: UNPROVED.` `CODATA/PDG anchors: COMPARED; SOURCE VALUES FAIL.`

Preserve the law as historical and potentially useful as a generic two-coordinate plotting family in the UI, not as a particle-mass derivation. Reopen physical consideration only with: (1) an independently derived invariant `Q`; (2) an independent observable fixing `k`; (3) a declared fitting protocol and covariance; (4) held-out particle assignments fixed before comparison; and (5) out-of-sample residuals against a versioned spectrum. No repair may silently reassign anchors after seeing residuals.
