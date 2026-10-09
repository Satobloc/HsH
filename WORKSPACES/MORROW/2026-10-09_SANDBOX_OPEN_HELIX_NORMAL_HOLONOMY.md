# Morrow + Kestrel | Open-helix normal holonomy (SANDBOXED)

**2026-10-09.** New mathematical construction, not canonical SAT/H(s)H, no historical constant fitting. **Do not conflate a screw-relative comparison with physical identification of time.**

## Source provenance and actual reading
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/4D_THINKING.txt`, blob `9b55304202fa8623e08db90f0b2c7220aa9b70c4`; contiguous opening ~26,000 characters read, including Nathan's relational Moiré alignment and binding strain. Surrounding assistant prose is not Nathan's formulation.
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/000 Earliest SAT_RMS/002 Forces Across Temporal Points - to 8-13-24.txt`, blob `42c1faee4e75b254a52161535d667d2d105769ae`; complete file read.
- Current HsH: `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`, blob `46ad779bf07007af5edca8c61defc4c42048909e`; complete 13,668-character file read. Also complete `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` read.
- Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and material control pointers read; `WORKSPACES/COMMON/REFERENCE_DESK/README.md` and HSH_RESOURCES War Room declaration/toolkit/tool chest/preference router reviewed for navigation. No PRIOR_ART opened.

## New calculation
Use local notation MK-HOL-20261009, Euclidean arclength `s`, axial tangent fraction `a`, `b=sqrt(1-a²)`, helix frequency `k`:

`γ(s)=((b/k)cos(ks),(b/k)sin(ks),0,a s)`.

`T=b e_θ+a e_4; N1=e_r; N2=e_3; N3=a e_θ-b e_4`.

Under **Euclidean normal-parallel** transport `P_N D'=0`, `D(0)=N1(0)`:

`D(s)=cos(aks)N1(s)-sin(aks)N3(s)`.

After `m` turns, screw-relative normal holonomy angle is `-2πma` mod `2π`. For rank-two support `E(s)=D(s)^⊥∩N_sγ`, the plane returns after `m` turns iff `2ma∈Z`; when this integer is odd the transported director reverses and plane monodromy reverses orientation. A **formal mapping-torus quotient** would have Klein-bottle boundary; the actual unquotiented open 4D worldtube does **not** become a Klein bottle or acquire protected Z2 topology.

With controlled local tangent-interface normal `n=N1`, the HsH orientation factor is **`β(s)=|sin(aks)|`**. Packet 002 then yields `A_Σ≈4 sqrt(2β) C4 ε^(3/2)/sqrt(bk)` for `β>0`, `C4=∫₀¹ sqrt(1-u⁴)du≈0.874019184764`. At `β=0` the generic formula fails and the exceptional thin-sheet branch gives `π ε²`. This phase dependence, not the inherited exponent, is the new candidate discriminator.

## Numerical and physical attack
Independent DOP853 integration matches analytic monodromy to ~`5.4e-12` in the two-turn `a=3/4` fixture. Local chord-area quadrature matches the analytic coefficient to ~`1e-14` within the quadratic model.

If `x4=ct` and Minkowski signature is imposed separately, the one-turn half-twist `a=1/2` is spacelike (`v/c=sqrt(3)`), so it cannot be an ordinary timelike particle history. The **two-turn** `a=3/4` fixture is timelike (`v/c=sqrt(7)/3≈0.881917`), but is not a predicted velocity or particle label. Euclidean normal connection is not automatically Lorentzian Fermi-Walker transport.

A smooth periodic axial deformation `x4(s)=a s+δ sin(s/2)` breaks exact two-turn director reversal: closure residual `0.001933` at `δ=.05`, `0.007737` at `δ=.1`. No robust quantization established. Next test: minimize material twist + finite-core contact energy for an open, timelike-compatible carrier and ask whether odd support-plane monodromy is dynamically stable without being imposed.

**Checkpoint state:** SANDBOXED / independent construction / analytic + numerical verification / topology and dynamics unproven. Full executable script and precision figures supplied in Morrow + Kestrel task thread, 2026-10-09.
