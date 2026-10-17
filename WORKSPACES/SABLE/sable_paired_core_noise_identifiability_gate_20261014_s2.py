#!/usr/bin/env python3
"""Sable s2 | Paired finite-core measurement identifiability gate.

Follow-up to Sable's 2026-10-14 Gaussian-convolution semigroup no-go.
Model (each 3D component in meters): X=R*n, n uniform on S^2;
Y_j=X+C+S_j, C~N(0,c^2 I_3) is a COMMON core displacement;
S_j~N(0,s_j^2 I_3) are independent channel readout errors.
All are independent of X and each other, except C is shared by the pair.

Single-channel marginal profiles identify only q_j=c^2+s_j^2, even at
infinite sample size. If matched X is available, paired residuals U_j=Y_j-X
identify c^2=Cov(U_1,U_2), s_j^2=Var(U_j)-Cov(U_1,U_2).
With unobserved X, Cov(Y_1,Y_2)=R^2/3+c^2 (known R required).
If readout errors correlate, the independence assumption fails and
identification disappears: two parameter sets yield the same joint Gaussian
residual distribution. The paired estimator must not be used blindly.

This is a synthetic 3D Euclidean geometric measurement model, not a physical
claim about SAT particles, worldtubes, or actual instruments.

Run: python sable_paired_core_noise_identifiability_gate.py
Requires numpy. Output is deterministic given seed.
"""
import math
import numpy as np

SEED=20261014
N=250_000
R=1.7484885900275715  # m, fixture from prior Sable shell profile
C=0.04              # m, shared core displacement SD
S1=0.02             # m, channel 1 readout SD
S2=0.06             # m, channel 2 readout SD
RHO=0.25            # correlated-readout counterexample


def theoretical(c,s1,s2,rho=0.0):
    v1=c*c+s1*s1
    v2=c*c+s2*s2
    cov=c*c+rho*s1*s2
    return np.array([[v1,cov],[cov,v2]])


def invert(cov):
    cc=cov[0,1]
    return np.array([cc,cov[0,0]-cc,cov[1,1]-cc])


def residuals(rng,n,c,s1,s2,rho=0):
    core=rng.normal(0,c,(n,3))
    e1=rng.normal(0,s1,(n,3))
    e2=rng.normal(0,s2,(n,3))
    # Construct readout correlation rho without changing marginal variances.
    if rho != 0:
        e2=rho*(s2/s1)*e1 + math.sqrt(1-rho*rho)*e2
    return core+e1,core+e2


def sample_cov(u1,u2):
    # Coordinate-pooled covariance, removing coordinate-wise sample means.
    a=u1.reshape(-1);b=u2.reshape(-1)
    return np.cov(np.vstack([a,b]),ddof=1)


def main():
    rng=np.random.default_rng(SEED)
    u1,u2=residuals(rng,N,C,S1,S2)
    theory=theoretical(C,S1,S2)
    sample=sample_cov(u1,u2)
    inferred=invert(sample)
    target=np.array([C*C,S1*S1,S2*S2])
    ncoord=3*N
    # Gaussian-product exact variance for sample cross covariance at large N.
    se_cov=math.sqrt((theory[0,0]*theory[1,1]+theory[0,1]**2)/ncoord)
    z=(inferred[0]-target[0])/se_cov
    assert abs(z)<5, (z,sample)
    assert np.all(np.abs(inferred-target)<6*se_cov)

    # If X's direction is unobserved but the shell radius R is exactly known,
    # use dot products of whole paired 3-vectors. Because |X|=R exactly,
    # the R^4 shell sampling variance cancels within each vector! Treating
    # the three Cartesian components as independent observations would give
    # a WRONG uncertainty estimate; derive variance at the pair level.
    dirs=rng.normal(size=(N,3))
    dirs/=np.linalg.norm(dirs,axis=1)[:,None]
    x=R*dirs
    y1=x+u1
    y2=x+u2
    raw_cross=R*R/3+C*C
    raw_c2_hat=np.mean(np.sum(y1*y2,axis=1))/3-R*R/3
    v1,v2=theory[0,0],theory[1,1]
    v12=theory[0,1]
    # Let D=(X+U1).(X+U2)/3. E[D]=R^2/3+c^2.
    # Var(D)=[R^2(v1+v2+2v12)+3(v1*v2+v12^2)]/9.
    # Isserlis' theorem supplies Var(U1.U2)=3(v1*v2+v12^2).
    raw_pair_var=(R*R*(v1+v2+2*v12)+3*(v1*v2+v12*v12))/9
    reg_pair_var=(v1*v2+v12*v12)/3
    se_raw=math.sqrt(raw_pair_var/N)
    ratio=math.sqrt(raw_pair_var/reg_pair_var)
    n5_raw=math.ceil(25*raw_pair_var/(C**4))
    n5_registered=math.ceil(25*reg_pair_var/(C**4))
    raw_z=(raw_c2_hat-C*C)/se_raw
    assert abs(raw_z)<5
    # Both n5 values count independent 3D paired observations, not coordinates.

    # Correlated readout noise: exact alias, not merely an approximate fit.
    alt_cov=theoretical(C,S1,S2,RHO)
    alt_params=invert(alt_cov)
    alt_c,alt_s1,alt_s2=np.sqrt(alt_params)
    assert np.allclose(alt_cov,theoretical(alt_c,alt_s1,alt_s2,0),rtol=0,atol=1e-18)
    # Independent core on separate observations: cross covariance is zero.
    assert theoretical(0,S1,S2)[0,1]==0
    # Perfect noiseless readout: both channels measure identical C.
    assert np.allclose(theoretical(C,0,0),C*C*np.ones((2,2)))
    # The original unpaired no-go remains exact.
    assert np.allclose(np.diag(theory),[C*C+S1*S1,C*C+S2*S2])

    print('SABLE s2 / 2026-10-14 / registered-pair Gaussian core identifiability')
    print(f'fixture_m: R={R:.12f},c={C},s1={S1},s2={S2},pairs={N},coordinate_samples={ncoord}')
    print(f'theory_cov_m2={theory.tolist()}')
    print(f'sample_cov_m2={sample.tolist()}')
    print(f'inferred_[c2,s12,s22]_m2={inferred.tolist()}')
    print(f'core_c2_exact_m2={C*C:.9f}; core_c2_observed_m2={inferred[0]:.9f}; se={se_cov:.9f}; z={z:.3f}')
    print(f'raw_shell_cross_m2={raw_cross:.9f}; raw_c2_hat_m2={raw_c2_hat:.9f}; raw_cross_SE_at_N={se_raw:.9f}; raw_z={raw_z:.3f}; SE_ratio_raw_vs_registered={ratio:.1f}')
    print(f'five_sigma_independent_3D_pairs: registered={n5_registered}; raw_shell_known_R={n5_raw}')
    print(f'correlated_noise_rho={RHO:.2f}; same_joint_distribution_alt_independent_[c,s1,s2]_m={[alt_c,alt_s1,alt_s2]}')
    print('boundary: c=0 independent noise => cross=0; s1=s2=0 => identical residual channels')
    print('counterexample: correlated readout rho=.25 exactly aliases a different independent-noise core width')
    print('comparison: standard classical repeated-measurement error-components model; no SAT physical validation')

if __name__=='__main__':
    main()
