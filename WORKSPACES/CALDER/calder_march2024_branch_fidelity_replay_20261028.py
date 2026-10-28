#!/usr/bin/env python3
"""Replay March 2024 DIMENSIONAL GRAVITY branch/text fidelity on real archives.

Usage:
 python calder_march2024_branch_fidelity_replay_20261028.py \
    '/path/to/DIMENSIONAL GRAVITY raw.json' \
    '/path/to/Mar23.2024 - DIMENSIONAL GRAVITY - iPhone_Screenshot - bellomy.txt'

No synthetic fixtures, measurements or external services. This script is a
replay recipe, not a claim of physics validation or Lean proof.
"""
import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re

RAW_SHA = '2cea1924266418e19b825b95ae51e6b7cbace7e1'
DERIV_SHA = '339fddec01b717bedffed770f1b73f8bab103fb5'
WORD_RE = re.compile(r"[^\W_]+(?:['’][^\W_]+)*", re.UNICODE)
MARK_RE = re.compile(r'(?m)^(You said:|ChatGPT said:)\r?\n')
ENUM_RE = re.compile(r'(?m)^[ \t]*(?:[-*][ \t]*)?\d+[.)][ \t]+')
FOOTER_RE = re.compile(r'“measurements”\s*No file chosenNo file chosen\s*ChatGPT can make mistakes\. Check important info\.[\s\S]*$')


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()


def text_of(node):
    content = (node.get('message') or {}).get('content') or {}
    return '\n'.join(p for p in (content.get('parts') or []) if isinstance(p, str))


def tokens(text: str):
    return WORD_RE.findall(text.casefold())


def collapse(text: str):
    return ' '.join(text.split())


def segments(text: str):
    marks = list(MARK_RE.finditer(text))
    return [(m.group(1), text[m.end():marks[i+1].start() if i+1 < len(marks) else len(text)])
            for i, m in enumerate(marks)]


def ancestry(mapping, current):
    found = set()
    while current and current not in found:
        found.add(current)
        current = mapping[current].get('parent')
    return found


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('original_raw_json', type=Path)
    ap.add_argument('screenshot_derivative_txt', type=Path)
    args = ap.parse_args()
    rb = args.original_raw_json.read_bytes()
    sb = args.screenshot_derivative_txt.read_bytes()
    rsha, ssha = git_blob_sha(rb), git_blob_sha(sb)
    if (rsha, ssha) != (RAW_SHA, DERIV_SHA):
        raise SystemExit(f'REFUSED: source blob drift: {rsha}, {ssha}')
    raw = json.loads(rb.decode('utf-8'))
    screen = sb.decode('utf-8')
    mapping = raw['mapping']
    path = ancestry(mapping, raw['current_node'])
    cutoff = datetime(2024, 4, 1, tzinfo=timezone.utc).timestamp()
    assistants = sorted((node for node in mapping.values()
        if (node.get('message') or {}).get('author', {}).get('role') == 'assistant'
        and (node.get('message') or {}).get('recipient') == 'all'
        and (node.get('message') or {}).get('create_time', float('inf')) < cutoff),
        key=lambda x: x['message']['create_time'])
    selected = [node for node in assistants if node['id'] in path]
    inactive = [node for node in assistants if node['id'] not in path]
    screenshots = [s for typ, s in segments(screen) if typ == 'ChatGPT said:']
    user_screens = [s for typ, s in segments(screen) if typ == 'You said:']
    assert len(selected) == len(screenshots), 'Cannot safely align by ordinal'
    strict_equal = 0
    exact_ws = 0
    pre_enumeration_token_equal = 0
    after_documented_repairs = 0
    mismatches = []
    for i, (node, derivative) in enumerate(zip(selected, screenshots)):
        original = text_of(node)
        shown = re.sub(r'^Updated saved memory\s*', '', derivative)
        if collapse(original) == collapse(shown):
            exact_ws += 1
        if tokens(original) == tokens(shown):
            pre_enumeration_token_equal += 1
        normalized_original = ENUM_RE.sub('', original)
        if tokens(normalized_original) == tokens(shown):
            strict_equal += 1
        corrected = FOOTER_RE.sub('', shown).replace('intertwining748', 'intertwining')
        if tokens(normalized_original) == tokens(corrected):
            after_documented_repairs += 1
        else:
            mismatches.append({'ordinal': i, 'uuid': node['id']})
    branch_records = []
    for leaf in inactive:
        cur = leaf['id']
        nodes = []
        while cur not in path:
            node = mapping[cur]
            nodes.append((node.get('message') or {}).get('author', {}).get('role'))
            cur = node['parent']
        branch_records.append({'leaf_uuid': leaf['id'], 'off_path_nodes': len(nodes),
                               'roles_leaf_to_ancestor': nodes, 'common_ancestor': cur})
    result = {'raw_blob': rsha, 'derivative_blob': ssha,
        'raw_graph_nodes': len(mapping), 'selected_ancestry_nodes': len(path),
        'raw_assistant_all': len(assistants), 'selected_assistant_all': len(selected),
        'inactive_assistant_all': len(inactive),
        'screenshot_assistant_segments': len(screenshots),
        'screenshot_user_segments': len(user_screens),
        'whitespace_ui_exact': exact_ws,
        'alphanumeric_token_equal_before_enumeration': pre_enumeration_token_equal,
        'strict_alphanumeric_equal_after_enumeration': strict_equal,
        'equal_after_two_explicit_derivative_repairs': after_documented_repairs,
        'unexplained_mismatches': mismatches,
        'inactive_branch_chains': branch_records}
    print(json.dumps(result, indent=2))
    if (len(mapping), len(path), len(assistants), len(selected), len(inactive),
        len(screenshots), len(user_screens), exact_ws, pre_enumeration_token_equal,
        strict_equal, after_documented_repairs, len(mismatches)) != (
        466, 456, 135, 131, 4, 131, 131, 97, 105, 129, 131, 0):
        raise SystemExit('Observed archive diverges from 2026-10-28 source-locked audit')


if __name__ == '__main__':
    main()
