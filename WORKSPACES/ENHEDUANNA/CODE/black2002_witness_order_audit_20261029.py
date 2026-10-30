"""Documentary source encoding only: J. A. Black, NABU 2002/1, pp. 2-4, note 4.
https://sepoa.fr/wp/wp-content/uploads/2012/05/2002-1.pdf
A/B/O/Q are historical edition sigla, NOT physical tablet IDs.
This checks only the transcription below, not the edition or original clay.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class Excerpt:
    witness: str
    preserved_attribution: bool
    preserved_final_hymn_count: bool
    order_relative_to_count: str
    following_separate_colophon_reported: bool
    last_attested_sequence: tuple[str, ...]

records = [
    Excerpt('A', True, True, 'before', True, ('attribution_543_544', 'rubric_545', 'distinct_colophon_col_vi')),
    Excerpt('B', True, True, 'after', False, ('rubric_545', 'attribution_543_544')),
    Excerpt('O', True, False, 'unresolved', False, ('attribution_543_544', 'damaged_line_22')),
    Excerpt('Q', True, True, 'before', False, ('attribution_543_544', 'rubric_545')),
]
assert len(records) == 4
assert sum(x.preserved_attribution for x in records) == 4
assert sum(x.preserved_final_hymn_count for x in records) == 3
assert [x.witness for x in records if x.order_relative_to_count == 'before'] == ['A', 'Q']
assert [x.witness for x in records if x.order_relative_to_count == 'after'] == ['B']
assert [x.witness for x in records if x.order_relative_to_count == 'unresolved'] == ['O']
assert records[0].last_attested_sequence[-1] == 'distinct_colophon_col_vi'
assert 'rubric_545' not in records[2].last_attested_sequence
assert records[3].last_attested_sequence == ('attribution_543_544', 'rubric_545')
assert sum(x.order_relative_to_count == 'before' for x in records) == 2
assert sum(x.order_relative_to_count == 'after' for x in records) == 1
assert sum(x.order_relative_to_count == 'unresolved' for x in records) == 1
print('12/12 documentary transcription assertions PASSED')
print('Direct rubric order: before=2, after=1, unresolved=1')
print('Black grouping A/O/Q is editorial inference, not three preserved rubric positions.')
print('A: separate colophon AFTER count; O: line 22 damaged, count NOT preserved.')
