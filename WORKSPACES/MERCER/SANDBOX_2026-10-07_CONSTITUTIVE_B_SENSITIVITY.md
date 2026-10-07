# SANDBOX — constitutive sensitivity of the B-like helix coordinate
**Mercer — 2026-10-07 — SILOED PLAYGROUND / noncanonical**

## Exact reading record
- Controlling front door: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, plus Reference Desk, War Room declaration, Tool Chest, toolkit index/digestion router, Nathan preference BOOT.
- SAT archive substantial read: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH SAT 2026 ROUNDUP/SAT PARTICLE LAGRANGIAN.txt`. Recovered: explicit 4D superhelix, filament action with tension/bending terms, persistent lepton coil vs 3-filament baryon braid, mass as time-surface/filament resistance.
- HsH substantial read: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[SAT26 PRE-ROUNDUP - init]/H(s)H MANIFOLDS.txt`. Recovered: finite worldtube, Euclidean 4D, resolving slab, SO(4) generator, bending + forward-tug action, closure-based effective mass, historical B entries. Historical numerical targets were not used to construct the model.

## Independent construction
Take one helical centerline in a local 3-plane of E4:
[
x(t)=(r\cos t,r\sin t,a t),\quad t\in[0,2\pi],\quad q=a/r.
]
For one turn,
[
\kappa_h=\frac{r}{r^2+a^2},\quad ds=\sqrt{r^2+a^2},dt.
]
Use a minimal bending + time-normal alignment functional:
[
E=\frac{K}{2}\int \kappa_h^2 ds+\frac{G}{2}\int (T\cdot u)^2 ds.
]
This gives
[
E=\frac{\pi K}{r}(1+q^2)^{-3/2}+\pi G r\,\frac{q^2}{\sqrt{1+q^2}}.
]
Define the local constitutive ratio
[
\eta=\frac{G r^2}{K}.
]
Then
[
\frac{Er}{\pi K}=f(q)=(1+q^2)^{-3/2}+\eta q^2(1+q^2)^{-1/2}.
]
Stationarity gives
[
f'(q)=\frac{q[\eta q^4+3\eta q^2+2\eta-3]}{(1+q^2)^{5/2}}=0,
]
so the nontrivial equilibrium satisfies
[
\boxed{\eta=\frac{3}{(1+q^2)(2+q^2)}}.
]
Equivalently,
[
q^2=\frac{-3+\sqrt{1+12/\eta}}{2}.
]

## Concrete discriminator
The logarithmic sensitivity is
[
\boxed{\frac{d\ln q}{d\ln\eta}=-\frac{(1+q^2)(2+q^2)}{2q^2(3+2q^2)}}.
]
At a B-like coordinate q≈0.24 this is ≈ -6.1. Thus a ~0.2% change in the effective tug/bending ratio moves q by ~1.2%. A percent-level shift of a B-like geometric coordinate therefore does **not** require percent-level geometric corruption; this variational regime is intrinsically sensitive.

Post-construction diagnostic only: raw historical B0=3/(4π)=0.238732 gives η=1.379800. The B value that would make the previously recovered structural ratio 2π/B^4 equal the observed proton/electron ratio is 0.241862, corresponding to η=1.376833, only -0.2151% from the raw-B constitutive ratio. This is NOT a derivation of the mass ratio; it quantifies how little constitutive change would be needed if that historical factorization survives independent reconstruction.

## Two regimes / scale implication
- Bending-dominated (η small): equilibrium q grows; the helix loosens axially.
- Tug/alignment-dominated (η→3/2 from below): q→0; the helix flattens. For η>3/2 the only local minimum in this toy functional is q=0.
Thus a composite braid can shift pitch through a very small renormalization of effective K or G. Interbraid coupling need not be inserted as an ad hoc correction to mass; it can enter upstream by changing the equilibrium geometry.

## Failure conditions
1. If the relevant H(s)H mass functional does not reduce locally to bending + time-normal alignment, this toy law is inapplicable.
2. If q is not related to historical B by an independently recovered geometric map, no B claim follows.
3. If adding finite-core/contact/interbraid terms changes the stationary branch qualitatively, the sensitivity estimate must be discarded.
4. No historical particle mass may be used to fit K, G, r, or q.

## Next solver test
Construct three 120-degree phase-shifted finite-core helices and add a pair interaction U(d_ij). Minimize the full one-period action over (q,r) for one strand and for the symmetric three-strand braid using the SAME microscopic K,G and an independently specified U. Measure Δq/q and the action ratio. The sharp test is whether composite coupling naturally produces an O(10^-3) change in η while preserving the closure structure, without using any particle mass as input.
