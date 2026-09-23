"""Meridian solver operationalization harness v0.1.

Execution/evidence shell only. Solver semantics remain solver-owned.
No SAT/H(s)H ontology or required mathematics is prescribed here.
"""
from __future__ import annotations
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Dict, List, Mapping, Optional
import json, math

class Stage(str, Enum):
    WRITE_TEST = "write_test"
    REALITY_CHECK = "reality_check"
    DOH_CHECK = "doh_check"
    BIG_PICTURE = "big_picture"
    FORGOT_CHECK = "review_what_we_forgot"
    NATHAN_VISUAL = "nathan_visual_check"

class Verdict(str, Enum):
    PASS = "PASS"
    FAIL = "FAIL"
    UNRESOLVED = "UNRESOLVED"
    HUMAN_CHECK = "HUMAN_CHECK"

@dataclass
class Check:
    stage: Stage
    name: str
    verdict: Verdict
    detail: str

@dataclass
class SolverRun:
    solver_id: str
    fixture_id: str
    primitive_input: Mapping[str, Any]
    solver_output: Mapping[str, Any]
    checks: List[Check] = field(default_factory=list)
    artifacts: List[str] = field(default_factory=list)
    notes: List[str] = field(default_factory=list)

    @property
    def machine_pass(self) -> bool:
        return all(c.verdict != Verdict.FAIL for c in self.checks
                   if c.stage in {Stage.WRITE_TEST, Stage.REALITY_CHECK, Stage.DOH_CHECK})

    def add(self, stage: Stage, name: str, ok: Optional[bool], detail: str):
        verdict = Verdict.UNRESOLVED if ok is None else (Verdict.PASS if ok else Verdict.FAIL)
        self.checks.append(Check(stage, name, verdict, detail))

    def request_human_visual_check(self, question: str):
        self.checks.append(Check(Stage.NATHAN_VISUAL, "looks_like_intended_geometry",
                                 Verdict.HUMAN_CHECK, question))

    def to_jsonable(self) -> Dict[str, Any]:
        return {
            "solver_id": self.solver_id,
            "fixture_id": self.fixture_id,
            "primitive_input": _jsonify(self.primitive_input),
            "solver_output": _jsonify(self.solver_output),
            "machine_pass": self.machine_pass,
            "checks": [
                {"stage": c.stage.value, "name": c.name,
                 "verdict": c.verdict.value, "detail": c.detail}
                for c in self.checks
            ],
            "artifacts": self.artifacts,
            "notes": self.notes,
        }

def _jsonify(x: Any) -> Any:
    if hasattr(x, "tolist"):
        return x.tolist()
    if hasattr(x, "value"):
        return x.value
    if isinstance(x, Mapping):
        return {str(k): _jsonify(v) for k, v in x.items()}
    if isinstance(x, (list, tuple)):
        return [_jsonify(v) for v in x]
    if isinstance(x, float) and not math.isfinite(x):
        return str(x)
    return x

def write_record(run: SolverRun, path: str | Path) -> Path:
    p = Path(path)
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(run.to_jsonable(), indent=2), encoding="utf-8")
    return p

def generic_doh_checks(run: SolverRun):
    """Cheap checks only; adapters add solver-specific semantic checks."""
    def walk(v):
        if isinstance(v, Mapping):
            for q in v.values(): yield from walk(q)
        elif isinstance(v, (list, tuple)):
            for q in v: yield from walk(q)
        else:
            yield v
    vals = list(walk(run.solver_output))
    bad = [v for v in vals if isinstance(v, float) and not math.isfinite(v)]
    run.add(Stage.DOH_CHECK, "finite_scalar_outputs", not bad,
            "No nonfinite scalar outputs." if not bad else f"Nonfinite values: {bad[:5]}")

def review_what_we_forgot(run: SolverRun, prompts: List[str]):
    for i, prompt in enumerate(prompts, 1):
        run.checks.append(Check(Stage.FORGOT_CHECK, f"forgot_{i}",
                                Verdict.UNRESOLVED, prompt))
