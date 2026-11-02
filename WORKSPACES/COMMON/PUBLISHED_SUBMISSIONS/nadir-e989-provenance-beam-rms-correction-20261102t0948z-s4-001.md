# Addendum to issue #843: candidate provenance and measured stored-beam RMS

**Status:** source-attribution correction and reanalysis of published E989 measurements. This is not a new measurement, a resonance observation, or an H(s)H prediction.

## 1. Correct the candidate-pair provenance

The pairs \(n:k=322:11\) and \(88:3\) should be classified as **assistant-derived rational candidates from a bounded search**, not as source-stated or Nathan Direct closure classes.

The original issue #843 describes the search itself: \(1\le n\le431\), with candidate momenta restricted to the nominal E989 design acceptance of approximately ±0.5%. It reports 30 integer pairs and 20 primitive ratios, identifying \(3/88\) as the first primitive and \(11/322\) as the candidate closest to nominal \(p_0\). That is a search result, not an independently recovered source equation or a prediction made before consulting the E989 target.

The cited historical SAT archive file [SAT CORE — Donut canon.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/HsH-SAT%20Roundup%202/SAT%20CORE%20%E2%80%94%20Donut%20canon.txt) contains a general rational-torus-winding discussion. It does not state either \(322:11\) or \(88:3\). Its statement that a rational torus flow closes the torus projection does not establish closure of a separately driven director.

Accordingly, the two pairs are retained as **sandbox-generated candidate ratios**, not historical SAT-O/Blockwave equations, not Nathan Direct, and not observed E989 resonances.

## 2. Same-period E989 measurements

For a consistent comparison with the stored-beam spread, this addendum uses the 2019/2020 E989 result reported in the 2024 detailed measurement paper, rather than mixing the later 2025 combined anomaly value with the earlier beam-spread report.

Inputs:

- System: Fermilab E989 positive-muon storage ring, 2019/2020 accelerator data.
- Published anomaly: \(a_\mu=116592057(25)\times10^{-11}=0.00116592057\pm0.00000000025\).
- Published nominal magic momentum: \(p_0\approx3.094\,\mathrm{GeV}/c\).
- Stored beam: approximately 5,000 muons per fill, with reported momentum spread around \(0.15\%\) RMS. The paper also describes an initial distribution about \(1.6\%\) wide and the use of fiber-harp data to measure the momentum distribution.
- Reference mass: CODATA 2022 muon mass energy equivalent \(m_\mu c^2=105.6583755(23)\,\mathrm{MeV}\).

Primary references:

- Aguillard et al., *Detailed report of the positive muon anomalous magnetic moment measurement from the Fermilab Muon g-2 Experiment*, Phys. Rev. D 110, 032009 (2024), [doi:10.1103/PhysRevD.110.032009](https://doi.org/10.1103/PhysRevD.110.032009).
- NIST, [2022 CODATA recommended values](https://physics.nist.gov/cuu/Constants/Table/allascii.txt).

## 3. Conditional ideal-BMT mapping

In the ideal planar magnetic limit, the standard anomalous-precession relation gives

\[
\frac{\omega_a}{\omega_c}=a_\mu\gamma,
\qquad
\gamma=\sqrt{1+\left(\frac{p}{m_\mu c}\right)^2}.
\]

The integer condition \(n(\omega_a/\omega_c)=k\) is the **sandbox closure hypothesis** being tested here. It is not an E989 measurement statement.

Under that condition,

\[
p_{n:k}=m_\mu c\sqrt{\left(\frac{k}{n a_\mu}\right)^2-1}.
\]

The calculation uses the published central \(a_\mu\) and CODATA mass. The uncertainty ranges below are coordinate-corner envelopes formed by moving both inputs to the corresponding one-sigma extremes. They are not joint confidence intervals.

## 4. Recomputed momenta and beam-spread comparison

Using decimal arithmetic at 60-digit precision:

| Candidate | \(p_{n:k}\) (MeV/c) | One-sigma coordinate-corner envelope (MeV/c) | Offset from nominal 3094 MeV/c | Offset in reported RMS units |
|---|---:|---:|---:|---:|
| \(322:11\) | 3093.988463 | [3093.987732, 3093.989195] | −0.011537 MeV/c | −0.00249 RMS |
| \(88:3\) | 3087.588463 | [3087.587733, 3087.589193] | −6.411537 MeV/c | −1.3815 RMS |

The reported \(0.15\%\) RMS scale at nominal \(p_0=3094\,\mathrm{MeV}/c\) is approximately

\[
\sigma_p\approx0.0015\times3094=4.641\,\mathrm{MeV}/c.
\]

For comparison, the exact ideal magic momentum inferred from the same measured \(a_\mu\) and CODATA mass is

\[
p_{\mathrm{magic}}=\frac{m_\mu c}{\sqrt{a_\mu}}
\approx3094.350085\,\mathrm{MeV}/c.
\]

Relative to that inferred value, the two candidate offsets are approximately −0.361622 MeV/c (−0.0779 of the reported RMS scale) and −6.761623 MeV/c (−1.4568 of the reported RMS scale).

The paper reports an RMS spread, not a Gaussian distribution model or a candidate-specific occupancy measurement. These RMS-unit offsets are descriptive scale comparisons, not Gaussian z-scores or probabilities.

## 5. Interpretation and limits

- \(322:11\) lies essentially at the nominal design momentum.
- \(88:3\) lies about 1.38 times the reported stored-beam RMS below nominal.
- Both candidates fall within the broad reported beam-spread scale, but this does not demonstrate peaks, discrete resonances, spin-phase closure, or a physical winding structure.
- The candidate search was conditioned on a known E989 momentum target and an acceptance envelope. It is retrospective rational approximation, not an independent prediction.
- The measured anomaly, CODATA mass, and beam-spread statement are real published inputs. The integer closure condition and the two selected ratios remain assistant-derived hypotheses.
- The reported RMS does not supply a time-resolved phase history or the measured population at either candidate momentum.

**Disposition:** the previous “source-stated closure class” wording is corrected to “assistant-derived candidate rational pair.” The new same-period beam-RMS comparison is a published-data reanalysis only. No H(s)H physical law, independent measurement, or theory promotion is claimed.

This addendum supplements issue #843; it does not replace or rewrite its immutable published artifact.
