# Tern Rook :00 | Real muonic-hydrogen line and archival SAT proton radius
2026-10-25 16Z | SANDBOX | CONDITIONAL_CODATA_COMPARED | HSH_UNRESOLVED

REAL EXPERIMENT: Pohl et al., Nature 466, 213-216 (2010), DOI 10.1038/nature09250. Measured muonic-hydrogen 2S(F=1)-2P(F=2) transition E_obs=206.2949 +/-0.0032 meV. Published 2010 theory E(r)=209.9779(49)-5.2262*r^2+0.0347*r^3 meV, with r in fm. The cubic term is a model-dependent third-Zemach approximation; the 2010 equation is not a claim of latest precision QED.

CODATA 2022: a0=5.29177210544(82)e-11 m, mp/me=1836.152673426(32), proton RMS charge radius=0.84075(64) fm. Standard Planck units from CODATA 2022 G and exact SI h,c. Observed E/E_P=1.6897089686463470e-29.

HISTORICAL ORIGINAL: HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/SAT UNODROP.txt, blob 53437e7d734b8e77894a7465a8cd37cc8ac8462a, Test 17 lines 1097-1155. Original equation a0/r_p=(mp/me)*2/B^2; B_stable=0.24177. Undated assistant-generated assessment, not authenticated Nathan derivation; measured mp/me is an input, not an independent SAT prediction.
RELATED ARCHIVE: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 135-160: B_raw=3/(4*pi); mu=3/(2*B^5)*(1+0.000082). Literal arithmetic gives mu=1934.50526593222, NOT archived 1836.152673. Inverse bridge required for CODATA at B_raw is -0.0507633810651 (opposite sign, much larger); not applied. At B_stable the unbridged mu=1815.84680658617, requiring +0.011182588072. No unique physical repair established.

EXECUTED Python Decimal numerical spectroscopy using published 2010 theory:
- Stable B + measured mu: r=0.842300713671 fm; E=206.290801599721 meV; residual -0.004098400279 meV; nominal residual/combined u=-0.7003.
- Raw B + measured mu: r=0.821268430833 fm; E=206.472144424560; residual +0.177244424560; ratio +30.2860.
- Stable B + archived mass law: r=0.851719815584 fm; E=206.208115022369; residual -0.086784977631; ratio -14.8291.
- Raw B + archived mass law: r=0.779578068522 fm; E=206.818159188992; residual +0.523259188992; ratio +89.4101.
- Raw B + archived mass law plus archived bridge: r=0.779514148362 fm; E=206.818675974985; residual +0.523775974985; ratio +89.4984.
Combined u=sqrt(0.0032^2+0.0049^2)=0.005852349955 meV, excluding model and B uncertainties. These ratios are NOT calibrated model significances. The 2010 extracted radius 0.84184 fm returns E=206.294822635250 meV, a roundoff-level control, not an independent prediction.

TESTS: Planck/SI energy and radius roundtrip PASS; dimension/sign checks PASS; analytic dE/dB=-60.83021478463 meV and independent centered numerical derivative agree to relative 9.80e-15; no arbitrary physical inputs, no tuning. Full executed script SHA256 2d4654a63479a8f622fa73b60c4c6aaf6776d5c55dccda0e27bc66cfb95f93bb, output SHA256 749788400f32b1a46dbf7bed5b0b5ff65d1a9920bde1054780c3742aa901948a. Complete code and stdout retained inline in Nathan's conversation.

READING ROUND: BEDROCK.md 563 lines blob 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY.md 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Genuine Python secrets.randbelow(3) selected index 0, SAT_THEORY_ARCHIVE_2023-25/BLACK HOLES AND BIG BANGS.txt, 87 lines / 19518 chars, blob 708c70ee1a721e81f0b9e0586e5617422407fa06, read in full including unrelated subjects. Mersearch instructions read; four request lanes occupied; NO new Mersearch run. Public-safe sources only.

GATE: archived algebra valid conditionally, archived mass bridge arithmetic FAIL, independent zero-input radius NOT ESTABLISHED, finite-core radius to RMS charge radius map NOT DERIVED, HSH cross-sector candidate NOT ADMITTED, BEDROCK unchanged. Next: derive the proton electric form factor or bound-state finite-size shift from operative finite-core geometry, and propagate the same B choice into mass ratio.
