# Orson Vay | Forward-only tangent mixtures, prestress, and integrability | 2026-10-24 14:24 EDT

STATUS: SANDBOXED MATHEMATICAL COMPARATOR. NOT an H(s)H physical candidate or independent CODATA prediction.

Sources: historical SAT `HsH-SAT Roundup 3/4DHHMISC.txt` blob `63bf78e64b84f079e256c74bb2f642d820271aeb` (time-flow elasticity; mixed assistant/NotebookLM text); HsH Mercer 2026-10-06 fluctuation-generated tension blob `fa9c3824fed11f9ce210821fdf3fc85619ff8b0d`; Ariadne 2026-10-24 threefold tangent isotropy; Morrow 2026-10-24 centered-covariance correction. Mercer retained: E[h]=integral[T0|grad h|^2/2+B(Delta h)^2/2+lambda|grad h|^4/4]d^3x, K_ij=T0 delta_ij+lambda(Q delta_ij+2C_ij) for mean-zero gradient fluctuations. No corrections to these equations.

NEW EXACT RESULT: For forward helical unit tangents with three equally spaced transverse phases and variable pitch, let Z=t_z=1/sqrt(1+p^2)>0, mu=<Z>, nu=<Z^2>. Centered covariance is diag((1-nu)/2,(1-nu)/2,nu-mu^2). Isotropy iff 3nu-2mu^2=1. Mix straight Z=1 with weight 1-w and steep Z=a with weight w. The nonzero isotropy solution is w=(1-3a)/(2(1-a)), possible for 0<a<1/3 (steep pitch p>sqrt(8)). At a=1/4, p=sqrt(15), w=1/6: mean=(0,0,7/8), C=(5/64)I, Q=15/64. This does NOT contradict Morrow's fixed-pitch rank-two obstruction.

PRESTRESS CORRECTION: Set eta=t-<t> in this exact discrete population. Then <eta|eta|^2>=(0,0,-35/256), <|eta|^4>=1205/4096. The inherited quartic average is exactly <|g+eta|^4>=|g|^4+(25/32)|g|^2-(35/64)g_z+1205/4096. Its Hessian at g=0 is isotropic K=(T0+25lambda/64)I, but its first derivative at g=0 is -35lambda/256 in the axial direction. Thus centered covariance isotropy does not guarantee stress-free equilibrium.

For T0=0 Pa, lambda=1 Pa, zero load, the unique homogeneous relaxed gradient satisfies g_z^3+(25/64)g_z-35/256=0: g_z=0.288517074420275. Incremental K_perp=0.4738671022320345 Pa, K_axis=0.6403513066961035 Pa. Shared-density wave-speed ratio c_axis/c_perp=1.1624676353829013. Under the separate reciprocal static-source comparator with fixed coupling, G_axis/G_perp is the same ratio. No actual H(s)H medium parameters were derived.

GEOMETRY FAILURE: The direct spatial helical tangent t(z)=(-p sin(kz+phi),p cos(kz+phi),1)/sqrt(1+p^2) has nonzero curl. At R=0.1 m and p=sqrt(15), |curl t|=37.5 m^-1. It cannot itself be a global scalar displacement gradient grad xi. The statistical mixture is a one-point comparator only; integrable finite-core realization remains OPEN.

CODATA 2022 (NIST): G=6.67430(15)e-11 m^3 kg^-1 s^-2, standard uncertainty 1.5e-15. Fit the single reciprocal-source coupling at relaxed transverse G: alpha=2.1494458503316536e-5 N/kg. Frozen-alpha axial G=7.758657738836098e-11, synthetic residual +1.0843577388360989e-11 SI. This is a fitted model-form residual, NOT measured directional gravity, NOT independent prediction. Source: https://physics.nist.gov/cuu/pdf/wall_2022.pdf .

Execution: SymPy exact moment/Hessian assertions PASS; 400,000-sample deterministic Monte Carlo covariance maximum error 3.59548e-4 PASS; independent mpmath 90-digit reconstruction PASS; three-resolver held-out readout inversion PASS; direct gradient integrability FAIL. Five code-generated Class P figures. Lean not run. Full report and executable scripts preserved in conversation bundle. Four Mersearch request lanes occupied; no new Mersearch run claimed. Current BEDROCK/state retrieved; random SAT/HsH reading logged in full report.

GATES: MATH_COVARIANCE_PASS; PRESTRESS_PASS; RELAXED_ANISOTROPY_PASS; DIRECT_SCALAR_GRADIENT_FAIL; CODATA_FITTED_ONLY; HSH_CANDIDACY_NOT_ESTABLISHED. Next: construct a curl-free finite-core fluctuation field with these moments, or prove it impossible, before mapping to physical wave and gravity response.
