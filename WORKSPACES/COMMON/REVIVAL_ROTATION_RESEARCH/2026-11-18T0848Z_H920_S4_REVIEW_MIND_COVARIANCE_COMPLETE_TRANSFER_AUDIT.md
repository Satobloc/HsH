# Aldus h920:s4 | Review-MIND covariance-complete transfer and field-of-view audit

**Run key:** `REVROT3-19-20261011:920:s4`  
**Nominal slot:** 2026-11-18 08:48 UTC  
**Selection:** h=920; seq=5h+4=4604; 4604 mod 19=6 → Aldus. Next ring label: Calder (index 7).  
**Disposition:** `SOURCE_GROUNDED_QC / COVARIANCE_MODEL_REFINEMENT / CANDIDATE_FOV_NOT_RESOLUTION / EXISTING_LEAN_REUSED / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION`.

This is assistant-level source-grounded work under the deterministic Aldus label, not authenticated participation by a historical Aldus thread. The recovered raw export is `Aldus [AUTO H(s)H Gitter]`, blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`, 47 user messages. Direct user instructions support broad cross-reading, exploring uncommon intersections, and deliberately diversifying perspective; no signed standalone charter or current Aldus conversation was authenticated.

## 1. New QC result

The h920:s3 architecture note proposed first-order transfer uncertainty:

\[
\Sigma_{\mathrm{pred}} \approx J_X\Sigma_XJ_X^T+
J_\eta\Sigma_\eta J_\eta^T+
\Sigma_{\mathrm{target}}+\Sigma_{\mathrm{model}}+\text{cross terms}.
\]

The component idea is useful, but the safer specification is **one joint covariance over the declared random inputs**, with explicit treatment of non-random discrepancy and nonlinearity. This is a refinement of the optional cross-resolution subtest, not a new gate/status.

## 2. Standard reference cross-read

- **JCGM 102:2011 §6.2.1.3** gives the first-order multivariate covariance propagation as \(U_y=C_xU_xC_x^T\), where \(C_x\) is the sensitivity matrix. This is the matrix form for multiple outputs sharing inputs. [Official BIPM record](https://doi.org/10.59161/JCGM102-2011) and [PDF](https://www.bipm.org/documents/20126/2071204/JCGM_102_2011_E.pdf).
- **JCGM 100:2008 §5.2.2** explicitly retains covariance terms for correlated inputs. Independence is an assumption to be established, not a default simplification. [Official BIPM record](https://doi.org/10.59161/JCGM100-2008E).
- The BIPM's current catalogue lists **JCGM 100:2008/Amd.1:2026, “Nonlinearity in measurement models”**. First-order propagation therefore needs an adequacy check; where nonlinearity is material, higher-order terms or distribution propagation (JCGM 101/102 Monte Carlo) may be required. [Current JCGM catalogue](https://www.bipm.org/en/committees/jc/jcgm/publications).

## 3. Cleaner uncertainty contract

Let \(z=(x,\eta,\epsilon,\delta)\) collect source observation/latent estimate, calibration or transfer parameters, target readout noise, and model discrepancy. If the output is locally linearized,

\[
\Delta y \approx J\Delta z,\qquad
\Sigma_y \approx J\Sigma_zJ^T.
\]

The **joint** \(\Sigma_z\) retains every cross-block covariance. The block expansion contains both \(J_i\Sigma_{ij}J_j^T\) and its transpose for each correlated pair. Do not omit them unless the independence relation is supported by the acquisition/calibration lineage.

`δ` is not automatically a random variable. If model discrepancy is a deterministic unknown, bounded nuisance, or systematic bias, keep it in a bias/bound or sensitivity analysis; do not manufacture a covariance term. If a probability model is assigned, document its source and dependence.

For nonlinear \(f\) or response operators, report the linearization point and adequacy test. If it fails, use a justified higher-order or Monte Carlo propagation. Never tune the transfer, shrink its uncertainty, or estimate a rescue discrepancy from the holdout.

## 4. Geometry and transfer typing

Use a typed chain:

`latent state X → calibrated response K_r(·; η_r) → native readout Y_r → declared observable O_r`.

A direct transfer \(T=K_{r2}\circ K_{r1}^{-1}\) is only defined where the source response is invertible and the inverse is stable/identifiable. Otherwise specify the estimator or restricted identifiable range and its uncertainty. A shape analogy is not a composition map.

Record separately:
- paired degradation/resampling of one acquisition (pipeline stress; shared-data dependence, **not** independent validation);
- genuinely distinct acquisitions/conditions, with acquisition lineage and any shared calibration/nuisance covariance;
- independently calibrated target response and frozen source prediction;
- native-space scoring or an explicit dimension/unit-compatible comparison map.

## 5. Candidate-source correction: Kelvin-vortex cameras are complementary views, not a demonstrated resolution pair

The primary paper, Barckicke, Falcon & Gissinger, *Kelvin wave propagation along vortex cores*, Nature Physics 22 (2026), DOI `10.1038/s41567-026-03175-w`, reports two lenses (8-mm wide-angle and 12-mm small-angle) for **complementary views**. The Methods report both horizontal and vertical resolution at 60 μm/px, a 0.5-mm contour width, typical core-radius/position uncertainty about 0.1 mm, 300 fps, and 30-s records. Thus lens/FOV differences are not, from these reported specs alone, a resolution contrast. They cannot be promoted as a natural cross-resolution transfer test.

The paper's public dataset DOI is `10.6084/m9.figshare.30903347`. The manifest, file lineage, raw bytes, covariance, and independent-acquisition status were not retrieved. No data were downloaded or analyzed. This remains a candidate for **view/FOV complementarity or paired pipeline characterization**, subject to a manifest and acquisition-lineage audit, not a cross-resolution validation fixture.

Source: [article](https://www.nature.com/articles/s41567-026-03175-w); [author-hosted PDF, Methods lines 233–237](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf); [data DOI](https://doi.org/10.6084/m9.figshare.30903347).

## 6. Proof-first check and reuse

Existing draft PR **#1416**, “Sable: formalize two-contour vortex readout covariance,” formalizes the source-specific \(A\Sigma A^T\) readout and identities including \(\mathrm{Cov}(\eta,a)=(v_0-v_\pi)/4\). Its exact head `46de846382661f4380fe214a70a8ed95b5a8f150` has a successful Lean 4 verification run [#42217720864](https://github.com/Satobloc/HsH/actions/runs/42217720864). The checkout-identity assertion and compile steps passed. The PR is open/draft and stacked on open draft PR #1189, so this is not main-integrated.

That formalization verifies a fixed two-channel linear map. It does **not** formalize this generalized transfer protocol, establish the response-map translation, supply raw covariance, or validate a physical prediction. The generic joint-covariance specification above was not formalized or run in Lean this turn; no local Lean toolchain was available. No new PR/module was created.

## 7. Gates and boundaries

- P0 Code Grurple remains ACTIVE (issue #1747 open; live reader route not freshly tested).
- P1 Orson cognition remains open/overdue/not-ready and Orson-owned (issue #564); no reassignment or manuscript edit.
- P2 real-system geometry remains HOLD; no system/data selected.
- P3 full theory remains INCOMPLETE; November 30 and December 14 gates remain separate.
- FIE review next due November 24; not due.
- Mersearch was not callable; four request lanes remain occupied. GitHub and public primary sources were a disclosed fallback. SAT archive root orientation was read; HSH_RESOURCES README/index only, no research payload. No new tooling, subscription, or expenditure.
- No physical calculation, fit, prediction, empirical result, experiment, human subject, API model run, or theory promotion.

## 8. Reproducibility and next useful step

Before any transfer experiment: fetch and version the actual dataset manifest; identify acquisition IDs and camera/lens/FOV/calibration versions; determine whether pairs are same acquisition, independent recordings, or merely complementary views; obtain measured response calibration and a joint uncertainty/provenance ledger; preregister transfer operator, target prediction, comparator, holdout unit, score, practical threshold, and linearization/nonlinearity adequacy. If the data do not contain a genuine resolution contrast, select a different measured system rather than relabeling FOV as resolution.

This audit adds a covariance-typing and source-eligibility refinement only. No P2 selection or theory-state change.
