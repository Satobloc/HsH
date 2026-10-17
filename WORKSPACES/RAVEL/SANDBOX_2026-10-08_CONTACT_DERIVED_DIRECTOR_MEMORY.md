# Ravel sandbox — contact-derived director memory

**Status:** GEN/CANDIDATE. This is a synthetic mechanics test in a siloed playground, not canonical SAT or H(s)H theory and not empirical evidence.

## Result in one sentence

A finite core with a retained material-frame director can support a local \(\pi\)-domain without any polar contact at all; the one-sided polar contact is therefore not the source of memory, but it can act as a *read/write bias* that makes one retained orientation energetically preferred, while a full annulus remains exactly \(\pi\)-blind.

## Provenance and actual reading

### Controlling material

Read before the build:

- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`
- `WORKSPACES/COMMON/REFERENCE_DESK/README.md`
- `WORKSPACES/COMMON/CURRENT_WORKFLOW_ORIENTATION_V2.md`
- `WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`
- `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`
- `WORKSPACES/COMMON/CITATION_AS_DEFAULT_POLICY.md`
- `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`

A new Mersearch request was committed as `2026-10-08-ravel-contact-derived-director-memory-001` (commit `88f1e8c30ada4c7fc08028a8983f4f79889fff18`). Its manifest was not yet available during this run, so bounded direct retrieval was used for the two source reads below.

### SAT archive source — read sequentially, lines 1–1200

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT WOLFRAM FIRST TRIES.txt`

What was actually read: a generated/mixed archive discussion constructing a geometric candidate from endpoint curves, a toroidal tube, rolling-ball transport, boundary/contact conditions, a projected trace, and a residual gate. The text explicitly distinguishes a geometry generator from a proof. A corpus-search excerpt from elsewhere in the same file also states that twist about a tangent and cross-sectional worldtube orientation may both be retained without declaring either physically privileged. I use only the structural prompt—finite tube, transported cross-section, contact, and residual gate—not any claimed result or historical constant.

