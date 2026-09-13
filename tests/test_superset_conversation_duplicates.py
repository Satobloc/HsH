import importlib.util
import unittest
from pathlib import Path


SCRIPT = Path(__file__).resolve().parents[1] / "WORKSPACES" / "COMMON" / "scripts" / "find_superset_conversation_duplicates.py"
SPEC = importlib.util.spec_from_file_location("find_superset_conversation_duplicates", SCRIPT)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


class SupersetConversationDuplicateTests(unittest.TestCase):
    def base_message(self):
        return {
            "id": "tool-msg-1",
            "author": {"role": "tool", "name": "python"},
            "content": {
                "content_type": "execution_output",
                "text": "line one\nline two\nline three",
            },
            "recipient": "all",
            "channel": "analysis",
            "create_time": 1_726_000_000.0,
        }

    def test_execution_output_text_truncation_changes_hash(self):
        full = self.base_message()
        truncated = self.base_message()
        truncated["content"] = dict(truncated["content"])
        truncated["content"]["text"] = "line one\n...[truncated]...\nline three"

        self.assertNotEqual(
            MODULE.canonical_message(full),
            MODULE.canonical_message(truncated),
        )

    def test_channel_change_changes_hash(self):
        analysis_message = self.base_message()
        final_message = self.base_message()
        final_message["channel"] = "final"

        self.assertNotEqual(
            MODULE.canonical_message(analysis_message),
            MODULE.canonical_message(final_message),
        )

    def test_json_object_key_order_does_not_change_hash(self):
        first = self.base_message()
        second = self.base_message()
        second["content"] = {
            "text": "line one\nline two\nline three",
            "content_type": "execution_output",
        }

        self.assertEqual(
            MODULE.canonical_message(first),
            MODULE.canonical_message(second),
        )


if __name__ == "__main__":
    unittest.main()
