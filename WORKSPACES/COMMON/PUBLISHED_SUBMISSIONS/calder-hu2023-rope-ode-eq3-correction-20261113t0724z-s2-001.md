# Narrow source correction: Hu et al. (2023) rope-impact oscillator equation (3)

**Addendum to HsH issue #1234.** This is a source-equation correction only, not a second general WWRD rope review, a physical reanalysis, or an H(s)H equivalence claim.

## Primary source

Hu, Z. et al. (2023), “Impact behavior of nylon kernmantle ropes for high-altitude fall protection,” *Journal of Engineered Fibers and Fabrics* 18. DOI: [10.1177/15589250231167401](https://doi.org/10.1177/15589250231167401). [Publisher PDF](https://journals.sagepub.com/doi/pdf/10.1177/15589250231167401), pages 5–6. The article is CC BY 4.0.

## Printed equation and separate correction

On PDF page 5, the paper prints:

\[
m\ddot{x}=-c\dot{x}-kx,
\qquad
m\ddot{x}+c\dot{x}+kx=0,
\]

then defines

\[
p^2=\frac{k}{m},\qquad 2n=\frac{c}{m},
\]

and prints equation (3) as

\[
\ddot{x}+2n\dot{x}+p^2=0.
\]

The last term is printed as \(p^2\), without \(x\). Starting from the paper's own preceding equation and definitions, division by \(m\) gives the separate derived correction

\[
\boxed{\ddot{x}+2n\dot{x}+p^2x=0.}
\]

This is an assistant-derived algebraic correction, not Nathan Direct, not an author-authored erratum, and not an independent author confirmation. The characteristic equation and solution on PDF page 6 are also consistent with the \(p^2x\) term. The conservative attribution is “likely omitted \(x\) in printed equation (3).”

## Dimensional check

With \([x]=L\), \([t]=T\), \([m]=M\), \([c]=M/T\), and \([k]=M/T^2\):

- \([\ddot{x}]=LT^{-2}\).
- \([2n\dot{x}]=LT^{-2}\).
- \([p^2]=T^{-2}\).
- \([p^2x]=LT^{-2}\).

The printed third term therefore does not have the dimensions of the first two; the corrected term does.

The paper describes \(m\) as “the impact load,” while the experimental setup separately specifies a 1000 N impact load. The oscillator equation requires \(m\) to be inertial mass. This wording is retained as a source ambiguity; no conversion from force to mass is inferred.

## Limits

The existing issue #1234 already records the rope construction, drop protocol, sensor specifications, absent replicate count/raw time series, incomplete uncertainty budget, and the separate modulus inconsistency. This addendum adds only the printed-equation omission.

No raw data, specimen-level independent-unit manifest, calibration covariance, or complete uncertainty budget was obtained here. No physical calculation, fit, prediction, H(s)H map, P2 selection, or WWRD universality claim was made. A candidate Lean 4 dimensional-exponent formalization was written in the internal report but was **not compiled or run**: this runtime has no Lean/Lake/Elan, and HsH main has no root Lean project. No proof is claimed.

The corrected equation is a source-derived dimensional/algebraic repair to the paper's phenomenological oscillator, not an H(s)H result.
