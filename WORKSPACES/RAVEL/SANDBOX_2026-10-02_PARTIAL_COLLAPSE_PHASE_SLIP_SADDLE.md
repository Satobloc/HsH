# Ravel sandbox checkpoint — partial-collapse phase-slip saddle

**Date:** 2026-10-02  
**Status:** SILOED PLAYGROUND; conditional local-potential derivation, not canonical SAT/H(s)H.

## Narrow question

The preceding comparison used two extreme trial paths: a compact registry slip at fixed radius and a radial path through zero radius. Does the coupled finite core instead prefer a partially collapsed, nonzero radius at the phase barrier, and when does full phase loss begin?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/..MATHEMATICAL_REPOSITORY_ADDENDUM_2026-06-09.txt` — full sequential read of all twelve entries. The relevant old construction is the \(N=3\) phase interaction
  \[
  V_{\rm int}=kR^2\sum_{i<j}[1-\cos(\delta_i-\delta_j)].
  \]
  The same audit retains the \(120^\circ\) configuration as stationary but records the interaction-sector Hessian \(\{0,-3kR^2/2,-3kR^2/2\}\). Thus this historical cosine term does not stabilize the \(C_3\) registry for the stated sign and is used only as a negative control. Its rejected modulo-three inference and historical constants are not imported.
- `Satobloc/HsH/WORKSPACES/COMMON/SOL_PLAYGROUND/EXP004_FINITE_CORE_TO_CENTERLINE_EFFECTIVE_ACTION.md` — full sequential read. Retained: finite-core multipole memory, exact nonlocal kernel after eliminating an internal mode, and the obstruction that a soft internal mode cannot be absorbed into a local centerline action.
- Google Drive targeted search for a partial-collapse saddle — no result.
- Slack targeted collision search — no prior nonzero saddle-radius derivation found. The earlier Ravel radial-hysteresis, compact-slip, and collapse-assisted-slip checkpoints are direct dependencies.
- `26R Worldline Topos.txt` was opened but is a malformed historical transcript dominated by deprecated lattice/particle claims; it was not counted as the substantial archive source and supplied no controlling input.

## Status boundary

- **SRC/HISTORICAL:** the old cosine interaction and its audited instability.
- **GEN/DERIVED conditional:** the algebra below follows exactly from the declared local potential.
- **SAT/CANDIDATE:** contact-overlap \(Y(u)\) as the registry pinning channel and the interpretation of its radial notch as an H(s)H readout.
- **OPEN:** the full spatial minimum-energy path once gradient coupling is retained.

## Object and declared local model

Use a marked or defect-sensitive \(B^2\)-type support with radius/order amplitude \(a\ge0\) and compact relative registry
\[
u\in\mathbb R/P\mathbb Z,\qquad P=\frac{2\pi}{3}.
\]

For the area-like coupling \(p=2\), take the local potential from the preceding two-field model:
\[
W(a,u)=
\frac{\lambda}{4}(a^2-a_0^2)^2
+j\,a^2Y(u),
\qquad \lambda,j>0.
\]

At either contact cusp, the exact overlap excess on \(0\le u\le P/2\) is
\[
Y(u)=
\begin{cases}
2u/\pi,&0\le u\le P/4,\\[1mm]
4u/\pi-1/3,&P/4\le u\le P/2,
\end{cases}
\]
with reflection and periodic extension. Its crest is \(Y(P/2)=1\).

## Pointwise radial minimization

At fixed \(u\),
\[
\partial_aW
=
a\left[\lambda(a^2-a_0^2)+2jY(u)\right].
\]

Therefore the radial minimizer is
\[
\boxed{
a_{\rm ad}^2(u)
=
\max\left\{
a_0^2-\frac{2j}{\lambda}Y(u),\,0
\right\}.
}
\]

Define the dimensionless competition parameter
\[
\chi=\frac{2j}{\lambda a_0^2},
\qquad
q=\chi^{-1}=\frac{\lambda a_0^2}{2j}.
\]

At the center of the phase barrier,
\[
\boxed{
\frac{a_{\min}}{a_0}
=
\sqrt{\max(1-\chi,0)}.
}
\]

Thus:

- \(0<\chi<1\): the barrier saddle is partially collapsed but retains nonzero phase amplitude;
- \(\chi=1\): the saddle first reaches \(a=0\);
- \(\chi>1\): a finite phase interval prefers the collapsed state, so phase is undefined over that interval in the pointwise envelope.

This replaces the earlier binary fixed-radius/zero-radius comparison by a continuous morphology law.

## Effective potential after radial relaxation

Substitution gives
\[
W_{\rm eff}(u)=
\begin{cases}
j a_0^2Y(u)-\dfrac{j^2}{\lambda}Y(u)^2,
&Y(u)<q,\\[3mm]
\dfrac{\lambda a_0^4}{4},
&Y(u)\ge q.
\end{cases}
\]

The two branches meet with equal value and first derivative. Full collapse therefore creates a flat-topped phase barrier rather than the original cusp crest.

For \(q<1\), the pointwise zero-radius phase width is
\[
\boxed{
\Delta u_0=
\begin{cases}
P-\pi q,&0<q\le1/3,\\[1mm]
\dfrac{\pi}{2}(1-q),&1/3\le q<1.
\end{cases}
}
\]

The formulas agree at \(q=1/3\). A direct grid minimization reproduced \(a_{\min}\) and \(\Delta u_0\) to the grid error, below \(2\times10^{-4}\) in the tested cases.

## Soft-mode obstruction

On the nonzero branch,
\[
m_a^2=\partial_a^2W\big|_{a_{\rm ad}}
=2\lambda a_{\rm ad}^2.
\]

Since
\[
a_{\rm ad}^2=\frac{2j}{\lambda}(q-Y),
\]
the radial gap approaches a collapse shoulder as
\[
\boxed{m_a^2=4j(q-Y)\to0.}
\]

With radial gradient coefficient \(c\), its correlation length is
\[
\boxed{
\xi_a=
\sqrt{\frac{c}{m_a^2}}
=
\sqrt{\frac{c}{4j(q-Y)}}.
}
\]

This is exactly EXP004’s obstruction in a typed core mode: eliminating \(a\) becomes nonlocal at each shoulder where the phase profile enters or leaves the collapsed interval. Near that event, the reduced state must retain \((\gamma,a,u)\), not only the centerline or an effective \(u\)-potential.

## Candidate comparison

- **Marked \(B^2\) support:** directly realizes the radius-plus-phase order parameter used above.
- **\(B^3\) core with selected material plane:** can reproduce the reduction, but plane selection is an additional mode and may soften first.
- **Fixed-radius \(S^2\):** cannot partially collapse; it belongs only to the fixed-radius branch.
- **Radially mobile boundary:** can show the same notch but requires an independent bulk/radial architecture.
- **Layered \(B^3+B^2+S^2\):** can separate radial stiffness \(\lambda\), registry pinning \(j\), and the observed boundary signal; it also permits multiple notches if layer radii decouple.
- **Bare centerline:** retains neither \(a_{\min}\) nor the loss of phase at \(\chi\ge1\).

## Readout and solver discriminator

Where the nondegenerate Run-133 inversion applies, measure
\[
\widehat a(u)=\frac{A_\Sigma(u)}{2C_4\ell_\parallel(u)}.
\]

The pointwise model predicts
\[
\boxed{
\widehat a_{\min}/a_0=\sqrt{1-\chi}
}
\]
for \(\chi<1\), followed by a zero-radius plateau for \(\chi>1\). The plateau is flanked by two growing correlation-length shoulders.

The decisive solver calculation is a string/NEB solution of the full functional
\[
E=\int ds\left[
\frac c2a'^2+\frac k2a^2u'^2+W(a,u)
\right].
\]
Sweep \(\chi\) through one and compare the actual \(a_{\min}\), zero-radius support, barrier energy, and shoulder width with the pointwise laws. Gradient terms should round the shoulders and may shrink or eliminate the exact zero plateau; their quantitative departure is the required correction, not a failure by itself.

## Failure conditions

The construction fails or changes class if:

- contact-overlap pinning does not scale as \(a^2\);
- a material director keeps registry defined at \(a=0\);
- the radial potential is not quartic around a nonzero \(a_0\);
- another shape or plane-selection mode becomes softer than \(a\);
- finite-interface inversion creates an apparent notch;
- the pointwise envelope is mistaken for the full stationary field solution;
- the unstable historical cosine interaction is substituted for the independently derived pinning potential.

## Prediction status and next dependency

No empirical particle prediction is earned. Tight internal predictions are the square-root notch law, the threshold \(\chi=1\), the piecewise \(\Delta u_0\) law, and soft shoulders with \(\xi_a\propto(q-Y)^{-1/2}\).

**Next dependency — Meridian:** solve the full two-field boundary-value problem and report whether gradient coupling preserves a true zero-radius interval or replaces it with a strictly positive avoided-collapse saddle.
