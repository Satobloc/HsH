# Orson Vay | OV-20261008-08 | Gaussian-resolution semigroup discriminator

**Date:** 2026-10-08  
**Status:** SILOED SANDBOX / tested mathematical apparatus discriminator, not canonical H(s)H physics  
**Local notation namespace:** \`LOCAL:OV08\` (no symbol promotion).  
**Continuity:** follows OV-20261008-05 through OV-20261008-07, but uses a new invariant that does not depend on their contact exponents.

## The missing distinction

The same fixed worldtube can yield distinct detector curves at different resolutions. **However, a very large class of those curves must obey a universal consistency relation if the resolution change is *only* additive independent Gaussian alignment jitter.** The consistency test does not require knowing the worldtube's core shape, contact exponents, coupling support, or absolute contact location.

For an arbitrary fixed true detector response \`f(d)\` and Gaussian alignment jitter \`Z~N(0,1)\`, define

\[
G(d,v)=\mathbb E[f(d+\sqrt v\,Z)],\quad v=\sigma^2.
\]

Then \`G=K_v*f\` with \`K_v\` the Gaussian density of variance \`v\`. Therefore for \`v_2>v_1\`:

\[
\boxed{G(\cdot,v_2)=K_{v_2-v_1}*G(\cdot,v_1).}
\]

Equivalently,

\[
\boxed{\partial_vG=\tfrac12\partial_d^2G}
\]

when derivatives exist (distributionally under weaker assumptions).

**Interpretation:** if one measured response at higher alignment variance cannot be predicted by further Gaussian convolution of the lower-variance response, then the hypothesis "the *only* change was independent additive Gaussian alignment jitter with calibrated variance" is false. This does not identify what replaced it: correlated or non-Gaussian jitter, changing gain/background, changing geometry, or a different physical detector channel are alternatives. Passing the test does not prove that the effect is merely observational; actual physical diffusion could generate the same heat semigroup.

## Exact 4D finite-core fixture (not merely asymptotic power laws)

Circle \`C(phi)=(R cos phi,R sin phi,0,0)\` in Euclidean four-space with a normal \`B^3\` core of radius \`a<R\`. Resolving slab \`|n·X|≤H\`, \`n=(q,0,0,sqrt(1-q²))\`, \`q=sin(tilt)\`. Define first-contact penetration \`d=Rq+a-H\`.

Normal-ball coordinates at centerline phase \`phi\` have projected unit-coordinate \`z\`, with

\[
m=Rq\cos\phi,\qquad \gamma=\sqrt{1-q^2\sin^2\phi},
\qquad \beta=q\cos\phi/\gamma.
\]

The **exact** normal-ball cap measure integrands, including the tube Jacobian, are

\[
dV_{B^3}=\pi(a^2-z^2)(R+\beta z)\,dz\,d\phi,
\quad
dM_{S^2}=2\pi a(R+\beta z)\,dz\,d\phi.
\]

At each \`phi\`, the positive and negative lost caps are respectively \`z∈[max(-a,(H-m)/gamma),a]\` and \`z∈[-a,min(a,(-H-m)/gamma)]\`, when nonempty. Integrate over \`phi∈[0,2pi)\`; normalize by \`8pi²Ra³/3\` (bulk) and \`8pi²Ra²\` (boundary). This is a direct exact-cap calculation, with numerical quadrature only over \`phi\`.

A synthetic response \`f(d)=0.001+0.15*lost_shell_fraction(d)+4*lost_bulk_fraction(d)\` tests an arbitrary mixed coupling. These gains and the background are arbitrary and are **not physical fits**.

## Scripted results

Fixture: \`R=1,a=0.12,H=0.15\`, penetration grid spacing \`2e-5 R\`; 4096 midpoint angles. \`sigma1=0.0012R\`, \`sigma2=0.0025R\`, and additional Gaussian width \`sqrt(sigma2²-sigma1²)\`.

Over \`|d|<0.009R\`:

- Gaussian semigroup maximum absolute residual: \`1.39e-17\`.
- Gaussian semigroup RMS residual: \`2.87e-18\` (approximately \`4.80e-16\` of the response span), floating-point-level consistency.
- Control: substitute **uniform** additive alignment jitter of matching variance at each width and still *test* the Gaussian semigroup. Maximum residual \`1.42e-5\`; RMS \`6.46e-6\` (approximately \`0.108%\` of the response span).
- Exact cap integrals give \`lost_shell_fraction(0.003R)=0.00227693\`, \`lost_bulk_fraction(0.003R)=6.77309e-5\`.
- Small-contact fitted slopes over \`d/R∈[1e-5,2e-4]\`: shell \`1.49910\`, bulk \`2.49899\` (finite-window approach to \`3/2,5/2\`).
- Repeating cap integration at 8192 rather than 4096 angles gives \`lost_shell_fraction(0.003R)=0.00227694\`; numerical convergence is adequate for the stated response test.

**Numerical status:** independent cap integration + discrete convolution check. The semigroup itself is an exact mathematical identity under the stated Gaussian assumptions; the numerical near-zero residual is not evidence of a new physical law.

## Source ancestry and authority boundary

- **Historical SAT primary-conversation extraction:** \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THOUGHTS — from scratch .txt\`; read substantial contiguous range approximately character offsets \`34000–59000\`, particularly Nathan's worldline physical extent, timesheet interaction, nested helices, and observer-as-particle-interaction intuition. Interleaved assistant claims about a proved Schwarzschild/SO(4) unification are **generated assertions, not established results**. Do not use them as mathematical premises. ⟦PROV:SAT-THOUGHTS-SCRATCH·34k–59k⟧
- **Current HsH historical construction:** \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt\`; read contiguous range approximately \`28000–41000\`, covering Euclidean 4D, \`SO(4)\` UI, finite slab, and multiple competing dual-shell/metric summaries. This is a **generated compilation**, not a controlling Nathan-direct premise. ⟦PROV:HSH-MANIFOLDS-30SEP·28k–41k⟧
- **Current premise control:** \`Satobloc/HsH/BEDROCK.md\`, opening authority and foundational-source sections; no superseded 3+3 or dual-shell premise was imported.
- **Previous local fixture:** \`WORKSPACES/ORSON_VAY/OV_20261008_07_CONTACT_RESOLUTION_TOMOGRAPHY.md\`, read completely; its geometric support laws motivate this apparatus test, but the Gaussian semigroup identity is independent of those laws.
- **Supporting reference routing:** \`WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md\`, Common Reference Desk, HSH_RESOURCES toolkit index, toolkit digestion, Tool Chest, preferences BOOT, War Room declaration, and its linked-resource map reviewed for routing. HSH_RESOURCES was **not** promoted to theory authority. \`PRIOR_ART\` not entered.
- **Mathematics provenance:** ordinary Gaussian convolution and heat kernel identity, derived directly above. No external paper was required to formulate the test.

## Failure / discriminators / next cursor

A single width scan at a single nominal contact position cannot identify the underlying support dimension or absolute contact position. The semigroup test instead requires **curves over contact displacement** at two or more independently calibrated alignment variances.

The test can be defeated by miscalibrated variances, finite field-of-view convolution edges, variable gain/background, heteroscedastic or correlated alignment error, or genuine changing worldtube geometry. A positive result is **not unique to an observational cause**.

Next: test identifiability under **unknown contact offset, resolution-dependent background/gain, and realistic pointwise measurement noise**, then compare Gaussian versus non-Gaussian apparatus models with the same underlying exact finite-tube response. Preserve the distinction between rejecting a *specific apparatus model* and proving a new interaction.

## Reproduction

Local solver generated in run: \`orson_ov08_semigroup_solver.py\`. Uses NumPy, SciPy \`ndimage\`, Matplotlib; exact normal-cap antiderivatives + midpoint \`phi\` quadrature; two response plots. The explicit integrands and parameters above are sufficient to reconstruct it. No historical constants used as numerical targets.
