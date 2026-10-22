# Meridian | Archive read, exact 4D geometric comma, optical toy audit | 2026-10-21

**STATUS:** SANDBOXED exact geometric calculation and archival arithmetic audit. No derivation of B, no verified physical optical anomaly, no adjustable constants added. Assistant-authored; not Nathan Direct or a BEDROCK amendment.

## Read provenance
Current controls and continuation examined: `BEDROCK.md` (BR-007/008 and relevant modern premise sections), `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md`, Meridian `NEW_INSTANCE_START_HERE.md`, `MERIDIAN_CONTINUITY_2026-10-21_CRULLER_NLM_ROTATION.md`, `SANDBOX_2026-10-21_CRULLER_SIGNED_WINDING_INSTABILITY.md`, `SANDBOX_2026-10-21_CRULLER_RELATIVE_REVERSE_WINDING.md`, `SANDBOX_2026-10-21_PYTHAGOREAN_COMMA_SO4_CLOSURE_GATE.md`.

Actual older source passages inspected through GitHub connector, not Mersearch:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` (first 250 lines), blob `1854995be3311f565739f2be64269cbb0385a82f`: 4D plane winding, historical distinct B0/B_stable/Phi; inherited source contains historical tension with newer bedrock, not automatically authority.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Early Misc/Thread1todate.txt` (initial + further early conversation sections), blob `51d97361b1b3625a80ae183ab693e2350016f6f9`: original optical experimental-lab aims.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Early Misc/Thread2todate.txt` first 230 lines; early speculative topological and scalar lab model.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CODE OUTPUT/EMERITUS_CODE.txt` first 200 lines, blob `cfb550e1703bbe6e59118325cc6ff8d95dfa8418`: optical `eta=0.02` toy code.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HOLONOMY DRAFT.txt` initial 180 lines: explicitly retains a free dimensionless ratio and is historical/draft, incompatible with the current **zero adjustable constants** requirement if reused unchanged.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS THE FRAMEWORK.txt` opening passages (out-of-topic periodic archival read): equivalence of observationally indistinguishable representations; no automatic ontic privilege.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt` first 195 lines, blob `33785afb8d46804122d79056b952169f99b325e2`: old fourth-order bending expression, loose spectrum-to-GR bridge; kappa and curve parameter not unambiguously physically typed.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/EARLY CLOSURE SAT DEBUG LAB 1-2 NLM COLLABORATION.txt` first 175 lines, archival NLM report of tau annealing/Dirac constraints; numerical tables are NOT reverified simulations.

**Mersearch gate:** Shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` occupied by Orson `2026-10-21-orson-nlm-big-haul-math-001`. Workflow 39692587169 read as in_progress; request-specific indexed result directory absent at retrieval. Did NOT run Mersearch, did NOT overwrite slot. Fallback GitHub searches and direct reads cover accessible SAT/HsH, not certified all-three-repo search. Historical source dates not inferred from filenames.

## Exact 4D normal holonomy, already-seeded 2:3 curve

Define in native R4 with Euclidean dot product, a mathematical closed curve on unit S3 (NOT a periodic physical worldline):
```
C_chi(u) = (cos(chi) cos(pu), cos(chi) sin(pu),
            sin(chi) cos(qu), sin(chi) sin(qu))
0<=u<=2pi, p,q positive integers, 0<chi<pi/2.
a1=(cos pu,sin pu,0,0), a2=(0,0,cos qu,sin qu)
e1=(-sin pu,cos pu,0,0), e2=(0,0,-sin qu,cos qu)
v = |C'| = sqrt(p^2 cos^2(chi) + q^2 sin^2(chi))
N0=C
N1=-sin(chi) a1+cos(chi) a2
N2=(q sin(chi) e1-p cos(chi) e2)/v
```
These are orthonormal normal directions to the tangent: `N0` radial and `N1,N2` tangent to S3. The ambient R4 normal connection has `N0' = v T`, so N0 does not mix into the normal subspace, and
```
A12 = N1'(u) . N2(u) = - p q / v .
K = p q / v
H_normal = exp(2 pi K J) in SO(2) <= SO(3)
Spec(H_normal)={1,exp(+2pi i K),exp(-2pi i K)}.
```
Orientation sign conventions invert the phase; the SO3 principal eigenangle is gauge invariant. This is normal-bundle holonomy of the **embedded curve**, not ambient Riemann curvature, not a nonzero field strength of a global moving frame, and not proof of material transport law without material directors.

