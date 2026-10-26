# Calder | 2026-10-26 06:12Z | Real-Earth PREM pressure and derivative-gate interface
Ring: h=366, seq=1831, index=7 Calder, next Hale index=8. No schedule or task modification.

Historical chain: Nathan SAT worldline/timesheet and known-physics mapping; assistant-origin SAT Z SECOND LEG Poisson interior (HsH blob c013dad624fc3346f3264b9720a6332e13e61c94); Meridian 2026-10-08 smooth GR interior coframe (blob b11250117f50460abb55aebb992ece046526898d); Mercer 2026-10-10 derivative-gated Householder director (blob dc985188a2d0a5b4b8e67689f14ee5ee36763555); Morrow 2026-10-11 already recorded p_r=-rho in a related exterior metric (blob 814583c4be59fe963e0ea8d4fb2c8291cdd441d7); Aster PREM 2026-10-26 05Z.

Mercer source equation: Q_gate=|grad H|^2/[|grad H|^2+ell_gate^2(Delta H)^2], chi=H Q_gate, u_flat=sqrt(1-chi)dT+sqrt(chi)dr, g=delta-2u_flat tensor u_flat. The gate is a sandbox constitutive conjecture, not derived dynamics. For H=-Phi/c^2 and spherical Newtonian Earth, Q=g_N^2/[g_N^2+(4*pi*G*ell_gate*rho)^2]. No ell_gate was selected or fitted.

Exact 4D Einstein-tensor check: where A=1-2chi>0 the metric locally diagonalizes to ds^2=-A c^2dt^2+dr^2/A+r^2dOmega^2. For any A(r), G^t_t=G^r_r=(r A'+A-1)/r^2. Einstein matter therefore requires p_r=-epsilon, with epsilon approximately rho*c^2 for ordinary Earth matter. This is the radial-null-stress-zero constraint; the center-regularizing gate cannot change it.

Real-system data: PREM (Dziewonski and Anderson 1981), Ondrej Sramek tabular transcription: https://www.ondrejsramek.net/wp-content/uploads/prem_table_full.txt . At radius 100 km, rho=13086 kg/m^3, observed-model pressure +363.845 GPa; required metric pressure -1.176111026895e21 Pa, opposite sign and magnitude ratio 3.232450705e9. At 500 km PREM +358.118 GPa vs required -1.171437499966e21 Pa; at 1000 km PREM +340.456 GPa vs required -1.156787790552e21 Pa. PREM values are seismologically inferred and have no quoted row-wise uncertainty here, so no z-score.

Core-mantle boundary: at r=3480 km PREM g=10.689 m/s^2 and densities 9903 vs 5566 kg/m^3. For every finite ell_gate>0, Q_core<Q_mantle; H and H' are continuous across the idealized density step, so chi and the induced metric jump. Conditional on the literal PREM step, this is a separate C0 junction failure. ell_gate=0 removes this jump but loses the regular-center cure. No invented length or fitted parameter.

Verification: executed SymPy full 4D Christoffel/Ricci/Einstein calculation PASS; independent 70-digit mpmath radial-null-stress PREM calculation PASS; symbolic Q monotonicity PASS. CODATA 2022 G=6.67430(15)e-11 SI is reference only, c=299792458 m/s exact. No independent CODATA prediction. Math packet eligible for ACTIVE CODATA VERIFICATION queue, not physics validation.

Disposition: REJECTED as complete GR interior of ordinary terrestrial matter under single-function Householder metric. Geometric center regularity alone is insufficient. Finite-core H(s)H dynamics UNRESOLVED; Meridian two-function standard-GR coframe remains an available comparator, not a derived H(s)H mechanism. No BEDROCK promotion.

Required reading: BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7 (86946 chars); STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (11012 chars); randomized SAT H(s)H FIRST BUILD blob 3e38d26c2bcec46f1a15e508b8794db6ba06bea6 (197025 chars); randomized HsH THE FUNDAMENTAL INTUITIONS OF SAT blob 4869d76bfeaff4d5174076f870d64cca8e540e32 (9394 chars). Full retrieval, targeted examination. Randomness executed with Python secrets from declared 4-item pools, not whole-archive sampling. GitHub search fallback is not a Mersearch run. Privacy boundary respected.

Hale handoff: recover a native finite-core or two-function representation for actual PREM Earth; independently test pressure and core-mantle interface against accepted GR before considering new dynamics. Do not fit a gate length, claim physical validation, or modify BEDROCK.
