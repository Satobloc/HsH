# Addendum: measured nylon kernmantle rope response under repeated impact

**2026-11-02 | Public experimental comparator | Addendum to WWRD rope-mechanics record**

## Scope

This note adds one open-access experimental dataset to the existing WWRD rope-mechanics record (HsH issue #1096). It does not replace that record and does not assert a physical equivalence between a climbing rope and an H(s)H worldtube.

The added study is Hu et al. (2023), “Impact behavior of nylon kernmantle ropes for high-altitude fall protection,” *Journal of Engineered Fibers and Fabrics* 18, first published 16 April 2023, DOI **10.1177/15589250231167401**. The article is CC BY 4.0.

## Identifiable physical system

The tested rope was manufactured by Qingdao Huakai Marine Technology Ltd. The paper reports:

- 10.3 mm nominal diameter and 68.6 g/m linear density.
- A core made from 12 parallel three-strand twisted ropes: six S-twisted and six Z-twisted.
- A nylon sheath braided from 48 strands in a 1:1 pattern.
- Reported minimum breaking load: 30.2 kN; figure-eight-knot strength: 17.8 kN.

This is a real finite-core, core/sheath construction with helical internal strands. It is not identified as a Petzl product.

## Measurement protocol and instrumentation

The authors used a custom continuous-drop rig, not a UIAA 101 standard fall test. The stated setup used a 1000 N drop load released from 5.2 m, fall coefficient 1, and 2 m natural elongation at the rope ends. The rope was repeatedly dropped at intervals under five minutes until failure.

The reported instrumentation included a laser displacement sensor with 1 ms response time and 0.1 mm accuracy, and a 0–50 kN force transducer with 0.1 N stated accuracy. The paper does not provide a replicate count, error bars, confidence intervals, or a complete uncertainty budget. Instrument specifications therefore must not be mistaken for total experimental uncertainty.

## Observed response

The authors distinguish multiple impacts within one drop from successive drop events.

Within a single drop, the rope exhibits several force peaks. Reported values include:

| Within-drop impact | Peak force | Response duration |
|---|---:|---:|
| First | 10,877.76 N | 0.31 s |
| Third | 3,034.8 N | 0.41 s |
| Fourth | 1,842.95 N | 0.43 s |

The paper reports that successive within-drop peaks generally fall by approximately 40–50%.

Across separate drop events, the reported first-impact peak force rises as the rope is repeatedly conditioned, then shows a decline at the seventh drop before fracture. These are different time scales and should not be collapsed into one monotonic damping law.

## Source and model limitations

The measured force/displacement response is the empirical result. The paper's single-degree-of-freedom damped-oscillator description is a phenomenological model, not a derivation from the rope's internal braid or core/sheath geometry.

The modulus discussion is internally inconsistent: different sections give different first-rebound values and disagree about whether modulus rises or falls across successive drop events. Those modulus statements should not be used as a calibrated monotonic constitutive law without reconciliation. The article also does not report sample replication or statistical uncertainty.

## Relevance to WWRD

This study supplies a concrete physical comparator for finite-core structure, helical internal strands, impact response, and history-dependent conditioning/damage. It does **not** measure controlled torsion, contact pressure, a 90-degree kink, or a traveling helical excitation. It therefore constrains possible rope mechanics without validating the WWRD geometric heuristic as a physical equivalence.

A useful distinction for future modeling is between (1) rapid energy dissipation across successive impacts within one drop and (2) slower structural conditioning and damage across repeated drop events. This is a measured-system observation, not an H(s)H prediction.

## Reference

Hu, Z., He, G., Zhang, X., Huang, T., Li, H., Zhang, Y., Xie, D., Song, X., Ning, X., & Ning, F. (2023). “Impact behavior of nylon kernmantle ropes for high-altitude fall protection.” *Journal of Engineered Fibers and Fabrics*, 18. DOI: 10.1177/15589250231167401. Full text: https://journals.sagepub.com/doi/pdf/10.1177/15589250231167401

Related HsH record: issue #1096, “WWRD rope contact-wave, torsion and climbing-rope constraints (corrected digest).”