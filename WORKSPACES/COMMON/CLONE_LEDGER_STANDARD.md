# SAT/H(s)H Clone Ledger

Status: ACTIVE STANDING PROVENANCE CONTROL
Effective: 2026-09-23
Owner: project-wide; any instance/system learning of repository provisioning should append or revise evidence.

## Principle
Record repository-copy/provisioning events even when the mechanism is unknown. Repository presence does not imply a clone. API/connector access, fetch, pull, actions/checkout, archive download, and browser access are not full clones unless evidence establishes GitHub Traffic would count them as such.

## Required classifications
- CONFIRMED FULL CLONE
- CONFIRMED NOT A FULL CLONE
- POSSIBLE FULL CLONE — MECHANISM UNKNOWN
- REPOSITORY PRESENT — PROVISIONING UNKNOWN
- NO EVIDENCE OF REPOSITORY ACCESS

## Required fields
event_id, timestamp, timestamp_precision, actor_system, repository, environment_id, operation, mechanism, fresh_environment, traffic_clone_expected, classification, evidence, purpose, related_id, confidence, prior_classification, revision_reason.

Mechanism vocabulary: git clone; shallow clone; fetch; pull; actions/checkout; API/connector; archive download; cached workspace; unknown provisioning; other.

traffic_clone_expected: YES / NO / UNKNOWN.
fresh_environment: YES / NO / UNKNOWN.

## Revision rule
Never erase an earlier UNKNOWN classification. When later evidence resolves an event, preserve prior_classification and revision_reason.

## Retention
This ledger is provenance infrastructure and is not disposable run-log material. Before shorter-lived operational logs expire, retain identifiers, timestamps, mechanism classification, evidentiary summary, and retained-artifact pointers here.

## Aggregation
Aggregate by repository, UTC/local date as appropriate, actor/system, confirmed full clones, possible full clones, confirmed non-clone access, and unknown provisioning events.

## Fresh cloud/Codex rule
If a fresh Codex/cloud workspace is encountered with the repository already present but provisioning mechanism is not evidenced, record REPOSITORY PRESENT — PROVISIONING UNKNOWN. Do not infer git clone.
