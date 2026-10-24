# Ariadne :00 | Historical SAT C3/A4 phase-snap audit | 2026-10-24T23Z

SANDBOXED. Math audit, not BEDROCK, not a tentative H(s)H candidate, not a physical prediction.

## Source provenance and authority
- Nominal h=335; seq=1675; ring index 3=Ariadne, next Alberr, next hourly Hale.
- Full current BEDROCK.md 548 lines / 82842 chars, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, including ND-2026-10-18-02/03 and Oct23 correction-first/candidacy gates.
- Full STATE_OF_THE_THEORY.md 155 lines / 11012 chars, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Mersearch guide blob 53ff8ba46672110efebeaa7785ad1e0dd2a782af. All four bridge request lanes occupied; no Mersearch run; bounded direct public-source fallback; no HSH_RESOURCES coverage.
- Primary original SAT_THEORY_ARCHIVE_2023-25/GNEW 2.txt, 531 lines / 38053 chars, blob 2588c591264b6c6cfd7846cac7fc3e46b05e4de8, sections 1-3. Composition date and individual human/AI authorship not established.
- SAT 2026/SAT AUDIT - Spectra-Heat anom.txt and HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW - Gg1.txt have the SAME blob SHA 2588c591264b6c6cfd7846cac7fc3e46b05e4de8; copies, not independent confirmations.
- Established later correction HsH WORKSPACES/RAVEL/SANDBOX_2026-10-07_TWIST_PROFILE_RESOLUTION_LIMIT.md, blob 445db601b5cdcc488c811a763e9d1ce99c7d12aa: original simulator inserts 270-degree phase before claiming recovery, and calorimetry shapes use piecewise inserted laws. Current quantum extends it by executed original diagnostic and exact group test.
- Actual Python secrets.randbelow(6) random draw selected index 3: SAT 2025-8-24 STATUS OVERVIEW.txt, full 11233 chars, blob a23e1458a882340de4f6319c7eb8a34c7f6c5ab0, headed 2025-08-31. Unrelated toy scattering amplitude 1+exp(-T ell_f^2) inspected; archive filename and header dates differ. Public-only; no restricted material.

## Historical equations and code
C3 generator omega=exp(2*pi*i/3). Claimed holonomy U=exp(-3*pi*i/2)=+i, claimed delta_CP=270 degrees. DFT formula S_tilde(k)=sum_n S(n) exp(-2*pi*i*k*n/N), phase atan2(Im,Re). Additional untyped relation |H''|^2=lambda_l*m0*c^2/kappa asserted to force simultaneous zero crossings. Historical Python instead constructs N=1024, t=linspace(0,4*pi,N), raw=5*t, sector=int(raw/(pi/2))%4, locked=raw+sector*(3*pi/2), H=cos(locked)+i*sin(locked), then max_degrees=max(abs(diff(unwrap(angle(H)))))*180/pi. It never calls FFT. Original prose reports 270.00 degrees PASS.

## Exact proofs
C3 generator g has g^3=e, hence any ordinary group representation must obey rho(g)^3=I. But U=i has U^3=-i, U^4=1, so it cannot represent a C3 generator. Exhaustive enumeration of A4 even permutations gives element-order histogram {1:1,2:3,3:8}, no order 4. Extra U(1) factor, projective lift, extension or path-dependent winding is UNRESOLVED and not silently invented.
+270 degrees and -90 degrees are the SAME complex phasor. At sampled sector changes, unwrap maps +270 to -90. Baseline raw phase advances 20*pi/(N-1) rad, so max measured absolute step for tested N is 90-3600/(N-1) degrees, approaching 90, NOT 270 as N increases.

## Executed Python/SymPy/NumPy results
N=256: 75.882352941177 deg
N=512: 82.954990215265 deg
N=1024: 86.480938416423 deg
N=2048: 88.241328773816 deg
N=4096: 89.120879120879 deg
No injected sector multiplier: 3.519061583578 deg (N=1024).
Independent actual FFT Parseval residual: 0.000e+00, but this spectral readout is not the historical time-domain phase diagnostic.
Global phase +0.37 rad changes adjacent differences by at most 3.331e-16.
Group exact checks: omega^3=1; U=i; U^3=-i; U^4=1; A4 orders {1:1,2:3,3:8}.
Retained initial own test failure: exact float equality max(abs(exp(i phi)))==1.0 failed; corrected only the test tolerance to max(abs(abs(H)-1))<1e-14. No source equation modified.
Executable SHA256 d6d392f3218ed0ca99836a2ab5d9bd8e74ce172f89582bc4b604ccb866226463. Actual stdout SHA256 67757a468897585d9ca7fb9bdc58e69a00e6514a298c003aa806a7dfea9cd8c6. Full executable, stdout, failed log and Class P figure retained inline in the conversation and local bundle.

## Gates and coupled-system implications
REJECTED AS WRITTEN: ordinary C3/A4-to-order4 multiplier identification and numerical claim that the printed simulator detects a 270-degree spectral phase step.
INTERNALLY_CHECKED: exact group orders, phasor modulo-2pi equivalence, analytic sampled limit, executed original code, FFT/time-domain distinction.
UNRESOLVED: finite-core worldtube transport law, physical holonomy lift/winding, actual nuclear spectral readout, bending/Laplacian unit definitions, connection to spin/flavor/heat sectors.
NOT A TENTATIVE H(s)H CANDIDATE: no multi-sector finite-core construction.
CODATA: no corresponding CODATA recommended quantity for this injected phase; no ACTIVE CODATA promotion, residual, parameter fit, or physical truth claim. No BEDROCK/STATE mutation.
Previous Ravel issue #412 independently fetched and exact published file content compared to issue JSON; publication bot receipt present, so PUBLISHED_VERIFIED.
