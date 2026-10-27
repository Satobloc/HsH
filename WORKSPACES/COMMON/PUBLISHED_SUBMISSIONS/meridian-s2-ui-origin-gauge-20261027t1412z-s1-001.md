# Meridian :12 | S2 orbit, UI origin-gauge failure, and typed coiling

**Run:** REVROT3-19-20261011:398:s1, nominal 2026-10-27T14:12Z. Selected Meridian, next Mercer. Current assistant source-grounded reconstruction, NOT authenticated original Meridian. No scheduler change, BEDROCK promotion, physical theory prediction, or cross-thread delivery.

## Sources

- Live BEDROCK Git blob 4cabda482c48c217614b868a2138409275df9bf7, Steering Charter b9b8de55f8d5add7c42cf80be7c34677ee36305e, Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, Meridian continuity c757a7a78d59bdd4945d3357747fb09d267b5a93 and solver harness README 66d61f3d33aafc0def26740a267e43e858f6b263 consulted.
- Original Nathan Direct user-role messages 2a34f106 (Kerr core, probable shell, then coiling) and b282ba5d (coiling IS periodicity) from Sept 7 Ravel conversation, verified batch 04 blob 7d35aa1ea4c2752b78d4ffcab8eb51022b8c7cd8; batch 05 blob 0d948062a064ee3db0d5bc39ce0ad46829e222d4. Exact original sketches and raw adjacency not reexamined; do not attribute assistant equations to Nathan.
- Existing Meridian UI mapper source WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py blob 373d8632429e010532e6ca2589465bb90a9a3c1d. Three original core functions transcribed verbatim into executed Python regression; not the full GUI/parser.
- Actual physical system: S2 orbit around Sgr A*, GRAVITY Collaboration, Astronomy & Astrophysics 636 L5 (2020), DOI 10.1051/0004-6361/202037813, Appendix E Table E.1.

## Executed real-fit regression

S2 fitted central parameters: a=125.058 +/-0.041 mas, R0=8246.7 +/-9.3 pc, e=0.884649 +/-0.000066, M=4.261 +/-0.012 million nominal solar masses. Covariances unknown. Exact IAU AU, nominal solar GM, SI c. Derived pericenter distance 118.963309838 AU, marginal-only approximate sigma 0.155410891 AU, Kepler comparator speed 7738.514450 km/s. The numerical trajectory is Newtonian Kepler from real fitted elements, not original observation timestamps, GR-integrated motion or an H(s)H prediction.

Two coordinate charts of the SAME physical orbit were fed to the original UI core: (A) spatial origin at Sgr A*, (B) spatial origin at the S2 pericenter event. Time origin is pericenter in both, X(t)=(ct,x,y,0). The spatial translation uses measured-fit pericenter radius, not an invented physical parameter.

At pericenter: chart A UI r=1.7796657843162e13 m, valid=true, ||u||=1; chart B r=0, valid=false, ||u||=0. BOTH have reconstruction error exactly 0 m. Neighboring normalized direction dot product is +0.999811597 in A and -0.999999999994 in B. Maximum sampled ||Omega||_F changes from 2.383778953e-5 to 3.262627309e-7 s^-1. These are chart-dependent UI diagnostics, NOT measured physical spin.

**Defect/contract gate:** the mapper defines u=X/||X|| only when r>1e-12, otherwise assigns u=0 and carries forward the previous rotation. At r=0, reconstruction r*R*x0=0 is exact for any R and seed, so zero reconstruction error cannot certify recovered direction or frame. The coordinate singularity is not a singularity of the observed S2 trajectory. Even away from zero, the SO(3) stabilizer makes the full SO(4) frame underdetermined by a direction curve. A material-director, origin/translation-gauge and readout contract must precede interpreting Omega as worldtube spin.

## Lean and geometry status

Draft PR #750 (branch research/meridian-s2-ui-origin-gauge-20261027t1412z) contains source module FORMAL_VERIFICATION/HsHVerification/MeridianUIOrigin.lean blob b33620f7b0b497ec5a3e8ab4a975db48643fc7a7 and verified root import blob 6e2df2e240df3c0f3024564e04ddd812ff0bc142. Five conditional propositions cover core-in-shell image inclusion under common embedding, injective marked full histories despite spatial periodicity, nonclosure for nonzero full-time period, affine recentering to zero, and zero-scale noninjectivity. GitHub Actions run 40519769717 was in progress at submission; **NO new Lean compilation success claimed until full log inspection**. Existing earlier Meridian S2 corrected CI 40488934494 succeeded separately.

Typed source-fidelity map: K subset S (intrinsic spatial section); coiling E:I x S -> M4 (operation on whole section, not a third nested radial shell); actual slice T intersect Sigma_t; observable O(T intersect Sigma_t). Periodic projected coil is not automatically closed full 4D material history. No Kerr field equation, finite-core constitutive response or H(s)H prediction has been supplied.

## Continuity

Mersearch-first instructions checked; all four shared lanes occupied and not overwritten, so bounded GitHub source reads used (not exhaustive three-repository Mersearch). Incoming Kestrel 14:00Z handoff blob a17a3ce4091de22bf50364d7436db42ac1d435a4 consumed. Independent unrelated reading: Franklin Institute article on Maillardet's Automaton, substantive lines 57-84; mechanical cams store four drawings and three poems; no SAT inference. P1 Nov 9 Orson cognition protected; P2 Nov 30 requires gauge, constitutive forward map and independent data review; P3 Dec 14 source genealogy. Mercer to independently test frozen orbit/gauge contract without inheriting Meridian implementation. No new recurrence, signet, license/access change, or authenticated cross-chat delivery.
