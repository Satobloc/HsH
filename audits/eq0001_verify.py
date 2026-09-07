#!/usr/bin/env python3
"""Independent standard-library audit of H(s)H ledger equation EQ-0001."""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path


def dot(left: tuple[float, ...], right: tuple[float, ...]) -> float:
    return sum(a * b for a, b in zip(left, right, strict=True))


def audit(radius: float, separation: float, radius_rate: float) -> dict[str, object]:
    if radius <= 0 or not 0 < separation < math.sqrt(3) * radius:
        raise ValueError("require R>0 and 0<d<sqrt(3)R")
    a = separation / math.sqrt(3)
    rho = math.sqrt(radius * radius - separation * separation / 3)
    centers = (
        (0.0, a, 0.0, 0.0),
        (-separation / 2, -a / 2, 0.0, 0.0),
        (separation / 2, -a / 2, 0.0, 0.0),
    )
    point = (0.0, 0.0, rho, 0.0)
    residuals = [dot(tuple(x - c for x, c in zip(point, center, strict=True)), tuple(x - c for x, c in zip(point, center, strict=True))) - radius * radius for center in centers]
    jacobian = [tuple(2 * (x - c) for x, c in zip(point, center, strict=True)) for center in centers]
    columns = [tuple(row[index] for row in jacobian) for index in range(4)]
    gram = [[dot(left, right) for right in columns] for left in columns]
    singular_values = sorted((math.sqrt(2) * separation, math.sqrt(2) * separation, 2 * math.sqrt(3) * rho), reverse=True)
    surface_velocity = (0.0, 0.0, radius * radius_rate / rho, 0.0)
    velocity_lhs = [dot(row, surface_velocity) for row in jacobian]
    velocity_rhs = [2 * radius * radius_rate] * 3
    tolerance = 1e-12
    assert max(map(abs, residuals)) < tolerance
    assert abs(gram[0][1]) < tolerance and abs(gram[0][2]) < tolerance and abs(gram[1][2]) < tolerance
    assert max(abs(a - b) for a, b in zip(velocity_lhs, velocity_rhs, strict=True)) < tolerance
    return {
        "equation_id": "EQ-0001",
        "inputs": {"R": radius, "d": separation, "Rdot": radius_rate},
        "rho": rho,
        "circumference": 2 * math.pi * rho,
        "jacobian_singular_values": singular_values,
        "regular_rank": 3,
        "critical_separation": math.sqrt(3) * radius,
        "critical_rank": 2,
        "surface_velocity": surface_velocity,
        "max_constraint_residual": max(map(abs, residuals)),
        "max_velocity_residual": max(abs(a - b) for a, b in zip(velocity_lhs, velocity_rhs, strict=True)),
        "scope": "Euclidean benchmark only; no H(s)H model-selection or physical claim",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--radius", type=float, default=1.0)
    parser.add_argument("--separation", type=float, default=1.0)
    parser.add_argument("--radius-rate", type=float, default=0.1)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = audit(args.radius, args.separation, args.radius_rate)
    content = json.dumps(result, indent=2) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(content, encoding="utf-8", newline="\n")
    print(content, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
