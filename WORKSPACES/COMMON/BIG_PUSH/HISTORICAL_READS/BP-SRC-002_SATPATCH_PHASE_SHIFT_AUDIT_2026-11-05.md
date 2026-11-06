# BP-SRC-002 — SATPatch 0.24-rad phase-shift audit

**Programme:** THE BIG PUSH  
**Operation:** BP-SRC-002  
**Source:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT QR/SATPatch.txt`  
**Blob SHA:** `540a5936f384371df8a550b1e4f526daee07e836`  
**Source length:** 1,669 lines  
**Status:** INITIAL AUDIT — derivation fails as written.

## Relevant source locations

- Lines 400–460: proposed phase integral, kink profile, parameter ranges, and claim Δφ ≈ 0.239 rad (±0.002 depending on tail cutoff).
- Lines 500–520: Python numerical integration code and its actual printed output.
- Lines 588–602: LaTeX note uses an integral from −∞ to +∞ and claims Δφ ≈ 0.239 rad for η = 1, w = 1.
- Lines 1449–1460, 1482–1490, 1521–1530, 1560–1570, and 1660–1670: changing completion/status matrices.

## Proposed model as written

[
\Delta\phi=\eta\int_{-\infty}^{\infty}\sin^2(\theta_4(x))\,dx
]

with

[
\theta_4(x)=\frac{2\pi}{3}\left[\frac12+\frac1\pi\arctan\left(\frac{x}{w}\right)\right].
]

The note claims Δφ ≈ 0.239 rad for η = 1, w = 1, and claims stability across realistic parameter variations. It also gives η = 0.1–2.0 and w = 5–500 nm.

## Reproduction of the embedded code

The embedded Python code uses:
- x = linspace(-10, 10, 1000);
- w = 1 implicitly;
- η = 1;
- Δφ = η * sum(sin²(θ₄)) * dx.

The code itself prints:

**Δφ ≈ 9.513 rad**

The immediately following assistant prose claims:

**Δφ ≈ 0.239 rad**

The discrepancy is a factor of approximately 39.8. No normalization, division, alternate integration interval, or changed coupling is shown to explain the change.

A faithful reproduction of the exact code expression gives approximately 9.5127 rad for the finite interval [-10, 10]. A separate trapezoidal integration gives approximately 9.5046 rad, consistent with the script's finite-domain result.

## Mathematical defects

### 1. The stated infinite integral diverges

As x → +∞,

[
\theta_4(x)\rightarrow\frac{2\pi}{3},
\qquad
\sin^2\theta_4(x)\rightarrow\frac34.
]

Therefore,

[
\int_{-\infty}^{\infty}\sin^2(\theta_4(x))\,dx
]

has a nonzero constant integrand on the positive tail and diverges linearly. It cannot yield a finite 0.239-rad result as written.

The left tail tends to zero, but that does not cure the positive-tail divergence.

### 2. The result depends on the arbitrary cutoff

For the same kink and w = 1, η = 1, numerical integration over symmetric finite windows gives approximately:

| Window | Integral |
|---|---:|
| [-1, 1] | 1.397 |
| [-2, 2] | 2.533 |
| [-5, 5] | 5.338 |
| [-10, 10] | 9.505 |
| [-20, 20] | 17.415 |
| [-40, 40] | 32.820 |

The result grows with the integration window; the claimed stability with respect to tail cutoff is contradicted by the formula.

### 3. Width and coupling dependence are not eliminated

For fixed finite bounds, changing w changes the integral. For the same [-10,10] interval, the numerical values are approximately:
- w = 0.5: 8.707;
- w = 1: 9.505;
- w = 2: 10.676;
- w = 5: 12.663;
- w = 10: 13.973.

The expression is also linear in η. The source gives a range η = 0.1–2.0, so a fixed 0.239-rad prediction does not follow from the displayed equation without an additional rule.

### 4. Dimensional consistency is unspecified

θ₄ is dimensionless and dx has dimensions of length. For Δφ to be dimensionless, η must have dimensions of inverse length (or the integral must be normalized by a specified length scale). The parameter table gives no units for η and calls it a material-dependent birefringent strength.

### 5. No finite wall-localized contribution is defined

A possible repair would require a new, explicitly justified prescription, such as subtracting the asymptotic vacuum contribution, integrating over a physically specified finite wall region, or deriving a localized density that vanishes in both vacua. None of those choices is made in the source. Do not silently insert one.

### 6. “Independent of material thickness” does not follow

The formula contains a material-dependent η and an integral over a spatial path. The note does not derive why the measured phase would be independent of thickness or path length, nor how a laboratory PET/liquid-crystal stack creates the proposed SAT θ₄ domain wall.

## Internal status contradictions in SATPatch

The same 1,669-line source gives changing and incompatible completion states:

- Line 1449: simulation plots not built; apparatus only a narrative outline; preregistration not drafted.
- Around line 1483: simulation algorithm and apparatus BOM marked complete; preregistration template still not done.
- Around line 1521: OSF preregistration draft marked complete; τ state-sum still needs a 3+1D Pachner-move invariance proof.
- Around line 1560: “all core theoretical gaps are now closed,” while public replication packaging remains.
- Around line 1667: phase-shift experiment marked 4/4 complete and SAT called release-candidate ready.

These are assistant-generated progress assertions within a conversation export. They are not verified artifact receipts. The contradictory states must be reconciled against actual files, code, preregistration records, and independent readback.

## Findings

1. The 0.24-rad number is not supported by the displayed integral and embedded code.
2. The embedded code's actual result is about 9.513 rad, while the prose reports about 0.239 rad.
3. The infinite integral diverges as written.
4. The expression has unresolved dimensions and parameter dependence.
5. The source's completion matrices conflict with one another.
6. The RESTITCH claim that this is a fully worked falsifiable prediction is not supported by this derivation as currently written.

## Required next work

- Recover the exact underlying phase-shift note and any referenced code/notebook/plots, if separate artifacts exist.
- Determine whether the intended observable is a finite wall contribution, a vacuum-subtracted integral, an average, or something else. Do not choose on behalf of the author.
- Ask for or recover the intended definition and units of η, the physical integration domain, and the boundary conditions.
- Re-derive the result from the SAT action and equations of motion, not from the desired 0.239-rad target.
- Independently reproduce any numerical result and preserve the complete code, inputs, outputs, and checksum.
- Audit the preregistration and apparatus claims against actual durable artifacts.

## Provenance

All equations, code, numerical output, and completion claims above are transcribed from the cited SATPatch conversation export. The numerical re-evaluation and divergence/dimensional analysis are independent calculations performed for this audit. No correction has been applied to the original source.
