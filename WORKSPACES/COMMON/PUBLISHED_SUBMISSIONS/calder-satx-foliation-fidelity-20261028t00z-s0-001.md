# Calder | SATx unit time-flow versus timesheet foliation source-fidelity gate

2026-10-28 00:00 UTC | Workshop Relay :00 | source-grounded current assistant, not authenticated historical Calder.

## Original and derived source witnesses

- Nathan-voiced July 3, 2026 original: SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37. First ~150 lines read. Nathan starts with a worldline and a timesheet as distinct primitives and proposes the angle of intersection as a kinematic readout. Original raw message role/timestamp not independently recovered in this pass.
- Nathan raw-user-verified Sept 7: HsH/WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md, blob 1076d5841ea8ec67ddae39e8949dbc5b2649b35c, message ce837c4f-30cb-43c1-ac55-511b41c12d53, states intersection angle depends on coil pitch and 3-space motion. It does not define a time-flow field or orthogonal foliation law.
- Historical assistant construction: SAT_THEORY_ARCHIVE_2023-25/SAT X/SATx CANONICAL.txt, blob afbf610347a6a39c74cf52cbe3818ef22ab3ebcf, Modules 1-5 read. Module 1 imposes unit timelike u (u^2=-1) and says its integral curves slice the 4-manifold into 3-surfaces Sigma_t. Its 1+1 rapidity choice is u=(cosh psi,sinh psi). Aldus issue #794 establishes a May 30, 2025 retrieval witness, not the original composition date.
- Derivative assistant repetition: SAT XY/SATx-y INSIGHTS.txt, blob dc693ab75fe384d6ff528ab485ab8f5656a2a059, first ~125 lines read; it repeats that flow integral curves foliate simultaneity surfaces. This is not an independent derivation.
- Historical SATx SUPPORTING.txt, blob acc27b18ff5d5e309cf4a98ebc44a9b888e683c9, first ~230 lines read; 3+1 constraint closure is described as still required.
- Later assistant alternative, not a Nathan-selected repair: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Lorentz 1.txt, blob 439c83aa7d4749f84b74c1387ef4c37dceba81f2, explicitly introduces khronon T and u_flat=-dT/sqrt(-dT dot dT), restricting vorticity to zero.
- Prior independent source of the axisymmetric coefficient: HsH/WORKSPACES/MERIDIAN/SANDBOX/AXISYMMETRIC_HOUSEHOLDER_FROBENIUS_OBSTRUCTION_2026-10-10.md, blob 081fa073435cb48feee39414ab26643bd5fb8bf7, read in full. This is prior art, not a new Calder discovery.

## Geometry and discrepancy

A smooth unit timelike field u defines 1D integral curves and pointwise 3D orthogonal hyperplanes ker(u_flat). Those hyperplanes need not integrate to hypersurfaces. For a local orthogonal foliation the 1-form alpha=u_flat must satisfy Frobenius alpha wedge d(alpha)=0. A global preferred time function requires still more assumptions. A nonvanishing u does admit local transverse 3D sections by the flow-box theorem, but these need not be orthogonal or global. Thus the SATx statement is at best ambiguous and, if interpreted as orthogonal simultaneity, omits a necessary geometric gate.

The 1+1 rapidity ansatz is a legitimate restricted parameterization. It cannot test a 3+1 twist obstruction, since 3-forms vanish in 2D. The source's separate internal phase also called psi is a previously identified semantic collision, not a new finding.

Nathan's independent timesheet Sigma_t is not automatically ker(u_flat). The map from the original worldline/timesheet incidence geometry to a derived u-normal foliation is absent. Symmetrically, Nathan's proposed link from angle to rest mass/force is a physical hypothesis beyond the kinematic diagram, not a proven consequence of incidence alone.

## Conditional Lean gate and scope

Draft PR #817: https://github.com/Satobloc/HsH/pull/817. Four Lean 4/Mathlib propositions isolate the algebraic coefficient C*dD-D*dC and its relation to the derivative-like expression dD/C-D*dC/C^2 when C is nonzero. This is the local ratio condition used in Meridian's earlier axisymmetric analysis. Compilation is pending until exact CI logs are inspected. These theorems do NOT formalize the Frobenius theorem, derivatives as actual functions, global foliation, source fidelity, physical truth or empirical measurements.

## Discrepancy ledger

FOL-01 HIGH: unit norm silently promoted to orthogonal foliation; require Frobenius.
FOL-02 HIGH: 1D integral curves conflated with 3D leaves; distinguish transverse from orthogonal.
FOL-03 MEDIUM: 1+1 rapidity not general 3+1; cannot diagnose twist.
FOL-04 HIGH: Nathan's timesheet is a separate primitive; missing identification map n_Sigma=u.
FOL-05 MEDIUM: Nathan's angle-to-rest-mass leap remains a hypothesis, not a kinematic theorem.
FOL-06 MEDIUM: later khronon option is a possible extra structure, not a historical Nathan choice.
FOL-07 MEDIUM: Meridian Householder obstruction is ansatz-specific, not a generic Kerr impossibility.

## Scope, navigation and return cursor

Mersearch guide read; four request lanes reported occupied, so no shared request overwritten. Bounded GitHub search plus original SAT/HsH blob reads only; HSH_RESOURCES and full three-root Mersearch coverage NOT claimed. Existing Math Hopper, Lean branch and PRs checked; no duplicate tooling. Lateral read: SATx-y INSIGHTS first ~125 lines, including Prism and cross-sector axiom table; no new empirical conclusions. FIE rereview not due from Oct 27 recent worker reads.

Next Hale: verify exact-head CI and publisher; recover raw SATx Module 1 message role/time; inspect current HsH solvers for u-versus-sheet-normal conflation; use a real measured system with provenance/units/uncertainties for any physical twist calculation; route unreviewed P3 source-genealogy issue separately. Nov 9 P1, Nov 30 P2, Dec 14 P3 gates remain distinct.

No CODATA scoring, invented physical fixtures, BEDROCK theory promotion, scheduler/task change, sixth automation, signet, chat rename or authenticated cross-thread delivery.
