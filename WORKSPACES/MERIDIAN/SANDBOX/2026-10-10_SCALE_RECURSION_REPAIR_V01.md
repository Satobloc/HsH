# SANDBOXED | Meridian | 2026-10-10 | Repair of nuclear scale-recursion defect

Status: NEW constructive mathematical repair prompted by historical notebook text, NOT a recovered original derivation and NOT an established physical model.

## Provenance
Historical trigger: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/[🗄️] 🍩 ONE DROP UNIVERSE__NotebookLM_export.json`, messages 450, 456, 462, 468, 472, 474, 476. Message 476 proposes `Delta_s = B_3(s ell) o C_s^(tensor 3) - C_s o B_3(ell)` but never specifies domains/codomains. The export labels all messages user even where notebook-generated; authorship unverified. The historical FCC/24-cell construction is NOT presumed a current SAT ontology.

## 1. Correct the typing
Let I be a parameter interval and F = (H^2(I,R^4))^9 be configurations of nine 4D filament centrelines gamma_{a i}(s), a=1,2,3 nucleon bundles, i=1,2,3 strands per bundle. A fixed common parametrization s is a modeling assumption, not a physical identification of strand points. Let E = (H^2(I,R^4))^3 be three coarse-grained centrelines.

Define coarse-graining C:F->E by Gamma_a(s)=(1/3) sum_i gamma_{a i}(s), with delta_{a i}=gamma_{a i}-Gamma_a and sum_i delta_{a i}=0.

An energy on F cannot be subtracted from an energy on E without lifting one to the same domain. The **scalar coarse-graining defect** is therefore
D[gamma] = E_fine[gamma] - E_eff[C(gamma)].
D is a scalar functional on F, with units of energy, if both energies have units of energy. It is NOT a commutator between unlike operators. Alternatively for dynamical operators T_f:F->F and T_e:E->E, the **map defect** is C(T_f gamma)-T_e(C gamma) in E, provided all maps and parameterizations are well defined.

These defects test distinct questions: energy closure vs dynamic closure.

## 2. Exact toy identity for interbundle quadratic energy
At a fixed s, let k>=0 be a spring coefficient with energy/length² units per filament pair and define for each pair of bundles a,b:
V_ab^fine(s) = (k/2) sum_{i=1}^3 sum_{j=1}^3 ||gamma_{a i}(s)-gamma_{b j}(s)||².
Write gamma_{a i}=Gamma_a+delta_{a i}. Expanding the square and using sum_i delta_{a i}=0 yields exactly
V_ab^fine = (9k/2)||Gamma_a-Gamma_b||² + (3k/2) sum_i ||delta_{a i}||² + (3k/2) sum_j ||delta_{b j}||².
The natural center-only effective model is V_ab^eff=(9k/2)||Gamma_a-Gamma_b||². Thus
D_ab(s) = (3k/2)(sum_i ||delta_{a i}||² + sum_j ||delta_{b j}||²) >= 0.
For the complete three-bundle graph with all three pairwise interactions:
D_total(s)=3k sum_{a=1}^3 sum_{i=1}^3 ||delta_{a i}(s)||².
Integrate ds with k interpreted as energy/(length² times s-unit) for a total energy, or let V(s) be energy per unit s. This identity is exact for the stated all-to-all harmonic toy coupling, NOT a nuclear binding law. It says internal strand variance carries energy discarded by a center-only reduction. It does NOT show attractive nuclear binding or predict a He-3 energy.

## 3. Four-dimensional bending also splits exactly
With a common affine parameter s and a quadratic bending functional K_f=(κ/2) sum_{a,i} integral ||gamma_{a i}''(s)||² ds,
K_f=(3κ/2) sum_a integral ||Gamma_a''||² ds + (κ/2) sum_{a,i} integral ||delta_{a i}''||² ds.
The cross terms vanish because sum_i delta_{a i}''=0. Thus an effective centerline bending modulus 3κ omits a nonnegative internal bending variance. This is a second independent, exact scale-recursion identity. It is **not invariant under arbitrary reparametrizations**; use a shared affine coordinate or replace by a properly parameter-invariant elastic-rod model. Neither identity introduces a 3D torus or demands that filaments close in 3D.

## 4. What remains unknown
- Actual 4D core/worldtube geometry and suitable admissible finite-core constraints.
- Whether physical interactions are all-to-all quadratic, topological, local-contact, timesheet-mediated, or mixed.
- Relative phases and longitudinal offsets; pointwise matching s across filaments may be wrong for braids.
- Gauge/reparametrization invariance, units and dynamic timesheet coupling.
- Boundary data for a nucleus, electromagnetic contributions, spin/isospin, proton-neutron distinction, Pauli constraints.
- Constitutive coefficient κ and interaction k; neither can be fitted to He-3 then advertised as a parameter-free prediction.

## 5. Arithmetic correction
Notebook source messages 456/474 state E = 0.078*0.22*(1/96)*pi*(9640 MeV), which is approximately 5.413435 MeV (not 53.04 MeV). Multiplying by Phi=0.246 yields ~1.331705 MeV (not 13.05 MeV). The previous 1/144 version is ~3.608957 MeV, and with Phi ~0.887803 MeV. This is an arithmetic check only, not a physical endorsement. Correcting a factor of ten does not rescue the unsupported model coefficients.

## 6. Hagalaz notation candidate
A six-component antisymmetric angular-velocity matrix Ω in so(4) can label infinitesimal 4D rotations, but a generic so(4) element is not automatically a full ᚼ operation. For an SO(4) frame R(s), Ω(s)=R(s)^T R'(s) satisfies Ω^T=-Ω. The six independent entries Ω_12, Ω_13, Ω_14, Ω_23, Ω_24, Ω_34 form a local coordinate representation of rotational rate. If ᚼ includes scaling, translation, and recursion, it needs extra data; do not silently identify the six-rate tuple with the six slots of the user-defined ᚼ grammar. Test transformation law under frame changes before making notation canonical.

## 7. Test suite proposed
- Symbolically expand pairwise quadratic interaction for 3×3 strands and compare coefficients 9,3,3.
- Check invariance of center+variance decomposition under rigid SO(4) rotations and translations.
- Check vanishing D iff delta=0 (for positive k), and nonvanishing for nontrivial internal strands.
- Compare quadratic bending decomposition with finite differences on 4D helical strands.
- Probe nonlinear/contact couplings; identify where simple variance closure fails.
- Recover original SAT 4DHH and ᚼ operator source definitions with Mersearch `equiv:`, `contains:`, `value:` once callable.
- Record numeric formulas and expected values in equation registry with candidate status; no promotion based on notebook prose.

Meridian ◈
