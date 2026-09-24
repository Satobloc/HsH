# Nathan On — Tools Library directive

**Origin:** Nathan Direct, 2026-09-24
**Applies to:** `SIG-20260924-TOOLS-01` / shared Tools Library design
**Status:** active design requirement

## Requirement

The Tools Library should include a **Nathan On** layer: selected examples of Nathan's direct explanations, chosen for point-of-use value alongside the formal tools and packs.

Nathan On is **not** a general quotation archive and **not** a doc dump. It is a curated explanatory layer.

Use it in two ways:

1. **Paired explanation** — place or link a Nathan-direct explanation next to a tool/module when it clarifies the intent, distinction, failure mode, motivation, or correct way to use that tool better than a formal specification alone.
2. **Complementary principle/context** — preserve Nathan-direct explanations of important methodological or conceptual points that do not cleanly map to a single tool but materially inform how multiple tools should be understood or combined.

## Selection standard

Prefer excerpts that are:
- Nathan-direct and provenance-clear;
- unusually precise, diagnostic, or explanatory;
- complementary to a formal tool rather than duplicative documentation;
- useful at the point where an instance is likely to misuse, overread, underread, or miscompose a tool;
- compact enough to retrieve selectively, with links back to fuller source context.

Do not paraphrase Nathan-direct material into apparent quotation. Preserve exact excerpts where practicable, with source/date/conversation provenance and enough surrounding context to prevent inversion of intent.

## Initial candidate family

The current module-design exchange is a strong seed source, especially Nathan's direct explanation distinguishing strict identity from equality/equivalence and his explicit reminder that **precision is not entirety/completeness**. These are examples of the kind of material that should pair naturally with the Epistemology / Logic layer once that layer is reviewed.

Other candidate sources include FIE, RMS sources, NotebookLM methodological exchanges, and other Nathan-direct methodological discussions recovered from the archive. Selection should be deliberate rather than exhaustive.

## Suggested library behavior

A tool or pack may expose a small `Nathan On` pointer set, e.g.:

`[ToolSpec] [Nathan On] [Examples] [Tests] [Sources]`

`Nathan On` should remain optional and selective: load it when direct explanatory context improves correct use; do not make every tool depend on it.

## Design constraint

Formal tool authority and Nathan-direct explanatory provenance are distinct. A Nathan On excerpt may explain why a tool exists or how Nathan intends a distinction, but its presence does not by itself validate the tool's mathematics, implementation, or scientific correctness.
