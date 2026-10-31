# Aster :00 geometry correction addendum | 2026-10-31T0300Z

**Run key:** `REVROT3-19-20261011:483:s0`  
**Role:** Aster; next ring role Ariadne.  
**Related publication:** issue #1136, submission `aster-slow-glass-path-length-20261031t0300z-s0-001`.  
**Purpose:** Tighten one mathematical interpretation in the published conditional kinematics. This is an additive correction, not a second theory submission.

## 1. Original conditional definitions

The published report defines:

- (s): intrinsic arclength along a fixed carrier;
- (x): chosen net-displacement coordinate;
- (lambda = ds/dx);
- material traversal along the carrier at speed (ds/dt=c);
- a moving front (w=ct), intersecting the fixed carrier at (s_*(t)).

The published equations are:

[
v_{\mathrm{mat},x}=\frac{dx}{dt}=\frac{c}{\lambda}
]

and

[
\frac{ds_*}{dt}=\frac{c}{dw/ds}.
]

Under the restricted identification (w=x), since (dx/ds=1/\lambda),

[
\boxed{\frac{ds_*}{dt}=c\lambda}.
]

The equations are consistent, but the prose description “reciprocal material/pattern rates” needs a normalization qualifier.

## 2. Correct interpretation

The two **dimensionless factors relative to (c)** are reciprocal:

[
\frac{v_{\mathrm{mat},x}}{c}=\frac{1}{\lambda},
\qquad
\frac{(ds_*/dt)}{c}=\lambda,
qquad
\left(\frac{v_{\mathrm{mat},x}}{c}\right)
\left(\frac{(ds_*/dt)}{c}\right)=1.
]

The dimensional speeds/rates themselves are not numerical reciprocals. Their product is

[
\boxed{v_{\mathrm{mat},x}\,\frac{ds_*}{dt}=c^2}.
]

Also, (ds_*/dt) is the rate at which the intersection parameter moves along the fixed carrier. It is not automatically the velocity of a material object. That identification requires a metric and an observation/readout map.

Therefore the precise statement is:

**Material projected speed and moving-front intersection-parameter rate have reciprocal dimensionless factors when normalized by (c), under (w=x) and the stated arclength convention. Their dimensional product is (c^2).**

## 3. Executed symbolic check

SymPy was used to define (v_m=c/\lambda) and (v_f=c\lambda). It returned:

- (v_m v_f=c^2);
- ((v_m/c)(v_f/c)=1).

This is conditional algebra only. It uses no measured system, physical fixture, fitted parameter or empirical claim. No CODATA scoring was performed.

## 4. Epistemic boundary

- Nathan Direct: light and matter both travel at (c) by the push of time; matter has farther to go.
- Assistant reconstruction: the specific helix, its pitch/radius, the choice (w=x), and the kinematic variables above.
- Standard mathematics: arclength reparameterization and the implicit differentiation of (w(s_*(t))=ct).
- Independent measurement: none.
- Lean status: no Lean 4/Mathlib run for this proposition. The current runtime has no `lean`, `lake`, or `elan` executable. The published report's SymPy check is not a Lean proof.

The original report's displayed conditional equations remain intact. This addendum narrows the prose interpretation and prevents dimensional speeds from being called reciprocals without normalization.

**Disposition:** `CONDITIONAL_KINEMATICS_CLARIFIED / SYMBOLIC_CHECK_EXECUTED / NO_PHYSICAL_PREDICTION / NO_THEORY_PROMOTION`.
