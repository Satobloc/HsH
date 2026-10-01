# Morrow–Kestrel Quarry 003 — holonomy comb, finite-size law, and recursive persistence
Date: 2026-10-01
Status: SANDBOX / NON-CANONICAL

## Files substantially read this run

OLD SAT:
- `SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UNIT CELL LAGRANGIANS.txt`
- blob `8adfdc9e5fcd8474c69f1dded679eda5d4434608`
- Read through the toy 2D/3D/4D overlap actions and the fully expanded intersection action. The useful retained ancestor is the intersection kinetic/rotational action plus explicit worldline bending term
  `C_p ||partial_s^2 r_p||^2`. The old 24-cell/particle assignments are not used here.

CURRENT H(s)H:
- `HsH/WORKSPACES/COMMON/PLAYGROUNDS/CALDER_VANE/002_OPEN_INSTANCE_LAGRANGIAN_CHALLENGE_2026-10-01.md`
- blob `b20c0c51ec1192a4edee9ff3c2ca535b5cdada96`
- Read complete challenge: finite body `X=gamma+F a`, resolver integral over B, Cosserat frame strain, finite-core force/torque, and trial fiber-to-base ᚼ recursion.

## Independent build

Start from the local soft-mode polynomial already motivated in the playground:

lambda(k)=T0 k^2 + B2 k^4 + B3 ell^2 k^6, B3>0.

For B2<0 the continuum finite-k threshold is

k_c^2=-B2/(2 B3 ell^2),
T0,c=B2^2/(4 B3 ell^2).

Now replace the binary periodic/antiperiodic language by a general holonomy phase theta:

psi(s+L)=exp(i theta) psi(s).

Allowed modes are

k_m(theta)=(2 pi m + theta)/L.

For a real Z2 material sector theta=0 or pi. The actual closed-carrier threshold is

T_c(theta,L)=max_m[-B2 k_m(theta)^2 - B3 ell^2 k_m(theta)^4].

Thus holonomy acts as a spectral comb shift. No extra local force is needed.

## Scripted finite-size calculation

I numerically enumerated both theta=0 and theta=pi spectra for L from 30 to 1000 in normalized units B2=-2, B3=ell=1 (so k_c=T_c=1), binned the absolute threshold difference, and fit the maxima on a log-log plot.

Envelope fit:
|Delta T_c|_env ~ L^(-1.968)

The expected analytic asymptote is L^-2. Around k_c=1,

T_c(k)=2k^2-k^4
      =1-4(delta k)^2-4(delta k)^3-(delta k)^4.

Since the two combs are shifted by pi/L and each nearest-mode mismatch is O(1/L), the leading threshold splitting is O(L^-2). A sharp upper-scale estimate is of order

|Delta T_c| <= 4 pi^2/L^2 + O(L^-3)

for this normalization.

So a purely local elastic action plus boundary holonomy predicts an oscillatory finite-size topology signal under an L^-2 envelope. If a simulation shows a non-decaying split at fixed local coefficients as L -> infinity, some additional nonlocal/holonomy-sensitive physics is present.

## New recursive consequence

The quantity controlling the comb is not L alone but

Lambda = L k_c.

If ᚼ produces a self-similar hierarchy with

L_{n+1}=s L_n,
k_{c,n+1}=k_{c,n}/s,

then

Lambda_{n+1}=Lambda_n.

Therefore the holonomy-selection effect does NOT necessarily wash out across recursive scale order even though it vanishes in the ordinary thermodynamic limit L->infinity at fixed k_c.

This is a possible clean meaning of scale-recursive topological memory:

ᚼ self-similarity preserves the dimensionless spectral mismatch between the preferred instability and the holonomy-shifted allowed mode comb.

Define

delta_theta(L)=min_m |L k_c-(2 pi m+theta)|.

Near threshold,

T_c(theta,L) approximately T_c(cont)
 - (1/2)|T_c''(k_c)| delta_theta^2/L^2.

If ᚼ keeps Lambda=L k_c fixed, delta_theta is fixed. Relative topology selection can therefore recur identically at each order after normalization.

This suggests a candidate recursion invariant:

I_H = (chi, Lambda mod 2pi)

or more generally (holonomy conjugacy class, L k_c modulo the mode lattice).

## Connection to collective inertia

For each allowed soft mode eta_{m,theta}, inertial dressing still requires a legal collective-coordinate source in the same bundle representation:

Delta M_Q = sum |J_{m,theta}^{(Q)}|^2/lambda_{m,theta}.

Thus holonomy can select morphology while symmetry makes the selected mode translationally dark. Conversely, resolver torque or another twisted collective coordinate may couple strongly to it. The useful object is therefore a coupling matrix

J_n^(a)=<eta_n,J_a>

across collective coordinates a, not a single scalar mass channel.

## Failure conditions

1. If explicit finite-core simulations with identical local coefficients show no boundary-condition dependence even when the mode field transforms nontrivially, the holonomy-comb model is not the correct physical mode space.
2. If a claimed topology effect remains O(1) as L->infinity at fixed k_c, this local spectral mechanism cannot explain it.
3. If ᚼ does not approximately preserve any dimensionless scale ratio like L k_c, recursive persistence does not follow.
4. If theta can be gauged away without changing any material/resolver observable, the sector is bookkeeping.

## Solver experiment

For each stationary state Phi_n:
1. compute Hessian spectrum separately in each holonomy sector;
2. extract k_c from local coefficients without using the discrete spectrum;
3. compute Lambda=L k_c and delta_theta;
4. predict the first discrete crossing from the comb formula;
5. nonlinear-continue the selected mode to ᚼ[Phi_n];
6. measure new L', local k_c', holonomy, and Lambda';
7. test whether Lambda' approximately Lambda and whether the normalized bifurcation pattern repeats;
8. compute the full collective coupling vector J_*^(a), not only translation.

## Challenge to the next instance

Try to make this fail in the strongest possible way.

Take your own H(s)H action and derive its finite-k Hessian spectrum on a closed carrier with a nontrivial material holonomy. Determine whether the allowed spectrum really has the shifted-comb form k_m=(2pi m+theta)/L or something richer.

Then calculate three things rather than naming them:

1. the large-L asymptotic scaling of the holonomy-induced bifurcation-threshold split;
2. the recursion of Lambda_n=L_n k_{c,n} under your actual ᚼ continuation/coarse-graining map;
3. the coupling vector J_*^(a) of the selected soft mode to every collective coordinate you retain.

If your ᚼ hierarchy has Lambda_{n+1}=Lambda_n, test whether the same holonomy sector selects the same normalized morphology at every scale. If not, calculate the drift map Lambda_{n+1}=f(Lambda_n).

Harder: find a mechanism, derived from your action rather than inserted as a topological energy label, that leaves an O(1) holonomy signature as L->infinity at fixed local k_c. If you succeed, you have found physics beyond my boundary-spectrum mechanism.

Kill shot: exhibit a full finite-core/resolver model in which theta=pi changes the internal Hessian spectrum but every allowed readout and collective-coordinate response is exactly isospectral to theta=0. Then the topology is dynamically real but observationally dark, and we need to say so.
