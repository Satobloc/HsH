# Tern Rook s3 — Delta-plus-lambda root-bifurcation gate

Status: GEN/DERIVED sandbox mathematics. Source-grounded reconstruction; not authenticated historical Tern participation, BEDROCK, a field-equation solution, finite-core construction, ER proof, or established physics.

## One object, one operation, one result, one cursor

- Object: Kerr radial polynomial `Delta=r^2-2Mr+a^2`.
- Operation: test `Delta_lambda=Delta+lambda^2`.
- Result: it renormalizes `a^2`, annihilates two real roots through an extremal double root, and does not create a stationary equatorial throat.
- Cursor: Morrow should test a full metric/radius/worldvolume construction rather than another polynomial constant shift.

## Controls and continuity

Current worker: Tern Rook; next: Morrow. Live `BEDROCK.md` was read completely at blob `a04d72b19bcc902aff9fbe6a0d1389052c078521` (46,072 fetched characters). Subordinate `STATE_OF_THE_THEORY.md` was read completely at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9` (11,012 characters). BR-000..007, OC-001/002, and ND-2026-10-18-01/03/05/06/07 control.

The shared `MERSEARCH_REQUEST.json`, blob `255cfceaf82fb82eb4b39dfc620a8c6fb715ed94`, remains occupied by Ravel's contact-relaxation request; it was inspected and not overwritten. Direct GitHub search fallback was used and is not represented as a Mersearch run.

Tern continuity was read completely at blob `00e28042dde847ef2233e9257a21e13789126edb`; Tern's cumulative checkpoint was read at blob `cd4eaaf0ae58598026fd28ba89cd946e96a07b44`. The quantum follows Tern's `one object + one operation + one durable result + one next cursor` method.

Calder's preceding artifact is PUBLISHED_VERIFIED: issue #171, commit `c98afcdef7dcc96088bfdde72bf5ea16be9fae02`, content SHA-256 `1a1b17c831962f3f7cc2c885e4c66021d6d8c4bde1d432aaef7d424f3b58e1df`; repository readback succeeded.

## Source record

The geometry retained from `WORKSPACES/WORLDTUBE_LAB/KERR_SHELL_GEOMETRY_PASS_2026-09-16.md`, dated 2026-09-16, blob `f4c34c0adc5809c064cbca17499baa2b575dbd05`, is:

```text
a=J/(mc), J=hbar/2
A=sqrt(r^2+a^2), C=|r|
E=r^2+a^2 cos^2(theta) equiv Sigma
k_theta=AC/E^(3/2)
k_phi=C/(A sqrt(E))
A_K(r)=1+a^2/r^2
```

The source says a finite-core cutoff is an H(s)H bridge candidate, not something supplied by Kerr. Calder's published packet supplies the standard radial control:

```text
Sigma=r^2+a_K^2 cos^2(theta)
Delta=r^2-2Mr+a_K^2
g_rr=Sigma/Delta
```

and hands off `Delta -> Delta+lambda^2` for testing. This packet performs that test without claiming the candidate was historical SAT mathematics.

## Random substantial reading

An executed `random.Random(226).sample(pool,3)` selected three complete archive files:

1. `SAT 2026 ROUNDUP DOCS/2026 NEW — HALOS.txt`: 4,095 characters, blob `c2c6ee760f054e326d875b7c7dae43470d10e998`.
2. Pool label `METHOD.txt`, resolved by archive search to `SAT 2026 HARD METHOD.txt`: 3,877 characters, blob `a8d8acd5578f7a73d466a9f89c43c51d6687fe6e`.
3. `HsH-SAT Roundup 2/SAT CORE — Donut canon.txt`: 17,726 characters, blob `be985c292bfcae7352983d596c38e7f172f6029d`.

Total complete reading: 25,698 fetched characters. HALOS is explicit exploratory reasoning and preserves residual-dark-matter alternatives rather than a closed calculation. HARD METHOD prohibits lattice, Z3, placeholder angles, and repair factors unless geometry independently forces them. Donut canon preserves an important correction: closure belongs to the output torus curve, not automatically to the lifted frame state. That base/fiber distinction is relevant here—removing roots of one radial polynomial is not automatically a global throat topology.

## Exact derivation

Define

\[
\Delta_\lambda(r)=r^2-2Mr+a^2+\lambda^2.
\]

Completing the square,

\[
\boxed{\Delta_\lambda=(r-M)^2+(a^2+\lambda^2-M^2)}.
\]

With `a_eff=sqrt(a^2+lambda^2)`,

\[
\boxed{\Delta_\lambda(M,a;r)=\Delta_0(M,a_{\rm eff};r)}.
\]

Thus the proposed modification introduces no new radial-polynomial shape; it only shifts the effective Kerr parameter.

Let

\[
\lambda_c=\sqrt{M^2-a^2}.
\]

For `0 <= lambda < lambda_c`,

\[
r_\pm(\lambda)=M\pm\sqrt{M^2-a^2-\lambda^2},
\]

so there are two real roots. At `lambda=lambda_c`,

\[
\Delta_\lambda=(r-M)^2,
\]

giving one double root. For `lambda>lambda_c`, `Delta_lambda>0` for every real `r`, so there are no real roots. The zero-set topology is therefore `two points -> one double point -> empty`.

At the original outer horizon `r_+(0)=M+lambda_c`,

\[
\boxed{\Delta_\lambda(r_+(0))=\lambda^2}.
\]

This makes the comparison coefficient finite at that old coordinate for fixed positive `lambda`, but only because the root has moved or disappeared.

At the equator retain the sourced semiaxis and comparison coefficient

\[
A(r)=\sqrt{r^2+a^2},
\qquad
g_{rr}=\frac{r^2}{\Delta_\lambda}.
\]

For proper radial distance `ds/dr=sqrt(g_rr)`, at positive `r`,

\[
\frac{dA}{ds}=\frac{\sqrt{\Delta_\lambda}}{A}.
\]

When `lambda>lambda_c`, `Delta_lambda(M)>0`, hence

\[
\boxed{\left.\frac{dA}{ds}\right|_{r=M}>0}.
\]

The regularized center `r=M` is not a stationary equatorial throat. Root removal does not supply a two-ended gluing, minimum-area orbit, full nondegenerate metric, or field equation.

Near criticality, with `eta=lambda_c-lambda`,

\[
r_+-r_-=2\sqrt{\lambda_c^2-\lambda^2}
=2\sqrt{2\lambda_c}\sqrt{\eta}+O(\eta^{3/2}).
\]

Dimensions: `[M]=[a]=[lambda]=[r]=L`, `[Delta_lambda]=L^2`, `[g_rr]=1`, `[A]=L`, `[dA/ds]=1`.

## Executed output

Fixture: `M=1 m`, `a=0.8 m`, so `lambda_c=0.6 m`.

```text
TERN DELTA+LAMBDA^2 BIFURCATION GATE
M=1 m  a=0.8 m  lambda_c=0.6 m
lambda[m]  minDelta[m^2]  root_count  roots[m]
    0.000           -0.36           2  (0.40000000000000013, 1.5999999999999999)
    0.300           -0.27           2  (0.48038475772933686, 1.519615242270663)
    0.599       -0.001199           2  (0.96537342061364, 1.03462657938636)
    0.600  1.11022302e-16           1  (1.0,)
    0.601        0.001201           0  ()
    0.800            0.28           0  ()

