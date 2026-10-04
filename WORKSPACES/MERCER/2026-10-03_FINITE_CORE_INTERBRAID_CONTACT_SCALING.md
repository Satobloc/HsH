# Mercer sandbox checkpoint — finite-core Interbraid contact scaling

**Status:** SANDBOXED conjecture, not canonical theory.

## Sources actually read
- `SAT_THEORY_ARCHIVE_2023-25/SAT_HSH_SYNTHESIS_STATE.md`, complete through section 12. Used: finite-core action family; direct finite-core contact/reconnection is distinct from medium-mediated Electrogravity; reconnection requires contact plus phase/energy/barrier/branch-pairing conditions; rank loss alone is not a reconnection law.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, lines 1–1250. Used: finite-core tangency law `n·y + alpha s + (1/2) A_rel s^2=0`, crossover parameter Lambda, and pair-of-pants/S1 topology as a possible reconnection readout.

## New sandbox construction
Near symmetric tangency, use the local gap
[
g(s)=-\delta+\frac{A}{2}s^2,
]
where \(\delta>0\) is penetration/overlap and \(A>0\) is relative curvature. Contact occupies
[
|s|<s_c,\qquad s_c=\sqrt{2\delta/A}.
]
For the minimal quadratic overlap penalty
[
U_c=\frac{\kappa_c}{2}\int_{-s_c}^{s_c}\left(\delta-\frac{A}{2}s^2\right)^2ds,
]
symbolic integration gives
[
\boxed{U_c=\frac{8\sqrt2}{15}\frac{\kappa_c}{\sqrt A}\delta^{5/2}}
]
and
[
\boxed{F_c=\partial_\delta U_c=\frac{4\sqrt2}{3}\frac{\kappa_c}{\sqrt A}\delta^{3/2}}.
]
Thus first contact is smooth: contact length grows as \(\delta^{1/2}\), energy as \(\delta^{5/2}\), and repulsive force as \(\delta^{3/2}\).

If reconnection requires accumulated contact energy to exceed an independently specified barrier \(E_b\), the threshold penetration is
[
\boxed{\delta_c=\left(\frac{15 E_b\sqrt A}{8\sqrt2\,\kappa_c}\right)^{2/5}}.
]
This predicts \(\delta_c\propto E_b^{2/5}A^{1/5}\kappa_c^{-2/5}\).

## Discriminator
Sweep relative curvature A and contact stiffness kappa_c in a finite-core solver. Before any topology-changing rule is enabled, verify the exponents 1/2, 5/2, and 3/2. Then impose one fixed barrier E_b and test the 1/5 and -2/5 threshold scalings. Failure of these exponents in the controlled quadratic-contact regime rejects this minimal constitutive law.

## Interpretation
This supplies a mechanical precondition for Interbraid without identifying contact with reconnection. Topology change remains a separate branch-pairing/phase/barrier event. Electrogravity remains medium-mediated and distinct.
