# Review-MIND h1144:s4 — License epochs, clone observability, and source-genealogy boundaries

**Status:** assistant-level operational response to the cleared September 23 license/provenance request. This is not attributed to Mira and does not imply authenticated worker participation. The review uses public HsH/SAT archive records and public standards only. It does not adjudicate the historical genealogy of braids, anyons, or related formalisms.

## Executive finding

Keep five things separate: **license permission, artifact identity, access/exposure events, authorship, and intellectual/source genealogy**. A license is not a telemetry system. A repository clone count is not an identity record. Similar mathematical structure is not, by itself, evidence of transmission.

The proposed US $0.99 handshake is not present in the current HsH/SAT license texts and cannot serve as a complete clone-tracing mechanism. Preserve historical grants by version and repository; use a frozen, per-release rights manifest and optional, explicit event receipts for future access or commercial agreements.

## 1. Verified license history

The public records support three distinct SAT/H(s)H license states:

1. **Pre-September 1, 2026 — SAT archive MIT snapshot.** The SAT archive preserves branch `archive-pre-2026-09-01-license-change`, with the cited snapshot commit `2c9076f1612be066466be3e68fec939c80f8ba0`. At that exact commit, `LICENSE` is the standard MIT License (Git blob `2f6ef53217e1d7ff212c2fbd9fd7ebbceb713a4f`). Treat this as a preserved historical grant for the covered snapshot; do not silently replace it with later terms or generalize it to other repositories without their own history audit.

2. **September 1, 2026 — SB2325 Research Commons License v0.1.** `SB2325_RESEARCH_COMMONS_LICENSE.md` (blob `7f3d8d941ea23a07e7f657aede22fd2991245052`) is explicitly version 0.1, effective September 1. Its default public license is CC BY-NC 4.0, with separately described commercial permissions and explicit limits on rights the archive holder does not control.

3. **September 4, 2026 — HSH2026 License v1.0.** The current HsH root `LICENSE` (blob `6f39fb95e700b8d6d59bbee672b6cfa76b3755aa`) and SAT archive root `LICENSE` (blob `f2ded4bb098828c96e4f7021b9d871960a4be7a8`) both identify HSH2026 License v1.0, effective September 4, with CC BY-NC 4.0 as the default for covered material and separate commercial grants. They are **not byte-identical**: the SAT archive copy includes the SB2325/legacy-MIT notice; the HsH copy has a different plain-language preamble and completed citation metadata. Keep repository-specific notices and scope explicit rather than assuming one root file proves the history of every repository.

The current v1.0 text lists a US $5,000 one-time early-supporter commercial research pass, US $10,000/year for systematic archive mining, and separate material-dependent commercial arrangements. The September 23 request's proposed $0.99 handshake is **not** in the current license text. It should not be introduced as if it were already adopted.

Two drafting/scope points deserve legal review before any future revision:

- The HsH preamble says “Otherwise, free use,” while the operative default is CC BY-NC 4.0 and commercial use is handled separately. Clarify the plain-language summary so it cannot be read more broadly than the operative grant.
- Both license texts exclude third-party material and rights the archive holder does not own or control. A repository-wide default therefore cannot replace file-level exceptions, source notices, or contributor authority checks.

This is a source audit, not legal advice. The exact scope of each historical grant must be tied to the repository, file/version, rights holder, and evidence that the grant was authorized. The verified MIT branch is for the SAT archive snapshot; it does not prove that HsH or HSH_RESOURCES had the same earlier license.

## 2. Why a $0.99 handshake cannot trace GitHub cloning

The internal historical observation records **119,670 HsH clones for November 10–23, 2026** from a single-repository GitHub Traffic CSV. The CSV was installed on November 25; its dashboard capture time is not embedded. The paired daily unique-cloner values sum to 25,011, but that sum is **not** the 14-day unique-cloner total. The window-level unique total remains unknown.

The current GTT thread key keeps traffic attribution unresolved: GTT-02 is parked pending direct Traffic evidence; GTT-03 is not open. Existing internal event records do not justify subtracting checkouts/API activity from the GitHub total to manufacture an “external” residual.

GitHub's documented clones endpoint returns aggregate `count`, `uniques`, and daily/weekly rows for the **last 14 days**. Its response schema contains no actor, account, IP, or individual-clone identity. The numbers are useful traffic observations, not an identity ledger. A historical CSV snapshot also cannot reconstruct identities that the source never supplied.

Therefore:

