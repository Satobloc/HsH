#!/usr/bin/env python3
"""Build the Glass Sausage Factory static site and preserve the existing Viewer.

Only curated public projections and accepted PDF derivatives enter the site
bundle. Raw/control JSON, staging assets, private repositories and workspaces
are not copied wholesale.
"""
from __future__ import annotations
import argparse
import datetime as dt
import hashlib
import json
import os
import re
import shutil
import subprocess
from pathlib import Path, PurePosixPath


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def safe_repo_file(repo: Path, value: str) -> Path:
    if not isinstance(value, str) or not value.strip():
        raise ValueError("Expected a repository-relative file path")
    posix = PurePosixPath(value)
    if posix.is_absolute() or "\\" in value or any(part in ("", ".", "..") for part in posix.parts):
        raise ValueError("Unsafe repository path: " + value)
    candidate = (repo / Path(*posix.parts)).resolve()
    if not candidate.is_relative_to(repo.resolve()) or not candidate.is_file():
        raise ValueError("Repository file does not exist or escapes root: " + value)
    return candidate


def public_text(value: str) -> str:
    text = str(value or "")
    text = re.sub(r"\bRavel's current Kerr line\b", "The current Kerr construction", text, flags=re.I)
    text = re.sub(r"\bRavel's\b", "The current construction's", text, flags=re.I)
    text = re.sub(r"\bRavel\s+—\s*", "Kerr construction — ", text, flags=re.I)
    text = re.sub(r"\bRavel\b", "the Kerr construction", text, flags=re.I)
    return text


def project_current_work(source):
    priorities = [{
        "order": x.get("order", ""), "title": x.get("title", ""),
        "audience_summary": public_text(x.get("audience_summary", "")),
        "status": x.get("status", ""),
    } for x in source.get("priority_stack", [])]
    fronts = [{
        "title": x.get("title", ""), "description": public_text(x.get("description", "")),
    } for x in source.get("live_fronts", [])]
    controlling = []
    for item in source.get("controlling_sources", []):
        path = item.get("path", "")
        if path in ("BEDROCK.md", "STATE_OF_THE_THEORY.md"):
            controlling.append({"path": path, "role": item.get("role", "")})
    return {
        "snapshot_date": source.get("snapshot_date"), "headline": source.get("headline", ""),
        "summary": public_text(source.get("summary", "")), "priority_stack": priorities,
        "live_fronts": fronts, "controlling_sources": controlling,
    }


def project_quotes(source):
    items = []
    for q in source.get("quotes", []):
        if q.get("display_status") != "featured":
            continue
        items.append({
            "id": q.get("id"), "speaker_class": q.get("speaker_class"),
            "speaker_label": q.get("speaker_label"), "text": q.get("text"),
            "timestamp": q.get("timestamp"), "source_path": q.get("source_path"),
            "message_id": q.get("message_id"), "context": q.get("context"),
            "source_type": q.get("source_type"),
        })
    return {"updated": source.get("updated"), "quotes": items}


def project_news(source):
    items = []
    for item in source.get("items", []):
        if item.get("display_status") != "featured":
            continue
        related = []
        for link in item.get("sat_hsh_links", []):
            title = re.sub(r"^Ravel\s+—\s*", "Kerr construction — ", str(link.get("title", "")), flags=re.I)
            related.append({"title": title, "path": link.get("path"), "relation": public_text(link.get("relation", ""))})
        items.append({
            "id": item.get("id"), "external_date": item.get("external_date"),
            "headline": item.get("headline"), "source_name": item.get("source_name"),
            "source_url": item.get("source_url"), "external_summary": item.get("external_summary"),
            "why_it_caught_attention": public_text(item.get("why_it_caught_attention", "")),
            "relationship": item.get("relationship"), "sat_hsh_links": related,
        })
    return {"updated": source.get("updated"), "editorial_heading": source.get("editorial_heading"), "items": items}


