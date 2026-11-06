# Hale parked-handoff amendment 01 — publisher status

This amendment supersedes the publisher-status line in the base handoff. The base handoff remains immutable.

- Issue #1418 publisher result: REJECTED: invalid submission ID.
- The ID is 83 characters; the publisher accepts at most 80.
- The content SHA-256 itself matches, but validation stopped at ID-format validation.
- The issue-publisher workflow has only an issues.opened trigger; no in-place retry route exists.
- Expected PUBLISHED_SUBMISSIONS artifact: NOT_FOUND.
- No second issue was created and no direct artifact write was attempted.

The handoff remains OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_RESPONSE_REQUIRED. No recipient acknowledgment or ChatGPT-thread delivery is claimed.