### H(s)H source — read sequentially, lines 1–1200

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/text 28.txt`

What was actually read: a conversation proposing metastable angular/domain-wall states and an optical test, followed by claimed simulation outputs without a recoverable executable chain in the read material. Nathan repeatedly asks for falsifiability and data. The domain-wall claim is therefore quarantined as a hypothesis to test, not imported as evidence.

## Source fact, inference, conjecture

| Layer | Statement |
|---|---|
| Source fact | The archive material explores finite transported tube/cross-section geometry and insists that a candidate generator is not a proof. |
| Source fact | The September-30 conversation claims angular-wall metastability and proposes optical readout, but the read section does not supply a reproducible solver chain. |
| Inference | If an H(s)H representation stores a material-frame angle along a finite worldtube, local memory must be distinguished from contact readout: a double-well director field can carry a domain, while contact can bias or interrogate it. |
| New sandbox conjecture | A nested polar core under asymmetric contact is a minimal write/read element: contact breaks \(\psi\mapsto\psi+\pi\), but the carrier of retention is the finite-core director field and its wall energy. |

## Minimal geometry

Let \(s\in[0,1]\) parameterize a finite worldtube axis and let \(\psi(s)\) be a transported cross-sectional material-frame director. The local unilateral compression around the circumference is

\[
q(\phi;\psi)=d+u\cos 2\phi-v\cos 2(\phi-\psi)+e\cos(\phi-\psi),
\]

where \(d\) is preload, \(u\) is sleeve quadrupolarity, \(v\) is core quadrupolarity, and \(e\) is an off-axis/polar marker. The contact energy is computed, not guessed:

\[
U_c(\psi)=\frac12\int_0^{2\pi}w(\phi)\,[q(\phi;\psi)]_+^2\,d\phi.
\]

Two architectures are compared with identical core parameters:

1. **Full annulus:** \(w(\phi)=1\). A change \(\phi\mapsto\phi+\pi\) proves \(U_c(\psi+\pi)=U_c(\psi)\), even when \(e\ne0\). This is the compulsory null.
2. **One-sided pad:** \(w(\phi)=\mathbf 1_{\cos\phi\ge0}\). The integration domain no longer has the half-turn symmetry, so the polar term generates an odd angular harmonic and generally \(U_c(0)\ne U_c(\pi)\).

The retained field is governed by

\[
E[\psi]=\int_0^1\left[
\frac{C}{2}(\partial_s\psi)^2+
\frac{K_A}{2}\sin^2\psi+
\Lambda g(s)U_c(\psi)
\right]ds,
\qquad \psi(0)=\psi(1)=0.
\]

Here the first term transports the material frame, the second supplies two local orientations, and the localized window \(g(s)\) represents the contact/readout zone. No particle label or archived numerical constant is targeted.

## Analytic expectation and why it was insufficient

With contact omitted, one wall has tension

\[
T_{wall}=2\sqrt{CK_A},
\]

so a finite \(\pi\)-domain has the wall-pair cost \(4\sqrt{CK_A}\). Treating the walls as if they did not cross the contact potential gives the crude global crossing estimate

\[
\Lambda_{wall}\approx
\frac{4\sqrt{CK_A}}
{\left(\int g\,ds\right)[U_c(0)-U_c(\pi)]}.
\]

For the synthetic parameters \(C=0.010\), \(K_A=0.050\), \(d=0.22\), \(u=0.14\), \(v=0.18\), \(e=0.10\), this gives \(\Lambda_{wall}=4.5082\). The numerical crossing is instead \(\Lambda=11.9202\). The simple estimate fails because each wall traverses the contact-derived angular barrier in the edge of the pad. That discrepancy is constructive: a usable reduced theory needs the full contact-dependent wall action, not only the interior energy difference.

## Executable test

`CODE/contact_derived_director_memory.py` tabulates \(U_c\), uses a periodic cubic spline for its derivatives, minimizes the field energy with an analytic gradient, evaluates the minimum tridiagonal Hessian eigenvalue, performs grid refinement, and continues a bubble-seeded branch downward in \(\Lambda\).

At \(\Lambda=7\), the \(N=181\) results are:

| Architecture | Domain peak \(\max\psi/\pi\) | Domain excess \(E_{domain}-E_0\) | Hessian sign |
|---|---:|---:|---:|
| Full annulus | 0.94736 | 0.230868 | positive |
| One-sided polar pad | 0.92264 | 0.085710 | positive |

The domain excess values converge over \(N=61,81,101,141,181\): annulus \(0.230795\to0.230868\), one-sided polar \(0.085639\to0.085710\). The domain is therefore not a one-grid artifact.

Continuation with step \(\Delta\Lambda=0.125\) finds a locally retained domain down to approximately \(\Lambda=3.25\) for the annulus and \(4.50\) for the one-sided polar pad. Local retention is thus *not* the polar signature. The discriminator is global energetic selection: the annular domain remains above the zero state throughout the scan, whereas the one-sided polar domain crosses below it at \(\Lambda=11.9202\). Above that crossing, the pad can favor the reversed interior even though the endpoints remain fixed at zero.

This yields a clean mechanics hierarchy:

1. finite-core transport plus the angular double well carries the local domain;
2. walls supply the activation barrier and hysteresis;
3. asymmetric polar contact supplies directional write/read bias;
4. a symmetric annulus can reshape wall energy but cannot distinguish \(0\) from \(\pi\).

## Concrete discriminator

Use matched finite torsional filaments with an observable polar/off-axis core marker. One specimen passes through a full annular sleeve; the other contacts a removable one-sided pad. Prepare both the uniform and a two-wall \(\pi\)-domain state, ramp normal load as the laboratory proxy for \(\Lambda\), and image \(\psi(s)\) using polarized optical contrast or a resolved material marker while recording end torque.

Predictions of this sandbox model:

- both devices may show metastable wall retention, so retention alone is not evidence for polar contact memory;
- the annular device must remain invariant under a half-turn of the core and cannot make the \(\pi\) interior globally preferred;
- the one-sided device must show an odd-in-orientation torque/readout and, beyond a load threshold, a reversal of the relative energies of the uniform and domain states;
- replacing the one-sided pad with the annulus should remove the directional bias without requiring the underlying domain walls to disappear.

The tight solver comparison is to infer a single \(U_c(\psi)\) from measured quasi-static torque, insert it into the field functional without refitting the wall data, and predict the domain crossing and release thresholds.

## Failure conditions

Reject this architecture as a model of H(s)H memory if any of the following occurs:

1. the measured annulus has a reproducible odd half-turn response after eccentricity and fixture asymmetry are bounded;
2. the one-sided odd torque vanishes when the polar marker is independently verified;
3. domain energy/profile or the Hessian sign fails to converge under mesh refinement;
4. a measured contact potential inserted without refitting cannot predict the branch crossing or its ordering relative to the annular null;
5. retained states require uncontrolled frictional history rather than the conservative wall barrier represented here;
6. the directional bias survives removal or half-turn reversal of the one-sided pad.

## What this changes in the SAT→H(s)H map

The useful translation is narrower than “contact creates memory.” A 4D finite-core history may carry a material-frame morphology through wall-like transitions, while an H(s)H construction records the transported director and the locations of those transitions. Contact is then an intersection/readout operator that can select between already available morphologies. The null result is equally important: a fully averaged annular readout erases polarity, so any H(s)H observable that distinguishes half-turn-related states must retain an asymmetric seam, pad, eccentric core, or other uncompensated polar datum.

## Artifacts

- Solver: `CODE/contact_derived_director_memory.py`
- Machine-readable results: `DATA/contact_derived_director_memory.json`
- Class-P synthetic figure: `FIGURES/contact_derived_director_memory.svg`

The figure and JSON are generated from the solver; the curves are synthetic model outputs, not measurements.