def project_papers_feed(source):
    entries = []
    for item in source.get("entries", []):
        entries.append({
            "id": item.get("id"), "title": item.get("title"), "status": item.get("status"),
            "site_display": item.get("site_display"), "version": item.get("version"),
            "date": item.get("date"), "summary": item.get("summary"), "caveat": item.get("caveat"),
            "manuscript_path": item.get("manuscript_path"), "review_path": item.get("review_path"),
            "acceptance_path": item.get("acceptance_path"),
        })
    return {"updated": source.get("updated"), "entries": entries}


def project_instruments(source):
    return {
        "updated": source.get("updated"),
        "instruments": [{
            "id": x.get("id"), "name": x.get("name"), "kind": x.get("kind"),
            "repo_html": x.get("repo_html"), "requested_route": x.get("requested_route"),
            "version": x.get("version"), "sciences_status": x.get("sciences_status"),
        } for x in source.get("instruments", [])],
    }


def copy_published_papers(repo: Path, public: Path, factory: Path):
    source_index = read_json(public / "generated" / "papers.json")
    result = {"updated": source_index.get("updated"), "content_hash": source_index.get("content_hash"), "papers": []}
    for paper in source_index.get("papers", []):
        ident = paper.get("id")
        if not isinstance(ident, str) or not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", ident):
            raise ValueError("Invalid published paper id: " + str(ident))
        source_pdf = safe_repo_file(repo, paper.get("pdf"))
        raw = source_pdf.read_bytes()
        if not raw.startswith(b"%PDF-") or b"%%EOF" not in raw[-2048:]:
            raise ValueError("Published PDF is incomplete: " + paper["pdf"])
        digest = hashlib.sha256(raw).hexdigest()
        if paper.get("pdf_sha256") and digest != paper["pdf_sha256"]:
            raise ValueError("Published PDF digest mismatch: " + paper["pdf"])
        site_pdf = "papers/files/" + ident + ".pdf"
        dest = factory / site_pdf
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_pdf, dest)
        entry = {
            "id": ident, "title": paper.get("title"), "preface": paper.get("preface"),
            "status": paper.get("status"), "date": paper.get("date"), "authors": paper.get("authors", []),
            "source": paper.get("source"), "pdf_sha256": digest, "site_pdf": site_pdf, "addenda": [],
        }
        for addendum in paper.get("addenda", []):
            aid = addendum.get("id")
            if not isinstance(aid, str) or not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", aid):
                raise ValueError("Invalid addendum id: " + str(aid))
            apdf = safe_repo_file(repo, addendum.get("pdf"))
            adata = apdf.read_bytes()
            if not adata.startswith(b"%PDF-") or b"%%EOF" not in adata[-2048:]:
                raise ValueError("Published addendum PDF is incomplete: " + addendum["pdf"])
            ahash = hashlib.sha256(adata).hexdigest()
            if addendum.get("pdf_sha256") and ahash != addendum["pdf_sha256"]:
                raise ValueError("Published addendum digest mismatch: " + addendum["pdf"])
            asite = "papers/files/" + ident + "/" + aid + ".pdf"
            adest = factory / asite
            adest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(apdf, adest)
            entry["addenda"].append({
                "id": aid, "title": addendum.get("title"), "preface": addendum.get("preface"),
                "status": addendum.get("status"), "date": addendum.get("date"),
                "sequence": addendum.get("sequence"), "site_pdf": asite, "pdf_sha256": ahash,
            })
        result["papers"].append(entry)
    return result


