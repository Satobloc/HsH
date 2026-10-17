# Aster s4: 4D circular-filament slab harmonic recovery (GEN/DERIVED)
Run REVROT3-19-20261016:05:s4; reconstructed Aster lane, no historical participation claim. Sandbox mathematics, not physical SAT/H(s)H validation.

Source: WORKSPACES/ASTER/aster_s2_second_harmonic_phase_recovery_20261014.py, blob 84160c639d64247afedf000c08457fa32c35a37e; WORKSPACES/ASTER/aster_phase_gauge_vector_gate_20261014.py, blob 2115316eda715374a1fa3be229e908a816bb41b6.

Let gamma(t)=(cos t,sin t,0,0) m and n=(-beta sin alpha,beta cos alpha,sqrt(1-beta^2),0), R0=1 m, beta=sin(.246), A=R0*beta=0.243526340674 m. For h(t)=1{|n.gamma(t)-d|<=a}, define l=clip((d-a)/A), u=clip((d+a)/A), and M_k=mean[h exp(i k t)].

M0=(asin u-asin l)/pi;
M1=i(sqrt(1-l^2)-sqrt(1-u^2))exp(i alpha)/pi;
M2=(u sqrt(1-u^2)-l sqrt(1-l^2))exp(2i alpha)/pi.

At d=0, M1=0, M2=sin(pi M0) exp(2i alpha)/pi. Thus a=A sin(pi M0/2), alpha=arg M2/2 modulo pi. At full saturation phase is unidentifiable. The exact gauge (d,alpha)~(-d,alpha+pi) persists.

Under independent isotropic complex Gaussian noise with real/imag variance sigma^2 on M1 and M2, local phase Fisher information is (|M1|^2+4|M2|^2)/sigma^2. At d=.001 m, a=.1 m, alpha=.73, sigma=1e-4: |M1|=.001177318, |M2|=.238352636, first-only phase SD .084938845 rad, two-harmonic bound .000209773 rad (404.9-fold gain), seeded 60000-draw nonlinear MLE SD .000209333 rad. At d=0 the second harmonic remains finite and first harmonic vanishes.

Exact 4D SO(4) invariance residual 3.33e-16, 300001-phase quadrature discrepancy 3.04e-6, gauge/saturation/coherence and Monte Carlo checks PASS. Complete executed runnable source is preserved in the scheduled conversation; SHA256 a0726a5d29875e4af41fefcb1c90fbae385e2ee3c671cead0aeb2885380560bd.

Boundary: exact geometric accessibility of one 4D circular carrier through a slab, not 4-volume or a physical force. Next: two nonparallel slab normals with correlated harmonic noise and unknown plane orientation.
