# Meridian — Whirligig information-conserving representation audit 05

**Run start:** 2026-09-19 19:27 EDT  
**Status:** source/provenance audit; no theory promotion  
**Exposure:** non-quarantined Library + current HsH control surfaces only. No PRIOR_ART, nLab, quarantine, or external-literature import.

## Startup/control state
Reread the current no-conversation-renaming policy, Worker Autonomy/Handoff Protocol, Automation Workflow Control, Current H(s)H Hypothesis Status, and Meridian checkpoint. The 2026-09-19 Nathan signet-protection hard rule is present at the top of the autonomy protocol and was observed. Shared-State Write Safety was reread before any repository write.

## Bounded operation
Test the current Whirligig frontier against the recovered `SAT Overview — raw.json`: did historical intent require a single canonical equation→curve encoding, or an admissible class of information-conserving representations?

## Source result
In `SAT Overview — raw.json`, an assistant first argues that the SU(2) and H-alpha curve representations must be locked before calculation because otherwise the Donut test would test the encoding choice. Nathan's immediately following reply is explicit: `Doesn’t matter what you pick just one information conserving curve for each … plug them in and calculate` (user message timestamp 1782220745.0462651; message id `be513696-be66-4947-a622-61a3a6c3bb12`).

This is a material correction to the earlier audit framing. The historical Nathan-direct requirement recovered here is **not one canonical curve per mathematical object**. It permits representation choice subject to an information-conservation requirement. Therefore the appropriate solver benchmark is not merely `recover the canonical encoder`; it is:

1. define what information must be conserved for an admissible representation;
2. identify at least two materially different admissible representations of the same input object where possible;
3. run the same Whirligig/Donut operation on each;
4. distinguish representation-dependent geometric detail from stable decoded relationship/output;
5. test whether the reverse-engineering stage recovers the conserved input information;
6. price any human/LLM choice needed to select, normalize, close, or decode the representation in the intervention budget.

## Important provenance boundary
The same raw conversation contains large tool-retrieved/assistant-authored passages asserting rolling-sphere reversibility, holonomy closure, Lissajous deconvolution, injectivity, and related mathematical guarantees. Those are **not Nathan-authored by adjacency** and were not accepted here as established operator properties. The only promoted source-history result in this run is Nathan's explicit admissible-information-conserving-curve instruction and its immediate contrast with the assistant's preceding canonicalization concern.

A later Nathan-authored retrospective in `ChatGPT Voice Glitch — raw.json` independently describes the intended architecture as equations represented by curves, projected to geometric surfaces, coupled into information-conserving composite curves, then reverse-engineered to an equation. That supports the functional target but does not itself supply the missing formal definition of information conservation or the decoder.

## Benchmark consequence
Representation invariance should now be tested at the **decoded/invariant relationship level**, not by demanding identical raw curves from different admissible encodings. A raw geometric trace may legitimately vary with representation while the conserved/decoded relationship remains stable. Conversely, if materially different information-conserving encodings yield incompatible decoded relationships, that is a substantive solver failure or evidence that the admissibility criterion is underdefined.

## Failure / uncertainty
The operational definition of `information conserving` remains unresolved. No source inspected this run establishes a formal injectivity criterion, sufficient statistic, decoder, or equivalence relation over admissible curve representations. Assistant claims that such reversibility follows automatically from rolling/no-slip/holonomy remain unverified and must not be silently promoted.

## Archive/infrastructure and capability result
The audit now separates three distinct questions that earlier source reading tended to conflate: `(a) admissible representation`, `(b) geometric transformation/search`, and `(c) decoded invariant relationship`. This is a better basis for reproducible representation-invariance benchmarks and intervention accounting.

## Current frontier / next cursor
Find the earliest Nathan-authored or Nathan-adopted operational statement defining what information a curve must preserve and how the composite is reverse-engineered. Then build a minimal two-representation benchmark on a simple pair before returning to the held-out GR↔QM case.

## Checkpoint write status
`WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md` was freshly fetched and its current blob SHA obtained, but the connector view truncates the large file and does not provide append/patch semantics. Whole-file replacement from incomplete content would violate `SHARED_STATE_WRITE_SAFETY.md`. This run note is therefore the durable owner-local continuation artifact; the checkpoint itself was deliberately left untouched rather than risk destructive replacement. No Nathan action is required.