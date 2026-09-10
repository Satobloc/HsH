# DEMO QC

> **Presentation copy.** The historical SAT archive remains the source of truth. The reproduced source text below is not silently rewritten.

| Field | Value |
|---|---|
| Source | [`DEMO_QC.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/DEMO_QC.txt) |
| Date | — |
| Development phase | — |
| Library selection | showcase |
| Candidate tier | III |
| Presentation status | trial candidate |
| Categories | qc, demo, development |

**Orientation:** Tier III candidate selected for presentation testing.

_This page is currently being shown as a library-layout test. Inclusion and tier placement remain provisional._

[Open the original source in the SAT Archive →](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/DEMO_QC.txt)

---

<pre style="white-space: pre-wrap; overflow-wrap: anywhere;">
{
  &quot;schema_version&quot;: &quot;0.1.0&quot;,
  &quot;equation_id&quot;: &quot;STD-GEO-S3X3-R4-DEFORM-0002&quot;,
  &quot;title&quot;: &quot;Carrier evolution under a volume-preserving oscillatory deformation of one 3-sphere&quot;,
  &quot;authority&quot;: {
    &quot;status&quot;: &quot;authoritative_standard_input&quot;,
    &quot;source&quot;: &quot;Standard implicit differential geometry and moving-constraint kinematics&quot;
  },
  &quot;equations&quot;: [
    {
      &quot;label&quot;: &quot;fixed_shells&quot;,
      &quot;expression&quot;: &quot;F_a(x)=||x-c_a||^2-R^2=0, a=2,3&quot;
    },
    {
      &quot;label&quot;: &quot;deformed_shell&quot;,
      &quot;expression&quot;: &quot;F_1(x,phi)=(x-c_1)^T A_1(phi)(x-c_1)-R^2=0&quot;
    },
    {
      &quot;label&quot;: &quot;shape&quot;,
      &quot;expression&quot;: &quot;A_1(phi)=diag(1,1,exp(-2 epsilon),exp(2 epsilon)), epsilon=amplitude sin(phi)&quot;
    },
    {
      &quot;label&quot;: &quot;moving_constraint&quot;,
      &quot;expression&quot;: &quot;J dx/dphi = -partial_phi F&quot;
    }
  ],
  &quot;variables&quot;: [
    {
      &quot;symbol&quot;: &quot;x&quot;,
      &quot;role&quot;: &quot;ambient point&quot;,
      &quot;unit&quot;: &quot;normalized_length&quot;,
      &quot;dimensions&quot;: {&quot;M&quot;: 0, &quot;L&quot;: 1, &quot;T&quot;: 0}
    },
    {
      &quot;symbol&quot;: &quot;R&quot;,
      &quot;role&quot;: &quot;undeformed shell radius&quot;,
      &quot;unit&quot;: &quot;normalized_length&quot;,
      &quot;dimensions&quot;: {&quot;M&quot;: 0, &quot;L&quot;: 1, &quot;T&quot;: 0}
    },
    {
      &quot;symbol&quot;: &quot;d&quot;,
      &quot;role&quot;: &quot;equilateral center separation&quot;,
      &quot;unit&quot;: &quot;normalized_length&quot;,
      &quot;dimensions&quot;: {&quot;M&quot;: 0, &quot;L&quot;: 1, &quot;T&quot;: 0}
    },
    {
      &quot;symbol&quot;: &quot;phi&quot;,
      &quot;role&quot;: &quot;deformation-cycle phase&quot;,
      &quot;unit&quot;: &quot;radian&quot;,
      &quot;dimensions&quot;: {&quot;M&quot;: 0, &quot;L&quot;: 0, &quot;T&quot;: 0}
    },
    {
      &quot;symbol&quot;: &quot;epsilon&quot;,
      &quot;role&quot;: &quot;logarithmic anisotropic deformation&quot;,
      &quot;unit&quot;: &quot;dimensionless&quot;,
      &quot;dimensions&quot;: {&quot;M&quot;: 0, &quot;L&quot;: 0, &quot;T&quot;: 0}
    }
  ],
  &quot;domain&quot;: {
    &quot;ambient_space&quot;: &quot;R^4&quot;,
    &quot;ambient_dimension&quot;: 4,
    &quot;shell_type&quot;: &quot;one quadratic ellipsoid plus two S^3 shells&quot;,
    &quot;expected_regular_intersection&quot;: &quot;closed one-dimensional carrier&quot;
  },
  &quot;assumptions&quot;: [
    &quot;All undeformed shells have common radius R.&quot;,
    &quot;The centers remain fixed at an equilateral separation d.&quot;,
    &quot;Only the first shell deforms.&quot;,
    &quot;The deformation matrix is symmetric positive definite and has determinant one.&quot;,
    &quot;Phase is a solver parameter, not physical time.&quot;
  ],
  &quot;symmetries&quot;: [
    &quot;Global translation invariance&quot;,
    &quot;Global O(4) covariance when the shell system and deformation tensor transform together&quot;,
    &quot;Full-cycle periodicity in phi&quot;
  ],
  &quot;constraints&quot;: [
    &quot;rank(J)=3 on every regular frame&quot;,
    &quot;det(A_1)=1&quot;,
    &quot;the traced carrier closes at every sampled phase&quot;
  ],
  &quot;boundary_conditions&quot;: [
    &quot;Each carrier is closed.&quot;,
    &quot;The shell geometry at phi=0 and phi=2*pi is identical.&quot;
  ],
  &quot;known_solution&quot;: {
    &quot;kind&quot;: &quot;analytic endpoints plus numerical continuation&quot;,
    &quot;endpoint_carrier_radius&quot;: &quot;sqrt(R^2-d^2/3)&quot;,
    &quot;cycle_period&quot;: &quot;2*pi&quot;,
    &quot;bifurcation_diagnostic&quot;: &quot;min singular value of J&quot;
  },
  &quot;empirical_anchors&quot;: [],
  &quot;mapping_request&quot;: {
    &quot;backend&quot;: &quot;spherical_constraint&quot;,
    &quot;operation&quot;: &quot;one_shell_shape_oscillation&quot;,
    &quot;parameters&quot;: {
      &quot;R&quot;: 1.0,
      &quot;d&quot;: 1.0,
      &quot;trace_step&quot;: 0.035,
      &quot;radius_rate&quot;: 0.0,
      &quot;internal_speed&quot;: 0.25,
      &quot;deformation_amplitude&quot;: 0.35,
      &quot;frame_count&quot;: 25,
      &quot;bifurcation_tolerance&quot;: 1e-5
    }
  },
  &quot;tolerances&quot;: {
    &quot;constraint_absolute&quot;: 1e-9,
    &quot;cycle_closure_absolute&quot;: 1e-8,
    &quot;endpoint_circumference_relative&quot;: 0.003,
    &quot;moving_constraint_absolute&quot;: 1e-9,
    &quot;shape_determinant_absolute&quot;: 1e-12
  }
}


&quot;&quot;&quot;Small dependency-free runtime validation for backend contracts.&quot;&quot;&quot;

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


class ContractError(ValueError):
    &quot;&quot;&quot;Raised when an equation packet violates the backend contract.&quot;&quot;&quot;


REQUIRED_PACKET_FIELDS = {
    &quot;schema_version&quot;,
    &quot;equation_id&quot;,
    &quot;title&quot;,
    &quot;authority&quot;,
    &quot;equations&quot;,
    &quot;variables&quot;,
    &quot;domain&quot;,
    &quot;assumptions&quot;,
    &quot;symmetries&quot;,
    &quot;constraints&quot;,
    &quot;known_solution&quot;,
    &quot;mapping_request&quot;,
    &quot;tolerances&quot;,
}

MAPPING_STATUSES = {
    &quot;exact_identity&quot;,
    &quot;exact_identity_with_numerical_verification&quot;,
    &quot;coordinate_rewrite&quot;,
    &quot;controlled_approximation&quot;,
    &quot;calibrated_representation&quot;,
    &quot;candidate_extension&quot;,
    &quot;failed_mapping&quot;,
}


def _require(condition: bool, message: str) -&gt; None:
    if not condition:
        raise ContractError(message)


def validate_equation_packet(packet: dict[str, Any]) -&gt; dict[str, Any]:
    &quot;&quot;&quot;Validate the subset of the JSON contract required by v0.1.&quot;&quot;&quot;

    missing = REQUIRED_PACKET_FIELDS.difference(packet)
    _require(not missing, f&quot;Equation packet is missing fields: {sorted(missing)}&quot;)
    _require(packet[&quot;schema_version&quot;] == &quot;0.1.0&quot;, &quot;Unsupported schema_version&quot;)
    _require(bool(packet[&quot;equation_id&quot;]), &quot;equation_id must be non-empty&quot;)
    _require(
        packet[&quot;authority&quot;].get(&quot;status&quot;) == &quot;authoritative_standard_input&quot;,
        &quot;authority.status must be authoritative_standard_input&quot;,
    )
    _require(bool(packet[&quot;authority&quot;].get(&quot;source&quot;)), &quot;authority.source is required&quot;)
    _require(isinstance(packet[&quot;equations&quot;], list) and packet[&quot;equations&quot;], &quot;equations must be non-empty&quot;)
    _require(isinstance(packet[&quot;variables&quot;], list), &quot;variables must be a list&quot;)

    for variable in packet[&quot;variables&quot;]:
        for key in (&quot;symbol&quot;, &quot;role&quot;, &quot;unit&quot;, &quot;dimensions&quot;):
            _require(key in variable, f&quot;Variable is missing {key}: {variable}&quot;)
        dims = variable[&quot;dimensions&quot;]
        _require(all(k in dims for k in (&quot;M&quot;, &quot;L&quot;, &quot;T&quot;)), f&quot;Variable dimensions need M, L, T: {variable}&quot;)

    request = packet[&quot;mapping_request&quot;]
    _require(request.get(&quot;backend&quot;) == &quot;spherical_constraint&quot;, &quot;Unsupported mapping backend&quot;)
    _require(isinstance(request.get(&quot;parameters&quot;), dict), &quot;mapping_request.parameters must be an object&quot;)
    operation = request.get(&quot;operation&quot;, &quot;equal_s3_static&quot;)
    _require(
        operation in {&quot;equal_s3_static&quot;, &quot;one_shell_shape_oscillation&quot;},
        f&quot;Unsupported spherical_constraint operation: {operation}&quot;,
    )
    parameters = request[&quot;parameters&quot;]
    for key in (&quot;R&quot;, &quot;d&quot;, &quot;trace_step&quot;, &quot;radius_rate&quot;, &quot;internal_speed&quot;):
        _require(key in parameters, f&quot;mapping_request.parameters is missing {key}&quot;)
    _require(float(parameters[&quot;R&quot;]) &gt; 0.0, &quot;R must be positive&quot;)
    _require(float(parameters[&quot;d&quot;]) &gt; 0.0, &quot;d must be positive&quot;)
    _require(float(parameters[&quot;trace_step&quot;]) &gt; 0.0, &quot;trace_step must be positive&quot;)

    if operation == &quot;one_shell_shape_oscillation&quot;:
        for key in (&quot;deformation_amplitude&quot;, &quot;frame_count&quot;, &quot;bifurcation_tolerance&quot;):
            _require(key in parameters, f&quot;deformation parameters are missing {key}&quot;)
        _require(float(parameters[&quot;deformation_amplitude&quot;]) &gt;= 0.0, &quot;deformation_amplitude must be non-negative&quot;)
        _require(int(parameters[&quot;frame_count&quot;]) &gt;= 3, &quot;frame_count must be at least three&quot;)
        _require(float(parameters[&quot;bifurcation_tolerance&quot;]) &gt; 0.0, &quot;bifurcation_tolerance must be positive&quot;)

    return packet


def validate_mapping_result(result: dict[str, Any]) -&gt; dict[str, Any]:
    _require(result.get(&quot;schema_version&quot;) == &quot;0.1.0&quot;, &quot;Unsupported result schema_version&quot;)
    _require(result.get(&quot;status&quot;) in MAPPING_STATUSES, &quot;Invalid mapping status&quot;)
    for key in (
        &quot;mapping_id&quot;,
        &quot;equation_id&quot;,
        &quot;backend&quot;,
        &quot;object_map&quot;,
        &quot;operator_map&quot;,
        &quot;constraint_realization&quot;,
        &quot;solver&quot;,
        &quot;readout_map&quot;,
        &quot;observables&quot;,
        &quot;residuals&quot;,
        &quot;diagnostics&quot;,
    ):
        _require(key in result, f&quot;Mapping result is missing {key}&quot;)
    return result


def load_equation_packet(path: str | Path) -&gt; dict[str, Any]:
    with Path(path).open(&quot;r&quot;, encoding=&quot;utf-8&quot;) as handle:
        packet = json.load(handle)
    return validate_equation_packet(packet)


&quot;&quot;&quot;One-shell deformation cycle for the spherical-constraint backend.&quot;&quot;&quot;

from __future__ import annotations

from dataclasses import dataclass
from math import cos, exp, pi, sin
from typing import Any, Sequence

import numpy as np
from numpy.typing import NDArray

from .contracts import validate_equation_packet, validate_mapping_result
from .geometry import ConstraintSystem, QuadraticShell, TraceResult, analytic_equal_s3_carrier, equal_s3_system, trace_closed_carrier


Vector = NDArray[np.float64]
Matrix = NDArray[np.float64]


@dataclass(frozen=True)
class CurveMetrics:
    circumference: float
    curvature_mean: float
    curvature_min: float
    curvature_max: float


@dataclass(frozen=True)
class DeformationFrame:
    phase: float
    epsilon: float
    shape_determinant: float
    trace: TraceResult
    metrics: CurveMetrics
    seed: Vector
    surface_forced: Vector
    internal_tangent: Vector
    total_velocity: Vector
    moving_constraint_residual: float
    minimum_jacobian_singular_value: float
    bifurcation_flag: bool


@dataclass(frozen=True)
class DeformationCycle:
    frames: tuple[DeformationFrame, ...]
    seed_cycle_error: float
    maximum_constraint_residual: float
    minimum_jacobian_singular_value: float


def oscillating_shape(phase: float, amplitude: float) -&gt; tuple[Matrix, Matrix, float]:
    &quot;&quot;&quot;Return A(phi), dA/dphi, and epsilon for a determinant-one deformation.&quot;&quot;&quot;

    epsilon = float(amplitude) * sin(float(phase))
    epsilon_rate = float(amplitude) * cos(float(phase))
    a2 = exp(-2.0 * epsilon)
    a3 = exp(2.0 * epsilon)
    shape = np.diag([1.0, 1.0, a2, a3])
    shape_rate = np.diag([0.0, 0.0, -2.0 * epsilon_rate * a2, 2.0 * epsilon_rate * a3])
    return shape, shape_rate, epsilon


def one_shell_deformed_system(
    radius: float,
    separation: float,
    phase: float,
    amplitude: float,
) -&gt; tuple[ConstraintSystem, tuple[dict[str, object], ...], float]:
    base = equal_s3_system(radius, separation)
    shape, shape_rate, epsilon = oscillating_shape(phase, amplitude)
    shells = list(base.shells)
    shells[0] = QuadraticShell(shells[0].center, shape, radius, label=&quot;S3_1_deformed&quot;)
    rates: tuple[dict[str, object], ...] = (
        {&quot;shape_rate&quot;: shape_rate},
        {},
        {},
    )
    return ConstraintSystem(shells), rates, epsilon


def discrete_curve_metrics(points: Matrix) -&gt; CurveMetrics:
    &quot;&quot;&quot;Calculate closed-polyline length and a discrete curvature estimate in R^D.&quot;&quot;&quot;

    points = np.asarray(points, dtype=float)
    if points.shape[0] &lt; 5:
        raise ValueError(&quot;At least four unique closed-curve points are required&quot;)
    unique = points[:-1] if np.linalg.norm(points[0] - points[-1]) &lt; 1e-10 else points
    previous = np.roll(unique, 1, axis=0)
    following = np.roll(unique, -1, axis=0)
    backward_segments = unique - previous
    forward_segments = following - unique
    ds_back = np.linalg.norm(backward_segments, axis=1)
    ds_forward = np.linalg.norm(forward_segments, axis=1)
    if np.any(ds_back &lt;= 0.0) or np.any(ds_forward &lt;= 0.0):
        raise ValueError(&quot;Curve contains repeated adjacent points&quot;)
    tangent_back = backward_segments / ds_back[:, None]
    tangent_forward = forward_segments / ds_forward[:, None]
    local_ds = 0.5 * (ds_back + ds_forward)
    curvature = np.linalg.norm(tangent_forward - tangent_back, axis=1) / local_ds
    circumference = float(np.sum(ds_forward))
    return CurveMetrics(
        circumference=circumference,
        curvature_mean=float(np.mean(curvature)),
        curvature_min=float(np.min(curvature)),
        curvature_max=float(np.max(curvature)),
    )


def trace_deformation_cycle(
    *,
    radius: float,
    separation: float,
    amplitude: float,
    frame_count: int,
    trace_step: float,
    internal_speed: float,
    bifurcation_tolerance: float,
) -&gt; DeformationCycle:
    rho, _ = analytic_equal_s3_carrier(radius, separation)
    phases = np.linspace(0.0, 2.0 * pi, int(frame_count), endpoint=True)
    initial_seed = np.array([0.0, 0.0, rho, 0.0])
    seed = initial_seed.copy()
    tangent_reference: Vector | None = None
    frames: list[DeformationFrame] = []

    for index, phase in enumerate(phases):
        system, rates, epsilon = one_shell_deformed_system(radius, separation, float(phase), amplitude)
        if index &gt; 0:
            if tangent_reference is None:
                raise RuntimeError(&quot;Missing tangent reference&quot;)
            seed = system.correct_to_carrier(seed, tangent_reference)
        tangent_reference = system.tangent(seed, reference=tangent_reference)
        trace = trace_closed_carrier(system, seed, step_size=trace_step)
        metrics = discrete_curve_metrics(trace.points)
        velocity = system.velocity_decomposition(
            seed,
            rates,
            internal_speed=internal_speed,
            tangent_reference=tangent_reference,
        )
        moving_residual = float(
            np.linalg.norm(system.jacobian(seed) @ velocity.surface_forced + velocity.parameter_derivatives)
        )
        singular_minimum = min(float(system.singular_values(point)[-1]) for point in trace.points[:-1])
        frames.append(
            DeformationFrame(
                phase=float(phase),
                epsilon=epsilon,
                shape_determinant=float(np.linalg.det(system.shells[0].shape)),
                trace=trace,
                metrics=metrics,
                seed=seed.copy(),
                surface_forced=velocity.surface_forced.copy(),
                internal_tangent=velocity.internal_tangent.copy(),
                total_velocity=velocity.total.copy(),
                moving_constraint_residual=moving_residual,
                minimum_jacobian_singular_value=singular_minimum,
                bifurcation_flag=singular_minimum &lt;= bifurcation_tolerance,
            )
        )

    return DeformationCycle(
        frames=tuple(frames),
        seed_cycle_error=float(np.linalg.norm(frames[-1].seed - initial_seed)),
        maximum_constraint_residual=max(frame.trace.max_constraint_residual for frame in frames),
        minimum_jacobian_singular_value=min(frame.minimum_jacobian_singular_value for frame in frames),
    )


def deformation_result(packet: dict[str, Any]) -&gt; tuple[dict[str, Any], DeformationCycle]:
    packet = validate_equation_packet(packet)
    params = packet[&quot;mapping_request&quot;][&quot;parameters&quot;]
    cycle = trace_deformation_cycle(
        radius=float(params[&quot;R&quot;]),
        separation=float(params[&quot;d&quot;]),
        amplitude=float(params[&quot;deformation_amplitude&quot;]),
        frame_count=int(params[&quot;frame_count&quot;]),
        trace_step=float(params[&quot;trace_step&quot;]),
        internal_speed=float(params[&quot;internal_speed&quot;]),
        bifurcation_tolerance=float(params[&quot;bifurcation_tolerance&quot;]),
    )
    frame_rows = [
        {
            &quot;frame&quot;: index,
            &quot;phase&quot;: frame.phase,
            &quot;epsilon&quot;: frame.epsilon,
            &quot;shape_determinant&quot;: frame.shape_determinant,
            &quot;circumference&quot;: frame.metrics.circumference,
            &quot;curvature_mean&quot;: frame.metrics.curvature_mean,
            &quot;curvature_min&quot;: frame.metrics.curvature_min,
            &quot;curvature_max&quot;: frame.metrics.curvature_max,
            &quot;surface_forced_speed_per_phase&quot;: float(np.linalg.norm(frame.surface_forced)),
            &quot;internal_speed_per_phase&quot;: float(np.linalg.norm(frame.internal_tangent)),
            &quot;moving_constraint_residual&quot;: frame.moving_constraint_residual,
            &quot;constraint_max_absolute&quot;: frame.trace.max_constraint_residual,
            &quot;minimum_jacobian_singular_value&quot;: frame.minimum_jacobian_singular_value,
            &quot;bifurcation_flag&quot;: frame.bifurcation_flag,
            &quot;point_count&quot;: int(frame.trace.points.shape[0]),
        }
        for index, frame in enumerate(cycle.frames)
    ]
    first = cycle.frames[0]
    last = cycle.frames[-1]
    circumference_cycle_error = abs(last.metrics.circumference - first.metrics.circumference)
    curvature_cycle_error = abs(last.metrics.curvature_mean - first.metrics.curvature_mean)
    determinant_error = max(abs(frame.shape_determinant - 1.0) for frame in cycle.frames)
    result = {
        &quot;schema_version&quot;: &quot;0.1.0&quot;,
        &quot;mapping_id&quot;: f&quot;MAP-{packet[&#x27;equation_id&#x27;]}-SPHERICAL-DEFORM-0001&quot;,
        &quot;equation_id&quot;: packet[&quot;equation_id&quot;],
        &quot;backend&quot;: &quot;spherical_constraint&quot;,
        &quot;status&quot;: &quot;coordinate_rewrite&quot;,
        &quot;object_map&quot;: {
            &quot;deforming_standard_shell&quot;: &quot;time-parameterized QuadraticShell&quot;,
            &quot;fixed_standard_shells&quot;: &quot;two QuadraticShell instances&quot;,
            &quot;common_intersection&quot;: &quot;evolving closed one-dimensional carrier&quot;,
            &quot;ambient_space&quot;: &quot;R^4&quot;,
            &quot;ontology_claim&quot;: &quot;none; computational representation only&quot;
        },
        &quot;operator_map&quot;: {
            &quot;shape_deformation&quot;: &quot;A_1(phi)=diag(1,1,exp(-2 epsilon),exp(2 epsilon))&quot;,
            &quot;shape_rate&quot;: &quot;analytic dA_1/dphi&quot;,
            &quot;carrier_tangent&quot;: &quot;one-dimensional nullspace of J&quot;,
            &quot;surface_forced_velocity&quot;: &quot;-pinv(J) partial_phi(F)&quot;,
            &quot;internal_velocity&quot;: &quot;u t&quot;,
            &quot;superhelical_nesting&quot;: &quot;not invoked&quot;,
            &quot;braid_nesting&quot;: &quot;not invoked&quot;
        },
        &quot;constraint_realization&quot;: {
            &quot;constraint_count&quot;: 3,
            &quot;ambient_dimension&quot;: 4,
            &quot;phase_interval&quot;: [0.0, 2.0 * pi],
            &quot;frame_count&quot;: len(cycle.frames),
            &quot;shape_determinant_target&quot;: 1.0
        },
        &quot;solver&quot;: {
            &quot;method&quot;: &quot;frame continuation plus closed-carrier predictor-corrector tracing&quot;,
            &quot;trace_step&quot;: float(params[&quot;trace_step&quot;]),
            &quot;seed_transport&quot;: &quot;previous-frame seed corrected into current constraints&quot;
        },
        &quot;readout_map&quot;: {
            &quot;history&quot;: &quot;per-frame carrier circumference, discrete curvature, velocity decomposition, and rank margin&quot;,
            &quot;curve_coordinates&quot;: &quot;exported separately as concatenated R^4 point arrays&quot;,
            &quot;phase_warning&quot;: &quot;velocity values are per unit deformation phase, not per unit physical time&quot;
        },
        &quot;observables&quot;: {
            &quot;deformation_amplitude&quot;: float(params[&quot;deformation_amplitude&quot;]),
            &quot;circumference_min&quot;: min(frame.metrics.circumference for frame in cycle.frames),
            &quot;circumference_max&quot;: max(frame.metrics.circumference for frame in cycle.frames),
            &quot;curvature_mean_min&quot;: min(frame.metrics.curvature_mean for frame in cycle.frames),
            &quot;curvature_mean_max&quot;: max(frame.metrics.curvature_mean for frame in cycle.frames),
            &quot;surface_forced_speed_max_per_phase&quot;: max(float(np.linalg.norm(frame.surface_forced)) for frame in cycle.frames),
            &quot;minimum_jacobian_singular_value&quot;: cycle.minimum_jacobian_singular_value,
            &quot;bifurcation_detected&quot;: any(frame.bifurcation_flag for frame in cycle.frames),
            &quot;frame_history&quot;: frame_rows
        },
        &quot;residuals&quot;: {
            &quot;constraint_max_absolute&quot;: cycle.maximum_constraint_residual,
            &quot;seed_cycle_closure_absolute&quot;: cycle.seed_cycle_error,
            &quot;circumference_cycle_closure_absolute&quot;: circumference_cycle_error,
            &quot;curvature_cycle_closure_absolute&quot;: curvature_cycle_error,
            &quot;shape_determinant_max_absolute&quot;: determinant_error,
            &quot;moving_constraint_max_absolute&quot;: max(frame.moving_constraint_residual for frame in cycle.frames)
        },
        &quot;diagnostics&quot;: {
            &quot;bifurcation_indicator&quot;: &quot;minimum singular value of J over each carrier&quot;,
            &quot;bifurcation_tolerance&quot;: float(params[&quot;bifurcation_tolerance&quot;]),
            &quot;bifurcation_frames&quot;: [index for index, frame in enumerate(cycle.frames) if frame.bifurcation_flag],
            &quot;endpoint_geometry&quot;: &quot;identical by construction at phi=0 and phi=2*pi&quot;
        },
        &quot;provenance&quot;: {
            &quot;input_authority&quot;: packet[&quot;authority&quot;],
            &quot;calibrations&quot;: [],
            &quot;candidate_physics&quot;: [],
            &quot;silent_repairs&quot;: []
        }
    }
    return validate_mapping_result(result), cycle


def concatenate_cycle_points(frames: Sequence[DeformationFrame]) -&gt; tuple[Matrix, NDArray[np.int64]]:
    lengths = np.array([frame.trace.points.shape[0] for frame in frames], dtype=np.int64)
    offsets = np.concatenate((np.array([0], dtype=np.int64), np.cumsum(lengths)))
    points = np.vstack([frame.trace.points for frame in frames])
    return points, offsets


&quot;&quot;&quot;Quadratic shell constraints and one-dimensional carrier tracing.&quot;&quot;&quot;

from __future__ import annotations

from dataclasses import dataclass
from math import pi, sqrt
from typing import Iterable, Sequence

import numpy as np
from numpy.typing import NDArray
from scipy.optimize import least_squares


Vector = NDArray[np.float64]
Matrix = NDArray[np.float64]


@dataclass(frozen=True)
class QuadraticShell:
    &quot;&quot;&quot;A shell F(x)=(x-c)^T A (x-c)-R^2=0.&quot;&quot;&quot;

    center: Vector
    shape: Matrix
    radius: float
    label: str = &quot;shell&quot;

    def __post_init__(self) -&gt; None:
        center = np.asarray(self.center, dtype=float)
        shape = np.asarray(self.shape, dtype=float)
        if center.ndim != 1:
            raise ValueError(&quot;center must be one-dimensional&quot;)
        if shape.shape != (center.size, center.size):
            raise ValueError(&quot;shape must be square and match center dimension&quot;)
        if not np.allclose(shape, shape.T, atol=1e-12):
            raise ValueError(&quot;shape must be symmetric&quot;)
        if np.min(np.linalg.eigvalsh(shape)) &lt;= 0.0:
            raise ValueError(&quot;shape must be positive definite&quot;)
        if self.radius &lt;= 0.0:
            raise ValueError(&quot;radius must be positive&quot;)
        object.__setattr__(self, &quot;center&quot;, center)
        object.__setattr__(self, &quot;shape&quot;, shape)
        object.__setattr__(self, &quot;radius&quot;, float(self.radius))

    @property
    def dimension(self) -&gt; int:
        return int(self.center.size)

    def value(self, x: Vector) -&gt; float:
        delta = np.asarray(x, dtype=float) - self.center
        return float(delta @ self.shape @ delta - self.radius**2)

    def gradient(self, x: Vector) -&gt; Vector:
        delta = np.asarray(x, dtype=float) - self.center
        return 2.0 * self.shape @ delta

    def parameter_derivative(
        self,
        x: Vector,
        *,
        center_velocity: Vector | None = None,
        shape_rate: Matrix | None = None,
        radius_rate: float = 0.0,
    ) -&gt; float:
        &quot;&quot;&quot;Partial derivative of F at fixed x under shell-parameter motion.&quot;&quot;&quot;

        delta = np.asarray(x, dtype=float) - self.center
        c_dot = np.zeros(self.dimension) if center_velocity is None else np.asarray(center_velocity, dtype=float)
        a_dot = np.zeros_like(self.shape) if shape_rate is None else np.asarray(shape_rate, dtype=float)
        return float(delta @ a_dot @ delta - 2.0 * c_dot @ self.shape @ delta - 2.0 * self.radius * radius_rate)

    def transformed(self, rotation: Matrix, translation: Vector) -&gt; &quot;QuadraticShell&quot;:
        rotation = np.asarray(rotation, dtype=float)
        translation = np.asarray(translation, dtype=float)
        return QuadraticShell(
            center=rotation @ self.center + translation,
            shape=rotation @ self.shape @ rotation.T,
            radius=self.radius,
            label=self.label,
        )


@dataclass(frozen=True)
class VelocityDecomposition:
    surface_forced: Vector
    internal_tangent: Vector
    total: Vector
    tangent: Vector
    parameter_derivatives: Vector


@dataclass(frozen=True)
class TraceResult:
    points: Matrix
    circumference: float
    max_constraint_residual: float
    steps: int
    closure_error: float


class ConstraintSystem:
    def __init__(self, shells: Sequence[QuadraticShell]):
        if not shells:
            raise ValueError(&quot;At least one shell is required&quot;)
        dimension = shells[0].dimension
        if any(shell.dimension != dimension for shell in shells):
            raise ValueError(&quot;All shells must share an ambient dimension&quot;)
        self.shells = tuple(shells)
        self.dimension = dimension

    def values(self, x: Vector) -&gt; Vector:
        return np.array([shell.value(x) for shell in self.shells], dtype=float)

    def jacobian(self, x: Vector) -&gt; Matrix:
        return np.vstack([shell.gradient(x) for shell in self.shells])

    def singular_values(self, x: Vector) -&gt; Vector:
        return np.linalg.svd(self.jacobian(x), compute_uv=False)

    def rank(self, x: Vector, tolerance: float = 1e-10) -&gt; int:
        return int(np.linalg.matrix_rank(self.jacobian(x), tol=tolerance))

    def tangent(self, x: Vector, *, reference: Vector | None = None) -&gt; Vector:
        jacobian = self.jacobian(x)
        _, singular_values, vh = np.linalg.svd(jacobian, full_matrices=True)
        rank = int(np.sum(singular_values &gt; 1e-10))
        nullity = self.dimension - rank
        if nullity != 1:
            raise ValueError(f&quot;Expected one-dimensional nullspace, found nullity={nullity}&quot;)
        tangent = vh[-1].astype(float)
        tangent /= np.linalg.norm(tangent)
        if reference is not None and float(tangent @ reference) &lt; 0.0:
            tangent = -tangent
        return tangent

    def velocity_decomposition(
        self,
        x: Vector,
        shell_rates: Sequence[dict[str, object]],
        *,
        internal_speed: float = 0.0,
        tangent_reference: Vector | None = None,
    ) -&gt; VelocityDecomposition:
        if len(shell_rates) != len(self.shells):
            raise ValueError(&quot;One rate dictionary is required per shell&quot;)
        partials = np.array(
            [shell.parameter_derivative(x, **rates) for shell, rates in zip(self.shells, shell_rates, strict=True)],
            dtype=float,
        )
        jacobian = self.jacobian(x)
        surface = -np.linalg.pinv(jacobian) @ partials
        tangent = self.tangent(x, reference=tangent_reference)
        internal = float(internal_speed) * tangent
        return VelocityDecomposition(
            surface_forced=surface,
            internal_tangent=internal,
            total=surface + internal,
            tangent=tangent,
            parameter_derivatives=partials,
        )

    def correct_to_carrier(self, predictor: Vector, normal: Vector, *, tolerance: float = 1e-12) -&gt; Vector:
        predictor = np.asarray(predictor, dtype=float)
        normal = np.asarray(normal, dtype=float)

        def augmented_residual(x: Vector) -&gt; Vector:
            return np.concatenate((self.values(x), [float((x - predictor) @ normal)]))

        result = least_squares(
            augmented_residual,
            predictor,
            xtol=tolerance,
            ftol=tolerance,
            gtol=tolerance,
            max_nfev=200,
        )
        if not result.success or np.max(np.abs(self.values(result.x))) &gt; 1e-9:
            raise RuntimeError(f&quot;Carrier correction failed: {result.message}&quot;)
        return result.x.astype(float)

    def transformed(self, rotation: Matrix, translation: Vector) -&gt; &quot;ConstraintSystem&quot;:
        return ConstraintSystem([shell.transformed(rotation, translation) for shell in self.shells])


def analytic_equal_s3_carrier(radius: float, separation: float) -&gt; tuple[float, float]:
    if radius &lt;= 0.0 or separation &lt;= 0.0:
        raise ValueError(&quot;radius and separation must be positive&quot;)
    squared = radius**2 - separation**2 / 3.0
    if squared &lt;= 0.0:
        raise ValueError(&quot;No regular S^1 carrier: require d &lt; sqrt(3) R&quot;)
    rho = sqrt(squared)
    return rho, 2.0 * pi * rho


def equal_s3_system(radius: float, separation: float) -&gt; ConstraintSystem:
    &quot;&quot;&quot;Three equal S^3 shells centered on an equilateral triangle in x0-x1.&quot;&quot;&quot;

    circumradius = separation / sqrt(3.0)
    centers = (
        np.array([0.0, circumradius, 0.0, 0.0]),
        np.array([-separation / 2.0, -circumradius / 2.0, 0.0, 0.0]),
        np.array([separation / 2.0, -circumradius / 2.0, 0.0, 0.0]),
    )
    identity = np.eye(4)
    return ConstraintSystem(
        [QuadraticShell(center, identity, radius, label=f&quot;S3_{index + 1}&quot;) for index, center in enumerate(centers)]
    )


def trace_closed_carrier(
    system: ConstraintSystem,
    start: Vector,
    *,
    step_size: float,
    max_steps: int = 5000,
    min_steps: int = 20,
    closure_factor: float = 1.25,
) -&gt; TraceResult:
    &quot;&quot;&quot;Trace a regular closed one-dimensional carrier by predictor-corrector continuation.&quot;&quot;&quot;

    start = np.asarray(start, dtype=float)
    if np.max(np.abs(system.values(start))) &gt; 1e-8:
        raise ValueError(&quot;start must lie on the carrier&quot;)
    points = [start.copy()]
    tangent = system.tangent(start)
    initial_tangent = tangent.copy()
    circumference = 0.0
    residual = float(np.max(np.abs(system.values(start))))

    for step in range(1, max_steps + 1):
        current = points[-1]
        tangent = system.tangent(current, reference=tangent)
        predictor = current + step_size * tangent
        corrected = system.correct_to_carrier(predictor, tangent)
        segment = float(np.linalg.norm(corrected - current))
        if segment &lt;= 1e-14:
            raise RuntimeError(&quot;Continuation stalled&quot;)
        points.append(corrected)
        circumference += segment
        residual = max(residual, float(np.max(np.abs(system.values(corrected)))))

        if step &gt;= min_steps:
            new_tangent = system.tangent(corrected, reference=tangent)
            distance_to_start = float(np.linalg.norm(corrected - start))
            if distance_to_start &lt; closure_factor * step_size and float(new_tangent @ initial_tangent) &gt; 0.8:
                circumference += distance_to_start
                points.append(start.copy())
                return TraceResult(
                    points=np.vstack(points),
                    circumference=circumference,
                    max_constraint_residual=residual,
                    steps=step,
                    closure_error=distance_to_start,
                )

    raise RuntimeError(&quot;Carrier did not close within max_steps&quot;)


def max_constraint_residual(system: ConstraintSystem, points: Iterable[Vector]) -&gt; float:
    return max(float(np.max(np.abs(system.values(point)))) for point in points)


&quot;&quot;&quot;Standard-equation packet to H(s)H geometric round trip.&quot;&quot;&quot;

from __future__ import annotations

from math import sqrt
from typing import Any

import numpy as np

from .contracts import validate_equation_packet, validate_mapping_result
from .geometry import analytic_equal_s3_carrier, equal_s3_system, trace_closed_carrier


def _relative_error(calculated: float, expected: float) -&gt; float:
    return abs(calculated - expected) / abs(expected) if expected != 0.0 else abs(calculated)


def run_roundtrip(packet: dict[str, Any]) -&gt; dict[str, Any]:
    packet = validate_equation_packet(packet)
    params = packet[&quot;mapping_request&quot;][&quot;parameters&quot;]
    radius = float(params[&quot;R&quot;])
    separation = float(params[&quot;d&quot;])
    trace_step = float(params[&quot;trace_step&quot;])
    radius_rate = float(params[&quot;radius_rate&quot;])
    internal_speed = float(params[&quot;internal_speed&quot;])

    rho_exact, circumference_exact = analytic_equal_s3_carrier(radius, separation)
    system = equal_s3_system(radius, separation)
    start = np.array([0.0, 0.0, rho_exact, 0.0])
    trace = trace_closed_carrier(system, start, step_size=trace_step)

    points = trace.points[:-1]
    radii = np.linalg.norm(points[:, 2:4], axis=1)
    rho_numeric = float(np.mean(radii))
    radius_spread = float(np.max(np.abs(radii - rho_exact)))

    rates = [{&quot;radius_rate&quot;: radius_rate} for _ in system.shells]
    velocity = system.velocity_decomposition(start, rates, internal_speed=internal_speed)
    forced_speed_exact = radius * radius_rate / rho_exact
    forced_speed_numeric = float(velocity.surface_forced[2])
    tangent_constraint_residual = float(np.linalg.norm(system.jacobian(start) @ velocity.internal_tangent))
    velocity_constraint_residual = float(
        np.linalg.norm(system.jacobian(start) @ velocity.surface_forced + velocity.parameter_derivatives)
    )

    near_critical_d = sqrt(3.0) * radius * (1.0 - 1e-8)
    near_rho, _ = analytic_equal_s3_carrier(radius, near_critical_d)
    near_system = equal_s3_system(radius, near_critical_d)
    near_start = np.array([0.0, 0.0, near_rho, 0.0])
    regular_singular_values = system.singular_values(start)
    near_singular_values = near_system.singular_values(near_start)

    result = {
        &quot;schema_version&quot;: &quot;0.1.0&quot;,
        &quot;mapping_id&quot;: f&quot;MAP-{packet[&#x27;equation_id&#x27;]}-SPHERICAL-0001&quot;,
        &quot;equation_id&quot;: packet[&quot;equation_id&quot;],
        &quot;backend&quot;: &quot;spherical_constraint&quot;,
        &quot;status&quot;: &quot;exact_identity_with_numerical_verification&quot;,
        &quot;object_map&quot;: {
            &quot;standard_shell&quot;: &quot;QuadraticShell&quot;,
            &quot;common_intersection&quot;: &quot;one-dimensional carrier&quot;,
            &quot;carrier_topology&quot;: &quot;S^1&quot;,
            &quot;ambient_space&quot;: &quot;R^4&quot;,
            &quot;ontology_claim&quot;: &quot;none; computational representation only&quot;
        },
        &quot;operator_map&quot;: {
            &quot;intersection&quot;: &quot;simultaneous constraint solution F_1=F_2=F_3=0&quot;,
            &quot;carrier_tangent&quot;: &quot;normalized one-dimensional nullspace of J&quot;,
            &quot;surface_forced_velocity&quot;: &quot;-pinv(J) partial_lambda(F)&quot;,
            &quot;internal_velocity&quot;: &quot;u t&quot;,
            &quot;superhelical_nesting&quot;: &quot;not invoked&quot;,
            &quot;braid_nesting&quot;: &quot;not invoked&quot;
        },
        &quot;constraint_realization&quot;: {
            &quot;equation&quot;: &quot;F_a(x)=(x-c_a)^T A_a (x-c_a)-R_a^2=0&quot;,
            &quot;constraint_count&quot;: 3,
            &quot;ambient_dimension&quot;: 4,
            &quot;regular_rank&quot;: system.rank(start),
            &quot;regular_nullity&quot;: 4 - system.rank(start)
        },
        &quot;solver&quot;: {
            &quot;method&quot;: &quot;pseudo-arclength-style predictor-corrector continuation&quot;,
            &quot;corrector&quot;: &quot;nonlinear least squares with tangent hyperplane gauge&quot;,
            &quot;trace_step&quot;: trace_step,
            &quot;steps&quot;: trace.steps
        },
        &quot;readout_map&quot;: {
            &quot;carrier_radius&quot;: &quot;mean Euclidean radius in the plane orthogonal to the center triangle&quot;,
            &quot;carrier_circumference&quot;: &quot;closed traced polyline length&quot;,
            &quot;velocity&quot;: &quot;v_total=v_surface+v_internal&quot;
        },
        &quot;observables&quot;: {
            &quot;carrier_radius_exact&quot;: rho_exact,
            &quot;carrier_radius_numeric&quot;: rho_numeric,
            &quot;carrier_circumference_exact&quot;: circumference_exact,
            &quot;carrier_circumference_numeric&quot;: trace.circumference,
            &quot;surface_forced_speed_exact&quot;: forced_speed_exact,
            &quot;surface_forced_speed_numeric&quot;: forced_speed_numeric,
            &quot;internal_speed&quot;: float(np.linalg.norm(velocity.internal_tangent)),
            &quot;total_velocity&quot;: velocity.total.tolist()
        },
        &quot;residuals&quot;: {
            &quot;carrier_radius_relative&quot;: _relative_error(rho_numeric, rho_exact),
            &quot;carrier_circumference_relative&quot;: _relative_error(trace.circumference, circumference_exact),
            &quot;surface_forced_speed_relative&quot;: _relative_error(forced_speed_numeric, forced_speed_exact),
            &quot;radius_pointwise_max_absolute&quot;: radius_spread,
            &quot;constraint_max_absolute&quot;: trace.max_constraint_residual,
            &quot;internal_tangent_constraint_norm&quot;: tangent_constraint_residual,
            &quot;surface_velocity_constraint_norm&quot;: velocity_constraint_residual
        },
        &quot;diagnostics&quot;: {
            &quot;regular_jacobian_singular_values&quot;: regular_singular_values.tolist(),
            &quot;near_bifurcation_separation&quot;: near_critical_d,
            &quot;near_bifurcation_carrier_radius&quot;: near_rho,
            &quot;near_bifurcation_jacobian_singular_values&quot;: near_singular_values.tolist(),
            &quot;smallest_singular_value_ratio&quot;: float(near_singular_values[-1] / regular_singular_values[-1]),
            &quot;bifurcation_condition&quot;: &quot;smallest singular value tends to zero as d tends to sqrt(3)R&quot;
        },
        &quot;provenance&quot;: {
            &quot;input_authority&quot;: packet[&quot;authority&quot;],
            &quot;calibrations&quot;: [],
            &quot;candidate_physics&quot;: [],
            &quot;silent_repairs&quot;: []
        }
    }
    return validate_mapping_result(result)


&quot;&quot;&quot;Small dependency-free runtime validation for backend contracts.&quot;&quot;&quot;

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


class ContractError(ValueError):
    &quot;&quot;&quot;Raised when an equation packet violates the backend contract.&quot;&quot;&quot;


REQUIRED_PACKET_FIELDS = {
    &quot;schema_version&quot;,
    &quot;equation_id&quot;,
    &quot;title&quot;,
    &quot;authority&quot;,
    &quot;equations&quot;,
    &quot;variables&quot;,
    &quot;domain&quot;,
    &quot;assumptions&quot;,
    &quot;symmetries&quot;,
    &quot;constraints&quot;,
    &quot;known_solution&quot;,
    &quot;mapping_request&quot;,
    &quot;tolerances&quot;,
}

MAPPING_STATUSES = {
    &quot;exact_identity&quot;,
    &quot;exact_identity_with_numerical_verification&quot;,
    &quot;coordinate_rewrite&quot;,
    &quot;controlled_approximation&quot;,
    &quot;calibrated_representation&quot;,
    &quot;candidate_extension&quot;,
    &quot;failed_mapping&quot;,
}


def _require(condition: bool, message: str) -&gt; None:
    if not condition:
        raise ContractError(message)


def validate_equation_packet(packet: dict[str, Any]) -&gt; dict[str, Any]:
    &quot;&quot;&quot;Validate the subset of the JSON contract required by v0.1.&quot;&quot;&quot;

    missing = REQUIRED_PACKET_FIELDS.difference(packet)
    _require(not missing, f&quot;Equation packet is missing fields: {sorted(missing)}&quot;)
    _require(packet[&quot;schema_version&quot;] == &quot;0.1.0&quot;, &quot;Unsupported schema_version&quot;)
    _require(bool(packet[&quot;equation_id&quot;]), &quot;equation_id must be non-empty&quot;)
    _require(
        packet[&quot;authority&quot;].get(&quot;status&quot;) == &quot;authoritative_standard_input&quot;,
        &quot;authority.status must be authoritative_standard_input&quot;,
    )
    _require(bool(packet[&quot;authority&quot;].get(&quot;source&quot;)), &quot;authority.source is required&quot;)
    _require(isinstance(packet[&quot;equations&quot;], list) and packet[&quot;equations&quot;], &quot;equations must be non-empty&quot;)
    _require(isinstance(packet[&quot;variables&quot;], list), &quot;variables must be a list&quot;)

    for variable in packet[&quot;variables&quot;]:
        for key in (&quot;symbol&quot;, &quot;role&quot;, &quot;unit&quot;, &quot;dimensions&quot;):
            _require(key in variable, f&quot;Variable is missing {key}: {variable}&quot;)
        dims = variable[&quot;dimensions&quot;]
        _require(all(k in dims for k in (&quot;M&quot;, &quot;L&quot;, &quot;T&quot;)), f&quot;Variable dimensions need M, L, T: {variable}&quot;)

    request = packet[&quot;mapping_request&quot;]
    _require(request.get(&quot;backend&quot;) == &quot;spherical_constraint&quot;, &quot;Unsupported mapping backend&quot;)
    _require(isinstance(request.get(&quot;parameters&quot;), dict), &quot;mapping_request.parameters must be an object&quot;)
    parameters = request[&quot;parameters&quot;]
    for key in (&quot;R&quot;, &quot;d&quot;, &quot;trace_step&quot;, &quot;radius_rate&quot;, &quot;internal_speed&quot;):
        _require(key in parameters, f&quot;mapping_request.parameters is missing {key}&quot;)
    _require(float(parameters[&quot;R&quot;]) &gt; 0.0, &quot;R must be positive&quot;)
    _require(float(parameters[&quot;d&quot;]) &gt; 0.0, &quot;d must be positive&quot;)
    _require(float(parameters[&quot;trace_step&quot;]) &gt; 0.0, &quot;trace_step must be positive&quot;)

    return packet


def validate_mapping_result(result: dict[str, Any]) -&gt; dict[str, Any]:
    _require(result.get(&quot;schema_version&quot;) == &quot;0.1.0&quot;, &quot;Unsupported result schema_version&quot;)
    _require(result.get(&quot;status&quot;) in MAPPING_STATUSES, &quot;Invalid mapping status&quot;)
    for key in (
        &quot;mapping_id&quot;,
        &quot;equation_id&quot;,
        &quot;backend&quot;,
        &quot;object_map&quot;,
        &quot;operator_map&quot;,
        &quot;constraint_realization&quot;,
        &quot;solver&quot;,
        &quot;readout_map&quot;,
        &quot;observables&quot;,
        &quot;residuals&quot;,
        &quot;diagnostics&quot;,
    ):
        _require(key in result, f&quot;Mapping result is missing {key}&quot;)
    return result


def load_equation_packet(path: str | Path) -&gt; dict[str, Any]:
    with Path(path).open(&quot;r&quot;, encoding=&quot;utf-8&quot;) as handle:
        packet = json.load(handle)
    return validate_equation_packet(packet)

</pre>
