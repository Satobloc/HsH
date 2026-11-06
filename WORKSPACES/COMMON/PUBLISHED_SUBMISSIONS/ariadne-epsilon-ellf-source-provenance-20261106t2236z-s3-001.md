# Epsilon and coil-scale provenance: numeric parameter admissibility

**Date:** 2026-11-06  
**Run key:** `REVROT3-19-20261011:646:s3`  
**Status:** source-provenance addendum to the existing worldtube-to-observable gate. This is not a new physical prediction, calculation, fit, P2 selection, or theory promotion.

This addendum extends the already published [worldtube-to-observable gate, issue #1409](https://github.com/Satobloc/HsH/issues/1409). It adds no new feature-status axis. It separates a qualitative source commitment to finite-core thickness from admissibility of a particular numerical thickness parameter.

## 1. What the current source actually supports

### BEDROCK authority

Current `BEDROCK.md` records Nathan Direct entry `ND-2026-10-18-07`: intrinsic filament thickness was operative in the earlier finite-core construction, and the historical `ell_f` scale near 0.7937 fm is associated with the first-order helical coil rather than intrinsic filament thickness. The same entry says no numerical model scale has been experimentally established.

Current BEDROCK blob: `527924246cc25caf7fac02dce4b20f024013cd19`.

The underlying October 18 raw conversation and message UUID were not recovered in this pass. Preserve the BEDROCK authority classification, but keep its message-level source locator open. Do not pretend the curated BEDROCK entry is itself the raw conversation.

### Direct October 9 source

Raw conversation: **Meridian Free Build**  
Conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`  
Raw export blob: `7af1561b321f4d9364da5eb111df689efc652827`  
Repository path: `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`.

The following are raw user-role messages:

- `28b2378a-846d-4c3f-a242-91f9007ce261`, 2026-10-09 07:39:31.044Z: the approximately 0.7 fm reference is not filament thickness. It is associated with the presumed first-order coil scale. The same message asks for a separate symbol for the worldtube axis-to-circumference dimension.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09 07:40:38.859Z: near-duplicate clarification. Count it as the same source witness, not independent corroboration.
- `44e9df22-a6ac-49ca-92ac-c74c8f137310`, 2026-10-09 01:32:23.763Z: says flexibility, tension, coil formation conditions, and coil dimensions should be derived from known physical systems and measured kinematics, naming the He-3 holotype and precision momentum data under known force as candidate routes. It supplies no measured filament thickness or stiffness value.

The direct 0.7 fm passage uses both coil-diameter and radius wording. The convention remains unresolved. Do not apply a factor-of-two correction or silently rename the quantity.

## 2. The historical numeric artifact is not a measurement

Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`  
File: `Base units .txt`  
Blob: `6b0a0f6a45008e69262e702e6f3a5ba1e3921518`  
First extant GitHub commit: `ac3486cde3e694cfa26cebf5cb308996d0fe4b0a`, 2026-06-10 10:11:32Z.

The short table labels:

- Filament Thickness (`epsilon`): approximately `2 x 10^-21 m`.
- Order-1 Coil Radius (`ell_f`): approximately `0.7937 fm`.

The upload commit is cryptographically verified under the Satobloc account. That authenticates the account's upload, not the derivation, measurement provenance, uncertainty, or raw conversation origin of the values. The file has no internal date, source equation, measurement record, uncertainty, covariance, calibration, or instrument provenance. This is a signed account-attributed historical artifact, not a raw user-role message or an independently measured value.

A related assistant-voiced narrative is preserved as `Dim.txt` and `2026/SAT THEORY — Dimensoins.txt`. Both have the same blob `8f019606e52cbc8e45bd7638395f994777a3a446`. The earliest extant copy is the June 1, 2026 commit `dd4719b9c6ab59322c8d2351483feffb08810686`; the root duplicate was added June 10. These uploads are also signed under the Satobloc account, but the text is not a raw role-authenticated conversation. It proposes a derivation from a lattice scale and curvature cap, supplies no source-located equation for those premises, and gives both `2 x 10^-21 m` and an alternative `sqrt(2) x 10^-21 m` estimate. The original derivation and role ancestry remain unrecovered. Do not treat this narrative as an independently verified derivation or silently promote its calculations.

The current `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md` blob `0d5961bb2df7c3226c3b7a0285011cbd597baa09` appropriately leaves epsilon historical/unresolved and ell_f historical with semantic genealogy unresolved.

## 3. Typed scale and parameter gate

| Quantity | Supported status | Prediction admissibility |
|---|---|---|
| Intrinsic filament/core thickness | Qualitative finite-core concept is recorded in BEDROCK as Nathan Direct. The historical numeric candidate `2 x 10^-21 m` is in a signed account-attributed archive upload. | **Not admissible as a fixed or fitted numerical H(s)H parameter yet.** Raw October 18 locator, derivation, uncertainty, and map to the current support remain missing. |
| First-order coil scale `ell_f` | Historical candidate near 0.7937 fm; October 9 direct source distinguishes it from filament thickness. Radius/diameter convention remains ambiguous. | Must not substitute for core thickness. Not an independently measured electron radius or a factor-of-two-resolved diameter. |
| Worldtube axis-to-circumference dimension | October 9 direct source asks for a separate symbol; no canonical symbol or value is selected. | Undefined until the object and its map are specified. |
| Instrument/resolver width | Measurement-operator property, separate from the physical core. | Must enter calibration and uncertainty accounting; it is not a worldtube parameter. |

The qualitative finite-core commitment does not force the historical numerical epsilon value. A finite support, its cross-section, and its scale law are distinct claims. The coil scale, worldtube axis-to-circumference dimension, core thickness, and instrument resolution cannot be substituted for one another.

The existing issue #1409 remains correct that beta_2 alone supplies no unique signature for core thickness, coil scale, or contact surface. This addendum tightens the source and parameter status of the thickness row.

## 4. Conditional acceptance rule for a numerical core thickness

A numerical epsilon may enter a prediction only after all of the following are supplied:

1. The raw direct source or original equation defining epsilon and its object type.
2. A source-grounded map from that object to the finite-core support and then to the measured observable.
3. Units, value provenance, uncertainty/covariance, and the relevant calibration record.
4. A declared parameter role: fixed by source, shared calibration parameter, derived quantity, or fitted parameter. These roles must not be interchangeable.
5. Calibration and holdout assignments frozen before scoring. The holdout cannot be used to tune epsilon.
6. A standard comparator with matched measurement operator and nuisance-parameter freedom.

Until then use the status:

`HISTORICAL_CANDIDATE / NOT_ADMISSIBLE_AS_NUMERIC_PREDICTION_PARAMETER`.

A free epsilon fit would add hidden flexibility, not establish a prediction.

A particular normal-bundle frame, cross-sectional profile, twist connection, contact-surface topology, boundary law, per-rotation creation mechanism, and map to electromagnetic or plasma variables remain optional until source-defined and independently tested.

## 5. Formal and empirical status

- No new Lean theorem was written or run. This addendum asserts no new mathematical theorem. A proof identifying epsilon with a physical support or observable would assume the very map that remains undefined. Existing conditional projection/fiber and carrier/slice formalizations are not evidence for that physical map.
- No physical calculation, numerical refit, CODATA comparison, dataset selection, holdout score, or new H(s)H prediction was performed.
- No P2 gate advanced. No BEDROCK promotion.
- No SAT-O or Blockwave equation was altered or corrected.

## 6. Next source cursor

Recover the raw October 18 conversation and message UUID underlying `ND-2026-10-18-07`. Then recover the original epsilon equation or derivation, if one exists. If no such source exists, keep the numerical epsilon candidate historical and inadmissible as a prediction parameter. Separately recover the direct convention for the `ell_f` radius/diameter wording. Do not infer either from the assistant-voiced `Dim.txt` narrative.

**Epistemic classification:** source-provenance correction and parameter-admissibility rule. Not an empirical result, physical derivation, or theory promotion.
