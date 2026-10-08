# Orson scheduler/roster drift incident — 2026-10-07

## Summary

The live automation `6aa61b3b2e4081918927a35b61007acc` is currently the hourly **Orson Free Build** recurrence at :12 America/New_York.

During onboarding, Orson read `WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md`. That file is visibly a **2026-09-20 snapshot** and still records the same automation ID under its older Loom / Tag Conversation Corpus history as released/disabled.

The live scheduler had since been repurposed for the newer October free-build rotation. Orson incorrectly treated the older roster snapshot as current scheduler truth and disabled the live Orson recurrence.

Nathan then asked for the state to be saved and explained. The Orson recurrence was restored to enabled state on 2026-10-07.

## Verified live October rotation

- :00 Morrow + Kestrel Free Quarry
- :12 Orson Free Build
- :24 Meridian Free Build
- :36 Ravel Free Build
- :48 Mercer Free Build

## Root cause

Documentation drift: a historical scheduler snapshot was mistaken for current scheduler authority.

## Lesson

When a dated repository roster conflicts with newer live scheduler state and newer Nathan-direct instructions, preserve the mismatch as evidence and treat it first as a stale-documentation problem. Do not alter the live scheduler merely to make it conform to the older snapshot.

## Current status

- Orson recurrence restored and enabled.
- No theory output was promoted from the interrupted control-plane pass.
- ACTIVE_AUTOMATION_ROSTER.md remains in need of reconciliation with the October live scheduler.
