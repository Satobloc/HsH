# Addendum 03 | Rotational cross-correlations and the chirality-identification gate

**Parent:** Cruller/Rubin stellar-visibility manuscript R0. **Date:** 2026-10-21. **Status:** SANDBOXED analytic/numerical fixture, no observed signal and no dynamical H(s)H chirality derived.

## Question
Can correlated stellar noise distinguish a rotating disturbance from straight translation or synchronous global variability? Does apparent rotation establish a left-handed physical bias?

## Explicit rotating-field calculation
On a small projected annular patch, let a stationary random field G be advected under a rigid rotation: g(phi,t)=G(phi-Omega t). Let a normalized angular covariance be K(Delta)=exp[-(2r sin(Delta/2))²/(2L²)] for isotropic smooth field sampled at angular radius r. Then
C_ij(tau)=A² exp[-(2r sin((phi_j-phi_i)-Omega tau)/2)²/(2L²)].
The local peak-lag relation is tau_peak=(phi_j-phi_i)/Omega (mod 2pi/Omega), provided angular separations and lags can be unwrapped. Reversing Omega reverses the lag sign. The normalized odd-under-signed-separation component
C_odd(Delta,tau)=[C(Delta,tau)-C(-Delta,tau)]/2
is nonzero away from tau=0 when Omega !=0, and changes sign when rotation is reversed. However for any *real-valued stationary scalar process*, C_ij(tau)=C_ji(-tau): this is not a fundamental violation of reciprocity. Do not misidentify sign-asymmetric lag ridges as parity-violating particle physics or intrinsic left-handed cosmology.

At equal time tau=0, C(Delta,0) is even: a static pair correlation in this isotropic model cannot determine rotation sign. Sky orientation and observer perspective can change the clockwise label. Claim of native Cruller chirality would require properly oriented 3+1 tetrads, a globally defined sign observable and comparison to astrophysical/instrumental spinning phenomena.

## Executed numerical example
Set illustrative rotation period P=120 days, Omega=2pi/P, ring radius r=1 arbitrary unit, covariance length L=.28 r. Signed separations DeltaPhi=-30,-15,+15,+30 degrees yield peak lags for Omega>0: -10,-5,+5,+10 days. Reversed Omega gives opposite sign. Synthetic covariance maps of positive rotation, negative rotation, and synchronous stationary field generated using NumPy/matplotlib and saved in originating chat at `/mnt/data/cruller_noise_addendum_03_rotation_signature.png`. This is calculated mathematical distinguishability, not a prediction that the cosmos rotates at 120 days.

## Observational test
1. Compare translating and rotational lag templates in local patches: translation yields delay gradients approximating a fixed vector, rotation yields gradients whose directions turn with projected position.
2. Use signed angular separations and time ordering, not just angular autocorrelation or one-dimensional PSD.
3. Mask CCD/drift-scan readout systematics, image-coordinate swirling patterns, atmospheric turbulence, cadence aliases, survey calibration and stellar proper motions. A twisting correlation ridge alone does not establish gravity.
4. Validate with detector-coordinate rotation or camera orientation: a sky-fixed physical imprint should remain stable in celestial coordinates when detector frames rotate.
5. Fit/predict out-of-sample; account for multiple axis centers, rotation periods and sky masks in trials corrections.
6. Direct dynamical Cruller calculation requires its 4D rotating stress-energy, induced Lorentzian metric, null-geodesic screen transport and measurable photon flux modulation, all currently absent.

## Calculated implication
A rotating stochastic pattern can have a *sign-antisymmetric, time-lagged* cross-correlation despite equal-time covariance being symmetric. This is a sharpened probe for proposed oriented transport, not a uniquely Cruller signature. No causal propagation speed or energy budget derived.

**Mersearch:** shared Mersearch request is another worker's; this new original math needs no historical retrieval. No Mersearch run claimed. Do not promote to BEDROCK.