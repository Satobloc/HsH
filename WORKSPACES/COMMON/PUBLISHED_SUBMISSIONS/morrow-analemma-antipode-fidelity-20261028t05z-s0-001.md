# Morrow :00 | 2026-10-28 05Z | Analemma antipode source-fidelity gate

STATUS: SOURCE-FIDELITY / CONDITIONAL LEAN DRAFT / NO PHYSICAL VALIDATION.
Run REVROT3-19-20261011:413:s0; Morrow index 13 -> Kestrel index 14. Current assistant, not authenticated historical Morrow. Scheduler unchanged.

## Primary and current sources
- Nathan-attributed original SAT archive `_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`, blob `a788b5cc415f90de2d0382d3596ef07d68604687`, pp. 26-27: historical GrAnn self-intersection at i_r, distinct self-tangent at the antipodal point t_ipode. Original raw message roles not recovered.
- HsH `PUBLIC_SITE/instruments/whirligig/ANALEMMA_CORRECTION_2026-10-21.md`, blob `ac8b47e753911b3ed11df6d37a0d62a1cbec414e`: reports Nathan's name correction from Great Annulum to Analemma. The specific 1:2 harmonic is explicitly a candidate, not a unique historical reconstruction. Exact user-role correction message not yet authenticated.
- Actual browser `PUBLIC_SITE/instruments/whirligig/index.html`, blob `c6c2edb52b09c94e9bfacf13458381c8fb423cf3`: `analemma(t,a) = unit([-1,a*sin(t),a*(sin(2*t)+.27*sin(t))])`.

## New conditional geometric incompatibility
Every point of the current material curve has strictly negative x-coordinate. Therefore no pair of its points can be antipodes, and a common rigid SO(3) rotation cannot change that fact. Its self-crossing at (-1,0,0) has antipode (1,0,0), absent from the track. Hence this implemented candidate cannot meet the historical antipodal self-tangency condition **if that condition remains in force**. Whether the October 21 correction withdrew the historical condition is OPEN. This is a representation/source-fidelity gap, not an experimental failure.

Historical R,Q -> anchors i_r,i_q -> GrAnn crossing plus antipodal self-tangency -> W_obble/W_iggle/V -> torus intersection -> Curvy_Lisa -> claimed QwrtR.
Current G_A -> inner-wall SO(3) rolling -> locked elbow -> first-forward torus intersection -> Curvy Lisa.
An explicit constraint-preserving map between these constructions has not been supplied. QwrtR remains untyped as a derivative. Aster's prior intersection-versus-addition finding is not claimed anew.

## Proof and limits
Draft PR #844: https://github.com/Satobloc/HsH/pull/844 . Three conditional Mathlib statements cover positive denominator, negative normalized x and no-antipodal-pair. CI run #40636155033 initially failed on TLS download before Lean compilation; a failed-job rerun was requested. Do not claim Lean acceptance until new logs are checked. No invented physical inputs, CODATA scoring, independent physics measurement, BEDROCK promotion or completed manuscript.

## Next source cursor
Recover the October 21 raw user-role correction and original March Donut role-tagged messages. Determine if antipodal self-tangency was explicitly superseded; otherwise require a different material curve or a rigorously defined geometry-preserving map. P1 Nov 9, P2 Nov 30, P3 Dec 14 gates remain separate. Repository handoff only, no authenticated cross-thread delivery.
