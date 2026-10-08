# SANDBOXED — Ravel: Covariant scattering and a finite-core black-hole benchmark
**Date:** 2026-10-08  
**Status:** research sandbox; ordinary Einstein-GR model with a conjectured finite-core profile, **not** a derived SAT field equation or observational confirmation.  
**Revision:** 3, incorporates an internal hostile audit; independent reviewer responses pending.

## Abstract

A recovered 2025 SAT calculation assigned two normalized path weights, obtaining a toy sum of \(1+e^{-T\ell_f^2}\). This is a valuable computational audit exercise, but not yet a momentum-dependent relativistic scattering amplitude. The same archive suggested a softened Newtonian potential and a particular light-bending correction without specifying a four-dimensional metric. We calculate an explicit Lorentzian general-relativistic completion, its source stresses, weak null scattering, photon capture orbit, horizon existence, and a high-precision conditional tolerance region. The covariant calculation produces a different leading light-bending coefficient than the archived heuristic. We further find that, in the first-post-Minkowskian approximation, the correction to the *differential ray scattering cross-section at a fixed small angle* is fourth-order in the core scale even though the deflection angle itself changes at second order. The calculation does not establish uniquely SAT-specific physics.

## 1. Primary archive recovery and source boundaries

All paths are exact repository-relative paths unless a repository is stated separately.

