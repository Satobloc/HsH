#!/usr/bin/env python3
"""Elias h856:s4: exact Track-A source replay + proposed envelope contract probe.

The first block imports the exact pinned upstream POC and tests its current behavior.
The second block tests a proposed composition contract with synthetic identifiers.
This is not a production workflow, human/LLM study, physical calculation, or Lean proof.
"""
from dataclasses import dataclass
from enum import Enum
from typing import Optional, FrozenSet
import argparse
import copy
import hashlib
import importlib.util
import json
import pathlib
import sys

SOURCE_GIT_BLOB = "49988a769389b2baf264a27d596ba7c3ff822b36"
SOURCE_SHA256 = "876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a"
SOURCE_COMMIT = "186b2088f0a883a763cf4f6491d1b7900c2c22fd"

def git_blob_sha1(data: bytes) -> str:
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()

def load_poc(path: pathlib.Path):
    data = path.read_bytes()
    blob = git_blob_sha1(data)
    sha = hashlib.sha256(data).hexdigest()
    if blob != SOURCE_GIT_BLOB or sha != SOURCE_SHA256:
        raise SystemExit(f"SOURCE_MISMATCH blob={blob} sha256={sha}")
    spec = importlib.util.spec_from_file_location("workflow_switchboard_demo_pinned", path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module, blob, sha

class Result(str, Enum):
    ACCEPT = "ACCEPT"
    REJECT = "REJECT"

@dataclass(frozen=True)
class Scope:
    event: str
    lease: str
    thread: str
    seed: str
    freeze: str
    attempt: str

@dataclass(frozen=True)
class Run:
    witness_id: str
    scope: Scope
    source_commit: str
    source_blob: str
    harness: str
    command: str
    execution_scope: str
    exit_code: int
    stdout_sha256: str
    stderr_sha256: str

@dataclass(frozen=True)
class Receipt:
    scope: Scope
    worker_label: str
    authenticated_subject: Optional[str]
    artifact_path: str
    artifact_sha256: str
    outcome: str
    witness_id: str
    exposure_sources: Optional[FrozenSet[str]]
    exposure_complete: bool
    cross_exposure: Optional[bool]

@dataclass(frozen=True)
class Publication:
    opened_event: str
    outcome: str
    artifact_sha256: str
    readback_sha256: Optional[str]

@dataclass(frozen=True)
class Delivery:
    thread: str
    artifact_sha256: str
    delivered: bool
    acknowledgment_id: Optional[str]

def compose(run, receipt, publication=None, delivery=None):
    if run.scope != receipt.scope or run.witness_id != receipt.witness_id:
        return Result.REJECT
    if run.exit_code != 0:
        return Result.REJECT
    if publication:
        if publication.opened_event != receipt.scope.event:
            return Result.REJECT
        if publication.artifact_sha256 != receipt.artifact_sha256:
            return Result.REJECT
        if publication.outcome == "PUBLISHED" and publication.readback_sha256 != publication.artifact_sha256:
            return Result.REJECT
    if delivery:
        if delivery.thread != receipt.scope.thread or delivery.artifact_sha256 != receipt.artifact_sha256:
            return Result.REJECT
    return Result.ACCEPT

def delivery_state(d):
    if d is None or not d.delivered: return "NOT_DELIVERED_OR_UNVERIFIED"
    return "ACKNOWLEDGED" if d.acknowledgment_id else "DELIVERED_UNACKNOWLEDGED"

def subject_relation(a, b):
    if a.authenticated_subject is None or b.authenticated_subject is None:
        return "SUBJECT_IDENTITY_UNKNOWN"
    return "SAME_SUBJECT" if a.authenticated_subject == b.authenticated_subject else "DISTINCT_SUBJECTS"

def exposure_relation(a, b):
    if (not a.exposure_complete or not b.exposure_complete or a.exposure_sources is None
        or b.exposure_sources is None or a.cross_exposure is None or b.cross_exposure is None):
        return "EXPOSURE_UNKNOWN"
    if a.cross_exposure or b.cross_exposure: return "CROSS_EXPOSURE"
    return "OVERLAPPING_SOURCE_EXPOSURE" if a.exposure_sources & b.exposure_sources else "DISJOINT_AUDITED"

def source_replay(module):
    checks = module.self_test()
    result = {
        "builtin_self_test_all_seven_pass": len(checks) == 7 and all(checks.values()),
    }
    missed = module.run("missed_directive")
    result["fresh_directive_preempts_task"] = missed["wake"]["next_operation"] == "incorporate_fresh_directive"
    result["war_room_is_first_source_route"] = missed["wake"]["source_routes"][0] == "war_room"
    lease = module.run("lease_receipt_gate")
    jobs = {j["job"]: j for j in lease["hydra"]["spawn"]}
    result["restore_depends_on_durable_receipt_job"] = (
        jobs.get("restore_displaced_lease", {}).get("depends_on") == "verify_durable_output_receipt"
    )
    result["elias_missing_from_actor_registry"] = "Elias Kern" not in module.ACTORS
    try:
        module.Switchboard().wake("Elias Kern", "theory_workbench", {"tags": []})
        result["elias_wake_fails_closed_with_keyerror"] = False
    except KeyError:
        result["elias_wake_fails_closed_with_keyerror"] = True
    failed = module.candidate_scenario(False)
    passed = module.candidate_scenario(True)
    result["negative_helper_branch_is_checked_fail"] = failed["candidate"]["stage"] == "checked_fail"
    result["negative_helper_branch_prunes"] = any(j["job"] == "prune_rebuild" for j in failed["hydra"]["spawn"])
    result["positive_helper_branch_is_checked_pass"] = passed["candidate"]["stage"] == "checked_pass"
    state = copy.deepcopy(module.BASE_STATE)
    state["directives"] = []
    board = module.Switchboard(state)
    board.state["theory_candidate"]["id"] = "freeze-A"
    board.apply_checks({"math_check": {"status": "pass"}})
    board.state["theory_candidate"]["id"] = "freeze-B"
    board.apply_checks({
        "adversarial_audit": {"status": "pass"},
        "provenance_prior_art": {"status": "pass"},
    })
    result["cross_freeze_checks_can_reach_checked_pass"] = (
        board.state["theory_candidate"]["id"] == "freeze-B" and
        board.state["theory_candidate"]["stage"] == "checked_pass"
    )
    result["candidate_state_has_no_freeze_binding"] = (
        "freeze_id" not in board.state["theory_candidate"] and
        all("freeze_id" not in record for record in board.state["theory_candidate"]["checks"].values())
    )
    return checks, result

def composition_probe():
    s = Scope("event-A","lease-A","thread-A","seed-v1","freeze-A","attempt-A")
    run = Run("witness-A",s,"e58ebfc","49988a","probe-v1","python probe.py",
              "DESIGN_CONTRACT_PROBE",0,"a"*64,hashlib.sha256(b"").hexdigest())
    a = Receipt(s,"Elias Kern",None,"artifact-A","b"*64,"success","witness-A",
                frozenset({"source-1","source-2"}),True,False)
    pub = Publication("event-A","PUBLISHED","b"*64,"b"*64)
    unacked = Delivery("thread-A","b"*64,True,None)
    b = Receipt(Scope("event-B","lease-B","thread-B","seed-v2","freeze-B","attempt-B"),
                "Other label","subject-B","artifact-B","e"*64,"success","witness-B",
                frozenset({"source-2","source-3"}),True,False)
    c = Receipt(Scope("event-C","lease-C","thread-C","seed-v3","freeze-C","attempt-C"),
                "Third label","subject-C","artifact-C","f"*64,"success","witness-C",
                frozenset({"source-9"}),True,False)
    tests = {
        "aligned_scope_accepts": compose(run,a,pub,unacked) == Result.ACCEPT,
        "thread_mismatch_rejects": compose(run,Receipt(Scope("event-A","lease-A","thread-B","seed-v1","freeze-A","attempt-A"),a.worker_label,None,a.artifact_path,a.artifact_sha256,a.outcome,a.witness_id,a.exposure_sources,True,False)) == Result.REJECT,
        "seed_mismatch_rejects": compose(run,Receipt(Scope("event-A","lease-A","thread-A","seed-v2","freeze-A","attempt-A"),a.worker_label,None,a.artifact_path,a.artifact_sha256,a.outcome,a.witness_id,a.exposure_sources,True,False)) == Result.REJECT,
        "freeze_mismatch_rejects": compose(run,Receipt(Scope("event-A","lease-A","thread-A","seed-v1","freeze-B","attempt-A"),a.worker_label,None,a.artifact_path,a.artifact_sha256,a.outcome,a.witness_id,a.exposure_sources,True,False)) == Result.REJECT,
        "attempt_mismatch_rejects": compose(run,Receipt(Scope("event-A","lease-A","thread-A","seed-v1","freeze-A","attempt-B"),a.worker_label,None,a.artifact_path,a.artifact_sha256,a.outcome,a.witness_id,a.exposure_sources,True,False)) == Result.REJECT,
        "publisher_event_mismatch_rejects": compose(run,a,Publication("event-B","PUBLISHED","b"*64,"b"*64)) == Result.REJECT,
        "publisher_readback_mismatch_rejects": compose(run,a,Publication("event-A","PUBLISHED","b"*64,"d"*64)) == Result.REJECT,
        "delivery_thread_mismatch_rejects": compose(run,a,None,Delivery("thread-B","b"*64,True,"ack-A")) == Result.REJECT,
        "delivery_without_ack_stays_unacknowledged": delivery_state(unacked) == "DELIVERED_UNACKNOWLEDGED",
        "different_labels_do_not_authenticate_subjects": subject_relation(a,b) == "SUBJECT_IDENTITY_UNKNOWN",
        "distinct_subjects_with_overlap_not_independent": subject_relation(b,c) == "DISTINCT_SUBJECTS" and exposure_relation(a,b) == "OVERLAPPING_SOURCE_EXPOSURE",
        "complete_disjoint_exposure_is_auditable": exposure_relation(b,c) == "DISJOINT_AUDITED",
    }
    return tests

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", default="workflow_switchboard_demo.py")
    args = parser.parse_args()
    source_path = pathlib.Path(args.source)
    module, blob, sha = load_poc(source_path)
    builtin, source_tests = source_replay(module)
    comp_tests = composition_probe()
    all_tests = {**{f"source::{k}":v for k,v in source_tests.items()},
                 **{f"composition::{k}":v for k,v in comp_tests.items()}}
    output = {
        "classification": "SOURCE_EXACT_POC_REPLAY_PLUS_SYNTHETIC_COMPOSITION_PROBE",
        "source": {
            "repo":"Satobloc/HSH_RESOURCES","commit":SOURCE_COMMIT,
            "path":"tools/workflow_switchboard_demo.py","git_blob_sha1":blob,
            "sha256":sha,"bytes":source_path.stat().st_size
        },
        "python":sys.version.split()[0],
        "builtin_self_test":builtin,
        "source_checks":source_tests,
        "composition_checks":comp_tests,
        "passed":sum(all_tests.values()),"total":len(all_tests),
        "limitations":[
            "Source checks execute the exact pinned POC, but only deterministic software fixtures.",
            "Composition checks exercise a proposed join contract with synthetic identifiers; they do not execute the POC.",
            "No production workflow, scheduler, human/LLM subject, or physical system was exercised.",
            "No POC/PR/adapter/production code was changed; this is not a Lean proof."
        ]
    }
    print(json.dumps(output,indent=2,sort_keys=True))
    return 0 if all(all_tests.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
