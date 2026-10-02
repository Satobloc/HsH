# Ravel Sandbox: Blind Complex-Pole Memory Sweep
Date: 2026-10-02
Status: speculative sandbox, not canonical.

Question: Can a causal one-relaxation-time medium make the raw radius exponent look one dimension lower, and can causal inversion recover the injected exponent?

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H MANIFOLDS.txt, requested lines 900-1250 and substantially read. Retained only medium/coarse-graining response motifs. Historical constants, lattice attenuation, particle assignments, and fitted mechanisms excluded.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/physandboxtubes.txt, full file. It contains standard hydrostatic/manometer material and no H(s)H memory law, so it functions only as a readout/medium negative control.

Construction:
Gamma(t) = Theta(t) A(a)/tau exp(-t/tau).
Gamma(z) = A(a)/(1-i z tau).
Complex poles solve D(z)=omega_c(a)^2-z^2-i z A(a)/(1-i z tau)=0.
Synthetic fixture: omega_c=a^-1, tau=1, A=1e-5 a^q, a from 0.1 to 10.
Injected cases q=2 and q=3.

At each pole, Sigma_obs=z^2-omega_c^2. A memory-blind analysis uses abs(Sigma_obs). Causal inversion reconstructs
A_rec = abs[Sigma_obs (1-i z tau)/(-i z)].

Results:
q=2: recovered q=1.9999999996, maximum relative reconstruction error 2.24e-7. Raw local slope drifts 1.9898 to 1.0121.
q=3: recovered q=2.9999999771, maximum relative reconstruction error 1.81e-6. Raw local slope drifts 2.9899 to 2.0397.

Conclusion:
The raw complex-pole correction loses almost one apparent power of radius across the memory crossover, while causal inversion restores the injected exponent. A true q=3 carrier can therefore masquerade approximately as raw q=2 if medium memory is ignored.

Failure:
Reject the one-pole model if one tau cannot jointly account for reactive shift and damping, causal inversion fails to stabilize the recovered exponent, or pole tracking changes physical branches.

No external physical prediction is earned.

Next dependency:
Infer tau rather than supplying it. Test whether q, tau, and A0 are simultaneously identifiable from complex-pole data alone.
