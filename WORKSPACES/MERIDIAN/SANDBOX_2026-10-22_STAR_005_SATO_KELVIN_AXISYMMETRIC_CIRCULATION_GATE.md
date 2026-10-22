# STAR 005 | SAT.O velocity equation versus Kerr-ring circulation: exact compatibility gate
**22 Oct 2026. SANDBOX / conditional consequence of an archived equation; NOT a proof or disproof of all SAT/H(s)H.**

## Sources and discipline
BEDROCK 2026-10-22: existing Kelvin-like response, literal rotational spin, finite Kerr core, local time and precession are operative hypotheses to be propagated, not optional and not automatically validated. Read old SAT.O `LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt` (its velocity variation, with unresolved `sorry`), original SAT.O D2 and HsH's already-published Kestrel exact curl audit `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-s12-20261022-16z-sato-curl-circulation-001.md`, along with Meridian STAR 003 and 004. Mersearch shared request remains reserved to Orson; only bounded direct source reads/search performed, not a Mersearch run.

## Archival equation under test (historical, not promoted)
\[
\mathbf v=\nabla\chi+\frac{\lambda}{\rho}\nabla(\rho\Phi)
=\nabla(\chi+\lambda\Phi)+\lambda\Phi\nabla\ln\rho,
\]
for spatially constant \(\lambda\), smooth \(\rho>0\), and scalar \(\chi,\Phi\). Curl identity (Kestrel previously independently checked):
\[
\nabla\times\mathbf v=\lambda\nabla\Phi\times\nabla\ln\rho.
\]
This permits nonzero *local* vorticity for crossed gradients but is NOT yet Kelvin-vortex persistence or electromagnetism. Archive typing issue: with ordinary mass density and energy-per-mass potential, \(\lambda\) should have time units to homogenize the old 3+1 action.

## New exact circular circulation obstruction
For any circular path \(C_R\) at fixed cylindrical \(R,z\), with \(\rho=\rho(R,z)\) axisymmetric, constant \(\lambda\), and globally single-valued smooth \(\chi,\Phi\),
\[
\Gamma(R,z)=\oint_{C_R}\mathbf v\cdot d\boldsymbol\ell
=\oint d(\chi+\lambda\Phi)+\lambda\oint\Phi\,d\ln\rho=0.
\]
This holds even if \(\chi\) or \(\Phi\) individually depend on azimuth \(\varphi\), because the first integral is exact and \(d\rho=0\) along the circle. If \(\rho\) is axisymmetric and \(\chi,\Phi\) both axisymmetric then \(v_\varphi\equiv0\) pointwise. Therefore the archived smooth-potential velocity law *cannot generate nonzero azimuthal circulation around a symmetric Kerr-ring cross-sectional vortex* when \(\rho\) is axisymmetric, even though Kestrel's asymmetric off-shell fixture proves nonzero local curl is possible in general.

The obstruction gives three pre-existing physics-compatible escape categories, **none automatically adopted**:
(i) density varying azimuthally (a broken-symmetry state, requiring consistency with the finite-core geometry and equations of motion);
(ii) a multivalued/singular phase potential \(\chi\), allowed on a punctured or linked domain with \(\oint\nabla\chi\cdot d\ell=2\pi k\) for \(\chi=k\varphi\); this is a defect/holonomy boundary condition, not a smooth globally defined scalar;
(iii) the existing bulk-medium circulation law is genuinely different from this 3+1 SAT.O velocity stationarity equation, in which case the full current mapping must be supplied and tested.
Varying \(\lambda\) spatially introduces additional terms and cannot be silently assumed; under axisymmetric \(\lambda(R,z)\) the circular obstruction persists as long as functions remain smooth and single-valued.

## Independent executable checks
The actual `/mnt/data/hsh_star_005_circulation.py` file was run with SymPy, checking an explicitly axisymmetric off-shell fixture \(\rho=1+\alpha R^2\), \(\Phi=\beta R^2/2\), \(\chi=0\):
\[
v_R=\beta\lambda R\frac{1+2\alpha R^2}{1+\alpha R^2},\quad v_\varphi=0,\quad \Gamma=0.
\]
As a nonaxisymmetric control \(\rho=1+ax\), \(\Phi=by\), \(\chi=0\):
\[
(\nabla\times\mathbf v)_z=-\lambda ab/(1+ax);
\qquad\Gamma=\frac{2\pi\lambda b}{a}(\sqrt{1-a^2R^2}-1)
=-\pi\lambda abR^2+O(a^3),
\]
for \(|aR|<1\). The exact circulation is independently present in Kestrel's earlier note; new contribution is the **axisymmetric no-circulation theorem and its implications for symmetric Kerr-associated cores**. Finally \(\chi=k\varphi\) gives nonzero \(\Gamma=2\pi k\) around the puncture but is not globally smooth/single-valued and has a core singularity. No physical circulation quantum is determined by this purely geometric test.

## Propagation to STAR 003/004 and the original EFT
- A Laplace–Beltrami spatial mode operator and coordinate-rotation frequency shift alone cannot supply the stationary physical circulation needed for literal spin and medium response.
- The simple smooth axisymmetric velocity law does not supply that missing circulation: it is zero on symmetric enclosing circles.
- Any successful finite-core Kelvin response must *derive* the topology/defect transport or break rotational symmetry in a way consistent with the same inherited medium equations and the finite-core shell, then propagate consequences through spin, electromagnetism, precession/time and the cross-sector spectral operator.
- Thus STAR 004's geometric mode spectrum remains a comparator, not a physical SAT wave spectrum. The historical EFT's tension coefficients may not be smuggled in as repairs.

## Verification and limits
This is a rigorous conditional mathematical result for the stated SAT.O stationary velocity equation, not an assertion that an ideal-fluid vortex (which can have a multivalued velocity potential) is impossible. It does not establish whether current H(s)H demands global axisymmetry, whether \(\rho\) means density on the actual 4D finite tube, or whether this old equation was superseded. These dependencies are explicit research tasks. Script and outputs were executed locally; independent GitHub readback required before claiming commit verification.