- A mandatory $0.99 payment or registration cannot identify everyone who clones a public GitHub repository; direct Git operations bypass a separate portal.
- An optional portal can record only the users who choose that portal. It is an opt-in access receipt, not a census of all access and not evidence of influence.
- Do not infer a person, organization, commercial use, or intellectual transmission from clone counts, unique counts, referrers, or timing alone.
- If a separate commercial license is offered for uses outside existing grants, record that agreement explicitly against the exact asset/version and scope. Keep it distinct from noncommercial permissions already granted.

The existing `CLONE_LEDGER_STANDARD.md` and GTT work should remain the operational basis. Do not build a second tracking service or merge license acceptance into a clone-count field. If a future voluntary acceptance event is added, it should be a distinct event type with timestamp, exact license-text digest, asset/release ID, terms accepted, actor identity only where supplied/consented, and a clear retention/privacy basis. It must not restrict rights already granted.

## 3. Recommended layered rights/provenance manifest

Use stable logical identity plus immutable version identity. A path or filename alone is not an identifier; the same CSV path was reused for different 14-day windows in the existing traffic archive.

Minimum layers:

- **Archive:** repository identity and scope.
- **License epoch:** version, effective date, exact license-text digest, and repositories/assets to which it applies.
- **Release:** immutable repository commit, release date, manifest digest, and (where deposited) DOI.
- **Asset:** stable logical `asset_id` for a work/document/dataset/code component.
- **Asset version:** `version_id`, exact path, Git commit, Git blob, and SHA-256 of the decoded content.
- **Rights record:** declared license, concluded license, rights holder/authority, source evidence, attribution, third-party exclusions, and explicit status (`verified`, `provisional`, `no_assertion`, `excluded`, or `unresolved`).
- **Derivation record:** typed `derived_from`, `translated_from`, `annotated_from`, `compiled_from`, or `reproduced_from` edges, each pointing to exact source versions.
- **Exposure/acceptance event:** a separate, privacy-minimized record for an actual observed access or explicit agreement. It must not be inferred from a license label or aggregate traffic count.

For software artifacts, SPDX 3.0.1 is a good existing standard to reuse. Its Licensing Profile distinguishes `hasDeclaredLicense` (what is actually found in the artifact) from `hasConcludedLicense` (the assessed governing license); it also distinguishes a known `NoAssertion` from a missing relationship. Do not treat missing metadata as proof of public domain or as proof that the repository-root license necessarily covers every file. For manuscripts, images, conversation-derived documents, and mixed research datasets, use a small sidecar manifest with equivalent fields rather than forcing every object into a software-only model.

For frozen releases, use the **version-specific DOI** when citing the exact artifact and the **concept DOI** when referring to the evolving collection. Zenodo documents both. Keep the Git commit/blob and content SHA-256 alongside the DOI: the DOI identifies the deposited record/version, while the commit and hashes identify the exact repository bytes.

## 4. Source genealogy is not license genealogy

For braid/anyon and other cross-formalism work, use a separate typed source graph. Suggested relation types:

- `direct_derivation` — a specific adaptation with primary-source evidence and a documented transmission/exposure path;
- `cited_antecedent` — an explicit citation to an earlier source;
- `shared_antecedent` — two later works cite or derive from the same earlier source, without evidence of direct transmission between them;
- `later_unification` — a later formalism demonstrates a mathematical connection between previously distinct traditions;
- `structural_analogy` — a similarity of mathematical form without established historical transmission;
- `retrospective_family_resemblance` — a broad later classification, not a demonstrated genealogy;
- `independent_convergence` — a positive, source-supported case of independent development; absence of a known citation alone is insufficient.

Each edge should carry its primary locator, exact source version/hash, date, evidence class, confidence, alternative explanations, and counterevidence. Keep “exposure observed” separate from “influence established”: access can make transmission possible without proving that it occurred. A common citation can establish a shared antecedent without proving that one author transmitted the idea to another.

The U.S. Copyright Office states that copyright protects expression, not ideas, procedures, systems, mathematical principles, formulas, or algorithms. Thus a license may govern a manuscript's wording, diagrams, code, or a copyrightable compilation, but it should not be represented as ownership of an abstract mathematical idea or an independently discovered result.

No braid/anyon historical genealogy or influence finding is made in this operational pass.

## 5. Formal structure and Lean status

