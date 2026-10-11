#!/usr/bin/env python3
"""Compact, navigable receipts for oversized pinned Mersearch 1.0 results.

Output is a derived navigation aid, NEVER an exhaustive result set, citation,
source read, or new search. No source-side network access. By default, content
from the resources/ checkout is NOT repeated into the public receipt.
"""
import argparse
import collections
import hashlib
import json
from pathlib import Path

SCHEMA = 'mersearch-compact-receipt-v1'
ROOTS = ('archive', 'hsh-main', 'resources')


def sha256(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def clean(s, length=260):
    return ' '.join(str(s or '').split())[:length]


def root_of(hit):
    return str(hit.get('path', '')).split('/', 1)[0] or '(untyped)'


def score_hit(hit):
    """Navigation-only heuristic; NOT a scientific relevance measure."""
    ts = [str(t) for t in hit.get('matched_terms', [])]
    # Prefer distinctive phrases and multiple independent term matches.
    return (sum(min(len(t), 32) for t in set(ts)) +
            15 * sum(' ' in t.strip() for t in set(ts)) +
            12 * (len(set(ts)) >= 2))


def build(data, source_sha, limit=24, per_root=12):
    if not isinstance(data, dict) or not isinstance(data.get('hits'), list):
        raise ValueError('Expected Mersearch 1.0 JSON object with hits array')
    hits = data['hits']
    counts = collections.Counter(root_of(h) for h in hits)
    terms = collections.Counter(t for h in hits if root_of(h) != 'resources' for t in set(h.get('matched_terms', [])))
    by_source = {}
    for ix, h in enumerate(hits):
        root = root_of(h)
        path = str(h.get('path', ''))
        key = (root, path)
        if key not in by_source:
            by_source[key] = {'count': 0, 'best_score': -1, 'first_index': ix}
        b = by_source[key]
        b['count'] += 1
        score = score_hit(h)
        if score > b['best_score']:
            b.update(best_score=score, best_index=ix, hit=h)

    rows = []
    for (root, path), b in by_source.items():
        h = b['hit']
        rows.append(dict(root=root, path=path, title=clean(h.get('title'), 130),
                         record_count=b['count'], best_score=b['best_score'],
                         first_hit_index=b['first_index'], sample_hit_index=b['best_index'],
                         locator=clean(h.get('locator'), 200),
                         matched_terms=list(h.get('matched_terms', []))[:12],
                         excerpt=clean(h.get('excerpt'), 280)))

    # Stable tie-breaks and explicit bounded per-root representation.
    rows.sort(key=lambda r: (-r['best_score'], -r['record_count'], r['first_hit_index'], r['path']))
    selected, selected_counts = [], collections.Counter()
    for row in rows:
        if row['root'] == 'resources':
            continue  # private/internal reference surface; no detailed public receipt
        if len(selected) >= limit:
            break
        if selected_counts[row['root']] >= per_root:
            continue
        selected.append(row)
        selected_counts[row['root']] += 1
    # Preserve a chronological/engine-order baseline separate from scored samples.
    first = []
    for ix, h in enumerate(hits):
        if root_of(h) == 'resources':
            continue
        first.append(dict(hit_index=ix, root=root_of(h),
                          path=clean(h.get('path'), 250),
                          locator=clean(h.get('locator'), 120),
                          matched_terms=list(h.get('matched_terms', []))[:8]))
        if len(first) >= 8:
            break

    return dict(schema=SCHEMA,
                derived_from='SEARCH_RESULTS.json; not an independent search or an exhaustive result listing',
                source_results_sha256=source_sha,
                tool=data.get('tool_name'), tool_version=data.get('tool_version'),
                source_generated_at_utc=data.get('generated_at_utc'),
                query=data.get('query'),
                roots=data.get('roots', []),
                coverage=data.get('coverage', {}),
                counted_hits=len(hits),
                distinct_sources=len(by_source),
                results_by_root=dict(sorted(counts.items())),
                redaction_policy='No detailed resources/ paths, excerpts, or matched terms in this public receipt',
                most_common_terms=terms.most_common(24),
                ranking_note='Displayed best-score ranking is a deterministic lexical navigation heuristic, NOT source authority or a semantic ranking',
                top_sources=selected, first_hits=first,
                caveats=['Not a substitute for full SEARCH_RESULTS.json or primary sources',
                         'Input search may exclude files by size, extension or quarantine',
                         'Status, authorship and date fields are not independently verified',
                         'Only the full run manifest establishes input Git commit provenance'])


def markdown(receipt):
    esc = lambda v: str(v).replace('\x60', "'").replace('|', '/')
    lines = ['# Mersearch compact receipt', '',
             f"**Source query:** \x60{esc(receipt['query'])}\x60", '',
             f"**Search implementation:** \x60{esc(receipt['tool'])}\x60 / \x60{esc(receipt['tool_version'])}\x60",
             f"**Source JSON SHA-256:** \x60{receipt['source_results_sha256']}\x60",
             f"**Files scanned:** {receipt['coverage'].get('files_scanned', 'unknown')}; "
             f"**records scanned:** {receipt['coverage'].get('records_scanned', 'unknown')}; "
             f"**hits:** {receipt['counted_hits']}; **distinct source paths:** {receipt['distinct_sources']}", '',
             '**This is a bounded navigation receipt, not the full search results or evidence of a theory claim.**',
             'No detailed hits from the HSH_RESOURCES \x60resources/\x60 checkout are repeated in this public receipt.', '',
             '## Hits by root (counts only)', '']
    for root, count in sorted(receipt['results_by_root'].items()):
        lines.append(f'- \x60{esc(root)}\x60: {count}')
    lines += ['', '## Frequent matched terms (descriptive only)', '']
    lines.append(', '.join(f'\x60{esc(k)}\x60 ({v})' for k, v in receipt['most_common_terms']) or 'None')
    lines += ['', '## Selected distinct source paths', '',
              'Displayed by a lexical navigation score, not by scientific merit. The list is intentionally incomplete.', '']
    for r in receipt['top_sources']:
        lines.append(f"- **{esc(r['path'])}**: {r['record_count']} hit(s), sample at \x60{esc(r['locator'])}\x60 "
                     f"(JSON hit index {r['sample_hit_index']})")
        lines.append(f"  - Matched: {', '.join('\x60'+esc(x)+'\x60' for x in r['matched_terms'])}")
        if r['excerpt']:
            lines.append(f"  - Sample: {esc(r['excerpt'])}")
    lines += ['', '## First eight hits in source search order', '']
    for r in receipt['first_hits']:
        lines.append(f"- #{r['hit_index']}: \x60{esc(r['path'])}\x60 at \x60{esc(r['locator'])}\x60")
    lines += ['', '## Verification', '',
              'Read \x60RUN_MANIFEST.json\x60 for exact repository commits, exclusions and runtime SHA-256. '
              'Read the full \x60SEARCH_RESULTS.json\x60 for every hit. Follow matches into primary files. '
              'This receipt does not certify authorship, chronology, physical interpretation or exhaustiveness.', '']
    return '\n'.join(lines)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--results', required=True, type=Path)
    ap.add_argument('--out-dir', required=True, type=Path)
    ap.add_argument('--limit', type=int, default=24)
    ap.add_argument('--per-root', type=int, default=12)
    args = ap.parse_args()
    if not (1 <= args.limit <= 200 and 1 <= args.per_root <= 200):
        ap.error('limits must lie in [1, 200]')
    data = json.loads(args.results.read_text(encoding='utf-8'))
    result = build(data, sha256(args.results), args.limit, args.per_root)
    args.out_dir.mkdir(parents=True, exist_ok=True)
    (args.out_dir / 'SEARCH_RECEIPT.json').write_text(
        json.dumps(result, indent=2, ensure_ascii=False)+'\n', encoding='utf-8')
    (args.out_dir / 'SEARCH_RECEIPT.md').write_text(markdown(result), encoding='utf-8')
    print(f"receipt: {result['counted_hits']} hits, {result['distinct_sources']} sources, "
          f"{len(result['top_sources'])} listed, SHA256 {result['source_results_sha256']}")


if __name__ == '__main__':
    main()
