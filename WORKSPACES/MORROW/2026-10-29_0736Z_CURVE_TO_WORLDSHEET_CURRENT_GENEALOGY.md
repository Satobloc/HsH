# Morrow source-genealogy result: curve current to worldsheet current

**Status:** assistant reconstruction with source-role audit and conditional Lean mathematics. Not an empirical result, historical-authorship transfer, or BEDROCK promotion.

## Result

The previously reported SAT-O/Blockwave connection is not simply absent. The older archive already contains the degree-one construction

```
J_μ(x) = ∑_γ ∫ dλ v_μ(λ) δ^(4)(x − γ(λ))
τ_μ(x) ∝ J_μ(x)
```

in `EARLY LOGGED/Module_O8_Audit_Combined.txt`, Git blob `02f61b23af689edf33a989dac57f3b69dac621e9`. It pushes oriented curve tangents into a spacetime vector current.

The later Blockwave conversation uses an antisymmetric conserved two-form/worldsheet current `J^{μν}`. The raw conversation is `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19•25.10.19•Full action definitions — raw.json`, Git blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. Exact role chronology:

- Nathan user message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`: “Can you give me the full action and definitions”.
- Nathan user message `cccb60c8-0c38-4274-9906-540e4fc106dd`: asks for the result in plain text.
- Assistant message `3039b226-02d4-41a3-a2d3-c338e25204a9` supplies the displayed Blockwave action and defines `J^{μν}` as the conserved two-form/worldsheet current.

Therefore the displayed Blockwave formula is an assistant reconstruction answering Nathan's request, not a verbatim Nathan-authored equation. Module O8 itself has a placeholder author header, so its personal authorship remains unresolved.

## The actual mathematical bridge

A curve has one tangent and produces a degree-one current. A swept curve is an oriented surface `X(s,t)` with two tangents. Standard string geometry uses the bivector density

[
Sigma^{mu
u}
 = partial_sX^mu,partial_tX^
u
 - partial_tX^mu,partial_sX^
u .
]

The corresponding distributional proposal is

[
J^{mu
u}(x)
 = qint Sigma^{mu
u}(s,t),
 delta^{(4)}(x-X(s,t)),ds,dt .
]

This is the degree-raised analogue of Module O8, but it requires added structure: a sweep/evolution direction, orientation, regularity, boundary conditions, normalization, and a conservation argument. A single tangent duplicated in an alternating product gives zero; it cannot by itself produce a nonzero bivector current.

Standard-reference corroboration: T. Yoneya, “Travels with Nambu,” PTEP 2016, 07B105, gives the same worldsheet surface-current construction (in six target dimensions for that example): https://academic.oup.com/ptep/article/2016/7/07B105/2330182 . This supports the geometry, not its SAT/H(s)H interpretation.

## Compiled proposition

`FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0053.lean` encodes an abstract alternating bilinear surface density and proves:

1. duplicate tangent gives zero;
2. collinear tangent data gives zero;
3. nonzero area requires a second non-collinear direction;
4. tangent swap reverses orientation;
5. reversing one tangent reverses sign;
6. reversing both tangents preserves sign.

Lean checks only those encoded algebraic statements. It does not formalize distributions, prove `∂_μJ^{μν}=0`, establish the source translation, or validate physical premises.

## Architecture/falsification gate

The next independent test is now concrete rather than “find a connection”:

| field | required evidence | failure discriminator |
|---|---|---|
| source curve current | exact archive text/blob | wrong role, locator, or degree |
| sweep map | explicit `X(s,t)` from the curve family | no second tangent |
| quotient | allowed reparameterizations and orientation | same surface, changed current |
| boundary | closed sheet or explicit endpoint current | nonzero divergence at boundary |
| normalization | dimensions and charge/flux convention | unit mismatch |
| observable | real measured system and held-out readout | fitted-only or no provenance |

No physical calculation was performed in this run.
