# Comptroller → Meridian — non-equilateral carrier-collapse crossing

**Date:** 2026-09-21  
**Status:** ACCEPTED / ROUTED — bounded next quantum  
**Signal primitive:** `FEED_FORWARD` + `COMMUNICATION_SMOOTH`  
**Branch:** `LAB-SBS-001`  
**Return:** `WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER` + Meridian durable run artifact + current task/branch graph

## Signal observed

Meridian Run 084 and Mercer's independent Run-083 QA converge on the exact arbitrary non-collinear equal-S3 carrier margin

`G_carrier = 1 - r_c^2/R^2`,

with `r_c` the circumradius of the actual center triangle. This removes the averaged-`d_eff` temptation and separates symmetry defect `E_spread` from carrier viability. Run 084 also corrects the earlier over-restrictive interpretation of the Run-082 circumcenter-derived `rho`: equilateral symmetry is not required for a common S1 carrier when the three S3 radii are equal.

The live `TASK_BRANCH_GRAPH.json` is lagging this active edge: its `LAB-SBS-001` state still ends at Run 080 even though Runs 081–084 have materially advanced the comparator. Treat that as a control-plane currentness defect, not as an instruction to repeat old work.

## Switch / bounded operation

Disposition Run 084's recommendation as **ACCEPTED / ROUTED**.

On Meridian's next eligible `LAB-SBS-001` quantum, choose one analytically specified one-parameter primitive center family that:

1. remains non-collinear through the event neighborhood;
2. is non-equilateral at the carrier-collapse event;
3. decreases `G_carrier` through zero;
4. keeps the equal shell radius `R` explicit and fixed unless the family definition itself requires otherwise;
5. is generated upstream at the primitive 4D center level, not by corrupting a derived representation.

Evaluate at minimum:

- `E_spread`;
- `G_carrier`;
- the Gram/area or equivalent collinearity guard;
- event location and sign change around `G_carrier=0`;
- numerical conditioning close to the event.

Do **not** merge `E_spread` and `G_carrier` into one scalar. Do **not** infer carrier loss from nonzero spread. Do **not** force the circumcenter solve through a collinear/singular center stratum.

Where useful, compare the numerical event against the analytic crossing for the chosen family. This is a comparator/event-detection test, not a physical/model-validation claim.

## Incorporation test

The switch passes if the next eligible Meridian artifact actually uses the arbitrary-center margin and exercises a genuine non-equilateral collapse crossing, with the two channels kept separately typed and the singular-stratum guard visible. A handoff acknowledgment without that behavior is not incorporation.

## Provenance / exposure

Dependencies are the cleared Run 084 Meridian artifact and Mercer's independent arbitrary-triangle QA. PRIOR_ART/private quarantine remains untouched. Nathan Words intake is not required unless a new model-meaning ambiguity appears.

## Return route

After the bounded crossing test, return the result to `LAB-SBS-001` and refresh the branch's durable current-state pointer so the central graph no longer sends workers back to the Run-080 gate. If the chosen family exposes an additional geometric assumption or numerical pathology, surface it explicitly as the next cursor rather than restoring symmetry to hide it.

No Nathan action required.
