# Ariadne h859:s2 | Nathan Direct source-provenance amendment for P0 discovery audit

**Run key:** `REVROT3-19-20261011:859:s2`  
**Related report:** [Ariadne h859:s2 current P0 discovery-snapshot revalidation](https://github.com/Satobloc/HsH/issues/1801)  
**Canonical incident:** [#1747](https://github.com/Satobloc/HsH/issues/1747)  
**Disposition:** `ORIGINAL_USER_SOURCE_RECOVERED / GENERAL_PRESENTATION_RULE_CONFIRMED / PAPER_A_B_APPLICATION_REMAINS_SEPARATE / NO_ROUTE_PROBE`.

## 1. Primary source recovered

The original-Statement-first check located the relevant source in the Library raw export:

- Conversation title: `Meridian Solver Loop`
- Conversation ID: `6ab8a4fe-4dc4-83ea-b499-ec428b2cec09`
- Raw export: `ND Meridian Solver Loop - raw.json`
- Raw SHA-256: `332e84af656512c27c5f8b7c1a161e71d03b73eaafc8b63c6b6a556913c83f8d`
- Raw size: 10,991,148 bytes
- Mapping nodes: 2,353
- Current-node ancestry: both cited user-role messages are on the export's current-node ancestry.

Two adjacent user-role messages state the same general public-site requirement:

| Message ID | Timestamp (UTC) | Source role |
|---|---|---|
| `b4fb4e99-983e-4daa-8816-c83975d54a68` | 2026-09-30 19:03:36.150 | `user`; serialized author name null |
| `30c0a3b8-928f-4609-aec9-29030ea27685` | 2026-09-30 19:05:01.821 | `user`; serialized author name null |

The messages ask for a review of the Sites Sausage Factory backend's navigability, live updating and readability; identify raw markup being exposed through reader routes; and require visitor-facing presentation to use robust, mathematics-capable RevLaTeX/PDF-style rendering with sensible layout and reflow. Both messages point to a raw `reader?mode=browse` route for a CALIPER JSON packet under `PUBLIC_SITE/live_influx/packets/`.

**Attribution qualification:** the raw export records `author.role=user` and `author.name=null`. This is retained as user-role / Nathan-attributed source context; no stronger serialized author-name authentication is claimed. The source messages are distinct from the assistant-authored September 24 rendering diagnosis and from later worker summaries.

## 2. Scope of the direct instruction

The recovered Nathan-attributed instruction establishes a **general presentation principle**: raw repository markup or data should not be the default visitor-facing endpoint; source material should be routed through a readable, audience-calibrated presentation process that preserves mathematical structure.

It does **not** specifically mention Paper A or Paper B, their R1 status, the current discovery-index builder, or the current `WORKSPACES/PAPERS/**` policy. Those are later applications and must remain separately sourced.

The current A/B finding is supported by:
- the current generated discovery snapshot and exact A/B source blobs;
- the current `site_discovery.py` and its tests;
- the current Presentation Gate, Reader Routing Registry and Presentation Contract;
- the live Code Grurple roster and canonical issue #1747.

The September 30 source supplies the original general rule, not a new paper-specific authorization or repair instruction.

## 3. Mersearch and recovery method

All four current Mersearch request lanes were inspected and remain `requested`; none was overwritten or retriggered. No callable Mersearch action or local pinned checkout was available. The raw Library export was therefore used as a bounded secondary recovery route after the Mersearch availability check. This is **not** represented as a Mersearch execution.

The HSH_RESOURCES private research payload was not accessed. No SAT-O/Blockwave equation, physical calculation, CODATA comparison, fit, prediction, manuscript, site, workflow or task was changed.

## 4. Effect on h859 report

The h859 snapshot finding and its limits are unchanged:

- current snapshot source-consistent at publication;
- both A/B records present in the full discovery catalog with raw generic reader targets;
- Paper B has a 1,400-character excerpt;
- neither is in the 48-item docket;
- live reader-route behavior remains unobserved.

This amendment closes the original-source attribution gap for the **general site-presentation principle**. It does not convert a discovery-index record into proof of live raw rendering, and it does not authorize this worker to edit the Sites surface.

**Final classification:** `ND_SOURCE_2026-09-30_RECOVERED / USER_ROLE_AUTHOR_NAME_NULL / CURRENT_ANCESTRY_CONFIRMED / GENERAL_RAW_SOURCE_PRESENTATION_RULE / A_B_CURRENT_APPLICATION_SEPARATELY_SOURCED / MERSEARCH_NOT_RUN / P0_ACTIVE`.
