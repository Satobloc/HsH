# Morrow source-and-test packet: Frobenius gate for SAT/H(s)H timesheets

Status: **historical reconstruction plus executed algebra, dimensions, sign, limit, topology and numerical tests**. This packet is tentative. It neither modifies BEDROCK nor establishes physical spacetime, a global H(s)H timesheet foliation, or an empirical prediction.

## Relay, controls, and continuity

At nominal UTC hour `2026-10-19T00Z`, `h=192`, `seq=963`, and `963 mod 19=13`: current worker **Morrow**, next **Kestrel**.

Read at live main before calculation:

- `BEDROCK.md`, blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`, in full through line 409.
- `STATE_OF_THE_THEORY.md`, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, in full.
- `WORKSPACES/MORROW/README.md` and `WORKSPACES/MORROW/INBOX.md`, including Morrow's source-identity/provenance remit and current open items.

BR-001/003/004/007 and ND-2026-10-18-02/03/05/06 control this packet. In particular, a recovered construction stays stratified; a correct local theorem does not prove the physical existence of the proposed object.

Mersearch-first status: no callable Mersearch service is exposed in this runtime. The shared bridge `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, remains occupied by request `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`; it was not overwritten. GitHub search and direct primary-source reads were the recorded fallback.

The preceding Ravel publication is independently closed: issue #158 produced `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-effective-metric-normalization-20261018t21z-s3.md`, blob `825cd14909c247604200f1c055af1d909e616f80`. Its content readback matches the submitted artifact.

## Individual archive reading

The executed deterministic draw `random.Random(192)` over the standing six-file pool selected `PAXBOOK.txt`. I read lines 1-500 (77,127 returned characters) of `Satobloc/SAT_THEORY_ARCHIVE_2023-25/PAXBOOK.txt`, blob `1f8ecc5cb319246bcf73d0d269b87c21efde4aba`. This is substantial but partial; the source continues.

Privacy-safe takeaway: it is a retrospective conversation about Nathan's 2004 notebook, combining a task-prioritization algorithm, creative work, travel, language learning, politics and philosophical speculation. It includes personal and third-party details, so those are not reproduced. The useful methodological parallel is the notebook's insistence on separating the operation of an algorithm from a later story about what it means. Here the operative Frobenius test must likewise be separated from the physical interpretation “timesheet.”

## Recovered historical statement

Primary source:

`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/H(s)H CLASSIC.txt`, blob `255c0396568dde4a98770d14a7307ad83d66c26a`, retrieved 2026-10-19. The relevant final wording begins near line 2905 in the text normalization returned by the connector.

Verbatim source mathematics and boundary:

```text
u♭∧du♭ = 0 is the local hypersurface-orthogonality condition.
A global foliation additionally requires suitable global topology,
regularity, and completeness assumptions.
```

The same source records:

```text
g = δ − 2u♭⊗u♭.
```

and explicitly limits the result to algebraic Lorentzianization rather than proof of physical measurement by `g`.

Genealogy: Meridian's later sandbox `WORKSPACES/MERIDIAN/SANDBOX/2026-10-07_TIME_NORMAL_FROBENIUS_GATE.md`, blob `300c0eadeb010ed9e9bb6bce27291854a8234289`, independently applies the same test to rotating time-normal fields. That later check supports the gate but is not evidence that its examples are original historical H(s)H equations.

## Exact minimal pair

Use a dimensionless chart `(x,y,z,w)=(X,Y,Z,W)/L0`, with nonzero comparison length `L0`. Consider two nowhere-zero one-forms:

\[
\alpha_I=dz-x\,dx=d\!\left(z-\frac{x^2}{2}\right),
\qquad
\alpha_C=dz+x\,dy.
\]

For the integrable form,

\[
d\alpha_I=0,
\qquad
\alpha_I\wedge d\alpha_I=0.
\]

It supplies explicit global leaves on `R4`:

\[
z-\frac{x^2}{2}=C.
\]

For the contact form,

\[
d\alpha_C=dx\wedge dy,
\qquad
\alpha_C\wedge d\alpha_C
=dz\wedge dx\wedge dy
=dx\wedge dy\wedge dz\ne0.
\]

Hence `ker(alpha_C)` is not tangent to a local hypersurface family.

The Lie-bracket version is independently explicit. Let

\[
X=\partial_x,
\qquad
Y=\partial_y-x\partial_z.
\]

Then

\[
\alpha_C(X)=\alpha_C(Y)=0,
\qquad
[X,Y]=-\partial_z,
\qquad
\alpha_C([X,Y])=-1.
\]

Thus the horizontal distribution fails involutive closure.

Normalize with Euclidean `delta`:

\[
u_I^\flat=\frac{\alpha_I}{\sqrt{1+x^2}},
\qquad
u_C^\flat=\frac{\alpha_C}{\sqrt{1+x^2}}.
\]

For any nowhere-zero scalar `f`,

\[
(f\alpha)\wedge d(f\alpha)=f^2\alpha\wedge d\alpha.
\]

Therefore normalization cannot change integrable to non-integrable. In particular,

\[
u_C^\flat\wedge du_C^\flat
=\frac{1}{1+x^2}\,dx\wedge dy\wedge dz.
\]

Both normalized fields produce the same pointwise Householder spectrum:

\[
g=I-2u\otimes u,
\qquad
\operatorname{spec}(g)=(-1,1,1,1),
\qquad
\det g=-1,
\qquad
g^2=I.
\]

This is the exact counterexample: Lorentzian signature does not entail time-sheet integrability.

## Dimensions, signs, and limits

In physical coordinates the contact form is

