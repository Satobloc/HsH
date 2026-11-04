# Ariadne source-fidelity supplement: \(w=ct\), Forest naming, and Lagrangian conventions

**Status:** `BASE_MAP_SOURCE_RECOVERED` / `FOREST_LABEL_UNRESOLVED` / `OCT29_RAW_SOURCE_BLOCKED` / `NO_BEDROCK_CHANGE`  
**Scope:** Archive provenance and mathematical translation only. No physical calculation, CODATA scoring, empirical claim, or theory promotion. Additive to issues #1325 and #1340, not a replacement.

## 1. Source genealogy

**Earlier \(w=ct\) source**
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORKING_GROUP_1.txt`, blob `dcadbd209733356a6b76c78d99df967e43842814`: the `worldtube-lab` Slack export preserves a Nathan-authored 2026-09-08 message specifying an “All-purpose normalization audit (w=ct + declared invertible maps)” and a residual/scale ledger. The export was committed later, on 2026-09-12.
- `DIMENSIONAL_NORMALIZATION.tex`, blob `52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1`, first commit `1fd97fe5b90910085b36cfde6ef61b8ce6181c9e` at 2026-09-08T22:55:04Z. Internal title/date: *Metric Symmetry to Reveal the Grain*, 2026-09-09, byline Nathan McKnight & Janus C. Sol. It defines \(w=ct\) as a base map for a cross-sector normalization audit and retains residual structure.

The Slack message is Nathan Direct; the paper is a co-authored historical working document. Neither proves physical equivalence among sectors or a Euclidean four-metric.

**October 21 conflicting direct notation**
Raw conversation: *Meridian Minkowski Ring Analysis*, conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

- Message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.205Z: `cw=t`, tentative `+/- (c+H_0)/2`, “Forest Normalizatin,” and `(++++)`.
- Message `92856f85-9f67-44d0-b1c4-4e9ff7d6500d`, 2026-10-21T14:00:32.869Z: explicitly calls \(H_0\) a **velocity** in the expansion-centering description.

A later October 29 correction is referenced by assistant-authored intake `WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-29_TOPLESS_GEOMETRIC_INTAKE.md`, blob `74ce884326a25877dd226977a1c91eb016174893`. Prior-conversation retrieval indicates that it says to use \(w=ct\) exclusively, but its raw export, conversation title, and message UUID are missing. It cannot yet serve as an immutable primary-source locator or prove explicit supersession of the October 21 `cw=t` statement.

## 2. “Forest Normalization” boundary

`WORKSPACES/LABS/THE_FOREST/THE_FOREST_WORKING_DRAFT.tex`, blob `e798158736615967312621daa64c8a97d77069db`, first commit 2026-09-22T01:50:29Z, defines a physical-information ancestry graph \(\mathcal F=(V,E)\). It contains neither \(w=ct\) nor \(cw=t\).

It separately gives
\[
\Delta_n=\frac{2\pi}{n},\qquad
B_n^{(\mathrm{tan})}=\frac{1}{2\Delta_n}=\frac{n}{4\pi},
\qquad B_3^{(\mathrm{tan})}=\frac{3}{4\pi}.
\]
The arithmetic is exact; the geometric origin of the factor of two remains a candidate interpretation. This tangent normalization is not the time-to-length map. The October conversational phrase “Forest Normalization” is not formally linked to either construction in the available sources.

## 3. Glossary and mapping

| Term | Meaning/status |
|---|---|
| \(w=ct\) | Historical invertible time-to-length base map. |
| `cw=t` | Literal October 21 direct notation; not silently rewritten as \(w=ct\). |
| Forest graph \(\mathcal F\) | Physical-information ancestry graph \((V,E)\). |
| Forest tangent normalization | \(B_n^{(\mathrm{tan})}=1/(2\Delta_n)\); factor-of-two interpretation open. |
| Forest Normalization | Conversational label; referent unresolved. |
| Residual | Structure left after declared invertible maps; not automatically an error or new law. |
| Action-preserving \(L_w\) | \(L_w=(1/c)L(q,cq_w,w/c)\). |
| Trajectory-equivalent \(\widetilde L\) | \(\widetilde L=L(q,cq_w,w/c)=cL_w\). |

```text
Nathan Direct, 2026-09-08: w=ct + declared invertible maps
                 |
                 v
DIMENSIONAL_NORMALIZATION.tex: base map + residual ledger
                 |
                 +--> OPERATOR_NORMALIZATION_HANDOFF.md: action-preserving L_w
                 |
                 v
Nathan Direct, 2026-10-21: cw=t + tentative c/H0 shorthand + (++++)

Separate object: THE_FOREST_WORKING_DRAFT.tex
  F=(V,E) + threefold tangent B normalization
  no source-defined map to w=ct or cw=t

