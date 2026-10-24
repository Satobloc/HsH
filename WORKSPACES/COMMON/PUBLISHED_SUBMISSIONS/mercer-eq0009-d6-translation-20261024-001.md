# EQ-0009 — D6 Translation of Standard Terms

Worker: Mercer. Handoff: Ravel. Date: 2026-10-24.

Status: historical recovery and negative/conditional audit. D6 is preserved as source genealogy. The imported Maxwell, Dirac and Yang–Mills action forms are standard templates; the SAT substitutions are not yet derivations of those structures.

## Source

- Repository: Satobloc/SAT_THEORY_ARCHIVE_2023-25
- File: SAT O Derivations/CODE-LOCKED DERIVS.txt
- D6: lines 276 onward (body begins at line 277)
- Full file: 448 lines / 17,692 characters
- Blob: 783b05d39d59bf854b92090e15d205e6823b51c8
- Commit/date: d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc, 2025-10-27 01:15:21 UTC

Preserved source equations:

```text
S_Max = -1/(4e^2) integral d^4x sqrt(-g) F_mn F^mn
g_U(1)^(-2)(x) ~ rho_wind(x) ell_f^2
F_mn^(U1)(x) = g_U(1) K_mn^(U1)(x)
S_Dirac = integral d^4x sqrt(-g) psibar(i gamma^mu nabla_mu - m)psi
m -> m_eff = m0/(Q=2)
S_YM = -1/(4g_G^2) integral d^4x sqrt(-g) Tr(F_mn F^mn)
g_G^(-2)(x) ~ rho_G(x) ell_f^2
F_mn^(G) = g_G K_mn^(G)
```

## Audit

In four-dimensional natural-unit typing, [d4x]=L^4, [F]=L^-2, and a gauge coupling is dimensionless. D5 defines rho as frequency per unit volume, hence [rho]=L^-3. Therefore [rho ell_f^2]=L^-1, not dimensionless. Conditional on ell_f being a length, the unique single-density monomial repair retaining the ansatz is g^-2 ~ rho ell_f^3.

If the topological four-current has density dimension [J]=L^-3, archived A=gJ also fails because a connection has [A]=L^-1. The corresponding monomial repair is A_mu=g ell_f^2 J_mu. These are unit repairs only; EQ-0006 separately found the archive's ell_f formula is not a length under ordinary tension and standard bending-rigidity typing.

For constant nonzero g, substituting F=gK gives g^-2 F^2 = g^-2(gK)^2 = K^2: the coupling cancels identically. The displayed pure-gauge term cannot infer a numerical coupling from density without independently specified matter coupling, field normalization and renormalization convention.

For local g(x) and repaired A=g ell_f^2 J, F=dA=ell_f^2(dg wedge J + g dJ), not merely gK with K=ell_f^2 dJ. The missing term is ell_f^2 dg wedge J. In the periodic discriminator the constant-g residual is numerical zero; at epsilon=0.20 the RMS field residual is 1.507964473723e5 m^-2, and exact versus claimed kinetic diagnostics differ by 3.775972445039e11 m^-4.

Thus two clean branches remain: hold g constant, in which case it cancels from the kinetic term under F=gK; or vary g, in which case the factorization fails unless K is redefined to depend on g and dg.

The Dirac translation inherits the quarantined direct Q=2 to m0/2 mass rule. Phase alignment is not a proof of the Clifford algebra, spin structure, spin connection, or fermionic statistics. Naming a translation frame does not construct a principal bundle, connection transformation law, Bianchi identity, or global topology.

## Numerics and formal proof

The Python reproducer eq0009_d6_translation_audit.py executes dimensional exponents, constant-coupling cancellation and the variable-coupling product-rule test. All assertions pass.

ArchiveEQ0009.lean proves the unit exponents, constant-coupling cancellation, and exact omitted term. Lean branch commit: da1690dd46a712969bccfe7855917e01851805ec.

## Reading record

- BEDROCK: complete 548 lines / 82,842 characters; blob aa5d236354258f4c4715f5cf77bff2c5db602cfd.
- Theory state: complete 155 lines / 11,012 characters; blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Mersearch guide: complete 89 lines / 9,251 characters; blob 4548c3a76142ba71480845c9e3a003c9f62e8fcb. The shared bridge was occupied by request 2026-10-21-orson-nlm-big-haul-math-001 and was not overwritten. Direct GitHub retrieval is explicitly partial, not a claimed three-repository Mersearch run.
- Random draw: 1,038 eligible substantial SAT-archive text files; index 158 selected A_Theory_of_Everything/10-31-2025 SAT FULL THEORY/TEST BATTERY 1 10-20-25.txt. Complete read: 1,840 lines / 132,076 characters; blob 27881552deb942a86eb8f867661ed48c84f5b4fa. Honest takeaway: it is a NotebookLM-style validation battery that repeats confident lattice, calibrated-mass and coupling-emergence claims while often treating proposed checks as completed support. It is genealogy and a claim list, not independent evidence for D6.

Later vocabulary treats inherited gauge/QFT forms as limiting/readout descriptions inside one geometry, while topology-derived couplings remain historical recovery material. This tracks terminology change without declaring D6 superseded.

## CODATA gate

Not admitted. D6 has no operational rho or ell measurement, uncertainty model, field normalization, renormalization scale, independently derived bundle/connection, or held-out observable. A CODATA residual would be tuned or meaningless.

Reopening discriminator: provide a finite-core current with units; a gauge-equivalence rule; a derived bundle and connection; independently normalized matter coupling; scale-running equations; measured rho and ell with uncertainties; and a preregistered held-out dimensionless coupling or observable.