There is a precise information-loss statement behind the traffic limitation. Let `P : Histories → AggregateObservation` be the projection to a clone-count observation, and let `A : Histories → ActorIdentity` be an actor-identification map. A deterministic actor map can be recovered from the aggregate observation only if `A` is constant on every fibre of `P`:

\[
P(h_1)=P(h_2)\Rightarrow A(h_1)=A(h_2).
\]

If two event histories produce the same aggregate count but have different actors, that fibre condition fails. No deterministic function of the aggregate count alone can recover the actor identity.

The existing Nadir module `NadirProjectionCoarseGrainFactorization.lean` contains the general theorems `factorization_iff_fiberwise` and `no_inducedCoarseGraining_of_fiber_mismatch`. It was built in GitHub Actions run [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757), job `139212241107`, at exact checkout `3f344a3f120a9ed63c1836549e3bcb696589eaea`, using Lean 4.34.0 / Lake 5.0.0. The full build succeeded (8,963 jobs). The theorem-specific `#print axioms` output reports `Classical.choice` for `factorization_iff_fiberwise` and `no_inducedCoarseGraining_of_fiber_mismatch`, `Quot.sound` for `inducedCoarseGraining_unique`, and no axioms for `imageProjection_surjective`. The global axiom audit, tests, lint, and nanoda were skipped.

This is an **existing generic theorem on an open/draft, unmerged PR branch**, not a new HsH-main proof. Its application to GitHub traffic is conditional on the stated event-history and projection definitions. The concrete GitHub event model was not separately formalized or compiled in this run. No new Lean module or PR was created. Lean checks the encoded mathematical statement; it does not establish the provenance of any particular clone or the truth of an external attribution claim.

## 6. Bounded recommendation

1. Preserve the SAT pre-September 1 MIT snapshot and the September 1 / September 4 license epochs as distinct historical states.
2. Do not retroactively impose the proposed $0.99 handshake on material already distributed under MIT or CC BY-NC 4.0. CC BY-NC 4.0 is irrevocable for licensed rights and prohibits downstream terms that restrict those rights; a separate commercial grant can be offered for uses outside the existing grant, subject to legal review.
3. Reconcile the September 23 proposal with the actual HSH2026 v1.0 text before changing any license terms. Clarify the “Otherwise, free use” summary and the repository-specific license notices.
4. Add a versioned, per-release rights manifest and per-asset exceptions using existing Git/DOI/SPDX/clone-ledger infrastructure. Do not create a new tracking tool.
5. Keep source genealogy, access telemetry, license permissions, authorship, and publication eligibility as separate graph dimensions. No influence claim without primary-source evidence.

**Next decision:** whether Nathan wants a qualified IP/licensing review of the current v1.0 wording and the exact repository/file coverage before any prospective license change. No license, repository, access-control, or telemetry setting was changed by this report.

### Sources

- [September 23 safe-interface request](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/MIRA_LICENSE_PROVENANCE_ADVICE_REQUEST_2026-09-23.md)
- [HsH current LICENSE](https://github.com/Satobloc/HsH/blob/main/LICENSE)
- [SAT archive current LICENSE and legacy notice](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/LICENSE)
- [SB2325 Research Commons License v0.1](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SB2325_RESEARCH_COMMONS_LICENSE.md)
- [Preserved pre-September 1 MIT snapshot](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/2c9076f1612be066466be3e68fec939c80f8ba0/LICENSE)
- [GTT historical observations](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/GIT_TRAFFIC_HISTORICAL_OBSERVATIONS_2026-11-25.md)
- [GTT thread key](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/GIT_TRAFFIC_THREAD_KEY.md)
- [Clone ledger standard](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md)
- [GitHub repository traffic API](https://docs.github.com/en/rest/metrics/traffic)
- [SPDX 3.0.1 Licensing Profile](https://spdx.github.io/spdx-spec/v3.0.1/model/Licensing/Licensing/)
- [Creative Commons BY-NC 4.0 legal code](https://creativecommons.org/licenses/by-nc/4.0/legalcode)
- [Zenodo DOI versioning](https://support.zenodo.org/help/en-gb/1-upload-deposit/97-what-is-doi-versioning)
- [U.S. Copyright Office Circular 31 — Ideas, Methods, or Systems](https://www.copyright.gov/circs/circ31.pdf)

**Tocktick:** current focus — preserve rights/provenance boundaries; immediate action — obtain legal review before any new license epoch; stop — no $0.99 gate or influence inference from clone counts; return — this report and the exact license/traffic sources above.
