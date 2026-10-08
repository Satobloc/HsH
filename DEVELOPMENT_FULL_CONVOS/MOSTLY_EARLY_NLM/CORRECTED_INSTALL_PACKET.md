# Foye V corrected install packet

## Required correction to Sable helper

Replace:

```python
for p in root.rglob("*.pdf"):
    if not p.is_file() or ".git" in p.parts: continue
```

with semantics matching `tools/index_papers.py`:

```python
SKIP_PARTS={".git","__pycache__",".pytest_cache"}

for p in root.rglob("*"):
    if not p.is_file() or any(part in SKIP_PARTS for part in p.parts):
        continue
    rel=p.relative_to(root).as_posix()
    if Path(rel).suffix.lower() != ".pdf":
        continue
    top=rel.split("/",1)[0]
    if top in {"tools","tests","indexes","derived"}:
        continue
```

Prefer the full corrected helper in this packet.

## Required tests

Install `test_pdf_inventory_freshness.py` from this packet. It adds:
- mixed/uppercase PDF;
- rename/delete;
- root PDF;
- nested machinery/source distinction;
- symlink parity;
- non-SHA256 row rejection;
plus same-size and size-change tests.

## Workflow placement

Run Morrow identity-mode preflight, then Foye-corrected PDF freshness gate, immediately before bibliography finalization.

No generated-state regeneration in the code/test commit.
