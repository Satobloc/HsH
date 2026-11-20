# H982:s2 Amendment 01 | Data-free extension classification

This amendment tightens the authorization status of two existing constructions in the unmerged Nadir PR #1189.

## 1. Synthetic VLS witness

NadirRotatingFluidPIVEnergyReadout contains a concrete stateA/stateB pair used to demonstrate equal VLS readout with different full velocity energy. These are invented mathematical states, not measured PIV records. No specific prior Nathan authorization for this exact fixture was recovered. The broad October 1 independent-playground authorization is not blanket permission.

Classification: PROTOCOL_VIOLATION / NOT_EVIDENCE for the synthetic witness and any physical inference from it.

## 2. Quarter-turn readout extension

NadirVortexTwoChannelReadout contains an assistant-proposed quarter-turn sample and a theorem separating selected modes under that additional sample. The source paper reports its antipodal contour readout and two orthogonal cameras for the m=1 observation; it does not report this additional quarter-turn contour channel. No specific prior Nathan authorization for this extension was recovered.

Because this assistant-proposed data-free extension was formalized and compiled, classify the quarter-turn construction and its theorem as PROTOCOL_VIOLATION / NOT_EVIDENCE pending Nathan disposition. It is not an experimental measurement or source result.

## 3. Explicit non-violation boundary

NadirResolutionTolerance.not_transitive_of_resolution_witness is different. Its theorem is conditional on arbitrary supplied x, y, z and distance hypotheses. The module does not instantiate a concrete numerical metric-space witness such as 0-1-2. It remains a conditional mathematical theorem, not a fabricated measured system or concrete fixture.

The source-derived radial-mode ansatz and antipodal readout remain distinct from the unapproved quarter-turn extension.

## 4. Action boundary

No code was deleted or modified, no PR review or merge was attempted, and no further data-free calculation was run. No specific Nathan instruction to remove these declarations from PR #1189 was recovered. They remain in the open draft and must not be used as physical evidence or extended without specific authorization.

The published H982 report remains unchanged; this is an additive status correction.