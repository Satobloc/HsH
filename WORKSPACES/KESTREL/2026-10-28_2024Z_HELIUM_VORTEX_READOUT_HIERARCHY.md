# Kestrel :24 | Helium vortex readout hierarchy | 2026-10-28T20:24Z

Status: REAL EXPERIMENTAL SYSTEM / EXECUTED NUMERICAL REPLAY / CONDITIONAL LEAN SUBMITTED / NO H(s)H PHYSICAL PREDICTION. This is current-assistant source-grounded Kestrel-role work, NOT the historical ChatGPT Kestrel instance.

## Real measured system
Tang et al., Nature Communications 14:2941 (2023), DOI 10.1038/s41467-023-38787-w; open full text https://pmc.ncbi.nlm.nih.gov/articles/PMC10205744/. He-II at 1.65 K, 1 mK bath-temperature control, 200 Hz optical images in a 0.8 mm laser sheet. A bare vortex core is approximately 1 Angstrom by model, **not directly imaged**. D2 tracer mean radius 1.1 micrometres inferred from settling speed. Nine-particle ellipse-fit ring radius reported from 312 to 150 micrometres; two-particle image half-separation 140.6 micrometres and S2W model-fitted initial radius 140.8 micrometres. Uncertainty bars in the article reflect particle-position/ellipse-fit SD; per-number covariance unavailable here.

## Actually executed
Python Decimal + independent Fraction arithmetic 9/9 consistency checks PASS, script SHA256 1ffe42801e7347f0e99fa408409cb146345a19e74ee69c255049a0adaa56bbf8. Nominal tracer/core scale 11000, nine-ring/tracer 283.636, nine-ring endpoint shrinkage 51.923%, two-fitted-ring/tracer 128 (cross-event), two fitted-versus-projected difference 0.2 micrometres (0.1420% of fit), laser-sheet/nine-ring-diameter 1.28205, camera period 5 ms. Rounded numbers, model core and fit are not precise independent measurements; no invented uncertainties.

Tang et al. estimate tracer Stokes drag 10-18% and gravity 4-4.7% of mutual friction in nine-particle event, versus 4.8-10% and 0.8-0.83% for two particles. These are model force estimates. Their constrained two-particle data favor S2W over 2W, not H(s)H. Paper prints D2 solid density as 202.8 g/cm^3; possible unit error requires original ref 35 check and was not used here.

## Three distinct forward maps
(1) Physical bare vortex plus responsive two-fluid dynamics; (2) deuterium loading changes dynamical response; (3) optical projection produces tracked particle coordinates and ellipse fits. The reverse from image to bare core is underdetermined without calibrated additional constraints. This is the crucial Kestrel whole-picture observation: do not draw the observed dots and call them the underlying tube. Nor can a rope heuristic replace two-fluid physics.

H(s)H would need an explicit typed worldtube -> medium -> detector map, a calibrated physical law, and a genuinely independent holdout observable with units and uncertainty. Existing Kestrel conditional readout-composition proof supports only the mathematical implication of assumed noninjectivity.

## Lean and existing tooling
Reused draft PR #846, branch research/kestrel-s2-eht-skyprojection-20261028t0512z, new head e62d8bbe31c90975edd04bb0a04d1a8100cb07e6. Two interconnected Lean 4/Mathlib modules KestrelHeliumScaleGate and KestrelHeliumReadoutGate, root-imported; 7 conditional theorem targets. CI #40764043283 pending/in progress at initial check, not a compiled success. No local Lean installation. Existing Mersearch/Math Hopper/Whirligig reviewed; no new tool or archive search job.

## Control and reading
BEDROCK 4cabda482c48c217614b868a2138409275df9bf7 (full file fetched, controlling opening inspected), Steering b9b8de55f8d5add7c42cf80be7c34677ee36305e, Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding, V3 rotation, Kestrel historical role and Morrow 20:12Z incoming handoff read. Mersearch three-root scan not run; no Nathan-authored SAT-O equation attributed to this comparator. Original Kestrel chat not authenticated; no cross-thread delivery.

Unrelated source: original SAT archive SAT Mark V/TheTANGLE.txt blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 556-620 actually read, cursor 621. FIE reviewed in team Oct27, <14 days.

P1 Nov9 Orson cognition, P2 Nov30 real geometry, P3 Dec14 full theory remain separate gates. No manuscript, PDF/reader, independent hostile review, BEDROCK promotion or task mutation claimed. Public-safe publisher issue #939, submission_id kestrel-helium-vortex-readout-20261028t2024z-s2-001, SHA256 2d9a944874767c91759f846855a19e7b14eb23e9faecccbca8f6d738393c0da9, pending committed readback at initial check. No duplicate issue.