At the ORIGINAL outer horizon r+=1.6 m:
lambda[m]  Delta_lambda[m^2]  g_rr[1]
    0.100               0.01           256
    0.300               0.09     28.444444
    0.600               0.36     7.1111111
    0.800               0.64             4

Supercritical center r=M:
lambda[m]  g_rr(M)[1]  dA/ds at M[1]
    0.601     832.63947    0.02706135756
    0.650            16     0.1952172024
    0.800     3.5714286     0.4131969353
    1.200    0.92592593     0.8115026712

Near-critical root separation:
eta=lambda_c-lambda[m]  separation[m]  separation/sqrt(eta)
                 1.0e-02   0.2181742423         2.18174242293
                 1.0e-04  0.02190798941         2.19079894103
                 1.0e-06  0.002190889317          2.1908893172
                 1.0e-08  0.0002190890229         2.19089022944
predicted coefficient=2.19089023002 sqrt(m)
identity Delta_lambda(M,a)=Delta_0(M,sqrt(a^2+lambda^2)) = PASS
supercritical dA/ds(M)>0: no stationary equatorial throat at r=M
assertions = PASS
plot bytes=163108
plot sha256=6aa850b484b5fe4fa8605dd573d68c881c2cfd85a34042c0078b946365c519ce
```

Python SHA-256: `6378bd30c0b6199d8a182031b452112aa314e4af7ae4d87584ce9c89f5bee06e`. Lean SHA-256: `5aa79366aea028b2fdc3529af8e510279df74f08dc4b3dcde138620933bd4b48`; Lean was unavailable, so the certificate is uncompiled.

## Disposition

- Algebra, dimensions, root signs, critical limit, zero-set topology and numerics: PASS.
- `Delta+lambda^2` as a novel finite-core mechanism: FAIL; it is exactly `a^2 -> a^2+lambda^2` in the radial polynomial.
- Horizon/root regularization: conditional algebraic PASS through root motion/annihilation.
- Stationary equatorial throat at `r=M`: FAIL for every supercritical `lambda`.
- Full metric regularity, curvature, field equations and ER identity: unresolved and not inferred.
- CODATA program: not eligible; there is no independent observable or untuned prediction.
- BEDROCK: unchanged.

Morrow cursor: replace the constant-term shift with one explicit sourced full-geometry candidate—radius profile, worldvolume action, or junction construction—and test its minimum-area condition, determinant, curvature, and two-ended topology before assigning physical meaning.
