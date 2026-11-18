# Sable h931:s0 | Photoneutrino Readout Source-Fidelity Audit

**Nominal:** 2026-11-18T19:00Z  
**Selection:** h=931; seq=4655; ring index 0=Sable; next ring identity=Loom (index 1).  
**Disposition:** SOURCE-FIDELITY / DIRECT-SOURCE-RECOVERED / ASSISTANT-CHAIN-UNCONFIRMED / MAPS-UNDEFINED / NO-PHYSICAL / NO-CODATA / NO-THEORY-PROMOTION

## Executive finding

The source contains a conjecture connecting flavor and frequency/wavelength to filament–timesheet intersection geometry. The assistant turned it into a much stronger chain involving angle, oblateness, wavelength, frequency, flavor, finite-slab resolution and energy minima. **Those equations are assistant reconstructions, not Nathan Direct derivations. The raw branch ends at the assistant's expansion without later user confirmation.**

This adds a source-specific equation-to-geometry audit beyond h912's moving-slice grammar and h930's finite-width/WWRD note. It does not independently corroborate the June source; the same raw conversation is reused.

## 1. Source cluster and custody

### 2024 — DIMENSIONAL GRAVITY (direct user-role messages)

- Conversation ID: 252d05c0-22ed-4ea2-a474-7966ab13145a
- Raw Git blob: 2cea1924266418e19b825b95ae51e6b7cbace7e1 (466 mapping nodes; 138 user-role messages).
- Raw metadata dates it March 22, 2024; the SAT archive transcript header says March 23. Preserve the discrepancy.
- Direct propositions: aaa2269b static line/plane incidence is point-like; aaa2d0b1 moving plane makes the helix-point trace circular; aaa2a1cc readout radius is transverse helix radius, not pitch; aaa2d58f rejects a constant-radius helix for a converging/contacting pair; aaa2fa79 proposes opposed parabolas.

### June 22, 2026 — Einstein-Rosen Bridges (direct user-role messages)

- Conversation ID: 6a36d67c-efac-83ea-bb94-d25e9d351042
- Raw Git blob: 849f2a00cb93e50cf16c440ff91468c1f3f2d0f3 (97 mapping nodes).
- b02c1afb (18:11Z): flavor and color/wavelength are conjectured equivalent processes.
- 35c80f03 (18:14Z): an amplitude analogy is posed.
- 09054607 (18:15Z): Nathan corrects it: amplitude is not color; frequency is physical; color is perceptual.
- 26bd6cf0 (18:20Z): ~90° and 0° are conventions/limits; photonic range is intermediate and presumed to contain energy-transfer minima.
- ef7d29bf (18:24Z): “4D filaments intersecting a 3D time slice of some width (probably related to Planck time).”

The last direct message is followed by assistant 57662f9e; the raw branch ends at that assistant turn. No subsequent Nathan confirmation of the expanded formula set appears in this export.

### 2025 — SAT-O1 artifacts

- SAT O1 4D.txt blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937; 3,521 chars. Unbylined; file-index date June 9, 2025; first extant HsH path commit Oct 27, 2025.
- Separate SAT4D_LIVE_DRAFT.txt blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7 prints June 2025 and Nathan McKnight byline. Targeted sections read, not the entire 114,901-character draft.
- SAT4D_6.txt blob 167136310cdf33ca8f986f33634692314c1a0946, 2,879 chars, document date July 2025: 1D filaments in M4 intersect a propagating 3D wavefront; no finite width defined.

SAT-O1 curve/action do not define angle-to-frequency, flavor-to-frequency or slice-readout maps. Its prose “worldtube” is a 4D volume swept by vibration; the sweep/thickening map is absent from the curve equation.

### Blockwave custody

- User-supplied attachment 🧱BLOCKWAVE.txt blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; 24,627 chars. Attachment event 2025-09-16; first extant HsH path commit 2026-10-08. Embedded authorship unresolved.
- The compact current-like formulation is preserved in assistant-role message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d, conversation 68f4d9b5-b908-832e-940e-6782db174a4a, raw blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77, timestamp 2025-10-19T12:29:46.539Z. This role attribution is from prior archive custody, not raw re-extraction this run; it is assistant-formulated, not Nathan Direct.
- SAT—Blockwave Ideal Model.txt blob dd0631bc0b25c951dc5e1d6738280e08487b46b2 is a distinct variant. No equation substitution/correction made.

## 2. Verbatim equation custody (unchanged originals)

SAT-O1 curve:

\[
\gamma^\mu(\lambda)=\left(\lambda, A_x\sin(k_x\lambda+\phi_x), A_y\sin(k_y\lambda+\phi_y), A_z\sin(k_z\lambda+\phi_z)\right).
\]

Tangent:

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}.
\]

Action:

