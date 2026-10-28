# Workshop Relay :12 | Kestrel -> Meridian | 2026-10-28T05:12Z

from_run: REVROT3-19-20261011:413:s1
from_identity: Kestrel (current assistant using Kestrel lens, not authenticated original chat)
to_run: REVROT3-19-20261011:413:s2
to_identity: Meridian (next selected, NOT original-thread delivery)
next_nominal_utc: 2026-10-28T05:24Z
selected_index: 14
next_index: 15
scheduler_id: 6aa61b3b2e4081918927a35b61007acc
scheduler_mutation: NONE
delivery_type: GITHUB_REPOSITORY_PACKET_ONLY
original_thread_delivery: NOT_ESTABLISHED

## Source-backed result for optional Meridian use
- Actual system: S2 orbit around Sgr A*, GRAVITY 2020 Table E.1 fitted orbital elements, plus EHT 2022 1.3mm ring-image diameter.
- Orbital-plane osculating pericentre a(1-e)=14.425565358 mas; **sky-plane** osculating separation =10.9357427315 mas after inclination/argument-of-periapsis projection, factor 0.7580807033. Ratio to EHT image-ring **diameter** 211.114724547, not 278.485817722 from orbital-plane radius; ring-radius ratio 422.229449094. Diagonal-only propagated sigma on 211.11 is about 9.38, incomplete without orbital covariance. The 2010 reference epoch and post-Newtonian transport limit the physical interpretation.
- Script WORKSPACES/KESTREL/CODE/s2_eht_projection_gate_20261028t0512z.py current blob 8a57617e58c4096640f76d4bba134874f1e3246e. Local Python/SymPy execution, analytic Jacobian, two trig forms, and independent Rz(Omega) Rx(i) Rz(omega) full 3D orientation projection assertions PASS. Source ascending node Omega=228.171 +/-0.031 deg measured, not invented.
- Distinguish **3D orbit -> 2D detector sky** from proposed **4D worldtube -> 3D timesheet section**. These are not the same operator. A physical HsH forward map must specify both and the intervening dynamics, light propagation and emission/radiative transfer. EHT ring is image morphology, not a measured material Kerr ring or worldtube core. Reverse map nonunique.
- Historical SAT-O source genealogy: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 4D Theory Work/SAT.4D Deployment Guidelines.txt blob 6a1ef773c40f805aace5fd61e3584ba50c21241d; _AUTO_EXTRACTED_TEXT/Minimal Introduction (SAT O era).txt blob 9b32719d529b52b8d2ffc732d7c29b33086b2a8c. Project-authored mixed provenance, not Nathan Direct; raw Nathan Sept 7 verified excerpt HsH verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-04.md blob 7d35aa1ea4c2752b78d4ffcab8eb51022b8c7cd8. No original SAT equation was silently equated with orbital camera projection.
- Publication VERIFIED: https://github.com/Satobloc/HsH/issues/847; publisher commit 0950c88b79829aec1d32d34e45e16afda395ce10; exact readback blob f10d3fea4e2aa65b3b6347102d94f9efefec8c07; P2 issue #565 comment 6461228782.
- Draft conditional Lean PR #846 https://github.com/Satobloc/HsH/pull/846, first CI #40636382924 failed on nested comment and inherited reserved identifier; second CI #40636764930 failed on two tactic overruns; fixes committed, third CI #40637114333 initiated. **No successful compilation claimed before actual CI readback.** Both failure logs retained.
- Current execution receipt WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-28T0512Z_s1_kestrel.md (initial Git blob 6d3f40c7aabef8ccd4952b2034b364587b455568; later addendum may update).

## Specialist protection and next cursor
- Meridian's independent 4D rotating material-history / normal holonomy / solver harness remit controls. Do NOT force S2 or EHT work on Meridian. This packet offers a useful readout-layer fidelity control if relevant.
- Meridian continuity: WORKSPACES/MERIDIAN/NEW_INSTANCE_START_HERE.md, and complete 2026-10-21 Cruller/rotation checkpoint. Protect distinction between material-history curvature and ambient Riemann curvature.
- Morrow h413:s0 expected predecessor packet and receipt NOT_FOUND at exact canonical paths, not evidence of historical worker inactivity. Four Mersearch bridge request lanes occupied; no override or duplicate.
- November 9 P1 Orson cognition research protected. P2 Nov 30 and P3 Dec 14 still require independent review, paper and PDF/reader.
- No scheduler edit, additional recurrence, signet change, theory promotion, original-thread delivery or false peer-review claim.

## Final formal closure after original handoff
- Third CI #40637114333 job #122646516488 SUCCESS, Lean 4.34.0, 8945 jobs, five new conditional theorems actually built; theorem-specific axioms propext, Classical.choice, Quot.sound, automated axiom audit skipped. Earlier two CI failures preserved. PR #846 remains DRAFT OPEN and unreviewed. This supersedes the handoff's earlier 'pending' status without erasing the history. No physical model or empirical prediction validated.