**Substantial historical reads**
1. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/2025 scatter amp.txt.txt\`; first 600 lines, 28,300 characters returned. Covers bending-path normalization, assigned reconnection factors, code audit, dimensions, and the Monte Carlo toy.
2. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SATO-scattering.txt\`; complete 3,374 characters. A topological S-matrix *proposal*, without physical external states.
3. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2025-8-24 STATUS OVERVIEW.txt\`; first 250 lines, complete 11,232 characters. Identifies missing external momenta and suggests a softened Newton potential.
4. \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/🧱🪢BLACK HOLES.txt\`; first 400 lines, 23,691 characters. Historical black-hole thermodynamics/flux-sector paper; not assumed correct.

**Substantial September 30 HsH reads**
1. \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SDFA.txt\`; first 500 lines, complete 11,232-character status document.
2. \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ADFA.txt\`; first 650 lines, complete 9,650-character tolerance document, including candidate gravity softening and lensing heuristics.

**Tooling and authority:** Newly read \`WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md\`; Common onboarding, symbol, citation, task, Reference Desk, and workflow documents. The reference desk and \`Satobloc/HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt\` overview-read; HSH_RESOURCES Toolkit index, Tool Chest, and digestion plan triaged. Reference links indexed, not imported as physical hypotheses; quarantined \`PRIOR_ART\` not entered. Examined \`Satobloc/HsH/tools/search_archive_content.py\` (Mercer_Searcher implementation); a full three-repo Mersearch corpus was not locally materialized, so **no Mersearch query result or exhaustive archive search is claimed**. Known-path reading and bounded repository retrieval used instead.

Historical SAT \(\ell_f\) may mean a loop/coiling scale, **not** a microscopic material radius. Its identification with the local test length \(\ell\) is deliberately withheld.

## 2. What the 2025 'scattering amplitude' actually establishes

The archive weighs a 1D transverse deflection using a normalized Gaussian bending penalty and assigns a reconnection weight
\[
w_{\rm recon}=e^{-T_{\rm recon}\ell_f^2}\,\alpha_{\rm top}.
\]
With \(\alpha_{\rm top}=1\), the two-channel Monte Carlo reproduces the assigned partition sum
\[
Z_{\rm toy}=1+e^{-T_{\rm recon}\ell_f^2}.
\]
This is not a 2-to-2 graviton S-matrix. It has neither incoming/outgoing four-momentum labels nor a normalized Lorentzian amplitude, analytic phase, optical theorem, or proven renormalized perturbation expansion. The archival self-audit found and glossed over a real dimensional issue: \(\int(y'')^2ds\) has units inverse length when \(y,x,s\) are lengths, requiring its multiplier to have units length, whereas \(T_{\rm recon}\ell_f^2\) requires its coefficient to have units inverse area. We use different LOCAL coefficients; equating them is blocked until a real derivation supplies scales.

## 3. Explicit standard-physics control: an Einstein-GR metric

Use standard Lorentzian signature \((-+++)\) and geometric units \(G=c=1\). Here \(M\) is gravitational mass in length units, \(r\) **areal** radius, \(\ell\) a LOCAL candidate core length, and \(b=L/E\) asymptotic impact parameter. Take the static spherical metric
\[
ds^2=-A(r)\,dt^2+A(r)^{-1}dr^2+r^2(d\vartheta^2+\sin^2\vartheta\,d\varphi^2),
\tag{1}
\]
where
\[
A(r)=1-\frac{2m(r)}r,\qquad
m(r)=\frac{Mr^3}{(r^2+\ell^2)^{3/2}}.
\tag{2}
\]
This is an **ansatz** belonging to standard Einstein gravity with an anisotropic source. It was not derived from SAT. As \(\ell\to0\), it returns exactly to exterior Schwarzschild.

Einstein's equations \(G_{\mu\nu}=8\pi T_{\mu\nu}\) fix, in an orthonormal frame,
\[
\rho=\frac{3M\ell^2}{4\pi(r^2+\ell^2)^{5/2}},\qquad
p_r=-\rho,\qquad
p_t=\frac{3M\ell^2(3r^2-2\ell^2)}
{8\pi(r^2+\ell^2)^{7/2}}.
\tag{3}
\]
In particular, \(\rho+p_t=15M\ell^2r^2/[8\pi(r^2+\ell^2)^{7/2}]\geq0\). These stresses extend outside any horizon, so the metric is **not a modified vacuum Schwarzschild solution**. Ordinary anisotropic matter could cause the same observations. The center is regular for every nonzero \(\ell\): the Kretschmann scalar obeys \(K(0)=96M^2/\ell^6\).

### The finite-potential fallacy

The historical candidate was \(\Phi(r)=-GM/\sqrt{r^2+\ell^2}\). Finite potential does **not** establish finite spacetime curvature. If one simply sets
\[
A_{\rm naive}(r)=1-\frac{2M}{\sqrt{r^2+\ell^2}},\qquad
B_{\rm naive}=A_{\rm naive}^{-1}
\]
in areal radius, then
\[
K_{\rm naive}(r)\sim\frac{16M^2}{\ell^2r^4},\qquad r\to0.
\]
Our metric (2) avoids this specific singularity, but does **not** reproduce exactly the same potential: at large \(r\), the \(r^{-3}\) metric corrections are \(3M\ell^2/r^3\) and \(M\ell^2/r^3\), respectively. A full metric and its stress tensor cannot be substituted by one softened scalar potential.

## 4. Exact null orbit and leading relativistic deflection

Constants of motion for equatorial null geodesics:
\[
E=A\dot t,\quad L=r^2\dot\varphi,\quad b=L/E,\qquad
\dot r^2=E^2-\frac{L^2A(r)}{r^2}.
\tag{4}
\]
With \(u=1/r\), the exact orbit equation is
\[
u''(\varphi)+u=\frac{3Mu^2}{(1+\ell^2u^2)^{5/2}}.
\tag{5}
\]
Perturb to first order in \(M/b\) around \(u_0=\cos\varphi/b\). The deflection is
\[
\begin{split}
\alpha_{\rm 1PM}(b)&=\frac{3M}{b}
\int_{-\pi/2}^{\pi/2}
\frac{\cos^3\varphi\,d\varphi}
{[1+(\ell/b)^2\cos^2\varphi]^{5/2}}\\
&=\boxed{\frac{4M}{b}\left(1+\frac{\ell^2}{b^2}\right)^{-2}}.
\end{split}\tag{6}
\]
The integral identity is exact in \(\ell/b\) at *first* post-Minkowskian order. The fractional leading change is \(-2(\ell/b)^2\). The archived ADFA/P3 heuristic instead implies \(-3(\ell/b)^2/2\), and is not derived from a unique metric. This comparison tests that **specific** heuristic, not all possible SAT completions.

A high-precision quadrature and algebraic result agree at \(\ell/M=0.2,b/M=1000\):
- quadrature \(0.003999999680000019199998976000051199997542\);
- formula (6) \(0.003999999680000019199998976000051199997542\);
- archive heuristic \(0.003999999760000011999999440000025199998891\).

Independent exact geodesic integration (including beyond-1PM terms), at \(\ell/M=0.2\):
- \(b/M=100\): core angle \(0.04122219338183593\); Schwarzschild \(0.04122253974927365\); relative \(-8.40238\times10^{-6}\), against 1PM \(-7.99995\times10^{-6}\).
- \(b/M=1000\): core \(0.00401182348743593\); Schwarzschild \(0.00401182380992536\); relative \(-8.03847\times10^{-8}\), against 1PM \(-7.99999952\times10^{-8}\).

The differences between exact integration and (6) are higher post-Minkowskian contributions. No real dataset has been fitted.

### Unexpected *observable*-dependent cancellation

For classical small-angle rays,
\[
\frac{d\sigma}{d\Omega}=\frac{b}{\sin\alpha}\left|\frac{db}{d\alpha}\right|.
\]
Let \(q=\ell^2/b^2\). Equation (6) gives, at a **fixed observed angle** on its monotone branch,
\[
\boxed{
\frac{(d\sigma/d\Omega)_{\rm core}}
     {(d\sigma/d\Omega)_{\rm GR,1PM}}
=\frac{1}{(1+q)^3(1-3q)}
=1+6q^2+O(q^3).
}
\tag{7}
\]
The order-\(q\) terms cancel between the impact-parameter map and its Jacobian. Thus the deflection at known \(b\) changes as \(\ell^2\), while the fixed-angle differential ray cross-section initially changes as \(\ell^4\). At \(\ell/M=0.2,b/M=100\), these differences are respectively about \(-7.99995\times10^{-6}\) and \(+9.60\times10^{-11}\) **within 1PM**. Not a quantum scattering probability and not a measured photon-ring brightness. The finite \(\alpha\) Jacobian is identical in both compared models at fixed \(\alpha\); the small-angle approximation controls other omitted terms.

## 5. Black-hole photon capture as a stronger test

The exterior unstable null circular orbit satisfies \(rA'-2A=0\), hence
\[
(r_{\rm ph}^2+\ell^2)^{5/2}=3Mr_{\rm ph}^4,\qquad
b_c=\frac{r_{\rm ph}}{\sqrt{A(r_{\rm ph})}}.
\tag{8}
\]
For small \(\ell/M\),
\[
r_{\rm ph}/M=3-\frac56(\ell/M)^2+O((\ell/M)^4),\qquad
b_c/(3\sqrt3M)=1-\frac16(\ell/M)^2+O((\ell/M)^4).
\tag{9}
\]

| \(\ell/M\) | \(r_{\rm ph}/M\) | \(b_c/M\) | \(\Delta b_c/b_{c,0}\) | \(\Delta(\pi b_c^2)/(\pi b_{c,0}^2)\) |
|---:|---:|---:|---:|---:|
| 0 | 3 | 5.196152423 | 0 | 0 |
| 0.05 | 2.997914783 | 5.193985703 | −0.0004169854 | −0.0008337970 |
| 0.10 | 2.991636365 | 5.187465547 | −0.0016717899 | −0.0033407850 |
| 0.20 | 2.966171464 | 5.161077577 | −0.0067501572 | −0.0134547497 |
| 0.40 | 2.857978018 | 5.050075108 | −0.0281125924 | −0.0554348669 |

An event horizon exists for \(\ell/M\leq4/(3\sqrt3)=0.7698003589\). This is a spherical nonrotating metric. A distant ray-capture threshold is **not** automatically a luminous accretion-ring diameter; black-hole rotation, emissivity, plasma, calibration, and distance/mass uncertainties prevent direct use of unprocessed telescope images as data.

## 6. Requested target: 0.00000000001 percent

That percentage is \(10^{-13}\) fractionally. It is an **aspirational comparison threshold**, not an observational precision or fitted achievement.

If the metric (2) is stipulated and Schwarzschild's mass is held fixed, then from (9)
\[
\left|\frac{\Delta b_c}{b_{c,0}}\right|<10^{-13}
\;\Longrightarrow\;
\ell/M\lesssim\sqrt{6\times10^{-13}}
=7.74597\times10^{-7}
\]
at leading order. From (6),
\[
|\Delta\alpha/\alpha|<10^{-13}
\;\Longrightarrow\;
\ell/b\lesssim\sqrt{10^{-13}/2}
=2.23607\times10^{-7}.
\]
These are parameter *design inequalities*, NOT empirical constraints. A tiny effect could simply mean SAT has no discernible improvement over GR.

## 7. Additional real-system control: Saturn's planetary rings

A ring grain traces a timelike four-dimensional worldline, with local scattering evaluated in a freely falling tetrad. For nearby nonrelativistic grains in the frame rotating at Keplerian frequency \(\Omega\), the familiar Hill equations are
\[
\ddot x-2\Omega\dot y-3\Omega^2 x=f_x,\qquad
\ddot y+2\Omega\dot x=f_y.
\tag{10}
\]
A **candidate** H(s)H correction can couple relative centerline motion to measured contact geometry \(U_c\) and a dynamical internal director. It must vanish for separated grains if it represents pure contact mechanics. Any claimed modification of distant encounters needs an independently derived long-range channel. Ring particle size, restitution, spin, optical depth, collision rates, and local velocity dispersion are unknown inputs here; without a source-backed dataset, assigning a numerical Saturn-ring improvement would be fictitious. This is a null/failure gate, not a successful Saturn-ring fit.

## 8. Hostile self-audit and comparison

1. **Old scattering archive:** better as concept/experiment motivation than as physical amplitude. Its Monte Carlo reproduces assigned weights; the 20-point positive audit overstates what was computed and fails an explicit unit check.
2. **Old black-hole SAT draft:** supplies speculative microphysics and standard thermodynamic identities, but no derivation of (3) or observable scattering correction. Conversely, this note does not derive a microscopic black-hole entropy spectrum.
3. **This note's main liability:** the central metric ansatz is standard Einstein-GR with anisotropic matter. A regular metric plus an unknown core length is not uniquely SAT and cannot claim priority over existing regular black-hole literature. Distinct material models can reproduce the same \(A(r)\).
4. **Revision corrections:** added stress-energy, nonsingularity check, exact-geodesic control, capture cross-section, observable Jacobian cancellation, coefficient comparison, scale-identification warning, and explicit data/model failure gates. No unreceived review is attributed to colleagues.
5. **Mathematical failure condition:** if independently derived finite-core mechanics does not yield a conserved \(T_{\mu\nu}\) compatible with (3), this metric is *not* the H(s)H prediction. If it does, verify hyperbolicity/stability and seek a held-out observable that distinguishes ordinary matter.

## 9. Peer-review routing and next decisive calculation

Three separate hostile-audit packets link this paper to **one different archive comparator per reviewer**:
- Meridian: historical Einstein/Minkowski collected relativity paper, covariance and geodesic audit.
- Mercer: 2025 SAT scattering-amplitude development, action and normalization audit.
- Morrow + Kestrel: archival SAT black-hole chapter, stress/source/strong-field audit.

Packets are GitHub issues 20, 21, 22; **submitted, not yet answered**. No external/independent hostile verdict exists as of this note. The next concrete **SATO novelty gate** is to derive effective \(m(r)\) or the stress triple \((\rho,p_r,p_t)\) from an independently constrained finite-core worldtube material action, not by reconstructing (3) after observing the desired answer. Then compare one *held-out* astrophysical scattering dataset, uncertainty model included.

**Ravel**  
