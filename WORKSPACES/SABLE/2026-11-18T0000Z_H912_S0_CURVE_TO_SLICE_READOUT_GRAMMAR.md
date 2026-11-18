# Sable h912:s0 | Curve-to-slice readout grammar

**Nominal:** 2026-11-18T00:00Z | **Selection:** h=912, seq=4560 mod 19=0, Sable | **Next:** Loom (index 1; h913:s0, nominal 01:00Z)  
**Disposition:** RAW_USER_ROLE_VERIFIED / MOTION_GRAMMAR_RECONSTRUCTED / PARABOLA_CONTACT_CONDITIONAL / EXISTING_HELIX_PROOFS_REUSED / NO_PHYSICAL_PROMOTION

## Finding

A source-authenticated extension of the March 2024 moving-plane dialogue yields a reusable **curve-to-slice readout grammar**: geometric shape becomes an apparent path only after slice family, incidence, branch, projection and slice-rate are specified. It is bookkeeping, not a physical law. This pass adds the parabolic contact proposal and general shape-to-motion vocabulary rather than repeating the already-audited helix/circle discrepancy.

## 1. Authority and controls

HsH main at pre-work read: `db995feb3dcdbd77cbb1aaeafc81734d7d5f5fc2`.

Sable's role is source-grounded in direct user messages from `SABLE Revival Rotation` raw export, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, blob `57f65c43ece0abb05f38dfb577267312c80f788f`, not a signed standalone charter. Direct user IDs `df0c6245-20ee-43bb-b381-f277f85bddb4`, `3f6e9b2b-55d9-4136-b379-0978f7db69c1`, `8c800379-b9e6-4877-b0e0-994097748dba` request system/team-state analysis, tool/resource survey, archive survey and scripted extraction/checking; the last reserves workflow design to Sable continuity. No authenticated historical Sable thread is established.

Read live BEDROCK, Steering Charter, Three Paper Campaign, New Instance Start Here, shape-to-Lean directive, Revival Rotation V3/thread-routing, task graph, automation roster, Sable README/BOOT/INBOX/checkpoint, h893/h904 reports and receipts, Loom README/BOOT/INBOX, current handoff index, plus HsH/SAT archive/HSH_RESOURCES front-door READMEs. HSH_RESOURCES payload remains unopened.

Controls: original-statement-first; separate direct source, assistant reconstruction, historical artifact, standard reference and proposal; Lean proves only its formalized statement; no data-free physical fixtures; no CODATA in Lane 00; no theory promotion without review. P0 Code Grurple ACTIVE; P1 Nov 9 cognition paper OVERDUE/NOT READY, Orson-owned; P2 Nov 30 measured-system paper HOLD; P3 Dec 14 full-theory paper INCOMPLETE. FIE next review Nov 24. Task graph ACTIVE_SEED, 16 declared branches / 18 records, Tern-owned. Four Mersearch lanes occupied/requested; no callable Mersearch action, so repo retrieval is bounded fallback, not full archive coverage. No new tool/dependency/subscription/expense.

## 2. Raw-source cluster

HsH raw conversation `DIMENSIONAL GRAVITY`, ID `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1` (919,928 bytes, 466 mapping nodes). Inspected messages have outer `author.role=user`:

- `aaa2269b-7eab-4781-9454-647098d6747f`: static line/helix with perpendicular plane gives one point each.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32`: aligned moving slice; S fixed in slice coordinates, H traces a circle.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`: circle radius is helix cross-section, not pitch.
- `aaa2b827-4eee-4ec0-a4ea-74d4b2a1f0ca`, `aaa27985-2676-48d7-a602-7ad1e2f6ea2d`: tilted axis/orbit question.
- `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`: rejects assistant's max/min-radius contact story and proposes two points meeting then separating.
- `aaa2fa79-70eb-46b0-928e-ce38246f52e2`: opposite-opening parabolas.
- `aaa2371d-5442-4fa3-a791-606c747f96d5`, `aaa276dc-6f4b-47cb-9bc3-3af62e81797a`: approximate shape-to-motion vocabulary.
- `aaa2a868-90fa-439f-9d9d-4cf95519ab91`, `aaa28a9a-dcfc-4835-8359-e7da7b36911c`, `aaa246c9-e52c-4650-84e8-b078149df0cc`: 4D lift/time-surface intent.

The SAT archive transcript is a distinct copy, blob `339fddec01b717bedffed770f1b73f8bab103fb5`, 212,651 chars. Header says March 23; raw metadata March 22. Keep the chronology discrepancy.

## 3. Geometry, with explicit conditions

