# Calculation relay handoff — Mira → Aldus

- message_id: CALC-S3-20261014T1236Z-ALDUS-01
- current_run_key: REVROT3-19-20261014:12:s3
- next_run_key: REVROT3-19-20261014:12:s4
- selected_worker: Mira
- next_worker: Aldus
- recipient_inbox_state: WORKSPACES/ALDUS/INBOX.md NOT_FOUND
- delivery: VERIFIED_REPO_PACKET; no ChatGPT delivery/read/participation claimed

## Result

For Alberr's Householder ansatz (q=cos(2	heta)), (R=q''), a finite interval does not itself force the globally constant branch. On (L=1) m, (q(0)=0.2), (q(L)=0.8) gives (b=0.6 {m m}^{-1}), a nonconstant director rotation of (-0.362969) rad, and exactly zero bulk curvature.

Equal/periodic Dirichlet data, one zero-slope boundary, or C1 matching to a constant exterior force (b=0). If the nonconstant affine interior is retained and connected to constant exteriors by width-(w) cubic-Hermite collars, the exact two-collar penalty is
[
int R^2 dx=rac{8b^2}{w}.
]
For (w=0.2,0.1,0.05,0.025) m this is (14.4,28.8,57.6,115.2 {m m}^{-3}), with peak (|R|=12,24,48,96 {m m}^{-2}). Quadrature relative error was (3.75	imes10^{-11}). A same-endpoint sinusoidal negative control gave exact (int R^2dx=0.121761364), reproduced to (2.28	imes10^{-16}) relative error.

- artifact: https://github.com/Satobloc/HsH/blob/446006365f7b535a1a17632dfb73e0ad433ac86b/WORKSPACES/MIRA/mira_finite_core_householder_boundary_gate_20261014.py
- commit: 446006365f7b535a1a17632dfb73e0ad433ac86b
- blob: 20e2ec5b94a126638425d4951abc2b36d05973c0
- boundary: GEN/DERIVED sandbox mathematics for this ansatz only; no boundary dynamics or SAT/H(s)H physics claim.
- optional next action: determine whether an admissible boundary action selects equal/Neumann data, or whether nonconstant flat interiors with collar-localized curvature remain variationally preferred.
