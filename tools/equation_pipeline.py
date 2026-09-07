#!/usr/bin/env python3
"""Validate H(s)H equation records, run bounded checks, and emit Lean modules."""

from __future__ import annotations

import argparse
import ast
import hashlib
import json
import math
import operator
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
import shlex
import subprocess
import sys
from typing import Any

TOOL_VERSION = "equation-pipeline/0.1.0"
PROVENANCE = {"OBS", "STD", "SAT", "SRC", "GEN"}
MATURITY = {"FROZEN", "DERIVED", "ACTIVE", "CANDIDATE", "HISTORICAL", "QUARANTINED", "REJECTED", "OPEN"}
CHECK_KINDS = {"dimensions", "numeric_close", "sympy_zero"}


@dataclass(frozen=True)
class CheckResult:
    equation_id: str
    check_id: str
    kind: str
    status: str
    detail: str

    def as_dict(self) -> dict[str, str]:
        return {
            "equation_id": self.equation_id,
            "check_id": self.check_id,
            "kind": self.kind,
            "status": self.status,
            "detail": self.detail,
        }


def load_registry(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def validate_registry(registry: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    if registry.get("schema_version") != 1:
        errors.append("schema_version must equal 1")
    equations = registry.get("equations")
    if not isinstance(equations, list):
        return errors + ["equations must be a list"]
    ids: set[str] = set()
    for index, equation in enumerate(equations):
        where = f"equations[{index}]"
        if not isinstance(equation, dict):
            errors.append(f"{where} must be an object")
            continue
        required = {"id", "title", "source", "provenance", "maturity", "dependencies", "symbols", "assumptions", "statement", "checks", "open_edge"}
        missing = sorted(required - equation.keys())
        if missing:
            errors.append(f"{where} missing: {', '.join(missing)}")
        eq_id = equation.get("id")
        if not isinstance(eq_id, str) or len(eq_id) != 7 or not eq_id.startswith("EQ-") or not eq_id[3:].isdigit():
            errors.append(f"{where}.id must match EQ-0000")
        elif eq_id in ids:
            errors.append(f"duplicate equation id: {eq_id}")
        else:
            ids.add(eq_id)
        if equation.get("provenance") not in PROVENANCE:
            errors.append(f"{where}.provenance is invalid")
        if equation.get("maturity") not in MATURITY:
            errors.append(f"{where}.maturity is invalid")
        source = equation.get("source", {})
        if not isinstance(source, dict) or not all(source.get(k) for k in ("repository", "path", "blob_sha", "coverage")):
            errors.append(f"{where}.source lacks repository/path/blob_sha/coverage")
        for check in equation.get("checks", []):
            if check.get("kind") not in CHECK_KINDS:
                errors.append(f"{where} check {check.get('id', '<missing>')} has unsupported kind")
        check_ids = [check.get("id") for check in equation.get("checks", [])]
        if len(check_ids) != len(set(check_ids)):
            errors.append(f"{where} has duplicate check ids")
    for equation in equations:
        if not isinstance(equation, dict):
            continue
        for dependency in equation.get("dependencies", []):
            if dependency not in ids:
                errors.append(f"{equation.get('id')} has unknown dependency {dependency}")
    graph = {equation.get("id"): equation.get("dependencies", []) for equation in equations if isinstance(equation, dict)}
    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(node: str, trail: list[str]) -> None:
        if node in visiting:
            errors.append("dependency cycle: " + " -> ".join([*trail, node]))
            return
        if node in visited:
            return
        visiting.add(node)
        for dependency in graph.get(node, []):
            if dependency in graph:
                visit(dependency, [*trail, node])
        visiting.remove(node)
        visited.add(node)

    for node in sorted(graph):
        visit(node, [])
    return errors


def _merge_dims(left: dict[str, Fraction], right: dict[str, Fraction], sign: int) -> dict[str, Fraction]:
    out = dict(left)
    for key, value in right.items():
        out[key] = out.get(key, Fraction(0)) + sign * value
        if out[key] == 0:
            del out[key]
    return out


def _numeric_constant(node: ast.AST) -> Fraction:
    if isinstance(node, ast.Constant) and isinstance(node.value, (int, float)):
        return Fraction(str(node.value))
    if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub):
        return -_numeric_constant(node.operand)
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Div):
        return _numeric_constant(node.left) / _numeric_constant(node.right)
    raise ValueError("dimension exponent must be a numeric constant")


