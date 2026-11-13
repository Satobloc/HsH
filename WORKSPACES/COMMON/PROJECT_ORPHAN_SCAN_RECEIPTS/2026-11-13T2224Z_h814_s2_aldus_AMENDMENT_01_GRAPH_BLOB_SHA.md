# Amendment 01 | Correct TASK_BRANCH_GRAPH blob SHA

The original h814:s2 scan receipt transcribed the TASK_BRANCH_GRAPH blob SHA incorrectly.

- Incorrect string in the original receipt: 4deda7b1c6a2a7aef4e4e8e5e2f0e7e5f6a4f1c3
- Correct blob SHA from independent fetch/readback: 4deda716de633880f27f5ff076e67d43de9fabfc
- Record counts are unchanged: 18 branch records, branch_count=16.
- No graph content was changed.

This amendment supersedes only the blob-SHA string. The original receipt remains append-only.
