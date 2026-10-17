# SANDBOXED: Ravel action-first sheath scattering (2026-10-09)
> **MODEL-SCOPE CORRECTION, 2026-10-09:** Nathan's direct clarification limits SAT to worldlines and H(s)H to their finite-core worldtube extension in Minkowski, with linear/radial w as specified by SAT. The four-form, Nambu–Goto and thin membrane ingredients below are **external general-relativistic comparison models, NOT SAT/H(s)H primitives**. Do not interpret a Schwarzschild exterior or a stable shell as an H(s)H result. See [Ravel scope correction](./SANDBOX_2026-10-09_SAT_WORLDLINE_WORLDTUBE_SCOPE_CORRECTION.md).

**Classification:** independent GR constitutive tests; candidate H(s)H geometric analogy only, not an SAT-derived field theory or observed signal. This extends [the previous Ravel covariance/scattering audit](./SANDBOX_2026-10-08_COVARIANT_SCATTERING_METRIC_AUDIT.md). Authors: Ravel sandbox. Archive quotations and inherited equations retain their own provenance.

## Source audit and workflow
Freshly read controlling \`WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md\`, required symbol/citation, Reference Desk, and task/workflow pointers; reviewed War Room declaration, HSH_RESOURCES toolkit/index and Tool Chest routing, without entering quarantined \`PRIOR_ART\`. The installed \`tools/search_archive_content.py\` is Mercer_Searcher; full three-repo corpus execution was **not available** in the local runtime. Known-path primary source reads (NOT archive-wide novelty search):
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SATO-scattering.txt\`: full 3,374 characters, topological S-matrix as proposed concept rather than physical amplitude.
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_HSH_SYNTHESIS_STATE.md\`: first 340 contiguous lines, 12,220 characters returned, finite-core worldtube trial action and empirical-methodology gates.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ADFA.txt\`: first 400 lines including softened potential, gravitational scattering and tolerance proposals.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT FORMALIZATION ROUND 3ish.txt\`: first 500 lines, 1+1D proposed angular kink/domain wall mechanics; unsupported particle claims not imported.
- Prior Ravel checkpoint read: \`WORKSPACES/RAVEL/SANDBOX_2026-10-08_COVARIANT_SCATTERING_METRIC_AUDIT.md\`, first 330 lines.

Standard mathematics used: Einstein field equations, Nambu-Goto worldsheet variation, local nonlinear flux actions and Israel junction conditions. Cited as methods, not as theories originating in SAT. All coefficients below belong to namespace LOCAL:RAVEL-ACTION-CORE unless explicitly STD; G=c=1, Lorentzian metric signature (-+++). Historical \`ell_f\` is not identified with any new length.

## Test A: tensioned 1D filaments cannot supply the previous source
Start not from a metric but with an explicit thin Nambu-Goto worldsheet:
\[
S_\text{NG}=-\mu\int d^2\sigma\sqrt{-h},\qquad
T^{\mu\nu}(x)=-\mu\int d^2\sigma\frac{\sqrt{-h}}{\sqrt{-g}}\,
h^{ab}\partial_aX^\mu\partial_bX^\nu\delta^{(4)}(x-X).
\]
At rest, a spherical orientation ensemble of positive-tension filaments obeys
\[
p_r=-\rho f_r,\quad p_t=-\rho(1-f_r)/2,\quad 0\le f_r\le1,\quad
p_r+2p_t=-\rho.
\]
The previous regular benchmark metric, **used here as a test target only**, has \`m(r)=Mr^3/(r^2+ell^2)^(3/2)\`, requiring
\[
p_r=-\rho,\qquad \frac{p_t}{\rho}
=\frac{3r^2-2\ell^2}{2(r^2+\ell^2)}.
\]
Thus pure string tension demands \`f_r=1\` and \`p_t=0\`, contradicting the required stress at almost every radius. Independently, stress conservation for a pure radial string cloud (\`p_r=-rho,p_t=0\`) forces \`rho proportional to r^-2\`, a singular core. The target needs \`p_t/rho=-1\` centrally, crosses zero at \`r/ell=sqrt(2/3)\`, and violates dominant energy (\`p_t>rho\`) beyond \`r>2ell\`. Not a no-go against finite-thickness bending, velocity, coupled filament ensembles or media; those must explicitly supply the missing transverse stress.

## Test B: two independently specified flux actions and an emergent neutrality obstruction
Take
\[
S=\int d^4x\sqrt{-g}\left[\frac{R}{16\pi}
-\frac{\mathcal L(\mathcal F)}{4\pi}\right],\quad
\mathcal F=\frac14F_{\mu\nu}F^{\mu\nu},
\quad F_{\vartheta\varphi}=Q\sin\vartheta.
\]
The magnetic configuration has \`F=Q^2/(2r^4)\`. Metric variation gives:
\[
\rho=\frac{\mathcal L}{4\pi},\quad p_r=-\rho,\quad
p_t=\frac{2\mathcal F \mathcal L_\mathcal F-\mathcal L}{4\pi},
\quad m'(r)=r^2\mathcal L.
\]
Two *newly chosen for this trial*, not inverse-fit to an earlier metric, laws:
- BI magnetic branch: \(\mathcal L_{BI}=\beta^2(\sqrt{1+2\mathcal F/\beta^2}-1)\).
- Bounded exponential: \(\mathcal L_E=\beta^2(1-e^{-\mathcal F/\beta^2})\).

Both reduce to Maxwell \`L(F)=F+...\`, so both generate an exterior \`+Q²/r²\` Reissner-Nordström-like term when Q is nonzero. A single conserved magnetic monopole cannot source the prior **neutral** regular metric while retaining an ordinary Maxwell limit. For a minimally coupled neutral metric-null probe, the universal weak-angle charge term is \(\Delta\alpha=-3\pi Q^2/(4b_{\rm imp}^2)\) relative to the same-mass neutral Schwarzschild result at the appropriate perturbative order; nonlinear-field photons can have a *different* effective optical metric.

At scale \`r0=(Q²/(2 beta²))^(1/4)=1\`, integrate with \`m(0)=0\`, fixing ADM mass from the action rather than imposing it:
\[
M_E/\beta^2=\Gamma(1/4)/3=1.2085366361,\quad
M_{BI}/\beta^2=2.0787796663.
\]
The BI branch has \(\rho\sim\beta|Q|/(4\pi r^2)\) and \(K\sim16\beta^2Q^2/r^4\), **finite total field energy but divergent curvature**. The exponential branch has \(\rho(0)=\beta^2/(4\pi)\), \(K(0)=32\beta^4/3\), but transverse local wave modes have
\[
v_\perp^2=
\frac{\mathcal L_\mathcal F+2\mathcal F\mathcal L_{\mathcal F\mathcal F}}
{\mathcal L_\mathcal F}
=1-2(r_0/r)^4,
\]
which turns negative for \`r<2^(1/4)r0\`; the BI magnetic branch remains positive in this mode. A horizonless exponential configuration exposes that hyperbolicity failure; some massive configurations hide it behind the outer horizon without curing the full action.

**Reverse-engineering audit only, NOT a derivation:** the previous regular metric's source would require from a *single* monopole an effective \(\mathcal L_{\rm needed}\sim\mathcal F^{5/4}\) as \(\mathcal F\to0\), conflicting with Maxwell. The resulting transverse mode factor \((3y-4)/(2(1+y))\), \(y=r^2/\ell^2\), tends to 3/2 at large radius and -2 centrally. This fingerprints how far that metric lies from this narrow class of healthy flux sources.

## Test C: independent four-form plus repulsive sheath action, successful narrow construction
Rather than a point-like conserved monopole, consider a 4-form field \`H4=dA3\` and a charged 2+1-dimensional sheath \(\Sigma\) carrying conserved surface number \`n_s\`:
\[
S=\int d^4x\sqrt{-g}
\left[\frac{R}{16\pi}-\frac{H_{\mu\nu\rho\sigma}H^{\mu\nu\rho\sigma}}{48}\right]
-\int_{\Sigma}\sqrt{-\gamma}\,d^3\xi
\left(m_s n_s+\frac{g_s}{2}n_s^2\right)
+q_\Sigma\int_{\Sigma}A_3.
\]
The form equation has a constant magnitude on each side of a charged membrane. With \`H4=h0 * volume_form\` inside and zero outside, \(\rho_v=h_0^2/2\) and \(T_{\mu\nu}=-\rho_v g_{\mu\nu}\), a **derived vacuum-like isotropic negative-pressure interior**. Einstein equations give \`f_in=1-H²r²\`, \`H²=8 pi rho_v/3\`, and **exact Schwarzschild exterior** \`f_out=1-2M/r\`. This is a well-known class of thin-wall/gravastar-like GR construction, not a newly discovered field theory and not literally a finite-thickness filament.

From the *surface material action*, surface energy and pressure are:
\[
\sigma(n_s)=m_s n_s+\frac{g_s}{2}n_s^2,\quad
P=n_s\sigma'(n_s)-\sigma=\frac{g_s}{2}n_s^2>0.
\]
For fixed \`N=4 pi R² n_s\`, write \`A_s=m_s N/(4 pi)\`, \`B_s=g_s N²/(32 pi²)\`; then \(\sigma=A_s/R^2+B_s/R^4\), \(P=B_s/R^4\). Unlike a pure tension-only membrane, repulsive surface material provides the positive pressure needed for equilibrium. Israel's static conditions:
\[
\sqrt{f_{in}}-\sqrt{f_{out}}=4\pi R\sigma,
\quad
P=\frac1{8\pi R}\left[
\frac{1-M/R}{\sqrt{f_{out}}}
-\frac{1-2H^2R^2}{\sqrt{f_{in}}}\right].
\]
The first yields \`M(R)=R[1-(sqrt(1-H²R²)-4pi R sigma)^2]/2\`, with no preassigned mass profile. The second selects equilibria. Radial evolution is \(\dot R^2+V(R;M)=0\):
\[
V=f_{in}-\left[\frac{f_{in}-f_{out}+k(R)^2}{2k(R)}\right]^2,
\quad k(R)=4\pi R\sigma(R).
\]
At equilibrium \`V=V'=0\`; \`V''>0\` is **linear spherical radial stability only**.

**A worked independently input example:** set \(\rho_v=0.01,\ A_s=0.01,\ B_s=0.1\) (dimensionless demonstration, not fit).
| Branch | R | M | 2M/R | V'' | exterior r_ph=3M? |
|---|---:|---:|---:|---:|---|
| Inner | 1.3348987433 | 0.6074092947 | 0.9100454964 | -1.9906051 | yes, unstable |
| Outer | 1.6098793999 | 0.5992018936 | 0.7444059396 | +1.4010517 | yes, **radially stable** |
Outer stable branch: \`R/M=2.6867061\`, surface \`c_s²=dP/dsigma=0.88528042<1\`; local energy positivity and \(P<\sigma\) hold. Static pressure residual <2e-17. The shell is outside \`2M\`, inside photon sphere \`3M\`, hence horizonless yet ultracompact. A bounded *72-point parameter scan* found 92 equilibria, 46 radially stable, one stable & ultracompact: existence only, not parameter-space classification.

**Scattering consequence:** Null geodesics with turning radius \`r_turn>R\` have identically Schwarzschild trajectories for the same M. Agreement at a fractional \`10^-13\` target is EXACT by standard GR, not a novel SAT validation. Unknown effects reside in wave reflection, interior excitations, and boundary constitutive impedance when fields reach the sheath. For the stable compact example, the exterior geometric round-trip radial null travel between the sheath and photon sphere is \`Delta t/M=2[(3-R/M)+2 ln(1/(R/M-2))]=2.12998310\`. This is not an observed or theoretically complete gravitational-wave echo time.

## Validation, failure gates, next test
- Independent symbolic check: target stress conservation vanishes exactly and \(p_t/\rho=(-2\ell^2+3r^2)/(2(\ell^2+r^2))\).
- NED integration: numerical central BI curvature coefficient tends to unity with shrinking r; exponential tends exactly to \`K(0)=32 beta^4/3\`; maximum tested normalized stress conservation residual ~2.1e-7 (finite differences).
- Shell: junction pressure matches surface EOS to <2e-17; radial V'' signs checked under step refinement. A radius-varying mass minimum is **not** a test of nonspherical or finite-width stability.
- **Hard stop for physical SAT claim:** the 4-form and conserved membrane fluid have not been deduced from H(s)H worldtube topology. The membrane has distributional curvature because it is infinitely thin. Angular perturbations, finite-thickness stability, evaporation, response to rotating Kerr exterior, and observational constraints remain open.
- **Next solver:** replace the surface equation of state with a finite-width, metric-varied contact/director energy; derive a frequency-dependent Robin impedance \(Z_\Sigma(\omega)\) for the external scalar Regge-Wheeler equation. Test absorption/unitarity and compare with fully absorbing Schwarzschild, neutral surface and no-contact controls. Do NOT infer photon reflectivity from the shell mass profile alone.

**Peer circulation:** prepend these results to predecessor hostile review packets HsH issues #20 (Meridian), #21 (Mercer), #22 (Morrow + Kestrel), with distinct archive comparators. They are review *requests*, not reviews received. A revised publication draft awaits independent audits.

**Ravel** (no user's signet)