def copy_local_gallery_assets(repo: Path, public: Path, factory: Path, manifest):
    gallery, remote_approved = [], 0
    for asset in manifest.get("assets", []):
        if asset.get("status") != "approved":
            continue
        source = asset.get("source_path_or_url") or asset.get("source")
        if not isinstance(source, str):
            continue
        if source.startswith(("https://", "http://")):
            remote_approved += 1
            continue
        if not source.startswith("PUBLIC_SITE/"):
            continue
        src = safe_repo_file(repo, source)
        if not src.is_relative_to((public / "assets").resolve()):
            continue
        relative = src.relative_to((public / "assets").resolve())
        dest = factory / "assets" / relative
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dest)
        gallery.append({
            "id": asset.get("id"), "title": asset.get("title") or src.stem.replace("-", " ").title(),
            "caption": asset.get("caption", ""), "alt": asset.get("alt") or asset.get("title") or src.stem,
            "credit": asset.get("credit", "HsH project visual"), "date": asset.get("date"),
            "roles": asset.get("roles", []), "status": asset.get("status"),
            "notes": asset.get("notes", ""), "source_path": source,
            "image": "assets/" + relative.as_posix(),
        })
    gallery.sort(key=lambda x: (x.get("title") or "").casefold())
    return gallery, remote_approved


def redirect_page(title: str, target: str, base_path: str):
    escaped = target.replace("&", "&amp;").replace('"', "&quot;")
    return f'''<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<base href="{base_path}"><title>{title}</title><meta http-equiv="refresh" content="0;url={escaped}">
<script>location.replace({json.dumps(target)});</script></head><body><p>Opening <a href="{escaped}">{title}</a>…</p></body></html>'''


