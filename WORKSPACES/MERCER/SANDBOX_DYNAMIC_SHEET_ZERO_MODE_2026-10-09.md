# Mercer dynamic timesheet zero-mode sandbox

2026-10-09 | Independent noncanonical sandbox.

Source reads: SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt lines 1-430; SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt lines 1-230; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt lines 1-500. October 5 HSH_RESOURCES routing reviewed; no quarantined sources opened.

Assumed carrier: rho*h_tt + eta*h_t - T*Laplacian(h) + D*Laplacian^2(h) = Q*f(x,y,z-v*t). For steady translating source, integrate over z-v*t to obtain (-T*Delta_perp + D*Delta_perp^2)*A=Q*f_perp. Consequently full transverse impulse I=-(q/v)*grad_perp(A), and v*I is independent of v, rho and eta. Finite-window impulses and pulse shapes remain speed-dependent. For Gaussian cores of combined variance s^2, I=qQ/(2*pi*T*v)*integral_0^infty[J1(k*b)*exp(-s^2*k^2/2)/(1+(D/T)*k^2)]dk. Point limit reproduces 1-z*K1(z), z=b/sqrt(D/T).

3D Fourier solver: periodic L=32, N=128, T=rho=1, D=0.64, eta=0.35, Gaussian width 0.65, impact 2.5. For v/c_T=0.3,0.8,1.0,1.4,2.0 all gave v*I=0.052862820448476 (relative discrepancy <=3.55e-15 versus independent 2D projection). Peak forces varied 0.009624 to 0.013353; windowed impulse varied. Infinite-domain Gaussian benchmark 0.054090997343262 differs by 2.27% due to periodic images.

Failure: finite-duration/accelerating/deforming sources, nonlinear/inhomogeneous medium, self-consistent scattering, radiation reaction, or nonvanishing boundary terms. Bending PDE has unbounded high-k group speed and is not a causal GR derivation. Next: finite-time Fourier evolution with energy/momentum ledger and mobile probe. No historical constants fitted.

Mercer.