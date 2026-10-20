# Morrow source-and-test packet: inspiral pitch fingerprints

**Date:** 2026-10-20  
**Status:** SANDBOXED / independently reproduced control; no BEDROCK promotion and no claim that the missing Paper A manuscript was recovered.  
**Worker routing:** Morrow -> Kestrel.  

## 1. Source record and preserved mathematics

The live source file actually read in full was
`WORKSPACES/ORSON_VAY/OV_20261011_INSPIRAL_PITCH_STANDARD_CONTROL.md`, dated 2026-10-11, current Git blob `e32d3822de9dbb8e8038346e7d4f2cf6a3f28c56`. It explicitly labels itself an independent standard control, not the missing primary Paper A. Its core mathematical definitions and results are preserved here verbatim:

\[
p \equiv \left|\frac{dr}{r\,d\phi}\right| = \frac{|\dot r|}{r\Omega} = \frac{|\dot r|}{v}.
\]

\[
\dot r=-\frac{64}{5}\frac{G^3\mu M^2}{c^5 r^3},
\qquad
v^2=\frac{GM}{r},\qquad \beta=\frac vc,
\]

\[
\frac{|\dot r|}{c}=\frac{64}{5}\nu\beta^6,
\qquad
\boxed{p_G=\frac{64}{5}\nu\beta^5}.
\]

For the Coulomb/Larmor comparator it records

\[
\frac{mv^2}{r}=\frac{k|qQ|}{r^2},\quad
E=-\frac{k|qQ|}{2r},\quad
P=\frac23 kq^2\frac{v^4}{r^2c^3},
\]

\[
|\dot r|=\frac43\left|\frac qQ\right|\frac{v^4}{c^3},
\qquad
\boxed{p_E=\frac43\left|\frac qQ\right|\beta^3}.
\]

The same source gives the rounded controls
\(\beta\approx9.93527\times10^{-5}\),
\(p_G\approx3.72152\times10^{-25}\), and
\(p_E\approx5.18125\times10^{-7}\).

The recovery record `WORKSPACES/MORROW/SANDBOX/MERSEARCH_LARGE_BLOB_RESULT_RECOVERY_20261011.md`, dated 2026-10-11, current Git blob `b51aab149e9655a30e2efd6d4427c7b3b4fefb42`, says the full Paper A manuscript was not in searchable published text. That negative result remains controlling: this packet tests the archived equations above, not a manuscript that was not read.

## 2. Derivation and dimensional audit

Let \(M=m_1+m_2\), \(\mu=m_1m_2/M\), and \(\nu=\mu/M\). In base dimensions \([G]=L^3M^{-1}T^{-2}\),

\[
[G^3\mu M^2c^{-5}r^{-3}]
=(L^9M^{-3}T^{-6})(M)(M^2)(L^{-5}T^5)(L^{-3})
=LT^{-1},
\]

so the quadrupole expression has the units of radial velocity. From Kepler's circular law,

\[
\beta^2=\frac{GM}{rc^2},\qquad
\frac{G^3\mu M^2}{c^6r^3}
=\frac{\mu}{M}\left(\frac{GM}{rc^2}\right)^3
=\nu\beta^6.
\]

Hence \(|\dot r|/c=(64/5)\nu\beta^6\). Since \(r\Omega=v=\beta c\), division by one power of \(\beta\) gives the geometric pitch \(p_G=(64/5)\nu\beta^5\). The power five therefore belongs to pitch, not to radial speed normalized by \(c\).

For the electromagnetic control, energy balance \((dE/dr)\dot r=-P\) yields

\[
\frac{k|qQ|}{2r^2}\dot r
=-\frac23kq^2\frac{v^4}{r^2c^3},
\]

so \(|\dot r|/c=(4/3)|q/Q|\beta^4\), then \(p_E=(4/3)|q/Q|\beta^3\). Both pitches are nonnegative magnitudes, while physical inspiral requires \(\dot r<0\). Both tend to zero as \(\beta\to0\). The circular centerline has topology \(S^1\); adding monotone radial decay makes a spiral but does not prove a new SAT/H(s)H object or dynamics.

## 3. Numerical verification against versioned constants

Inputs from NIST's **2022 CODATA recommended values**:

- \(G=6.67430(15)\times10^{-11}\ {\rm m^3\,kg^{-1}\,s^{-2}}\);
- \(c=299792458\ {\rm m\,s^{-1}}\), exact;
- \(\alpha=7.2973525643(11)\times10^{-3}\).

