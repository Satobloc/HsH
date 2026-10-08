# Mersearch | The Glass Archive (Human Interface)

This directory is the **human-facing research interface** for Mersearch. It is designed for people who want to follow the history of an idea without memorizing a Boolean query language. The underlying search engine is the same Mersearch Core used by agents and research workers. Chronology is an optional perspective, not a separate search product.

**Status:** development / draft PR #10. Do not advertise public live searching until an allowlisted search backend has been deployed and tested.

## Run it on your Windows computer

From a working checkout of the HsH repository, double-click **START_MERSEARCH.cmd** in the repository root. Python 3 must be available. The launcher opens your browser at an automatically selected local address and starts the **research** profile.

Alternatively:

    python tools/serve_mersearch_ui.py

For the restricted public-content profile, run:

    python tools/serve_mersearch_ui.py --profile public

This server binds only to 127.0.0.1. It **is not** an internet-facing production API. Close its terminal or press Ctrl+C to stop it.

For three-archive research coverage, keep sibling checkouts adjacent:

    SAT_THEORY_ARCHIVE_2023-25/
    HsH/
    HSH_RESOURCES/

Use --archives-home to point at a different parent directory. If a repository is missing, Mersearch reports partial coverage rather than pretending the result is exhaustive. Search runs currently scan files in each archive; larger searches will become faster when the indexed Core/API is promoted.

## Interface features

- Search ordinary terms, an exact phrase, mathematical notation or advanced Boolean/NEAR expressions.
- Choose historical era, version designation, speaker, source repository, filename/title, and date confidence filters without writing syntax.
- View passages or per-file results. Sort by direct dates or estimated origin, with clearly distinguished evidence classes.
- Open original GitHub source documents and reveal chronology evidence, archive dates, version history and byte-identical mirror locations.
- Switch into **Chronology**, a histogram of *currently loaded dated results*. It is not represented as a complete archive histogram.
- Import Mersearch SEARCH_RESULTS.json exports without a backend. Imported results are explicitly labeled as such.
- Export source-backed results as JSON. Save private search queries in your own browser; no accounts or telemetry.

## Public safety

The public profile only includes the public original SAT archive and an explicit allowlist of public-facing HsH documents: README.md, BEDROCK.md, PUBLIC_SITE, NEW_PAPERS and the Conversation Viewer README. It does **not** index HSH_RESOURCES, arbitrary working directories or PRIOR_ART/QUARANTINE.

The client cannot choose source roots. HTTP requests cannot override the public allowlist; this is enforced by the local service, not merely by disabled UI controls.

Do not put the **research** profile on an internet-facing host. For a real public service, deploy a hardened independently authenticated/isolated backend with a prebuilt public allowlisted index. Do not add private repository tokens to a static site.

## GitHub Pages

The existing Conversation Viewer Pages workflow publishes the contents of CONVERSATION_VIEWER as its site root. Upon merge and deployment, this folder can appear at:

    https://satobloc.github.io/HsH/mersearch/

**Static Pages have no Python service.** In that environment this UI transparently enters preview/import mode. It can load existing local JSON results, but it will not falsely claim live archive-wide search. To make live public search available, configure a separately deployed approved API service or a public static index under a reviewed search architecture.

The Conversation Viewer gains a Mersearch navigation link. Static asset updates are included in the Pages workflow trigger.

## Accessibility and privacy

Responsive for desktop/mobile, semantic labels and buttons, keyboard / or Ctrl+K to focus search, visible focus, reduced-motion support, and no required external assets/fonts/scripts. Search data is rendered through text nodes, never trusted HTML. No analytics. Saved searches use browser localStorage on this device only.

## Test surfaces

    python -m unittest discover -s WORKSPACES/MERCER -p 'test_mersearch_ui.py' -v
    node --check CONVERSATION_VIEWER/mersearch/mersearch.js

GitHub Actions workflow: .github/workflows/mersearch-ui-dev.yml. Covers JavaScript/Python syntax, no private resources in public profile, pagination/caching and local API origin enforcement. A full human browser QA and large-corpus benchmark are still required before public launch.
