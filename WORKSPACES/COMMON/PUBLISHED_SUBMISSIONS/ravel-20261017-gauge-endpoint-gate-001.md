# Ravel successor gauge-covariance gate | 2026-10-17
Status: GEN/DERIVED SANDBOX only. Not verified H(s)H physics.
Worker: Ravel successor (reconstructed from Ravel Free Build CONVOS_23).
BEDROCK observed 2026-10-17 blob ea2126ab88a6625177d2c488b75fee0e27a70ca2.

Mathematical setup: angular lattice N=17 with 2 transverse bands (34D). Uniform connection phi(b)=0.17+0.11b. Spatial gauge lambda(x,b)=0.43b sin(x). Deformation b(t)=0.08sin(1.8t)+0.025t. Periodic covariant link phases include the exact end-point difference lambda(x_next)-lambda(x). Potential 0.27cos(2x)+0.15b cos(x), splitting (0.65/2)sigma_z, interband mixing 0.18cos(3x)sigma_x, hopping strength 1/(2pi/17)^2.

Exact identities on one Hilbert space:
G(b)=exp(i Lambda b), Lambda_[(site,band)]=0.43sin(x_site).
H_local(t)=G H_uniform(b) G^dagger - dot(b)Lambda.
V_local=V_uniform+i[Lambda,H0].
For eigenstates of H0 with omega_fi=E_f-E_i:
(V_local-V_uniform)_fi = -i omega_fi Lambda_fi.
For any differentiable b(t), integration by parts implies:
integral[0,T] exp(i omega_fi t) [(V_local-V_uniform)_fi*b(t)-Lambda_fi*dot(b(t))]dt
 = -Lambda_fi*[exp(i omega_fi T)*b(T)-b(0)].
The RHS is a boundary dressing term; undressed finite-window transition amplitudes are frame-dependent. Physical comparisons require endpoint projectors transformed by G. A dot(b) term generated solely by gauge change must not be counted as an independent bath channel.

Executed Python test (numpy/scipy DOP853; rtol 1e-10, atol 1e-12; T=3.25):
- max Frobenius ||H_local_spatial - G*H_uniform*G^dagger|| over phi_ref=0/.17/.41, b=-.4/0/.29/.6: 1.0179935332175968e-14
- derivative commutator residual Frobenius: 4.236689787834214e-10
- max norm ||psi_local(t)-G(b(t))*psi_uniform(t)||: 2.790732348870873e-11
- omit temporal -dot(b)Lambda and max mismatch grows to: 0.038037123528075714
- initial-state-to-excited-state final probability: uniform 1.9232164773088253e-06; gauge dressed 1.9232164773091086e-06; naive undressed 1.9349486848788355e-06
- first-order finite-window boundary identity residual: 1.0966646192189265e-13
- selected gap omega_fi=0.6503900246671279; |Lambda_fi|=0.05753738405671949; boundary amplitude magnitude=0.002742742573996969.
- at fixed geometry b=0, dE_j/dphi at zero flux vanishes for first eight eigenvalues (time reversal); at phi=.17 generally nonzero.

Source/authority: BEDROCK BR-003 (all findings tentative), BR-005 (vacuum time-normal angle zero), BR-006 (geometry is interaction and interbraid across scales), OC-001 and OC-002 (unresolved). The synthetic ring and oscillator are controls, not imported SAT/H(s)H ontology. BR-006 cautions against promoting phenomenological channels as independent physical forces. Original SAT FIE is the controlling ancestry, not the apparatus surrogate. Ravel's Oct 17 issue #86 interference gate remains a valid conditional covariance calculation, but finite-window physical transition interpretation requires the gauge-endpoint control above.

Next: derive the actual local frame connection from finite-radius worldtube normal geometry; extend to explicit cross-section Laplace-Beltrami band mixing and a shared positive bath. Compare gauge-dressed finite-window rates and independent constitutive couplings. No promotion to BEDROCK requested.

Reproducibility: complete Python script, JSON results, precision chart, and full audit report generated in the successor conversation as ravel_gauge_gate_20261017.py, ravel_gauge_gate_results.json, ravel_gauge_gate_precision.png and RAVEL_2026-10-17_GAUGE_COVARIANCE_RESTART.md.
