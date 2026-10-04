# Quarry 070 — Reconnection as a frame-registry gluing map

**Status:** Morrow/Kestrel siloed sandbox; not canonical SAT/H(s)H.

## Provenance actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_HSH_SYNTHESIS_STATE.md` — lines 1–500 requested/read; SHA `a39106a1231555dbfd5091e488f5d4b771f4da48`. Retained: finite-core contact plus phase, barrier, and branch-pairing conditions belong in the reconnection grammar; topology is typed only after object/permitted moves are specified.
2. `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-02_TRANSPORT_BEFORE_QUOTIENT_FINITE_CORE.md` — lines 1–500 requested/read; SHA `819dd52753e4ef822da0c6592813ab31e798107e`. Retained: full transport representatives compose before stabilizer quotient; reconnection changes carrier identity and therefore lies outside the fixed-edge theorem.

## Source fact -> inference -> new sandbox construction

**Source facts:** the synthesis requires branch pairing/phase/barrier data at finite-core reconnection. Ravel shows that endpoint material registry is represented by full composable transport before quotient and that reconnection changes carrier identity.

**Inference:** a reconnection event is not only a topological surgery. It must also specify a gluing map between incoming and outgoing carrier frames/directors.

**New sandbox construction:** for two incoming branches with phases a,b and outgoing branches c,d, compare the two possible pairings with a registry mismatch functional

```
E_pres = Cg/2 [dist(c,a)^2 + dist(d,b)^2]
E_swap = Cg/2 [dist(d,a)^2 + dist(c,b)^2].
```

Here dist is the shortest phase distance for an SO(2) fixture. The lower-cost pairing is selected unless other action terms reverse it. This is a toy reduction of the full SO(3)/H or SO(4) gluing problem.

For the symmetric fixture a=-delta/2, b=+delta/2, c=alpha-delta/2, d=alpha+delta/2, the pairing preference changes on a calculable boundary in (delta,alpha). Thus identical centerline contact geometry can reconnect differently solely because the incoming frame registry differs.

## Audacious completion

Interbraid reconnection may be a *typed gluing operation*: contact opens a surgery channel, the barrier determines whether it occurs, and frame registry determines which branch pairing is dynamically cheapest. Topological output is therefore not determined by contact geometry alone.

The full event should carry something like

```
R_event = (contact set, barrier saddle, branch permutation P, gluing transport G, outgoing stabilizers H_out).
```

This provides a concrete place for chirality/holonomy memory to survive or flip across reconnection without pretending that a projected braid diagram alone supplies the interaction law.

## Failure condition

If the fully relaxed finite-core action gives identical event action for all allowed gluing maps after legitimate stabilizer quotient, registry is physically irrelevant and this mechanism dies. It also dies for an isotropic B3 carrier with no resolver/hidden director, because no intrinsic rotational registry survives.

## Tight solver test

Hold centerline/contact geometry fixed. Sweep only incoming material-frame registry. For every registry, solve both branch pairings through the same finite-core event saddle. Compare total event actions after quotienting only at readout. Look for a pairing bifurcation and record outgoing holonomy/chirality. If the branch preference changes while contact geometry is unchanged, reconnection carries genuine frame information.

## Carry-forward

Reconnection should be modeled as **surgery + gluing**, not surgery alone. The gluing map is a candidate home for phase/chirality/holonomy selection at finite-core contact.