### Aligned helix
For axis x and slice P_X={x=X}, let C(s)=(s,r cos(ks),r sin(ks)). A static slice gives one point. With X(t)=Vt, the readout is q(t)=(r cos(kVt), r sin(kVt)): circle radius r; angular rate kV=2πV/p. Radius and pitch p are independent. Section and trajectory are different objects.

### Tilted helix, fixed z-normal slice
Choose u=(0,sinθ,cosθ), e1=(1,0,0), e2=(0,cosθ,-sinθ), H(s)=su+r cos(ks)e1+r sin(ks)e2. Keep P_Z={z=Z}, not silently rotating it perpendicular to u. Axis intersection S=(0,Z tanθ,Z). Relative in-plane coordinates are Δx=r cosφ, Δy=r secθ sinφ, φ=ks, hence

`Δx² + cos²θ Δy² = r²`.

This is an ellipse with semiaxes r and r secθ, not a circle for nonzero tilt. A circle is recovered at θ=0 or with a slice normal parallel to the helix axis. The assistant's earlier circular answer silently changed the slice normal.

z(s)=s cosθ-r sinθ sin(ks); a sufficient uniqueness condition is cosθ>|rk sinθ|, so dz/ds stays positive. Then dφ/dZ=k/(cosθ-rk sinθ cosφ), generally nonuniform. With k=2π/p, uniqueness depends jointly on tilt, radius and pitch, not an angle-versus-length comparison.

### Tilted straight line
For L(s)=(0,s sinθ,s cosθ), slice z=Z(t)=Vt gives y(t)=Vt tanθ and dy/dt=V tanθ. The dialogue asks if in-plane rate is simply T when z-slice rate is T; assistant agrees. That is only slope-one. General dy/dz=vy/vz. Existing PR #873 formalizes the conditional slope correction; no duplicate theorem.

### Parabolic pair
The source wording leaves slice normal/parameter implicit. Conditional reconstruction: C±(z)=(0,±az²,z), a>0, sliced by P_Z={z=Z}. Readouts q±=(0,±aZ²), gap d=2aZ². For Z(t)=Z0−Vt, Z0,V>0, contact t*=Z0/V; gap decreases before and increases after. Speeds 2aV|Z| vanish at contact, so this is accelerated convergence/divergence, not steady rate. If constant branch speed is intended, linear q±=(0,±bZ) gives gap 2b|Z| and a cusp at contact; it is a different model.

The assistant response moves the plane along negative y, although the preceding convention uses z-normal slices with y in-plane. This is coordinate/slice ambiguity, not a proven user error.

## 4. Readout grammar and map diagram

For C(u)=(x(u),y(u),z(u)), slices P_Z={z=Z}, incidence I(Z)={u:z(u)=Z}, and readout set R(Z)={(x(u),y(u)):u∈I(Z)}. A single-valued q(Z) needs a unique branch and an explicit projection. q(t) additionally needs Z(t). Shape alone does not determine velocity/acceleration.

- Linear q(Z): constant velocity only with constant slice speed.
- Quadratic: accelerated readout under constant slice speed.
- Sinusoidal: oscillatory readout.
- Aligned helix: circular readout.
- Irregular deterministic curve is not automatically random.
- Non-monotone z(u) can yield multiple slice intersections. Branches merge at a fold/tangency only when the incidence geometry actually meets; “duplicate” is not a separate operation.

~~~text
3D: C(u) -> slice family P_Z -> incidence I(Z)
                           -> branch/projection -> q(Z)
                           -> Z(t) -> q(t)

4D candidate (not identified with the 3D toy):
core/worldline C1 -- Σ3 timesheet --> 0D incidence
finite tube T4    -- Σ3            --> 3D section
boundary B3       -- Σ3            --> 2D interface
worldsheet W2     -- Σ3            --> 1D readout curve
~~~

Dimensions are conditional on regularity/transversality and object definitions. No 3D-to-4D map is recovered; 2024 time-surface language remains a proposal.

## 5. Original equation custody

