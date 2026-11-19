"""Regression tests for the Mersearch bridge publisher failure guard."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from mersearch_push_failure_guard import classify_push_failure


# Verbatim failure markers from Lane 2 Actions run 40261929577,
# job 121375960469 (the historical GH001 oversized-blob rejection).
GH001_LOG = """remote: warning: File indexes/mersearch_requests/archive-harvest-20261025-optics-01/SEARCH_RESULTS.md is 59.64 MB; this is larger than GitHub's recommended maximum file size of 50.00 MB
remote: error: File indexes/mersearch_requests/archive-harvest-20261025-optics-01/SEARCH_RESULTS.json is 352.48 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
! [remote rejected] HEAD -> main (pre-receive hook declined)
error: failed to push some refs to 'https://github.com/Satobloc/HsH'"""

NON_FF_LOG = """To https://github.com/Satobloc/HsH
! [rejected] HEAD -> main (non-fast-forward)
error: failed to push some refs"""

assert classify_push_failure(GH001_LOG, "a", "b", True) == "STOP_GH001_LARGE_FILE"
assert classify_push_failure(
    "remote: error: GH013: Repository rule violations found", "a", "b", True
) == "STOP_REPOSITORY_POLICY"
assert classify_push_failure(
    "remote: Permission to Satobloc/HsH.git denied to worker", "a", "b", True
) == "STOP_PERMISSION"
assert classify_push_failure(NON_FF_LOG, "a", "b", True) == "REBASE"
assert classify_push_failure(NON_FF_LOG, "a", "a", True) == "STOP_NO_REMOTE_ADVANCE"
assert classify_push_failure(NON_FF_LOG, "a", "b", False) == "STOP_REMOTE_NOT_DESCENDANT"
assert classify_push_failure("fatal: unable to access: 502 Bad Gateway", "a", "b", True) == "STOP_UNCLASSIFIED_REJECTION"
assert classify_push_failure("", "a", "b", True) == "STOP_EMPTY_PUSH_LOG"
assert classify_push_failure(NON_FF_LOG, "", "b", True) == "STOP_MISSING_REMOTE_BASE"

print("PASS: deterministic rejections stop; only observed descendant non-fast-forward permits rebase")
