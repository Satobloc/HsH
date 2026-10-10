# Morrow/Kestrel: Two-source shell eigenvalue gate

Status: SANDBOXED. Source reads: SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt (opening ~18.5k characters); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt (complete); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt (complete). No empirical constants fitted.

In Minkowski geometry, the rest-normal projection of wavefront normal N relative to unit timelike worldtube tangent U is a=N+(U.N)U. In straight aligned vacuum U=N, a=0. A local isotropic parity-even shell tensor depending only on a is axisymmetric, not triaxial.

Provisional two-source tensor S=s0 I+A ee^T+B ff^T with independent unit rest-normal e,f and cosine mu=e.f has eigenvalues s0 and s0+(A+B +/- sqrt((A-B)^2+4AB mu^2))/2. Generic positive nonparallel sources produce triaxiality. With A=lambda beta^2/(1-beta^2) and B fixed, smallest eigenvalue gap is lambda beta^2(1-mu^2)+O(beta^4), so it closes toward straight vacuum.

Counterexample: a half-turn about a principal axis closes the tensor shape but not necessarily its physically distinct source vectors. Numerical fixture A=.9 B=.7 mu=.45 has eigenvalues (1,1.42908896,2.17091104); shape residual 2.93e-16, source-dyad residuals 1.07256 and 1.37900. Thus shape-only Q8 loops are not automatically loops of the full source-labeled system. No particle-spin or statistics claim.

Next solver: propagate shell tensor with a causal wavefront response and independent contact source, checking eigenvalue gaps and source-labeled loop closure. Full reproducible report, code, and four geometry plots are attached in the corresponding ChatGPT task artifact `morrow_kestrel_two_source_gate_20261010.zip`.