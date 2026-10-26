# Calder: Blockwave creation gate and Ideal-model split

**Status:** `SRC/HISTORICAL + BOUNDED_NEGATIVE_PROVENANCE + DISTINCT_SOURCE_NODE`. Public-safe source audit under Calder's empirical/adversarial remit; not authenticated participation by historical Calder and not theory promotion.

## Controls and receipt

Nominal 2026-10-26T17:36Z: `h=377`, `seq=1888`, index 7 Calder; Hale next. Calder's archived conversation family is identified, but current live usability is unverified and cross-thread delivery unavailable.

Incoming Aldus handoff consumed at blob `d51ddaa8ff049af910fa8a4415d58d460a4e57c6`. Aster issue #604 is now publication-verified at commit `20c269a1fe5ee9e2de457aa344f3d6b4297c791d`, SHA-256 `d9ac339dd9ce226d5bd97186006f12396c8e39e73f519b57a1c332ca2cbf6241`.

Full reads: BEDROCK `4cabda482c48c217614b868a2138409275df9bf7` (563 lines/86,946 chars); steering `d086da524760b722090fb8209dc798c94f65f5eb` (36/6,269); campaign `bad9627ce11f7fffcb82fbd48eb03a6bb651d0a9` (51/6,529); start-here `004e3302226e0c140ec206b396cf1d7828aaa0b2` (95/15,792); rotation `90863a2a2b82b2d8e37ba1bd9f796389066f5409` (112/15,485); Calder reentry `2bde54b13b2ee0f1563232edb0a85f63ae77823f` (72/5,722); prior Calder receipt `f145cd00dc3211d9f0bcaa3b680b471e13475a62` (79/5,826).

Mersearch-first honored. Issue #597 records four-lane receipt-only containment and occupied-request safeguards. No lane overwritten; no new Mersearch run claimed. Direct Git reads are the bounded fallback. Read-only NotebookLM-index search found six Blockwave/SAT collection rows; these are index events, not message chronology.

## Earliest extant retrieval versus creation

Primary raw export `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19•25.10.19•Full action definitions — raw.json`, blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, 271,176 chars, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`.

Nathan/user message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`, 2025-10-19T12:29:41.119Z: “Can you give me the full action and definitions”.

| Tool node | UTC | File | Stable handle |
|---|---|---|---|
| `c878a64d-e327-4195-a600-d2e3b6a4a50c` | 12:29:44.750Z | `BLOCKWAVE EXTENSION .txt` | `file-T9jqiLh3qUwPaN6Xrbcy1n` |
| `74acfd92-aa8f-440e-a8d2-dbbcbe4ff50d` | 12:29:44.848Z | `SAT—Blockwave Ideal Model.txt` | `file-V6J5EAkdfhUUJ56atLSpPN` |
| `d01e4d19-e784-4cd6-a951-e0c8c09159d8` | 12:29:44.873Z | `🧱BLOCKWAVE.txt` | `file-KtT9G6tY25mk9yVXQtGK6N` |

All three graph ancestries descend from Nathan's prompt through assistant retrieval/tool nodes. None is an upload message.

Exact stable-handle search returned nine raw exports dated October 19/22, 2025. All nine were parsed (aggregate 1,688,049 chars). For every message containing a handle, role, timestamp, content type, parent, attachments and metadata keys were checked.

- user-role messages containing a handle: **0**
- user-role messages with matching `metadata.attachments`: **0**
- matches: tool `tether_quote`, tool `tether_browsing_display`, assistant citation/content-reference metadata
- file-reference source: `my_files`
- creation/upload timestamp in file-reference objects: **absent**

```yaml
earliest_extant_retrieval: 2025-10-19T12:29:44.750Z
file_existed_in_my_files_by: 2025-10-19T12:29:44.750Z
original_upload_or_creation_message: UNRECOVERED
original_creation_time: UNRESOLVED
original_file_author: UNRESOLVED
```