def expression_dimensions(expression: str, symbol_dims: dict[str, dict[str, int]]) -> dict[str, Fraction]:
    tree = ast.parse(expression, mode="eval")

    def visit(node: ast.AST) -> dict[str, Fraction]:
        if isinstance(node, ast.Expression):
            return visit(node.body)
        if isinstance(node, ast.Constant):
            return {}
        if isinstance(node, ast.Name):
            if node.id == "pi":
                return {}
            if node.id not in symbol_dims:
                raise ValueError(f"unknown symbol {node.id}")
            return {k: Fraction(v) for k, v in symbol_dims[node.id].items()}
        if isinstance(node, ast.UnaryOp) and isinstance(node.op, (ast.UAdd, ast.USub)):
            return visit(node.operand)
        if isinstance(node, ast.BinOp):
            left, right = visit(node.left), visit(node.right)
            if isinstance(node.op, (ast.Add, ast.Sub)):
                if left != right:
                    raise ValueError(f"addition/subtraction dimension mismatch: {left} vs {right}")
                return left
            if isinstance(node.op, ast.Mult):
                return _merge_dims(left, right, 1)
            if isinstance(node.op, ast.Div):
                return _merge_dims(left, right, -1)
            if isinstance(node.op, ast.Pow):
                exponent = _numeric_constant(node.right)
                return {k: v * exponent for k, v in left.items() if v * exponent}
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            if len(node.args) != 1:
                raise ValueError("functions must have one argument")
            arg = visit(node.args[0])
            if node.func.id in {"sin", "cos", "exp", "log"}:
                if arg:
                    raise ValueError(f"{node.func.id} requires a dimensionless argument")
                return {}
            if node.func.id == "sqrt":
                return {k: v / 2 for k, v in arg.items() if v / 2}
            if node.func.id == "abs":
                return arg
        raise ValueError(f"unsupported expression node: {ast.dump(node, include_attributes=False)}")

    return visit(tree)


_BINARY = {ast.Add: operator.add, ast.Sub: operator.sub, ast.Mult: operator.mul, ast.Div: operator.truediv, ast.Pow: operator.pow}
_UNARY = {ast.UAdd: operator.pos, ast.USub: operator.neg}
_FUNCTIONS = {"sqrt": math.sqrt, "sin": math.sin, "cos": math.cos, "exp": math.exp, "log": math.log, "abs": abs}


def evaluate_numeric(expression: str, bindings: dict[str, float]) -> float:
    tree = ast.parse(expression, mode="eval")

    def visit(node: ast.AST) -> float:
        if isinstance(node, ast.Expression):
            return visit(node.body)
        if isinstance(node, ast.Constant) and isinstance(node.value, (int, float)):
            return float(node.value)
        if isinstance(node, ast.Name):
            if node.id == "pi":
                return math.pi
            if node.id not in bindings:
                raise ValueError(f"missing numeric binding for {node.id}")
            return float(bindings[node.id])
        if isinstance(node, ast.UnaryOp) and type(node.op) in _UNARY:
            return _UNARY[type(node.op)](visit(node.operand))
        if isinstance(node, ast.BinOp) and type(node.op) in _BINARY:
            return _BINARY[type(node.op)](visit(node.left), visit(node.right))
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id in _FUNCTIONS and len(node.args) == 1:
            return float(_FUNCTIONS[node.func.id](visit(node.args[0])))
        raise ValueError(f"unsupported numeric expression: {ast.dump(node, include_attributes=False)}")

    return visit(tree)


def run_checks(equation: dict[str, Any]) -> list[CheckResult]:
    results: list[CheckResult] = []
    eq_id = equation["id"]
    symbol_dims = {item["name"]: item.get("unit", {}) for item in equation["symbols"]}
    for check in equation["checks"]:
        check_id, kind = check["id"], check["kind"]
        try:
            if kind == "dimensions":
                left = expression_dimensions(check["lhs"], symbol_dims)
                right = expression_dimensions(check["rhs"], symbol_dims)
                if left == right:
                    results.append(CheckResult(eq_id, check_id, kind, "PASS", f"dimensions agree: {left}"))
                else:
                    results.append(CheckResult(eq_id, check_id, kind, "FAIL", f"{left} != {right}"))
            elif kind == "numeric_close":
                actual = evaluate_numeric(check["expression"], check.get("bindings", {}))
                expected = float(check["expected"])
                tolerance = float(check.get("abs_tol", 1e-12))
                status = "PASS" if math.isclose(actual, expected, rel_tol=0.0, abs_tol=tolerance) else "FAIL"
                results.append(CheckResult(eq_id, check_id, kind, status, f"actual={actual:.17g}; expected={expected:.17g}; abs_tol={tolerance:.3g}"))
            elif kind == "sympy_zero":
                try:
                    import sympy as sp  # type: ignore
                except ImportError:
                    results.append(CheckResult(eq_id, check_id, kind, "NOT_RUN", "SymPy is not installed"))
                    continue
                local = {name: sp.symbols(name, real=True) for name in symbol_dims}
                local.update({"exp": sp.exp, "sqrt": sp.sqrt, "sin": sp.sin, "cos": sp.cos, "log": sp.log})
                reduced = sp.simplify(sp.sympify(check["expression"], locals=local))
                status = "PASS" if reduced == 0 else "FAIL"
                results.append(CheckResult(eq_id, check_id, kind, status, f"simplified={reduced}"))
        except Exception as exc:  # a malformed check is a logged failure
            results.append(CheckResult(eq_id, check_id, kind, "FAIL", f"{type(exc).__name__}: {exc}"))
    return results


