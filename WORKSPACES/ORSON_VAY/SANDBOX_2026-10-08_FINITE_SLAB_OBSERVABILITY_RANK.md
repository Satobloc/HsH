# Orson Vay — Finite-slab observability rank

**Checkpoint:** OV-20261008-03  
**Date:** 2026-10-08  
**Status:** SANDBOX / not canonical physics

## Source coverage and boundary

Historical SAT: Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, first 250 lines (F1/F2, opening F3); Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H_TIME_RESIDUALS.txt, complete 10,034 characters (normalization and UI/Whirligig/Graticule instrument discussion).

HsH: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt, opening ~24 KB of 235 KB (Euclidean 4D, UI, slab resolving surface, recursive helix); Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md, complete (dimensional-measure checks).

**Recovered construction:** 4D trajectory, rotational modes, finite resolving slab, normalized units. **New local inference:** the slab centroid has a mode-dependent transfer function, and therefore detector-dependent observable dynamical rank. **Sandbox conjecture:** some apparent loss of degrees of freedom in a 3D readout may be a measurement-channel null rather than a physical transition. No historical constants or particle assignments used. HSH_RESOURCES consulted only for routing after internal construction. PRIOR_ART not accessed.

## Explicit 4D geometry and readout

Let the centerline be

\[
X(s)=\big(a\cos(\omega_1s+\phi_1)+b\cos(\omega_2s+\phi_2),\
a\sin(\omega_1s+\phi_1)+b\sin(\omega_2s+\phi_2),\ 0,\ s\big).
\]

Coordinates, a, b, s, h have dimensions of length; angular rates have units inverse length. This is a 4D centerline, not a full finite-core worldtube.

The apparatus reports only a signed-coordinate average through a slab:

\[
y_h(s_0)=\frac{1}{h}\int_{s_0-h/2}^{s_0+h/2}X_x(s)\,ds
=\sum_{j=1}^2 a_j\,\operatorname{sinc}(\omega_jh/2)\cos(\omega_js_0+\phi_j).
\]

The second mode vanishes exactly in this channel when

\[
h_\star=2\pi/\omega_2.
\]

This is not disappearance of the geometric mode or of its energy; a nonlinear, intensity, or spatially resolved detector may retain it.

For samples s_n=nΔ and c_j=cos(ω_jΔ), the readout obeys

\[
y_{n+4}-2(c_1+c_2)y_{n+3}+(2+4c_1c_2)y_{n+2}
-2(c_1+c_2)y_{n+1}+y_n=0.
\]

Generic Hankel rank is 4 when two distinct nonaliased modes have nonzero readout amplitudes. At the second-mode null the rank is 2. The lower-order process is an artifact of a restricted observation operator applied to an unchanged trajectory.

## Scripted fixture

Use a=0.20, b=0.07, ω1=1.1, ω2=2.7, φ1=0.37, φ2=-0.52, Δ=0.4 in normalized length units. If s=ct and the effective Lorentzian interval is spatial norm squared minus ds squared, the curve is timelike because aω1+bω2=0.409<1.

At h=0.4 the mode amplitudes are 0.1983905664 and 0.0666472582. A 12×12 Hankel matrix of 200 readout samples has leading singular values 1.28926591, 1.09984883, 0.38858965, 0.37630487; rank=4 at threshold 1e-9.

At h=2π/2.7=2.3271056693 the second-mode amplitude is below 3e-18; leading singular values are 0.959417952, 0.817967302, then ~2e-16; rank=2.

At h=0.9999 h_star, second-mode amplitude is 7.0007e-6, so rank returns to 4 in noiseless arithmetic. Across all three settings, maximum residual of the exact fourth-order recurrence over 200 samples was <8e-15.

For independent Gaussian measurement noise of variance σ², with phase/frequency known, the Fisher information about b is

\[
I_b(h)=\frac{\operatorname{sinc}^2(\omega_2h/2)}{\sigma^2}
\sum_n\cos^2(\omega_2n\Delta+\phi_2).
\]

Near the null, I_b is proportional to (h-h_star)^2. For N=200 and σ=0.005, approximate second-mode matched-filter SNR falls from 133.3 at h=0.4 to 1.41 at 0.99 h_star, 0.14 at 0.999 h_star, and zero at h_star.

## Discriminator and failure

Vary slab thickness without changing the underlying 4D curve. Test mode amplitudes, Hankel rank, and Fisher-information scaling. This mechanism fails as an explanation of any proposed physical effect if the actual apparatus does not perform this signed-coordinate averaging, if calibration shows a different transfer function, or if the measured mode persists in the claimed null channel. Frequency aliasing and nonlinear readout are independent alternative explanations for rank changes.

Next: finite-radius tube with several explicitly defined detector kernels (signed centroid, intensity, resolved geometry), and a controlled rotation of the resolving slab. Do not infer quantum discreteness or a particle transition from a centroid null.

## Minimal reproduction (Python / NumPy)

    import numpy as np
    a,b,w1,w2,dt,ph1,ph2=.20,.07,1.1,2.7,.4,.37,-.52
    n=np.arange(200)
    def readout(h):
        return (a*np.sinc(w1*h/(2*np.pi))*np.cos(w1*dt*n+ph1)
              + b*np.sinc(w2*h/(2*np.pi))*np.cos(w2*dt*n+ph2))
    def hankel(x,m=12):
        return np.array([x[i:i+m] for i in range(m)])
    for h in (.4,2*np.pi/w2):
        sv=np.linalg.svd(hankel(readout(h)),compute_uv=False)
        print(h,sv[:6],np.sum(sv>1e-9))

No conversation title or scheduler mutation. Symbols are local sandbox notation only.