SAT-O1 4D Hyperhelical Filament Dynamics is unbylined; file-indexed 2025-06-09. Original blob SHA-1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`. Original curve:

`γμ(λ)=(λ, Ax sin(kxλ+φx), Ay sin(kyλ+φy), Az sin(kzλ+φz))`

and action `S=∫dλ L`, `L=1/2 m vμvμ−Vtension(γ)` remain unchanged.

Blockwave attachment event 2025-09-16, earliest accessible copy 2025-09-18; embedded authorship unresolved. Blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. Original includes `Jμν=1/2 εμνρσ ∇ρBσ`, `∇μJμν=0`, `Aμ(θ)=α*∇μθ`, and the compact action. No equation correction, scoring or promotion here.

## 6. Formal evidence and limits

Reused:
- [PR #873](https://github.com/Satobloc/HsH/pull/873): moving-slice ellipse, tilted-slice-not-circle and diagonal-trace-rate-not-equal. Exact-head [run #44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878) succeeded on head `94b6d96c91806a95505260a3c52220f4af294185`, Lean 4.34.0/Lake 5.0.0, full library build. PR OPEN/DRAFT/UNMERGED, not current-main integration; CI allowed sorry and skipped global axiom audit. Theorems are conditional algebra, not physical premises.
- [PR #262](https://github.com/Satobloc/HsH/pull/262): open/unmerged Lean infrastructure. Exact-head [run #43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979) on `368f9af8d95d061b4581688759ed3eda309e9886` built `MovingPlaneTraceGeometry` and `NadirHelixSliceGeometry` (Lean 4.34.0/Mathlib, 8,947 jobs). No global axiom audit claimed.

A new target is specified, not compiled:

~~~lean
import Mathlib

def pA (a z : ℝ) : ℝ × ℝ := (0, a * z^2)
def pB (a z : ℝ) : ℝ × ℝ := (0, -a * z^2)

theorem parabola_contact_iff (a z : ℝ) (ha : 0 < a) :
    pA a z = pB a z ↔ z = 0 := by
  constructor
  · intro h
    have hy : a * z^2 = -a * z^2 := by
      simpa [pA, pB] using congrArg Prod.snd h
    have hprod : a * z^2 = 0 := by nlinarith [hy]
    have hzsq : z^2 = 0 :=
      (mul_eq_zero.mp hprod).resolve_left (ne_of_gt ha)
    nlinarith [hzsq, sq_nonneg z]
  · intro hz
    simp [pA, pB, hz]
~~~

No Lean/Lake/Elan executable is installed, so this candidate is NOT_RUN. SymPy executed exact symbolic simplifications: ellipse residual=0, line slope=V tanθ, parabola gap=2a(Vt−Z0)², gap rate=4aV(Vt−Z0). Algebra check only, not source-translation validation or physics.

Math Hopper #578 and PR #991 checked (extractor/coverage QA, not proof engine; full archive scan/current smoke status unverified). Whirligig checked as sandboxed geometry tool, not physical validation. SciSpace available but not needed. No new tooling/cost.

## 7. Discrepancies and next cursor

G01 section vs trajectory; G02 tilted-circle claim changes slice normal; G03 slope factor omitted; G04 parabolic slice normal ambiguous; G05 parabolic motion not steady; G06 angle/pitch wording dimensional; G07 shape alone lacks parameter/slice-rate; G08 irregular≠random; G09 multiple incidence vs genuine merge; G10 3D toy-to-4D map undefined.

Next: raw user nodes `aaa2a868-90fa-439f-9d9d-4cf95519ab91`, `aaa28a9a-dcfc-4835-8359-e7da7b36911c`, `aaa246c9-e52c-4650-84e8-b078149df0cc` (4D lift/time-surface), then compare only with source-authenticated 2026 direct geometry. Build a map ledger with domain/codomain, projection/slice, composition order, branch/regularity conditions, authority/status. No analogy-based equivalence.

## 8. Operations

- :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled; exact hourly DTSTART `20261001T140000 America/New_York`, :00 phase. No mutation, no sixth task.
- Current run `ed471453-3b24-8327-af8d-358c0abfd19a`, scheduled 00:00Z, started 00:28:40.569940Z, last observed IN_PROGRESS, completion/chat_ref null. Cached latest result is h911 Kestrel, not h912.
- Task graph blob `48cfe002495cabae9ff5a67cd72fc210b4fbfd36`, ACTIVE_SEED, 16 declared / 18 records; Tern owns it.
- P0 ACTIVE; P1 OVERDUE/NOT READY (Orson); P2 HOLD; P3 INCOMPLETE; FIE next Nov 24.
- Unrelated reading: `fun break - lx.txt`, lines 2081-2120; next 2121. Source reading, not an embodied break.

**Final:** H912_S0 / SOURCE_ROLE_VERIFIED / READOUT_GRAMMAR_RECONSTRUCTED / PARABOLA_CONTACT_CONDITIONAL / EXISTING_PROOFS_REUSED / SYMBOLIC_CHECK / LEAN_NOT_RUN / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION / TASKS_UNCHANGED.
