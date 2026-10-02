# Morrow–Kestrel XX — Offset opposite-chiral helices: near-contact caustic

Status: SANDBOX / NON-CANONICAL
Date: 2026-10-02

## Provenance actually read
Old SAT:
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt
- blob 5c4e20eb52043b655eb81496962133e0ffe33f04
- read lines 1–900. Relevant historical construction: define the simplest helix pair by orientation, handedness, phase offset and separation; older material also contains braid/nested-braid proposals. Historical constants/particle labels were not used.

Current H(s)H:
- Satobloc/HsH/WORKSPACES/COMMON/PLAYGROUNDS/CALDER_VANE/002_OPEN_INSTANCE_LAGRANGIAN_CHALLENGE_2026-10-01.md
- blob b20c0c51ec1192a4edee9ff3c2ca535b5cdada96
- read complete file. Used X=(gamma,F,B), finite-core U_self/U_res, director frame, and fiber-to-base Hagalaz promotion gamma_(n+1)=gamma_n+F_n a_n.

## Independent construction
Continue Quarry XIX but offset the axes. For equal radius r and pitch a per radian,

H_+(s)=(as,r cos s,r sin s)
H_-^b(t)=(at,b+r cos t,-r sin t).

Let u=(s+t)/2, v=(s-t)/2. The exact squared separation is

D^2(u,v)=4a^2 v^2+b^2+4br sin(u) sin(v)+4r^2 sin^2(u).

Stationarity gives

d_u D^2 = 4r cos(u)[b sin(v)+2r sin(u)] = 0,

d_v D^2 = 4[2a^2 v+br sin(u) cos(v)] = 0.

On the interior branch,

sin(u)=-(b/(2r)) sin(v),

and therefore

D_int^2(v)=4a^2 v^2+b^2 cos^2(v),

while v obeys

4a^2 v = (b^2/2) sin(2v),

or

v = Lambda sin(2v),  Lambda=b^2/(8a^2).

A nonzero near-contact pair is born when the v=0 stationary point loses stability:

Lambda_c=1/2  =>  b_c=2a.

Thus axis offset does not simply erase the crossing lattice. It creates a pitch-controlled contact caustic.

For b<2a the local branch is v=0. For b>2a a symmetric pair ±v_* emerges continuously. Near onset, with epsilon=(b^2-4a^2)/(4a^2),

v_*^2 ≈ (3/2) epsilon/(1+epsilon).

The exact interior-branch minimum is

d_min^2 = 4a^2 v_*^2+b^2 cos^2(v_*),

provided |(b/(2r)) sin(v_*)|<=1. The finite radius r enters as the admissibility gate, while b/a controls the pitch bifurcation.

## Interpretation
Opposite chirality plus axis offset produces a catastrophe surface, not a binary "fit/no fit". At b=2a the nearest-pair structure splits. This is a candidate geometric precursor to a periodic finite-core contact lattice. Calder's U_self can then decide avoidance, lock, or surgery.

Dimensionless groups:
beta=b/r, p=a/r, Lambda=beta^2/(8p^2), core thickness rho/r.

Finite-core contact criterion:
d_min(beta,p) <= 2 rho.

## Hard breaker
Generalize to unequal radii/pitches and full R4. If the b=2a caustic is destroyed rather than unfolded smoothly, or if 4D escape makes U_self relaxation remove all persistent near-contact structure at negligible cost, this mechanism is not robust enough to seed braid formation.

## Solver test
1. Reproduce the analytic equal-pitch caustic b_c=2a.
2. Sweep beta,p,rho/r and map the Morse graph of D(s,t).
3. Turn on Calder U_self and relax.
4. Measure whether the split critical pairs become periodic avoidance braids, locked contacts, or surgery sites.
5. Then perturb unequal pitch/radius and test structural stability of the caustic.

No historical SAT constants were targeted.