def lean_text(equation: dict[str, Any]) -> str | None:
    block = equation.get("lean")
    if not block:
        return None
    lines = [f"-- Generated by {TOOL_VERSION}", f"-- Equation: {equation['id']} — {equation['title']}"]
    src = equation["source"]
    lines.append(f"-- Source: {src['repository']}/{src['path']} @ {src['blob_sha']}")
    lines.append(f"-- Status: {equation['provenance']}/{equation['maturity']}")
    lines.append("-- Generated module status is independent of source-claim status.")
    lines.extend(f"import {item}" for item in block.get("imports", ["Mathlib"]))
    lines.extend(["", f"namespace {block.get('namespace', 'HsH.Generated')}", ""])
    for declaration in block.get("declarations", []):
        lines.extend([declaration, ""])
    for theorem in block.get("theorems", []):
        lines.append(f"theorem {theorem['name']} {theorem['statement']} := by")
        derivation = theorem.get("derivation", [])
        if derivation:
            lines.extend(f"  {step}" for step in derivation)
        else:
            lines.append("  sorry")
        lines.append("")
    lines.extend([f"end {block.get('namespace', 'HsH.Generated')}", ""])
    return "\n".join(lines)


def compile_lean(equation_id: str, path: Path, command: str | None) -> CheckResult:
    if not command:
        return CheckResult(equation_id, "lean-compile", "lean_compile", "NOT_RUN", "no --lean-command supplied")
    completed = subprocess.run([*shlex.split(command), str(path)], capture_output=True, text=True, check=False)
    detail = (completed.stdout + completed.stderr).strip().replace("\n", " | ")
    return CheckResult(equation_id, "lean-compile", "lean_compile", "PASS" if completed.returncode == 0 else "FAIL", detail or f"exit={completed.returncode}")


def write_outputs(registry_path: Path, registry: dict[str, Any], results: list[CheckResult], out_dir: Path, lean_dir: Path, lean_command: str | None) -> list[CheckResult]:
    out_dir.mkdir(parents=True, exist_ok=True)
    lean_dir.mkdir(parents=True, exist_ok=True)
    for equation in registry["equations"]:
        rendered = lean_text(equation)
        if rendered is None:
            continue
        filename = equation["lean"].get("module", equation["id"].replace("-", "_")) + ".lean"
        path = lean_dir / filename
        path.write_text(rendered, encoding="utf-8")
        results.append(compile_lean(equation["id"], path, lean_command))

    input_sha = hashlib.sha256(registry_path.read_bytes()).hexdigest()
    ordered = sorted(results, key=lambda item: (item.equation_id, item.check_id))
    log_path = out_dir / "check-log.jsonl"
    log_path.write_text("".join(json.dumps(item.as_dict(), sort_keys=True) + "\n" for item in ordered), encoding="utf-8")
    counts = {status: sum(item.status == status for item in ordered) for status in ("PASS", "FAIL", "NOT_RUN")}
    report = [
        "# Equation Check Report",
        "",
        f"- Tool: `{TOOL_VERSION}`",
        f"- Registry SHA-256: `{input_sha}`",
        f"- Results: {counts['PASS']} PASS, {counts['FAIL']} FAIL, {counts['NOT_RUN']} NOT_RUN",
        "",
        "| Equation | Check | Kind | Status | Detail |",
        "|---|---|---|---|---|",
    ]
    for item in ordered:
        detail = item.detail.replace("|", "\\|")
        report.append(f"| {item.equation_id} | {item.check_id} | {item.kind} | {item.status} | {detail} |")
    report.extend(["", "`PASS` applies only to the named check. It does not promote the equation's model status.", ""])
    (out_dir / "CHECK_REPORT.md").write_text("\n".join(report), encoding="utf-8")
    return ordered


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("registry", type=Path)
    parser.add_argument("--out", type=Path, default=Path("generated/equations"))
    parser.add_argument("--lean-out", type=Path, default=Path("generated/lean"))
    parser.add_argument("--lean-command", help='command prefix, for example "lake env lean"')
    parser.add_argument("--strict", action="store_true", help="fail when any check is FAIL or NOT_RUN")
    args = parser.parse_args(argv)

    registry = load_registry(args.registry)
    errors = validate_registry(registry)
    if errors:
        for error in errors:
            print(f"SCHEMA FAIL: {error}", file=sys.stderr)
        return 1
    results: list[CheckResult] = []
    for equation in registry["equations"]:
        results.extend(run_checks(equation))
    ordered = write_outputs(args.registry, registry, results, args.out, args.lean_out, args.lean_command)
    failures = [item for item in ordered if item.status == "FAIL"]
    not_run = [item for item in ordered if item.status == "NOT_RUN"]
    print(f"{TOOL_VERSION}: {len(ordered)} checks; {len(failures)} FAIL; {len(not_run)} NOT_RUN")
    if failures or (args.strict and not_run):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
