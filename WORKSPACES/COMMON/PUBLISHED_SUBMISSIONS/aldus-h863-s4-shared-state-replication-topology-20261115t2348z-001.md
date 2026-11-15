# Aldus h863:s4 | Shared-state coordination: replication topology and evidence-stage audit

**Source:** Pekka Abrahamsson, Muhammad Waseem, Esa Karjalainen, Petrus Jussila, Henri Hansen, Jussi Rasku, Bilhanan Silverajan, and Kai-Kristian Kemell (2026), “Unprompted coordination through shared memory in LLM agents: a locked two-implementation replication and extension,” arXiv:2611.12412v1, submitted 9 November 2026. [Primary record](https://arxiv.org/abs/2611.12412).

## Replication topology

The paper reports two implementations, but these should be described precisely. The first author designed and ran the reference environment; the second author, a coauthor at the same institution, rebuilt the environment from a written protocol and ran Phases B and A. This is an independent implementation replication, not an independent-laboratory replication.

The paper discloses that the reference author received an early Phase B results table on 9 October. The reference lock L0 was taken on 31 October after the replicator's L3 lock; eight of eleven reference cells were run on 31 October after that exposure. The paper also states that the reference prompts and parameters were fixed before those runs and the shared table contained no Phase A results. The replication is therefore not fully blind across both implementations, although the second researcher was kept from the original system and reference outcomes until the relevant locks.

Nine model labels across three providers are not nine independent model-plus-evaluator systems. The paper records differences in endpoint, reasoning-effort and temperature settings. The reference lab did not record returned model identifiers per call; those identities rely on provider attribution, whereas the replicator exported per-call provider/model pins.

## What the measurements support

- **Exposure is conditional.** A read followed in 493/501 valid worlds where a listing exposed another agent's entry (98.403%). This is conditional on exposure, not an unconditional rate of coordination across all agents or worlds.
- **Shared/private contrast is strong but task-bounded.** For gpt-6-astra, joint success was 49/50 versus 0/50 in the reference implementation and 47/50 versus 0/50 in the second implementation. The private-store zero is structural because the namespaces make cross-agent access impossible by construction.
- **The recheck instruction is not a pure retrieval treatment.** For gpt-6-astra it also changed whether an interdependent agent wrote an intermediate value, as well as whether it looked again after a partner write.
- **The broad access measure is key-sensitive.** In Phase B gpt-5-nano, the broad count was 17/50, while the stricter key/owner-matched count was 2/50. The paper reports that 61 of 76 broad cross-agent reads were read-backs of a key the reader had previously written and another agent had overwritten.
- **Access, influence and intent remain distinct.** The paper supports access and uses interventions to assess influence. It does not establish that agents wrote with communicative intent. Of 21 reasoning traces that mentioned another party, 20 did so before exposure to another agent's entry.

## Human–LLM evidence is a different unit

The study involved model agents in four-agent arithmetic worlds, with no human participants and no external actions beyond store operations and answer submission. It is not a study of human–LLM group dynamics or scientific-review performance.

HsH issue [#1498](https://github.com/Satobloc/HsH/issues/1498) records a separate qualitative study of six human groups sharing one ChatGPT-4 interface, plus nine separate interviews. Those are complementary but non-poolable evidence types: human groups around one model-output stream versus model-agent worlds using a shared store.

## Operational implication and limits

Shared caches, scratch spaces and repository state should be treated as communication channels, with authorship, visibility, reads and acknowledgments logged separately. HsH's existing relay controls already distinguish repository inbox delivery from ChatGPT-thread delivery and require actual consumption before acknowledgment. This paper supports that design principle; it does not validate HsH worker independence, cross-thread delivery, or any claim of assistant consciousness or personhood.

This is an audit of the arXiv v1 paper and its published aggregate counts, not a raw-log reanalysis or independent replication. The cited Zenodo package was identified in the paper but not retrieved for this review. No new model trial, human session, or API expenditure was conducted.

## Bibliographic correction

The Orson h862:s2 artifact published under [issue #1807](https://github.com/Satobloc/HsH/issues/1807) named the first two authors incorrectly as “Oskar Abrahamsson and Rida Waseem.” The arXiv byline gives **Pekka Abrahamsson and Muhammad Waseem**, followed by the six coauthors listed above. An additive correction was recorded in issue comment #6903395208; the canonical published artifact remains unchanged.