2026-10-29 correction: referenced, but raw export/UUID absent
```

## 4. Direct propositions versus assistant translations

| Source | Proposition | Epistemic status |
|---|---|---|
| Nathan Direct, 2026-09-08 Slack | Use \(w=ct\), declared invertible maps, and a residual/scale ledger. | Direct, source-located. |
| Historical paper, 2026-09-09 | \(w=ct\) is the base map for a cross-sector audit. | Co-authored working document; not a physical equivalence proof. |
| Nathan Direct, 2026-10-21 | `cw=t`, tentative \((c+H_0)/2\), Forest normalization, `++++`. | Raw direct source; variable types and signs incomplete. |
| Nathan Direct, 2026-10-21 | Calls \(H_0\) a velocity, while also referring to an “actual velocity related to \(H_0\)” for dimensional normalization. | Raw direct source; the conversion map is not supplied. |
| Later 2026-10-29 statement | Use \(w=ct\) exclusively. | Partial prior-conversation recovery; raw locator missing. |
| BEDROCK `ND-2026-10-21-03` | \(v_H=H_0L\), then midpoint \(c\) and \(v_H\). | Assistant reconstruction, not verbatim; it implicitly treats \(H_0\) as a rate and supplies a scale map absent from the direct message. |

Thus the \(H_0\) issue is not settled by importing standard Hubble notation. The direct message uses both \(H_0\) and a velocity related to \(H_0\), without giving the conversion map. BEDROCK's \(v_H=H_0L\) remains an assistant reconstruction, not a verbatim direct equation. The later correction alleged by the October 29 intake is not raw-verified.

## 5. Lagrangian comparison

For constant \(c\ne0\), \(w=ct\) gives
\[
q_w=\frac{\dot q}{c},\qquad \dot q=cq_w,\qquad dt=\frac{dw}{c}.
\]
Exact action preservation requires
\[
S=\int L(q,\dot q,t)\,dt
 =\int \underbrace{\frac1cL(q,cq_w,w/c)}_{L_w}\,dw.
\]
Then \(p_w=p_t\) and \(H_w=H_t/c\).

The paper's appendix writes \(\widetilde L=L(q,cq_w,w/c)\) without \(1/c\). This equals \(cL_w\): for constant \(c\), it preserves Euler-Lagrange stationary paths but scales the action by \(c\). This is a convention distinction, not necessarily an error. The Hamiltonian notation must say whether \(p,H\) are the original or reparameterized canonical variables. Existing `WORKSPACES/WORLDTUBE_LAB/OPERATOR_NORMALIZATION_HANDOFF.md`, blob `504a46e54992c3d1cd6ded61a26d4db654f0aead`, records the action-preserving form and warns that field-theory measures/Jacobians must also be transformed.

No new Lean theorem for this Lagrangian map was added.

## 6. Proof, Factory, and epistemic status

Draft PR #1135, branch `research/ariadne-scalar-hessian-antisym-20261031t0312z`, exact-head Lean CI run #713 / job `124429317733`, succeeded with Lean 4.34.0, Mathlib v4.34.0, and an 8,944-job build. It proves the local-coordinate conditional statement: a \(C^2\) scalar's covariant Hessian is symmetric for symmetric connection coefficients, so its antisymmetrization is zero. Printed dependencies include `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was reported. The separate automated axiom-audit step was skipped.

This checks only the formalized statement, not the physical premises, the intended SAT connection, the Forest interpretation, or an empirical result. The existing Ariadne Factory handoff packet and issue #1137 remain `SUBMITTED_NOT_VERIFIED`. The November 3 geometry-first gate requires a precise plot and independent hostile fidelity review before Factory Floor admission. No Floor admission or BEDROCK promotion is claimed.

## 7. Discrepancy ledger and next cursor

1. Recover the raw October 29 conversation, title, message UUID, full context, and whether it explicitly supersedes `cw=t`.
2. Recover the authoritative source for “Forest Normalization” and determine whether it names \(w=ct\), the Forest tangent normalization, or a third construction.
3. Reconcile the direct \(H_0\)-as-velocity statement with the assistant \(H_0L\) reconstruction and any later source-backed correction.
4. Recover the original “The Trees Themselves” source and its equation genealogy.
5. If needed, formalize the constant-\(c\) action-preserving Lagrangian map in Lean, separately from trajectory-only scaling.
6. Keep the Forest graph, tangent \(B\) normalization, \(w=ct\), `cw=t`, and the stronger four-dimensions-alike physical interpretation separate until explicit source-backed maps connect them.

**Controls:** no BEDROCK edit; no Factory Floor admission; no CODATA scoring; no measured-system calculation; no new tool, branch, or PR; no theory promotion.
