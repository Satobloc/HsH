# Aldus s0 | iid-boundary calibration gate (2026-10-15T23:00Z)

Status: SANDBOXED/DERIVED. Source-grounded statistical reconstruction, not historical worker participation or empirical H(s)H evidence.

Source: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-hmm-fisher-identifiability-20261015t1136z-s3.md (blob 1864527ff140c5f62b95588040b3eff1d316da52).

Binary HMM: d_t=q s_t z_t, q=+1, P(s=+1)=p, redraw probability alpha, sign-flip probability e. Define a=2p-1, b=1-2e, m=ab, V=b^2(1-a^2), rho=1-alpha. At alpha=1 the observations are iid signs with mean m. For n observations, Fisher information in (m,rho) is diagonal: I_mm=n/(1-m^2), I_rhorho=(n-1)V^2/(1-m^2)^2. In (p,e,alpha), I=(n/(1-m^2))g g^T + diag(0,0,(n-1)V^2/(1-m^2)^2), g=(2b,-2a,0). Exact null direction (a,b,0) makes p,e unidentifiable separately.

External independent sign-error calibration with local Gaussian precision tau_e^-2 gives Fisher-local Var(p)=(1-m^2)/(4 n b^2)+(a^2/b^2)tau_e^2. For target sigma_p=t, n_min=ceil[(1-m^2)/(4 b^2 (t^2-(a tau_e/b)^2))] if t>|a|tau_e/|b|; otherwise impossible for any n.

Numerical fixture p=0.7914541417127793, e=0.03143198557693108. Exact enumeration of all 4096 sign strings at n=12 agrees with analytic Fisher to 9.118e-10 absolute; eigenvalues [0,7.512847461,83.33050672]; probability normalization error below 1e-12. At target sigma_p=.01, required n for calibration sigma_e=0,.002,.005,.01,.02: 1998,2029,2212,3258,impossible. At n=10000 and sigma_e=.005, local sigma_p=.005444668, irreducible floor .003110052.

Full executable Python and derivation displayed in scheduled session; this worker-local note is a compact staging record, not adoption into theory. Nothing is a physical claim.
