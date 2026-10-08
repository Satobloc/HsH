# Mercer sandbox: multi-source test of a Householder time-normal metric

**Date:** 2026-10-08. **Status:** SANDBOX; conditional mathematics, not canonical theory.

## Provenance and reading
- SAT archive `2026/SAT THEORY — Dimensoins.txt` (full text): Euclidean four-space, finite worldtubes and timesheet intersections. Historical particle/lattice claims not adopted.
- SAT archive `2026/SAT CORE — UI CONFIG.txt` (full text): SO(4) generator and time-normal coupling.
- SAT archive `2026/GRAVITY TWIST.txt` (five contiguous excerpts, approximately 270 lines): history-dependent worldtube coupling, not a mathematical premise here.
- HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt` (five 54-line excerpts across 956 lines): the timesheet graph F=q-cτ-h(x,τ), coupling and finite contact.
- Controlling `BEDROCK.md`, `🔑/🔑.md` and O_eff key reviewed. October 5 resource desk/toolkit routing reviewed. No quarantined source used.
- Symbol namespace `LOCAL:MERCER-HOUSEHOLDER-2SOURCE-20261008`; all coordinates and height have length units; no historical constants fitted.

## One-source exact construction
In Euclidean 4-space set F=q-h(x)=const and n=(dq-dh)/sqrt(1+|grad h|²). Define g=δ-2 n⊗n. With w=|grad h|²:

g_qq=(w-1)/(1+w), g_qi=2 h_i/(1+w), g_ij=δ_ij-2h_i h_j/(1+w).

This normal is automatically Frobenius-integrable, since n is proportional to dF. For one spherical source of Schwarzschild radius r_s, choosing h(r)=sqrt(r_s(2r-r_s)) gives g_qq=-(1-r_s/r). The full metric is Schwarzschild in a non-diagonal coordinate chart. Six-radius numerical tests verified the exact matrix identities and diagonalization.

## Two-source failure of height additivity
For two equal sources at x=±d/2, naively add h_1+h_2. At the symmetry midpoint grad(h_1+h_2)=0, hence A=-g_qq=1. The weak-field target A=1-s, s=r_s/r_1+r_s/r_2, gives A_mid=1-4r_s/d.

At d=4, r_s=0.02: target A=0.98, naive A=1. At r_s=0.2: target A=0.8, naive A=1.

For N equal compact sources observed far away, height gradients add as N sqrt(r_s/(2R)); therefore the induced potential scales as N² r_s/R rather than the required N r_s/R. Numerical far-field ratios for N=1,2,4,8 are 1.000000, 1.999994, 3.999940, 7.999496.

## Alternative and open discriminator
Superpose the weak-field potential s, then solve the eikonal condition |grad h|²=s/(2-s). This fixes g_qq by construction but not the full Einstein equations. For equal sources, a reflection-even smooth scalar h has zero gradient at the midpoint while the eikonal right-hand side is positive. A symmetric 1D branch must have a cusp. A gauge-dependent asymmetric height or a richer metric representation may evade this restricted obstruction.

This corrects any overbroad interpretation of an earlier two-source Frobenius problem: graph normals are integrable; **source superposition and constitutive closure** are the unresolved tasks.

**Next solver:** two-source eikonal solution with finite cores; evaluate the full Einstein tensor outside sources and compare smoothness, symmetry and bulk scaling. Failure of naive additive height is a result for that ansatz only, not for SAT/H(s)H.

**Script/plots:** `mercer_two_source_householder_test_20261008.py` plus Class-P lapse, cusp and N-scaling figures generated in the conversation workspace.