For historical equal-amplitude (p,q)=(2,3), chi=pi/4:
```
v=sqrt(13/2)
K=12/sqrt(26)=2.3533936216582085... (IRRATIONAL)
one-loop residual Delta=2pi*(K-2)=2.2204376112538373 rad
```
Since K irrational, no finite positive integer n has `nK` integer. The curve itself closes after one circuit, while a normally parallel transported orientation never exactly closes at any finite multiple of the base period. This is an exact **geometric comma** (incommensurate closure frustration) without a fitted numeric coefficient, conditional on selecting this particular fixture. Kronecker irrational-rotation result implies dense relative phases for repeated circuits.

Successive best near-returns in n=1..500, computed with Python:
```
n=1:   2.22043761125384 rad
n=2:   1.84231008467191
n=3:   0.37812752658193
n=14:  0.32979997834422
n=17:  0.04832754823771
n=116: 0.03983468891790
n=133: 0.00849285931989
```
These are `2pi*abs(nK-round(nK))` (principal mismatch for chosen n), NOT the musical Pythagorean comma.

**Negative selection control:** For same winding p=2,q=3 and variable amplitude angle chi, `K(chi)=6/sqrt(4cos^2chi+9sin^2chi)` continuously varies from 3 to 2. Hence its modulo-one holonomy sweeps all possible angles. By *choosing* `chi~1.30624731603 rad=74.8424582 deg`, one can match the previously constructed `4pi log2[(3/2)^12/2^7]=0.2456726543 rad`. This is a forbidden match-by-selection as a claim of parameter-free prediction. At the actual equal-amplitude chi=pi/4, the independent angle is 2.22043761 rad, not 0.24567265, and historic B0=3/(4pi) remains a distinct construct. The two-plane angular coordinate chi is a geometric initial configuration, NOT an adjustable law constant; its *selection* needs derivation for a universal number.

## Re-evaluated older optical toy: published 0.125 not reproduced by specified code
Source `CODE OUTPUT/EMERITUS_CODE.txt` uses `x=linspace(-10,10,1000)`, `theta4=(2pi/3)*(1+tanh(x))/2`, `eta=.02`, `delta_n=eta*sin(theta4)^2`, and `delta_phi=trapz(delta_n,x)`.
Independent actual execution (NumPy + SciPy trapezoid, same 1000 x points):
```
integral = 0.1628941021696857
```
Not 0.125 reported in parts of early archive. It is not a dimensionally valid physical optical phase until the spatial coordinate and wavenumber are specified. Eta=.02 is a toy input; no parameter-free optical coincidence is established. Perhaps an earlier 0.125 run used different inputs; do not claim that all variants are disproven.

## Next gates
1. Under current Cruller material geometry, identify *which* director/normal-frame orientation is materially observable and the actual successive-section return map. Avoid conflating closed S3 internal curve with physically monotone time.
2. Derive from geometry and known physics any allowed chi amplitude selection or conserved quantity; otherwise leave holonomy as a family, not a universal constant.
3. Compare normal SO3 transport, SO4 ambient isoclinic two-plane relative phase, and the `B(Q,topology)` material response separately.
4. Reconstruct the historical 0.125 optical model with correct k0 and physical dimensions as separate comparator; no fitted eta or target-driven selection.
5. Repeat archival Mersearch discovery when shared slot is unoccupied, using all three permitted corpora; trace original earliest B and optical formulas.
6. Continue finite-core/reach and length-conserved Cruller stability tests, without importing unidentified material stiffness.

**Figures (created by actual Python execution in ChatGPT runtime, not GitHub):**
`/mnt/data/meridian_4d_geometric_comma_holonomy.png`
`/mnt/data/meridian_4d_geometric_comma_nearreturns.png`

Research status: exact geometry, conditional physical interpretation; no BEDROCK/publication promotion. Meridian.