def build_site(repo: Path, output: Path, project_base: str):
    repo, output = repo.resolve(), output.resolve()
    public, source = repo / "PUBLIC_SITE", repo / "PUBLIC_SITE" / "site"
    project_base = "/" + project_base.strip("/") + "/"
    factory_base = project_base + "glass-sausage-factory/"
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True)

    # Preserve the current Viewer at /HsH/ and /mersearch/.
    viewer = repo / "CONVERSATION_VIEWER"
    if not viewer.is_dir():
        raise ValueError("CONVERSATION_VIEWER source directory is missing")
    shutil.copytree(viewer, output, dirs_exist_ok=True)

    factory = output / "glass-sausage-factory"
    factory.mkdir(parents=True)
    data_dir = factory / "data"
    data_dir.mkdir()
    current = read_json(public / "CURRENT_WORK.json")
    quotes = read_json(public / "FEATURED_QUOTES.json")
    news = read_json(public / "NEWS_FEED.json")
    papers_feed = read_json(public / "PAPERS_FEED.json")
    registry = read_json(public / "instruments" / "INSTRUMENT_REGISTRY.json")
    asset_manifest = read_json(public / "ASSET_MANIFEST.json")

    write_json(data_dir / "current-work.json", project_current_work(current))
    write_json(data_dir / "featured-quotes.json", project_quotes(quotes))
    write_json(data_dir / "news-feed.json", project_news(news))
    write_json(data_dir / "papers-feed.json", project_papers_feed(papers_feed))
    write_json(data_dir / "instruments.json", project_instruments(registry))
    papers_index = copy_published_papers(repo, public, factory)
    write_json(data_dir / "papers.json", papers_index)
    gallery, remote_approved = copy_local_gallery_assets(repo, public, factory, asset_manifest)
    write_json(data_dir / "atlas.json", gallery)

    assets_dir = factory / "assets"
    assets_dir.mkdir(exist_ok=True)
    for filename in ("site.css", "site.js"):
        shutil.copy2(source / filename, assets_dir / filename)
    for filename in ("page-listen.js", "math-speech.js"):
        shutil.copy2(public / "runtime" / filename, assets_dir / filename)
    shell = (source / "index.html").read_text(encoding="utf-8").replace("__BASE_PATH__", factory_base)
    (factory / "index.html").write_text(shell, encoding="utf-8")
    route_names = ("visual-atlas", "current-work", "news", "quotes", "papers", "reading-room", "laboratory", "about")
    for route in route_names:
        route_dir = factory / route
        route_dir.mkdir(parents=True, exist_ok=True)
        (route_dir / "index.html").write_text(shell, encoding="utf-8")

    public_instruments = []
    for item in registry.get("instruments", []):
        source_html = safe_repo_file(repo, item.get("repo_html"))
        route = item.get("requested_route", "").strip("/")
        if not route or route.startswith(".."):
            raise ValueError("Invalid instrument route: " + str(route))
        dest_dir = output / route
        dest_dir.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_html, dest_dir / "index.html")
        local_assets = source_html.parent / "assets"
        if local_assets.is_dir():
            shutil.copytree(local_assets, dest_dir / "assets", dirs_exist_ok=True)
        public_instruments.append({
            "id": item.get("id"), "name": item.get("name"), "kind": item.get("kind"),
            "repo_html": item.get("repo_html"), "requested_route": "/" + route + "/",
            "version": item.get("version"), "sciences_status": item.get("sciences_status"),
        })

    lab = output / "laboratory"
    lab.mkdir(exist_ok=True)
    lab_cards = "".join(
        '<article><h2>' + str(x["name"]) + '</h2><p>' + str(x["kind"]) +
        '</p><p><a href="' + project_base + x["requested_route"].strip("/") +
        '/">Open instrument</a></p></article>' for x in public_instruments
    )
    lab_html = f'''<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<base href="{project_base}"><title>Geometry Laboratory · HsH</title>
<style>body{{margin:0;padding:36px;background:#111416;color:#ece9e1;font:16px/1.6 system-ui}}main{{max-width:900px;margin:auto}}article{{padding:22px;margin:16px 0;background:#181d20;border:1px solid #343c40}}a{{color:#b8d0cd}}</style></head>
<body><main><p>FIE → SAT → H(s)H</p><h1>Geometry Laboratory</h1><p>Two interactive mathematical instruments, each with its own source and status.</p>{lab_cards}
<p><a href="{factory_base}">Return to the Glass Sausage Factory</a></p></main></body></html>'''
    (lab / "index.html").write_text(lab_html, encoding="utf-8")

    conversations = output / "conversations"
    conversations.mkdir(exist_ok=True)
    (conversations / "index.html").write_text(redirect_page("Conversation Viewer", project_base, project_base), encoding="utf-8")
    search = output / "research" / "search"
    search.mkdir(parents=True, exist_ok=True)
    (search / "index.html").write_text(redirect_page("Public conversation search", project_base + "mersearch/", project_base), encoding="utf-8")

    revision = os.environ.get("GITHUB_SHA")
    if not revision:
        try:
            revision = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=repo, text=True).strip()
        except Exception:
            revision = "unknown"
    manifest = {
        "schema_version": 1, "site": "Glass Sausage Factory", "source_repository": "Satobloc/HsH",
        "source_revision": revision, "built_at_utc": dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat(),
        "project_base": project_base, "factory_base": factory_base,
        "current_work_snapshot": current.get("snapshot_date"), "quote_feed_updated": quotes.get("updated"),
        "news_feed_updated": news.get("updated"), "papers_feed_updated": papers_feed.get("updated"),
        "published_pdf_count": len(papers_index.get("papers", [])), "local_approved_visual_count": len(gallery),
        "legacy_remote_approved_visuals_not_mirrored": remote_approved,
        "routes": [factory_base] + [factory_base + x + "/" for x in route_names] +
                  [project_base, project_base + "mersearch/", project_base + "laboratory/"] +
                  [project_base + x["requested_route"].strip("/") + "/" for x in public_instruments],
    }
    write_json(data_dir / "site-build.json", manifest)
    (output / ".nojekyll").write_text("", encoding="utf-8")
    (output / "404.html").write_text(redirect_page("Page not found", factory_base, project_base), encoding="utf-8")
    return manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path("."))
    parser.add_argument("--output", type=Path, default=Path("_site"))
    parser.add_argument("--base-path", default="/HsH/")
    args = parser.parse_args()
    print(json.dumps(build_site(args.root, args.output, args.base_path), ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
