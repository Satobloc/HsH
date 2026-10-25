# Meridian :00 | Historical MOVE 10 geometric contact sensitivity | 2026-10-25T09Z

STATUS: MATHEMATICALLY CLEARED in a specified Euclidean helix model; ELIGIBLE FOR CANDIDACY CONSIDERATION ONLY. NOT an H(s)H construction candidate, material elasticity prediction, independently verified CODATA prediction, or BEDROCK amendment.

RING: h=345, seq=1725, index=15 Meridian; next index=16 Mercer. Existing hourly recurrence unchanged.

## Source and correction genealogy
- Full HsH BEDROCK.md read: Git blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines), including ND-2026-10-18-02/03; full STATE_OF_THE_THEORY.md read: blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines).
- Primary HsH DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt: blob 8be62af34009f9d9e97c94d137fe43ace3f39e21, 1041 lines; MOVE 8-10, approximately lines 431-555. Historical source sets R=Bohr radius, P=electron Compton wavelength, a=P/(2*pi*R)=alpha. It asserts r_core/R approximately pi*a, fixed-turn-length d ln R/d ln P approximately -alpha^2, and core-contact growth approximately pitch growth. These are geometric representation claims, not a derivation of alpha. Original message-level authorship/timestamp unverified.
- Later exact correction: Alberr issue #330, 2026-10-24, establishes the double-normal contact equation sin(delta)+a^2*delta=0 and exact reach branch. This audit extends that correction to exact differential response.
- Random reading: actual Python secrets.randbelow(3) selected index 1 from [SCALING.txt, SRENA SAT.txt, HOLONOMY DRAFT.txt]. Entire SAT SRENA SAT.txt read (blob c946047b01165ca41b3ba7cdb454e7c1ccb7535d; 23385 chars, 17 messages, exported 2026-07-31). Nathan's discussion distinguishes co-acceleration of a whole braid from internal strand motion; no pitch equation taken from it.
- Mersearch: read worker guide and four current request files, all occupied by Orson/Tern/Morrow/Meridian. No request overwritten, no new Mersearch run. Reused completed Orson three-repository receipt as partial discovery evidence; direct primary-source fallback. Public files only.

## Exact equations
Euclidean helix r(phi)=(R*cos(phi),R*sin(phi),P*phi/(2*pi)); a=P/(2*pi*R); turn arclength L=sqrt((2*pi*R)^2+P^2). Nonlocal contact phase delta near 2*pi solves sin(delta)+a^2*delta=0. Contact radius r_c=R*g(a), g(a)=sqrt(2*(1-cos(delta))+a^2*delta^2)/2. Define D=2*(1-cos(delta))+a^2*delta^2. Envelope theorem gives G=d ln(g)/d ln(a)=a^2*delta^2/D. Then:
d ln(R)/d ln(P)|L = -a^2 EXACT;
d ln(r_c)/d ln(P)|L = -a^2+(1+a^2)*G EXACT;
d ln(r_c)/d ln(R)|P = 1-G EXACT.
For small a, g~pi*a/sqrt(1+a^2), r_c~P/2*sqrt(1-(P/L)^2), and d ln(r_c)/d ln(P)|L~1-a^2.

## Executed checks and numerical fixture
CODATA 2022 alpha=7.2973525643(11)e-3 (u=1.1e-12) used strictly as MEASURED INPUT, not predicted or tuned. NIST 2022 adjustment, web version 9.0.
70-digit mpmath: delta=6.2828507368618140656525577917324; g=0.022924698829148095927316801188684; G=0.99994675147961801303749131917331.
Exact fixed-L pitch sensitivity=0.99994674864406218036095018895101. Fixed-P radius sensitivity=0.000053248520381986962508680826690771. The 1-a^2 approximation differs by -1.490123853415321e-12.
A +1% pitch perturbation at fixed L raises contact limit by 0.999945947196660823%; radius falls by 0.0000535176255406155%. A +1% R at fixed P raises contact limit by 0.0000524603519906272%.
PASS: SymPy exact differentiation; mpmath stationarity; independent SciPy brentq; 3 central finite-difference step sizes; four limiting-case controls; unit consistency; local curvature bound check. Class P plot and full runnable code preserved in the calculation conversation. No Lean run. No physical elastic modulus, force, or independent observable derived.

GATE: Archive's geometric anisotropy is quantitatively upheld in this precise branch. Physical finite-core/Kerr-shell identification, anisotropic cross-section, responsive-medium dynamics, interbraid mechanics, and multi-sector closure UNRESOLVED. No CODATA residual can be claimed because alpha is an input. No BEDROCK promotion.
