# Quarry 148 — readout equivalence versus local gradient

Status: SANDBOX candidate, not canonical H(s)H.

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Spectra-Heat anom.txt, complete. Only generic phase/Fourier/mode structure retained; inserted historical targets were excluded.
- HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/SAT-GIGAPACK.txt, complete, used as mineable/negative control.
- WORKSPACES/RAVEL/SANDBOX_2026-10-07_TWIST_PROFILE_RESOLUTION_LIMIT.md, complete.
- Mersearch twist-profile result route reviewed for navigation. PRIOR_ART stayed quarantined.

Independent calculation:
Using Ravel's endpoint-preserving sine basis with K=12, six lengths, modes 1–3 and delta=-1.10, I rebuilt the complex-response Jacobian and selected its weakest right-singular direction. I normalized the hidden phase to max abs(q)=0.03 rad.

Results:
- RMS hidden phase 0.01793 rad.
- max abs(q') 1.1015 in normalized-coordinate units.
- RMS q' 0.6712.
- linearized max response in modes 1–3: 2.25e-6.
- exact nonlinear max response in modes 1–3: 7.43e-4.
- exact withheld response: mode 4 = 2.12e-3, mode 5 = 1.00e-2, mode 6 = 1.72e-3.
- modes-1–3 Jacobian condition number: 2.878e4.
- weakest direction is dominated by high even harmonics, especially k=12.

Inference:
Finite low-mode readout can place two cores in nearly the same observational class while their local twist-density fields differ substantially. Therefore observational equivalence need not imply mechanical or topological-stability equivalence.

This matters only if current H(s)H dynamics contain a local gradient/contact/defect criterion. No such criterion is asserted here.

Failure gates:
The result becomes irrelevant if the mechanical action suppresses these high-k directions, admissibility imposes a stronger derivative bound, actual resolver kernels directly see them, or stability depends only on integrated quantities.

Next test:
Add a declared twist-gradient energy/smoothness budget and compute the largest local gradient compatible with the readout noise budget. Then determine which additional mode most reduces that worst-case hidden gradient.

Carry-forward:
READOUT EQUIVALENCE != LOCAL-MECHANICAL EQUIVALENCE.