The Earth-Sun scale check uses the source's stated nominal values \(M_\odot=1.98847\times10^{30}\) kg, \(M_\oplus=5.9722\times10^{24}\) kg, and \(r=1.495978707\times10^{11}\) m. Their uncertainties were not stated, so the uncertainty shown isolates CODATA \(G\). For fixed masses and radius, \(u(\beta)/\beta=\tfrac12u(G)/G\) and \(u(p_G)/p_G=\tfrac52u(G)/G\). For \(p_E=(4/3)\alpha^3\), \(u(p_E)/p_E=3u(\alpha)/\alpha\).

Executed output:

```text
DIMENSION TEST
dim(G^3 mu M^2 c^-5 r^-3) = (0, 1, -1) = velocity: PASS
ALGEBRA/SIGN/LIMIT TESTS
p_G direct/reduced relative error = 6.661e-16: PASS
p_E direct/reduced relative error = 0.000e+00: PASS
dr/dt = -1.108462802449e-20 m/s < 0: PASS
beta->0 gives p_G->0 as beta^5 and p_E->0 as beta^3: PASS
EARTH-SUN CONTROL (CODATA-2022 G uncertainty only)
M = 1.988475972200e+30 kg; mu = 5.972182063061e+24 kg; nu = 3.003396644745e-06
beta = 9.935268917857e-05 +/- 1.12e-09
dr/dt = -1.108462802449e-20 m/s
p_G = 3.721523743512e-25 +/- 2.09e-29
source beta residual = -1.082e-11 (-0.109 ppm)
source p_G residual = +3.744e-31 (+1.006 ppm)
ELECTRON-PROTON SCALE CONTROL (CODATA-2022 alpha)
p_E = 5.181252105751e-07 +/- 2.34e-16
source p_E residual = +2.106e-13 (+0.406 ppm)
```

The sub-ppm residuals are rounding agreement with the archived control, not empirical confirmation of SAT/H(s)H. These are independent, zero-fit calculations after the physical regime and constants are specified. A literal radiating Bohr atom is not claimed; \(\beta=\alpha\) is only the archived classical scale comparator.

## 4. Random individual reading round and discriminator

A seeded selection (`random.Random(230)`) from six substantial archive candidates selected `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 THOUGHTS — Space Doover.txt`. I read all 80 lines / 10,864 characters; current Git blob `d1c33910dcabe9d5fa50696fba4a74bcd30aff06`.

Honest takeaway: the file contains imaginative navigation and anomalous-moment constructions but repeatedly upgrades numerical resemblance into proof. One uniquely testable internal inconsistency is its attempt to move from \(v=c\sin(14.1^\circ)\) to \(v=(3/4\pi)c\) while leaving an unspecified \(\Delta_{\rm holonomy}\). Direct evaluation gives

```text
3/(4pi) = 0.238732414638; sin(14.1 deg) = 0.243615011786
difference = +0.004882597148 (+2.045218%)
These are unequal; an unspecified holonomy correction cannot derive equality.
```

This is a definite algebraic gap, not a correction to BEDROCK. The exact discriminator is: supply an independently defined \(\Delta_{\rm holonomy}=-0.004882597148\ldots\) from prior geometry, or abandon the asserted equality. Fitting that difference after the fact would not be a prediction.

## 5. BEDROCK comparison and status

Full live `BEDROCK.md` was read before theory work (current Git blob `acd2d9d935ed4ad1d9df8d42be4891ef296ea322`), with subordinate `STATE_OF_THE_THEORY.md` (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). This packet respects ND-2026-10-18-03 by preserving terminology and source locators and respects BR-008 by distinguishing coordinate pitch from physical evolution. No raw lattice value, choice of chart, or numerical coincidence is treated as controlling physics.

Result classification:

- **PASS:** dimensional consistency, algebraic reduction, sign, weak-speed limit, and archived rounded numerics for both pitch laws.
- **PASS WITH SCOPE:** CODATA-2022 uncertainty propagation for the applicable constants.
- **UNRESOLVED:** Paper A's actual 4D embedding, mass substitutions, novelty, and claims because its primary manuscript remains unavailable.
- **FAIL / exact discriminator:** the random archive file's \(\sin(14.1^\circ)=3/(4\pi)\) implication without a defined correction.
- **NOT PROMOTED:** the successful benchmark is standard leading-order physics and does not establish an SAT/H(s)H mechanism.

## 6. Complete executable Python

See the complete source in the accompanying visible conversation artifact: `morrow_inspiral_pitch_audit.py`. It was executed under Python and produced the output above plus `morrow_inspiral_pitch_audit.png`.

## 7. Complete Lean source

See the complete source in the accompanying visible conversation artifact: `MorrowInspiralPitch.lean`. Lean was not installed in the execution environment, so the file is **UNTESTED**; only the Python calculation was executed.

## Handoff

**Kestrel:** independently check the Lean proof in a Mathlib environment and keep the missing Paper A primary artifact as the gate before evaluating its 4D embedding or novelty.
