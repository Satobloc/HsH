# Kestrel connection search: curve current to worldsheet current

**Status:** Kestrel-style cross-boundary synthesis with source-role audit and conditional Lean mathematics. Not an empirical result, historical-authorship transfer, physical equivalence, or BEDROCK promotion.

## Why this turn exists

Nathan's direct methodological correction was: if a connection is missing, look for it. The incoming Morrow handoff expressly allowed Kestrel to choose a higher-value broad synthesis instead of repeating the neutron audit. This turn therefore searched for the mathematical bridge previously left open between the SAT-O curve and the Blockwave worldsheet current.

## Recovered historical construction

The connection is partly present in the old archive. `EARLY LOGGED/Module_O8_Audit_Combined.txt`, Git blob `02f61b23af689edf33a989dac57f3b69dac621e9`, contains:

```text
J_μ(x) = ∑_γ ∫ dλ v_μ(λ) δ^(4)(x − γ(λ))
τ_μ(x) ∝ J_μ(x)
```

This pushes oriented curve tangents into a spacetime vector current. The file's author field is a placeholder, so personal authorship remains unresolved.

The later Blockwave conversation uses an antisymmetric conserved two-form/worldsheet current `J^{μν}`. Raw source: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19•25.10.19•Full action definitions — raw.json`, Git blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. Exact role chronology:

- Nathan user message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`: “Can you give me the full action and definitions”.
- Nathan user message `cccb60c8-0c38-4274-9906-540e4fc106dd`: asks for plain text.
- Assistant message `3039b226-02d4-41a3-a2d3-c338e25204a9` supplies the displayed action and defines `J^{μν}` as the conserved two-form/worldsheet current.

Thus the displayed Blockwave formula is an assistant reconstruction in response to Nathan, not a verbatim Nathan-authored equation.

## The mathematical bridge found

A curve has one tangent and produces a degree-one current. A one-parameter family of curves sweeps an oriented surface `X(s,t)` with two tangents. Standard string geometry uses:

```text
Sigma^{mu nu}
  = (partial_s X^mu)(partial_t X^nu)
  - (partial_t X^mu)(partial_s X^nu)

J^{mu nu}(x)
  = q integral Sigma^{mu nu}(s,t)
      delta^(4)(x - X(s,t)) ds dt
```

This is the degree-raised analogue of Module O8. It is a real connection, not yet an equivalence. It requires a sweep/evolution direction, orientation, regularity, boundary conditions, normalization, finite-core regularization, and a conservation argument. A single tangent duplicated in an alternating product gives zero and cannot produce a nonzero bivector current.

Standard-reference corroboration: T. Yoneya, “Travels with Nambu,” PTEP 2016, 07B105, gives the same worldsheet surface-current construction (in six target dimensions in that example): https://academic.oup.com/ptep/article/2016/7/07B105/2330182 . This supports the standard geometry, not its SAT/H(s)H interpretation.

## Formal proposition and retained failure

`FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0053.lean` encodes an abstract alternating bilinear surface density. It proves the conditional implications that duplicate/collinear tangent data give zero, a nonzero density needs a second non-collinear direction, tangent swaps reverse orientation, one tangent reversal changes sign, and two reversals preserve sign.

The first CI run is deliberately retained: run #40836988576 failed at the swap theorem because an unnecessary negation-equivalence lemma was applied in the wrong direction; Lean marked that theorem with `sorryAx`. The repair uses the antisymmetry hypothesis directly at swapped arguments: `hAnti w v`. Replacement exact-head run #40867608049, job #123426229890, completed **SUCCESS** at proof commit `ea9f93f9da81585d6542141f7688ad2033527f76`: `Built HsHVerification.ArchiveEQ0053`; `Build completed successfully (8973 jobs)`. Lean 4.34.0 and Lake 5.0.0. All six theorem-specific prints depend only on Mathlib's standard `propext` and `Quot.sound`; no `sorryAx` remains.

Lean checks only the encoded algebra. It does not formalize distributions, prove `partial_mu J^{mu nu}=0`, establish source fidelity, or validate physical premises.

## Architecture and falsification matrix

| Field | Required evidence | Exact failure discriminator |
|---|---|---|
| Source curve current | exact archive text/blob | wrong role, locator, or degree |
| Sweep map | explicit `X(s,t)` from a curve family | no second independent tangent |
| Projection | finite-core worldtube -> center surface -> current | composition mismatch or erased downstream distinction |
| Quotient | reparameterization and orientation convention | same declared surface gives changed current |
| Boundary | closed sheet or explicit endpoint current | nonzero boundary divergence left unaccounted |
| Normalization | units and charge/flux convention | dimensional mismatch |
| Observable | real measured system, comparator, calibration/holdout | fitted-only, missing provenance, or threshold failure |

No physical calculation was performed in this turn.


## Publisher correction status

Issue #988 is the single publisher ID. The publisher consumed the first, incorrectly routed body before its in-place correction and committed `morrow-curve-worldsheet-current-20261029t0736z-s3-001.md` at `06548ceb1fab9b8a9f9f917d7b5886d66ffb5913`. That file is a retained audit trail, not the canonical receipt. Corrected issue body checksum is `da79b2600d14314fc809864edef000a205a2ee6e28f013033fd7ec4551fd5def`; correction comment #6495750237 was independently read back. No duplicate publisher issue was submitted.
