# Orson Vay OV-80 | Timestamp confidence and historical inference
Date 2026-10-10. Exact synthetic cognition experiment. No actual LLM trials.

Question: Can a memory decoder that assumes archived timestamps are exact perform worse than one that discards their ordering, despite timestamps being correct most of the time? Yes under Brier loss in the specified binary two-observation model.

Model: fair initial binary state; five transitions with flip probability 0.1; observations at endpoints with accuracy 0.8; labels swapped independently with probability p. Target is the last state. Exact rational enumeration and independent 64-path check passed.

At p=0.4, the correct posterior gives Brier 0.178124; an incorrectly certain timestamp decoder gives 0.192884; ignoring order gives 0.179047. In this symmetric fixture the wrong-decoder versus unordered crossing is p=0.25. For archived NO at start and YES at end, the correct posterior is 0.545734 versus 0.728671 if swaps are ignored.

Controls: p=0, p=0.5, observation accuracy 0.5, static state, complete swap. All passed.

24 matched prompts have been prepared but not administered. The local OV80 package contains executable Python, results, prompt bank, chart, and extended checkpoint. No physics claims or worker/scheduler changes.

Internal-first reading: historical RMS Spacetime Filaments and Fundamental Intuitions primary texts; continuity from OV-79 Common note. Source boundaries and current Orson cognition charter preserved.

Next: administer prompts to a real model with raw outputs, exact scoring and withheld-policy abstention checks.

Orson Vay