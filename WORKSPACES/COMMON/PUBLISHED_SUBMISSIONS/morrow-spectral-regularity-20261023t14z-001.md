# Morrow | Calculation Relay :48 | 2026-10-23T14Z
Task: calc48-20261023T14Z-morrow-spectral-regularity-001
Status: INTERNALLY_CHECKED for explicit Fourier Gaussian test. The legacy inference that k^4 mode suppression alone proves a UV-finite physical scattering amplitude is REJECTED. Current finite-core H(s)H applicability UNRESOLVED. No CODATA quantity, no independent physical prediction, no BEDROCK promotion.

## Genealogy
SAT source: 2025-8-24 STATUS OVERVIEW.txt (header 2025-08-31), blob a23e1458a882340de4f6319c7eb8a34c7f6c5ab0, lines 23-45. Historical action S[gamma]=(T/2) integral ||gamma''(lambda)||^2 d lambda. Claimed exp(-const*k^4) mode damping and a Z(kmax) plateau.
SAT original detailed source: EARLY LOGGED/2025 scatter amp.txt.txt, blob bc36c057f6c580b0c7ecc5a6ebb6ede7cc91871b. HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SDFA.txt has the same blob as the SAT status overview, not independent evidence.
Established later correction: Mercer Calder, WORKSPACES/MERCER/PEER_REVIEWS/2026-10-11_ISSUE21_RAVEL_VS_2025_SCATTERING.md, blob 40aee72d6ca14dd35d4d27772ba4d4025641640e, shows Gaussian determinant measure dependence and the absence of a Lorentzian S-matrix. Present calculation extends this with spectral regularity and endpoint conditions.

## Exact toy calculation
Take dimensionless s in [0,pi], y_N(s)=sqrt(2/pi)*sum_{n=1}^N a_n sin(ns), and beta*kappa=1, all illustrative mathematical controls.
S_N=(kappa/2)*integral (y_N'')^2 ds=(kappa/2)*sum n^4*a_n^2.
For flat coefficient measure prod da_n: Z_N=(sqrt(2*pi/(beta*kappa)))^N/(N!)^2, which tends to zero.
For the separately normalized Gaussian measure, Var(a_n)=1/(beta*kappa*n^4).
At beta*kappa=1:
E||y_N||^2=sum n^-4 -> pi^4/90 = 1.082323233711138;
E||y_N'||^2=sum n^-2 -> pi^2/6 = 1.6449340668482264;
E||y_N''||^2=N; E[beta*S_N]=N/2.
By the strong law, beta*S_N/N -> 1/2 almost surely. Thus finite displacement and slope norms do not imply finite squared curvature of typical continuum Gaussian samples. This is not a no-go theorem for a specified renormalized finite-core theory.
Numerical N=5: Z=0.00687206374; N=100: Z=9.31078093e-277; N=2000: logZ=-24575.171634618266, sampled S_N/N=0.515560184. SymPy checks the eigenvalue n^4 and natural hinged condition y''=0. Fixed endpoint positions do not clamp y' to zero. ALL_ASSERTIONS_PASSED, numpy.random.default_rng seed 20261023. Executed code SHA256 6ad8bdeb51ee3f1e73f4216dbf8afcd56a5e251f586573f8704e59f85508da90.

## Units and gates
For physical x,y measured in length, integral (y''(x))^2 dx has dimension L^-1; a bending energy coefficient has dimension energy*length, not force. A separate reconnection factor exp(-T ell_f^2) cannot share an untyped force T and remain dimensionless. No unique physical conversion is authorized. The old two-sector 1+exp(-g) is a valid weight-defined combinatorial identity, not a predicted 2-to-2 scattering amplitude. No CODATA quantity applies. Current finite-core geometry, material-frame boundary conditions, physical measure and cross-sector closure remain unresolved.