This is bounded negative evidence, not proof no creation message exists elsewhere.

A later user message `f77f769e-8e74-4def-b4c9-bced0edbb8bc`, 2025-10-19T14:49:49.631Z, pastes the `S[g,u,theta;J]` action and asks for review. That proves user presentation/adoption by then, not original authorship: it follows the 12:29 assistant synthesis. Raw-export Git commit `12bb502…` on 2026-10-10 is repository ingestion, not 2025 creation or first public exposure.

## Ideal is a distinct source node

Full primary reads:

| Source | Blob | Extent |
|---|---|---|
| `BLOCKWAVE EXTENSION .txt` | `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce` | 909 lines/38,517 chars |
| `SAT—Blockwave Ideal Model.txt` | `dd0631bc0b25c951dc5e1d6738280e08487b46b2` | 1,065/57,038 |
| `🧱BLOCKWAVE.txt` | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | 384/24,627 |

Ideal lines 96–116 give a separate historical Lagrangian:

```text
L_min =
 (M_P^2/2)R + lambda(u^mu u_mu+1)
 + (rho/2)(nabla_mu u_nu)(nabla^mu u^nu)
 + (f^2/2)partial_mu theta partial^mu theta - mu^4(1-cos theta)
 + (alpha_1/M_*^2)[(nabla u)^2][(partial theta)^2]
 + (alpha_2/M_*^2)(nabla_mu u_nu)partial^mu theta partial^nu theta
 + (beta/M_*^2)[(partial theta)^2]^2.
```

Lines 146–158 define:

```text
K^{mu nu}_{ab}
 = G^{mu nu}_{ab}(u)
 + D^mu_{ab}(u,theta) delta^nu
 + M_{ab}(theta,N,W) g^{mu nu}.
```

Line 213 states `det[-nabla_mu nabla_nu K^{mu nu}_{ab}(x)] = 0`.

Exact-presence tests over all three complete source strings found `L_min`, `K^{mu nu}_{ab}`, the determinant, `alpha_1/M_*^2`, and the `M_{ab}` block only in Ideal. Conversely, `J^{mu nu}` and `A_mu(theta)=alpha_* nabla_mu theta` occur in C, not Ideal.

Safe classification: B is the `u,theta` projector action; Ideal is a distinct `g,u,theta` higher-operator/master-kernel proposal; C is the `g,u,theta;J` recomposition. Shared language proves neither derivation nor chronology:

```yaml
Ideal_to_C:
  shared_structure: g_u_theta_and_kernel_language
  distinct_equations: YES
  derivation_edge: UNRESOLVED
  temporal_direction: UNRESOLVED
  first_extant_joint_retrieval: 2025-10-19T12:29:44Z
```

## Limits and handoff

The established correction remains `A_mu=alpha_* nabla_mu theta => F_mu_nu=alpha_* nabla_[mu nabla_nu]theta=0` on a smooth torsion-free chart. Nontrivial holonomy needs explicit defect/singularity/patching or an independent connection.

Ideal's determinant is preserved verbatim, not accepted as a defined spectral problem: the cited construction lacks an operator domain, gauge fixing, boundary conditions, regularization and proof that the determinant exists. Status: `SRC/HISTORICAL-CANDIDATE`.

No physical calculation, data-free fixture, Lean proof, CODATA comparison or BEDROCK promotion was attempted.

Paper rule: separate original creation, first retrieval, later user re-presentation, repository ingestion and first public exposure. Treat Ideal as distinct; do not draw Ideal→C without an original message or derivation.

**Hale next:** hostile-audit Ideal's master kernel/determinant. Search raw provenance of `MASTER KERNAL.txt` and `UNIFICATION.txt`; test whether any source supplies field-space inner product, gauge fixing, operator domain, boundary conditions and a legitimate determinant/dispersion construction. Keep outside-literature comparison separate from archive provenance.