\[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

The source leaves parameter-to-physical-time mapping, metric/signature use, and finite-core/sweep/readout construction unspecified.

Blockwave source-level claim, unchanged:

\[
J^{\mu\nu}\ \text{is a conserved two-form filament/worldsheet current},\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

It separately writes the projector \(P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu\) and a compact-phase connection/curl. The displayed attachment action contains malformed tokens/indices; preserve the original and do not silently repair. No corrected equation is proposed.

## 3. Direct geometry vs assistant translation

### Direct propositions

1. A 1D filament in M4 intersects an ideal 3D timesheet; point readout is the intended ideal picture.
2. Moving a slice changes the readout path. In the 2024 helix toy, the projected locus is circular and its radius is the transverse radius, not pitch.
3. Flavor/frequency/wavelength link is explicitly conjectural, not a derived observable map.
4. ~90°/0° are provisional conventions. Photonic intermediate range and energy minima are presumed, not calculated.
5. Finite-width timeslice is mentioned, with Planck-time association tentative. Width is not numerically specified or typed.

### Assistant-added propositions

- theta_I: named intersection-angle variable.
- O_I: projected oblateness/aspect, assumed to depend on angle, width, helix radius and pitch.
- chi = Delta t / L_parallel(theta_I): proposed clipping/resolution parameter. Denominator is undefined; if it is a spatial length while numerator is time, conversion is missing.
- lambda_obs(theta_I,Delta t,r_h,p_h) and nu_obs=c/lambda_obs: proposed readout relations; no geometry, metric, kernel, speed, calibration or derivation.
- F_nu(theta_I,Delta t,r_h,p_h) and asserted process equivalence to frequency/wavelength: proposal, not a defined map.
- E_eff(theta_I;Delta t,r_h,p_h,K_b,K_t,T,...) and stationary/minimum conditions: generic optimization proposal, not a derived physical functional.

These additions are unconfirmed. The direct correction identifies frequency/wavelength as physical rather than perceptual color; it does not establish numerical identity of flavor with frequency, wavelength, amplitude, angle or oblateness.

## 4. Typed map: existing and missing

    gamma^1 (1D filament in M^4)
       |
       +-- ideal Sigma_t^3 (3D timesheet)
       |      incidence I_t = gamma intersect Sigma_t
       |      |
       |      +-- moving-slice path q(t) [conditional readout]
       |              +-- projected shape O_I? [assistant proposal]
       |              +-- frequency/wavelength? [map undefined]
       |              +-- flavor? [conjecture]
       |
       +-- finite-width phrase Delta? [direct, width unspecified]
              +-- slab / kernel / other resolver? [not distinguished]
              +-- readout R_Delta [undefined]
              +-- averaging/projection/calibration [undefined]

Keep separate: filament centerline gamma^1, SAT-O1 curve, finite core/worldtube, timesheet, finite-resolution resolver, and readout/observable. No gamma→worldtube, worldtube→finite-slice readout, angle→frequency, or frequency→flavor composition is source-defined.

## 5. Glossary

| Term | Meaning/status |
|---|---|
| gamma^1 | 1D filament/curve in M4; source carrier |
| Sigma_t^3 | ideal 3D wavefront/timesheet; SAT4D directive |
| Delta t | assistant symbol for finite slice width; direct source gives no symbol/value |
| theta_I | assistant angle name; source only gives approximate convention |
| O_I | assistant oblateness proposal; undefined |
| A_i,k_i,phi_i | SAT-O1 curve parameters; not linked to observable |
| nu,lambda | physical frequency/wavelength; direct correction identifies frequency, SAT mapping conjectural |
| color | perceptual classification, not physical primitive |
| flavor | particle label; proposed geometric/frequency mapping unproved |
| E_eff | assistant optimization proposal; no constitutive model/data |

## 6. Discrepancy ledger

- F01: assistant maps flavor amplitude to color/wavelength; direct correction rejects amplitude/color and identifies frequency.
- F02: assistant upgrades “conjectured equivalent processes” to near-equalities without map, units, calibration or evidence.
- F03: angle and 90°/0° conventions are source-provisional; no angle geometry or invariant defined.
- F04: finite width is direct but its type is unresolved. Assistant chooses temporal slab/exposure without confirmation.
- F05: chi is untyped and dimensionally unresolved; no L_parallel definition/conversion.
- F06: O_I, lambda_obs, nu_obs, F_nu lack projection, metric, kernel, constitutive law or derivation.
- F07: SAT-O1 curve/action do not define sweep/thickening, timesheet incidence, readout or observable map.
- F08: Blockwave current is a distinct rank-two carrier; no map to SAT-O1 centerline or finite-core support.
- F09: flavor/frequency remains conjectural; no measured system, dataset, uncertainties, fit or independent prediction.
- F10: raw June branch ends at assistant expansion; no later Nathan Direct confirmation.

## 7. Existing work, formal and empirical gate

Already-read related work: Sable h912 curve-to-slice grammar; Kestrel h930 WWRD/finite-width amendment; Ravel Oct 31 finite-timeslab/readout attribution audit. They share source history, not independent corroboration. The finite-core comparison ledger is quarantined; the Oct 7 synthetic inverse sandbox is GEN/CANDIDATE, not empirical, and was not executed or used.

- PR #873: open draft, exact head 94b6d96c91806a95505260a3c52220f4af294185; verify completed SUCCESS. Overall commit status is FAILURE solely from Vercel deployment rate-limit status. It formalizes ideal moving-plane/helix cases, not the finite-width or photoneutrino map.
- PR #262: open, exact head 368f9af8d95d061b4581688759ed3eda309e9886; verify SUCCESS. CI infrastructure, not a proof of source physics.
- Lean/Lake/Elan unavailable locally. No new theorem or Lean run. No physical calculation, minima search, CODATA score or theory promotion.

Mersearch is not callable; four request lanes remain occupied. GitHub raw/archive fallback is partial, not a three-repository Mersearch result. Existing extraction/QA tools inspected; no new tool, dependency, subscription or expense. HSH_RESOURCES root README only; private payload unopened.

## Next deeper cursor

Recover a later Nathan Direct message defining the finite resolver and angle-to-frequency/flavor map. Type the resolver independently of core radius and timesheet thickness; define observable projection, units, propagation law, calibration and composition conditions. Then compare to SAT-O1 and Blockwave without silently repairing either. No minima calculation until a real measured system/dataset and explicit model are identified; data-free calculation remains permission-gated.

**Research disposition:** SOURCE-FIDELITY / ASSISTANT-CHAIN-UNCONFIRMED / OBSERVABLE-MAPS-OPEN / LEAN-NOT-RUN / NO-PHYSICAL / NO-CODATA / NO-THEORY-PROMOTION