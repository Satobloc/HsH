# CODE 000 | Mira | 2026-10-25T10Z | Real-data helium-3 anchor audit

Task: calc48-20261025T10Z-mira-he3-anchor-001
Gate: REJECTED (literal SI length formula); historical underlying construction UNRESOLVED.
BEDROCK ND-2026-10-25-01 real-world-data-first rule honored. No invented physical inputs.

## Historical source
HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1, section 1.1:
ell_f = (h*c/(2*pi*f_He3*alpha^2))^(1/3) = (2*A/T)^(1/3) ~ 0.793732 fm.
SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH - BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f, independently refers to ell_f ~0.7937 fm pinned to the Rydberg constant, but supplies no dimensionally explicit unique bridge. Both are compilations; earliest original-message date is unresolved.

## Measured systems
Neutral metastable helium-3 triplet hyperfine splitting: f=6739.71 +/-0.05 MHz, measured by atomic-beam magnetic resonance (Weinreich and Hughes, Phys Rev 95, 1451, 1954). https://doi.org/10.1103/PhysRev.95.1451
Different physical transition: helium-3 ion ground-state hyperfine rest line f=8665.65 MHz, NRAO reference; tabulated precision only, no uncertainty supplied. https://www.cv.nrao.edu/~dbalser/ppt/tmb_he3_bern.pdf
NIST CODATA 2022 version 9.0: h=6.62607015e-34 J s exact; c=299792458 m/s exact; alpha=7.2973525643(11)e-3; Rinf=10973731.568157(12) m^-1. https://physics.nist.gov/cuu/pdf/all.pdf

## Executed numerical and dimensional audit
[h]=kg m^2 s^-1; [c]=m s^-1; [f]=s^-1. Therefore [h*c/f]=kg m^3 s^-1 and [(h*c/f)^(1/3)]=kg^(1/3) m s^(-1/3), NOT length. Its numerical SI output must not be compared to 0.793732 fm.
Measured neutral line: E=h*f=4.46577912506565e-24 +/-3.313035075e-29 J; lambda=c/f=0.0444815070678 +/-3.29995705066e-7 m; f/(c*Rinf)=2.04864248235434e-6 +/-1.51982984606e-11.
Ion line: E=5.74192047953475e-24 J; lambda=0.0345954957793 m; f/(c*Rinf)=2.63406270109751e-6. No ion uncertainty-normalized comparison is justified.
Formal cube-root nonlength SI numbers: neutral 4.449470501280708e-11 +/-1.10031205718413e-16; ion 4.091868676338487e-11. These carry units kg^(1/3) m s^(-1/3), not meters.

## Status and next action
REJECTED: historical displayed equality as a physical SI length.
UNRESOLVED: definition/units of A and T, choice of helium-3 transition, earliest original derivation, Rydberg-based bridge.
NO UNIQUE REPAIR: no added mass, tension, scale, or fitted parameter. No SAT prediction of an observable and no prediction residual against CODATA. The conventional E=h*f and lambda=c/f computations use observed data as inputs, not independent SAT predictions.
Script executed with assertions PASS; complete Python SHA-256 48aac4bc3347cdea33b49788c115798720edf788a0ed073b5699e21842a5305e. Full code and numerical output retained in the chat evidence packet. No protected signet, no theory promotion.
