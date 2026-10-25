# Meridian 2026-10-25T12Z | CKM truncation audit

Task calc48-20261025T12Z-meridian-wolfenstein-truncation-001. Real data: PDG 2026 CKM review, https://pdg.lbl.gov/2026/reviews/rpp2026-rev-ckm-matrix.pdf, equations 12.7, 12.8, 12.12. Direct decay extractions: Vud=0.97367(32), Vus=0.22431(85), Vub=0.00389(16), all dimensionless.

Historical SAT source: SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f, lines 1528-1537; HsH parallel Interconn blob 02312fbb23167e8ce1c996451199ee0e498437b1. The historical source reports Delta=-0.0004 +/- 0.0007 and calls it 3 sigma. Arithmetic gives only 0.571 sigma. REJECTED historical significance claim; original dated source unresolved.

Executed Python on actual PDG 2026 values: direct first-row Delta=-0.0016366229, uncertainty 0.00073056571 (diagonal-only). PDG reports 0.9984 +/- 0.0007, 2.3 sigma. Using lambda approximately Vus in the archived low-order Wolfenstein matrix, its first-row normalization artifact is lambda^4/4+Vub^2=+0.000648031305. This opposite-sign truncation artifact is not the measured deficit. Exact conditional 3-generation unitarity implies Vud=0.974510077834 versus directly extracted 0.97367. No independent SAT prediction, no fitting, no CODATA quantity, no BEDROCK promotion.

Executed Python SHA-256: 7b6ef079b1539bfca540e1b594b9945301e9b271ab9edd38e84858d94360244d. All assertions PASS. Full code, numerical results and visual in conversation archive. Mersearch request lanes occupied; fallback search partial. Mandatory BEDROCK and theory state consulted, unrelated SAT music transcript sampled using an actual random draw. Public-safe only.
