# 4DHH finite-core reconstruction: exact Minkowski/Kerr-oblate kinematic gate
**22 October 2026 | MERIDIAN sandbox | Direct response to Nathan's instruction: reproduce the earlier EFT's results from current 4DHH geometry with a Kerr-associated finite worldtube, rather than importing the EFT action.**

## Original sources examined
- SAT archive `_AUTO_EXTRACTED_TEXT/4DHH LAGRANGIAN (nolat).txt`, pages 1-3: older Blockwave/4DHH root-action claims, ensemble inverse metric, topological coupling, \(B\), higher-curvature corrections. This is extracted historical material, not proven equations. Notably it presupposes a hypersphere lattice and fitted scale, currently restricted by BEDROCK. Original source is a PDF, but this pass examined the archive's prepared text extraction, **not the source PDF visually**.
- SAT archive `_AUTO_EXTRACTED_TEXT/SAT_4DHH_UC.txt`, pages 1-3: explicitly proposed \(S=\int\sqrt{-g}(L_{UC}+L_{4DHH})\), statistical metric \(g=(\langle vv\rangle)^{-1}\), gauge/winding correspondences, historical curvature correction, several unproved sector claims.
- HsH `WORKSPACES/WORLDTUBE_LAB/KERR_SHELL_GEOMETRY_PASS_2026-09-16.md`: exact Kerr-coordinate oblate geometry, with no automatic claim to material stress laws.
- BEDROCK and AGENTS: Minkowski first, inherited Kelvin-like medium, literal spin, shelf-cocking and time alternatives remain active constraints, no additional mechanism unless forced.
- Mersearch-first check: shared request `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` still occupied by Orson request 2026-10-21-orson-nlm-big-haul-math-001. No Mersearch run claimed; archive retrieval is a bounded direct-source fallback.

## Defined finite-core Kerr-oblate surface with 4DHH rotation
Use ordinary Minkowski spacetime in inertial Cartesian coordinates with ds²=-c²dt²+dx²+dy²+dz². The spatial Kerr-oblate coordinate embedding at constant positive r is
\[
x=\sqrt{r^2+a^2}\sin\theta\cos(\varphi+\Omega t),\quad
y=\sqrt{r^2+a^2}\sin\theta\sin(\varphi+\Omega t),\quad
z=r\cos\theta,
\]
where \(a=J/(mc)\) is an *assumed* Kerr geometry length scale and \(\Omega\) is a purely kinematic rotation rate to be constrained, **not an added force or material law**. Coordinates \((t,\theta,\varphi)\) parameterize a worldtube history of an oblate two-dimensional cross-sectional surface. This is a precisely defined comparison construction, **NOT Kerr spacetime itself**, and not yet the entire SAT four-spatial-dimensional native build. Taking \(r\to0\) degenerates the coordinate-surface geometry.

Define \(A^2=r^2+a^2\), \(E=r^2+a^2\cos^2\theta\), \(S=A^2\sin^2\theta\). The induced worldvolume metric is
\[
 h_{ab}=
 \begin{pmatrix}
 -c^2+\Omega^2 S&0&\Omega S\\
 0&E&0\\
 \Omega S&0&S
 \end{pmatrix}.
\]
Exactly
\[
\det h=-c^2 ES,\qquad
h^{tt}=-1/c^2,\qquad h^{t\varphi}=\Omega/c^2.
\]
The determinant is independent of rotation \(\Omega\): a rigid re-labeling of the same surface history cannot create a local energy density, physical gravity, or an event horizon. The apparent stationary-time norm \(h_{tt}\) changes sign when \(\Omega A\sin\theta=c\), but \(h^{tt}=-1/c^2\) always; this is a rotating-coordinate light cylinder, not a Kerr ergosphere or horizon. Coordinate null angular speeds obey
\[
\frac{d\varphi}{dt}=-\Omega\pm\frac{c}{A\sin\theta}.
\]
This is the *required baseline zero-deformation, zero-Kelvin-response limit* for reconstructing a true Kerr-associated physical worldtube. A real rotating material shell must respect local subluminal motion; its stress-energy, circulation, spin and electromagnetic current cannot be derived from this coordinate chart alone.

## Cross-sector EFT recovery gates
1. **Geometric spectrum**: compute exact intrinsic/extrinsic invariants of the native 4DHH finite tube, its boundary mode operator and boundary conditions. A free mode spectrum from geometric mapping alone is not yet a dynamical dispersion law.
2. **Literal spin and magnetic response**: derive charge-current distribution and \(J,\mu\) from one finite-core motion; simple co-moving ring's \(g=1\) vs electron \(g\simeq 2\) remains a known comparator gate. Never fix with a free phenomenological factor.
3. **Kelvin-like medium and time direction**: derive or recover the existing constitutive response. Distinguish hypersurface-orthogonal timesheet normal from vortical bulk 4-velocity; Frobenius obstruction remains valid for rotating fluid congruences.
4. **Gauge and phase**: the historical \(A\propto d\theta\) has \(F=dA=0\) for smooth \(\theta\), so nontrivial local gauge response must come from actual geometry/defects or existing responsive medium relations; topological loop holonomy can remain nonzero.
5. **Metric/gravity**: recover Kerr, Kerr-Newman or Einstein-Maxwell dynamical quantities as *held-out* standard controls; flat spacetime rotating charts are not GR frame dragging. Electron classical KN parameters are overextreme: no standard classical horizon exists.
6. **Flavor/precession**: use the same local time direction to define shelf-cocking and rung precession; derive observed bosonic/fermionic transformation properties rather than claim photon/neutrino identity.
7. **Parameter ledger**: \(r,a,\Omega\) in this kinematic check are input geometric descriptors, **not predictions** and not allowed as independent freely tuned physical parameters; the EFT cannot be claimed recovered until SAT inherited constraints fix physical observables without retuning.

## Computer verification
Executed an actual SymPy calculation at `/mnt/data/hsh_4dhh_kerr_gate.py` checking the induced metric, determinant, inverse, coordinate stationary boundary and null angular speeds. No constitutive dynamics or Einstein equation has been solved. This is a **first exact gate**, not an EFT reconstruction.

## Next substantive calculation
Recover original 4DHH/Blockwave *variation and boundary operators*, replace the ideal worldline by specified Kerr-associated finite-core tube, write its mode problem from the *existing* geometry and medium law (or exhibit the mathematical obstruction if unavailable), and compare GR/EM/flavor sectors simultaneously. Do not import an arbitrary elasticity/tension/string action to make the spectrum work.
