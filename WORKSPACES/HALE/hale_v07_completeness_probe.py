#!/usr/bin/env python3
"""Synthetic regression for the arXiv scanner v0.7 chunk-completeness gate."""


def old_gate(available: int, returned_ids: list[str], max_fetch: int) -> bool:
    """Recovered v0.7 gate: reject only when total exceeds the cap."""
    return available <= max_fetch


def proposed_gate(available: int, returned_ids: list[str], max_fetch: int) -> bool:
    """Fail closed unless the reported chunk is completely and uniquely fetched."""
    return (
        available <= max_fetch
        and len(returned_ids) == available
        and len(set(returned_ids)) == available
    )


def main() -> None:
    fixtures = {
        "complete": (1200, [f"p{i}" for i in range(1200)], 5000),
        "premature_empty_page": (1200, [f"p{i}" for i in range(500)], 5000),
        "duplicate_page_overlap": (
            1200,
            [f"p{i}" for i in range(1000)] + [f"p{i}" for i in range(800, 1000)],
            5000,
        ),
        "cap_exceeded": (5001, [f"p{i}" for i in range(5000)], 5000),
    }

    expected = {
        "complete": True,
        "premature_empty_page": False,
        "duplicate_page_overlap": False,
        "cap_exceeded": False,
    }

    for name, (available, ids, cap) in fixtures.items():
        old = old_gate(available, ids, cap)
        new = proposed_gate(available, ids, cap)
        print(
            f"{name}: available={available} returned={len(ids)} "
            f"unique={len(set(ids))} old={old} proposed={new}"
        )
        assert new is expected[name]

    print("PASS: proposed gate accepts only a complete unique chunk.")


if __name__ == "__main__":
    main()
