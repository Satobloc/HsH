# Amendment 01 to Ravel h953:s2 | Source-typed T/A clarification

**Parent report:** [Issue #2114](https://github.com/Satobloc/HsH/issues/2114)  
**Parent artifact:** WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-h953-s2-mutual-accommodation-proof-map-20261119t1724z-001.md  
**Amendment scope:** source attribution and dimensional typing only. No original equation is changed.

## 1. Primary-source distinction

The repository's June 2025 SAT Big Paper extracted-text copy is:

- Path: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_bigpaper_pdfcopy.txt
- Git blob SHA-1: d50427f21539ca983bc0a1344dc13aa24936c6b5
- Document-level byline: Nathan McKnight, June 2025.
- This is an extracted text copy, not an independently inspected original PDF. Document-level byline does not make every equation Nathan Direct.

Its dimensional ledger labels filament tension T with dimensions [M][L]^-1 and lists the fundamental length:
\[
\ell_f=(2A/T)^{1/3}.
\]
The later scale section states that T ell_f has mass dimension one. The source does not provide an unambiguous glossary definition of A or a complete SI conversion convention.

In c=1 natural units, [M][L]^-1 is consistent with force, not force per length. Under that source assignment, the scale equation requires:
\[
[A]=[T]L^3.
\]
In SI this corresponds to A having units N m^3 if T is force. A standard flexural rigidity of N m^2 would instead require T to be force per length. That alternative is a comparison branch, not the Big Paper's stated dimensional assignment.

The source's own ledger therefore favors a force-type T in its natural-unit convention, while leaving A's physical meaning and unit conversion unresolved. This is not a physical contradiction and does not establish that A is a standard beam or rope rigidity.

## 2. Separate O8 audit package

The SAT archive file SAT O AUDITS/SAT_O8_Audit_Results.txt is a separate audit package:

- Git blob SHA-1: 11ef2d599d80b2350f891cdf8a63df98ae42f2d6
- 32,021 bytes.
- Module header uses an [Author Name] placeholder.
- Tracker entry T08 records start date 2025-06-06 and status In Progress.
- No verified author or equation-level Nathan Direct attribution.

Its embedded Module O8 text contains:
\[
T\sim c^4/G,\qquad A\sim T\Lambda^{-3/4}.
\]
However, the same file's glossary-consistency audit explicitly flags T and A as undefined. It also identifies other undefined quantities and says the module is awaiting audit distribution. These relations are audit-package content, not accepted derivations, measured values, or a replacement for the Big Paper's separate dimensional ledger.

Do not merge the O8 T/A symbols with the Big Paper's T/A merely because the symbols match.

## 3. Coupling-constant locator

The existing RavelCouplingDimensionalAudit module records candidate kappa expressions at Big Paper pages 19, 36, and 134. The p.19 and p.36 expressions were recovered in the extracted text. The exact p.134 expression cited by the module comment was not independently located in the current extraction during this pass. Retain that locator as UNVERIFIED, not disproven and not source-established.

The SI dimensional audit is conditional on ordinary SI stress-energy. The Big Paper uses a naturalized dimensional ledger, but the conversion of its stress-energy and coupling coefficients to SI has not been fully specified. Consequently, the SI result that ell_f^2 T_munu does not have curvature units under ordinary SI stress-energy is a conditional warning, not a completed source-level contradiction.

## 4. Consequence for the next measurement gate

Before any numerical coil-scale comparison:

1. Pin the exact source equation and document version.
2. Define A operationally and dimensionally.
3. State whether T is force, force per length, or another source-defined quantity.
4. State the natural-unit convention and the complete conversion to SI.
5. Identify the measured width observable and periodicity definition.
6. Pin CODATA 2022 Version 9.0 or the relevant measurement publication, including measurement method, correlations, adjustment/evaluation model, and uncertainty.

No physical calculation, fit, prediction, CODATA comparison, or independent measurement was performed in this amendment. No corrected equation was introduced. No SAT-O1, Blockwave, Big Paper, or O8 source equation was edited.

**Disposition:** ADDITIVE_SOURCE_CLARIFICATION / ORIGINAL_EQUATIONS_PRESERVED / T_AND_A_NOT_NUMERICALLY_READY / NO_THEORY_PROMOTION.
