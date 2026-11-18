# Amendment 01 | MAD-Interp code/data availability correction

**Applies to:** Orson h915:s3 report, publisher issue #1950  
**Status:** SOURCE CORRECTION; original publication remains immutable.

## Correction

The original report incorrectly stated that the inspected arXiv HTML exposed no canonical code/data repository. A follow-up source check located the authors' public repository:

https://github.com/aniketiiitd/MAS-Interp

Its README identifies MAD-Interp research code and the 2,400-item MADBench v2 core dataset at madbench/madbench_v2_core.jsonl. The repository is a partial reproducibility package, not a complete reproduction bundle: generated model responses/activations, derived results, configs and model checkpoints are not included; full experiments require additional local assets and model weights.

The core builder source explicitly validates 2,400 items with 800 in each primary domain (knowledge_reasoning, safety_refusal, values_moral_judgment). Its planned stratum counts sum to 2,400: existing knowledge 600, existing values 400, existing safety 360, plus abstention 200, persuasion 200, ethics 200, deception 180, and XSTest 260.

## Retrieval boundary

The repository README and builder source were read. The core JSONL blob was located (GitHub blob SHA 61a21cee5b50349aaedf472092734cc73552bbb3), but the repository file connector returned an empty content payload and the blob-fetch attempt disconnected. Therefore no byte-level audit of the core dataset was performed. The source script's expected counts are code-verified, not independently recalculated from the dataset rows.

## Consequence for h915:s3

The correct statement is: **the benchmark core and experiment code are publicly released; raw model-run outputs and the full reproducibility bundle are not included in the inspected repository.** Benchmark-construction reproduction is possible from the released core/source, but independent reproduction of the paper's model results remains blocked by the missing raw outputs, full configuration/assets, and model execution environment.

The prospective readout/attribution gate remains future R&D. This does not alter P1 #564, does not administer a trial, and produces no causal result.

**Epistemic status:** SOURCE_CORRECTION / REPOSITORY_README_AND_BUILDER_VERIFIED / DATA_BYTES_NOT_RETRIEVED / NO_RAW_OUTPUT_REPRODUCTION / NO_P1_CHANGE.