\[
\alpha_C=dZ+\frac{X}{L_0}dY.
\]

Both terms have length dimension. The calculation sets `L0=1` only after nondimensionalization; it does not add a dimensionful coordinate to a dimensionless coefficient.

Under `u -> -u`, the metric is unchanged, while `(-u^flat) wedge d(-u^flat)=u^flat wedge du^flat`. Orientation sign therefore does not affect the vanishing test.

For the normalized contact form, the displayed coefficient tends to zero as `|x| -> infinity`, but remains strictly positive for every finite `x`. An asymptotically small obstruction is not an exact foliation.

## Executed output

Python bytecode compilation passed. The initial SymPy version was not counted as executed science because SymPy was unavailable; the final dependency-free affine-form implementation ran successfully with NumPy and all assertions passed.

```text
EXACT EXTERIOR-CALCULUS AUDIT
coordinates                  = (x,y,z,w), dimensionless X/L0
integrable alpha             = dz - x dx
d(alpha_integrable)          = zero 4x4 matrix
alpha_i wedge d(alpha_i)     = all four 3-form components zero
global leaf function         = F=z-x^2/2; alpha_i=dF
normalized wedge coefficient = 0 exactly

contact alpha                = dz + x dy
nonzero d(alpha_c)[x,y]      = 1
alpha_c wedge d(alpha_c)     = {(0,1,2):1, other components:0}
normalized wedge coefficient = 1/(1+x^2)

LIE-BRACKET TOPOLOGY TEST
alpha_c(X), alpha_c(Y)       = 0 0
[X,Y]                        = -d/dz
alpha_c([X,Y])               = -1
distribution closure         = FAIL (non-integrable)

POINTWISE METRIC TEST
x      case          eigenvalues          det(g)        ||g^2-I||_F  frobenius
0.0    integrable    [-1,1,1,1]           -1.000000000  0.000e+00    0.000000000
0.0    contact       [-1,1,1,1]           -1.000000000  0.000e+00    1.000000000
0.5    integrable    [-1,1,1,1]           -1.000000000  3.424e-16    0.000000000
0.5    contact       [-1,1,1,1]           -1.000000000  3.424e-16    0.800000000
2.0    integrable    [-1,1,1,1]           -1.000000000  4.026e-16    0.000000000
2.0    contact       [-1,1,1,1]           -1.000000000  4.026e-16    0.200000000
10.0   integrable    [-1,1,1,1]           -1.000000000  1.110e-16    0.000000000
10.0   contact       [-1,1,1,1]           -1.000000000  1.110e-16    0.009900990

VERDICT
historical local Frobenius statement : PASS
Lorentzian signature implies sheets  : FAIL
integrable exact-form example         : PASS, global leaves on R4
contact-form counterexample           : PASS, bracket obstruction
global H(s)H timesheet existence      : UNRESOLVED for actual u(x)
CODATA verification                   : NOT APPLICABLE (no observable)
```

## Gate verdict

| Item | Verdict | Discriminator |
|---|---|---|
| Historical local Frobenius statement | `INTERNALLY_CHECKED` | Exterior derivative and Lie-bracket tests agree |
| Integrable minimal-pair member | `INTERNALLY_CHECKED` | Explicit global potential `F=z-x^2/2` |
| Contact minimal-pair member | `INTERNALLY_CHECKED` non-integrable | `alpha wedge d alpha != 0`; bracket leaves kernel |
| Pointwise Lorentzian metric | `INTERNALLY_CHECKED` for both | Same spectrum, determinant and involution residual |
| Actual H(s)H time-normal field | `UNRESOLVED` | No independently reconstructed `u(x)` supplied |
| Global foliation | `UNRESOLVED` | Requires local pass plus global topology/regularity/completeness |
| CODATA gate | `NOT APPLICABLE` | No empirical quantity or independent prediction |

Specific BEDROCK comparison: the local theorem is compatible with BR-003 and ND-2026-10-18-03. Any stronger historical claim that Lorentzian signature alone produces synchronized timesheets conflicts with the explicit local/global repair and fails the contact-form counterexample. No historical equation was silently deleted, no physical claim was promoted, and BEDROCK was not edited.

Exact next discriminator: reconstruct the actual SAT/H(s)H `u(x)` from a source-defined geometry, evaluate `u^flat wedge du^flat` on its domain, locate singular/zero sets, and only after a local pass test global topology, completeness and leaf structure. If the field fails, interpret it as a flow congruence rather than a timesheet normal or reject that ansatz.

## Code identities

- Executed Python: `morrow_frobenius_audit.py`, SHA-256 `a9927d851543b0df3e1edbbbdb07424a5839ee177d6321d4d8604d6d34e32080`.
- Executed plotting source: `morrow_frobenius_plot.py`, SHA-256 `727ade4ee6ab687640703b2911091a9cf119aba56e6a450e54d3b8d2c3dad053`.
- Generated PNG: `morrow_frobenius_minimal_pair.png`, SHA-256 `d59f71716f6d11d9d8c8b260caaa88d0db657381b3ee0bb0a24bdf10600d9c40`.
- Lean source: `MorrowFrobeniusAudit.lean`, SHA-256 `9c62c543dd91926f8dd2544df512091e3a3fd375d6dee49280d8f1668adf0e71`; Lean is unavailable, so it is complete but not compiler-tested.

## Kestrel handoff

Do not identify a pointwise Householder signature with a timesheet. Reconstruct one source-defined `u(x)` and run the local Frobenius gate before any global or physical interpretation; retain a failing field as a flow-congruence candidate only if the model explicitly permits that object.
