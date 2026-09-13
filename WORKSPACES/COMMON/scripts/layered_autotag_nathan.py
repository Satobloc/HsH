#!/usr/bin/env python3
"""Archive-wide three-level conversation autotagger.

Purpose: broad retrieval/indexing redundancy for Nathan's conversation archive.
This is a machine pre-tagging and winnowing layer only. It does NOT promote
material into NATHAN_VERIFIED_WORDS_COMPENDIUM.md and does NOT infer authorship
from style.

Relevance is recorded at three levels:
  1) conversation level (both speakers)
  2) adjacency level (nearby turns, both speakers; highest retrieval priority)
  3) message level (the message itself)

The tagger scans every JSON file beneath the supplied roots and accepts only
objects that actually look like ChatGPT conversation exports (a mapping of
message nodes). Filename conventions such as "*raw*.json" are not required.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

TOPICS: dict[str, tuple[str, ...]] = {
    "SAT-HSH": ("sat", "scalar angular torsion", "h(s)h", "hsh", "blockwave", "4dhh", "sat-o", "stringing-along theory"),
    "4D-THINKING": ("4d", "four dimensional", "four-dimensional", "four space", "4-space", "orthogonal dimension"),
    "DIMENSIONALITY": ("dimension", "dimensional", "meters and meters", "metres and metres", "length-valued", "proper dimensionality"),
    "SPEED-OF-TIME": ("speed of time", "rate of time", "time speed"),
    "C-TYPING": ("w=ct", "w = ct", "w component", "intersection propagation", "speed of light"),
    "W-AXIS": ("w-axis", "w axis", "w direction", "w-direction", "w component"),
    "TIMESHEET": ("timesheet", "time sheet", "time surface", "wavefront", "resolver"),
    "INTERSECTION-READOUT": ("intersection", "readout", "projection", "slice", "cross-section", "cross section", "resolving surface"),
    "WORLDLINE": ("worldline", "world line"),
    "WORLDTUBE": ("worldtube", "world tube", "finite core", "tubular neighborhood"),
    "HELIX-GEOMETRY": ("helix", "helical", "pitch", "radius", "arc length", "arclength", "coil", "superhelix", "hyperhelix"),
    "NESTING": ("nested", "nesting", "recursive", "scale level", "scale order", "superhelical", "hyperhelical"),
    "BRAIDING": ("braid", "braiding", "interbraid", "borromean", "brunnian", "string link"),
    "TOPOLOGY-MORPHOLOGY": ("topology", "morphology", "knot", "chirality", "winding", "reconnection"),
    "UI": (" universal indicatrix", " ui ", "indicatrix", "user interface"),
    "WHIRLIGIG-DONUT": ("whirligig", "whirlygig", "donut", "torus", "toroid"),
    "SPHERES": ("spheres", "sphere", "spheroid"),
    "GRATICULE": ("graticule", "graticulum", "graticula", "gendarme"),
    "HAGALAZ": ("hagalaz",),
    "INTERACTIONS": ("interaction", "interactions", "coupling", "force transfer", "energy transfer"),
    "ELECTROGRAVITY": ("electrogravity",),
    "INTERBRAID": ("interbraid",),
    "FINITE-CORE": ("finite core", "finite-core", "core radius", "cross-sectional core"),
    "METRIC": ("metric", "minkowski", "lorentz", "signature", "effective metric"),
    "HOLONOMY": ("holonomy", "phase retardance", "geometric phase"),
    "QUANTIZATION": ("quantization", "quantized", "quantisation", "discrete", "continuous spacetime", "emergent quant"),
    "LAGRANGIAN": ("lagrangian", "action", "euler-lagrange", "hamiltonian"),
    "MODEL-VS-REALITY": ("physical claim", "ontology", "representation", "abstraction", "heuristic", "model vs reality"),
    "PROVENANCE-HISTORY": ("earliest", "original", "history", "timeline", "goes back", "used to", "later version", "provenance"),
    "PHYSICS": ("physics", "physical", "spacetime", "particle", "field", "energy", "momentum"),
    "RELATIVITY": ("relativity", "minkowski", "lorentz", "einstein", "proper time", "geodesic"),
    "GRAVITY": ("gravity", "gravitational", "general relativity", "curvature"),
    "QUANTUM": ("quantum", "qft", "wavefunction", "hilbert", "operator", "commutator", "superposition"),
    "PARTICLE-PHYSICS": ("particle", "electron", "proton", "neutron", "quark", "lepton", "boson", "fermion", "standard model"),
    "PHOTON-NEUTRINO": ("photon", "neutrino"),
    "COSMOLOGY": ("cosmology", "universe", "hubble", "inflation", "dark energy", "dark matter", "friedmann"),
    "BLACK-HOLES": ("black hole", "kerr", "schwarzschild", "horizon", "singularity", "hawking"),
    "ASTROPHYSICS": ("pulsar", "neutron star", "glitch", "supernova", "galaxy", "astrophys"),
    "ELECTROMAGNETISM": ("electromagnet", "electric", "magnetic", "maxwell", "charge", "voltage", "current"),
    "OPTICS": ("optics", "lens", "light path", "diffraction", "refraction", "interference", "polarization", "polarisation"),
    "THERMODYNAMICS": ("thermodynamic", "entropy", "temperature", "heat", "free energy"),
    "MATHEMATICS": ("equation", "theorem", "proof", "derive", "derivation", "mathematics", "math"),
    "GEOMETRY": ("geometry", "geometric", "curve", "surface", "manifold", "radius", "angle"),
    "TOPOLOGY": ("topology", "topological", "homotopy", "homology", "knot", "braid"),
    "ALGEBRA": ("algebra", "group", "clifford", "lie algebra", "matrix", "tensor"),
    "CALCULUS": ("derivative", "integral", "variation", "calculus", "differential equation"),
    "PROBABILITY-STATS": ("probability", "statistics", "bayes", "confidence interval", "distribution", "regression"),
    "GEOLOGY": ("geology", "geologic", "rock", "mineral", "stratigraphy", "sediment"),
    "PALEONTOLOGY": ("paleontology", "palaeontology", "fossil", "conodont", "trilobite"),
    "BIOLOGY": ("biology", "biological", "cell", "organism", "genetics", "gene", "evolution"),
    "CHEMISTRY": ("chemistry", "chemical", "molecule", "molecular", "reaction", "element"),
    "ASTRONOMY": ("astronomy", "astronomical", "planet", "star", "moon", "asteroid", "telescope"),
    "NEUROSCIENCE": ("neuroscience", "brain", "neuron", "cognition", "consciousness"),
    "MEDICINE-HEALTH": ("medical", "medicine", "health", "disease", "symptom", "diagnosis", "drug"),
    "AI-LLM": ("chatgpt", "gpt", "llm", "language model", "gemini", "claude", "notebooklm", "artificial intelligence"),
    "CODING": ("python", "javascript", "typescript", "code", "script", "function", "class ", "syntax error"),
    "LEAN-FORMALIZATION": ("lean", "theorem prover", "formal proof", "mathlib"),
    "GITHUB-REPO": ("github", "repo", "repository", "commit", "branch", "pull request"),
    "ARCHIVE-INDEXING": ("archive", "index", "indexing", "wayfinding", "dashboard", "manifest", "ledger", "corpus"),
    "AUTOMATION": ("automation", "automate", "workflow", "scheduled task", "recurring task", "cron"),
    "DATA-PROCESSING": ("json", "jsonl", "csv", "dataset", "dataframe", "parse", "extract"),
    "VISUALIZATION": ("visualization", "visualisation", "plot", "graph", "diagram", "animation", "render"),
    "IMAGE-PHOTOGRAPHY": ("camera", "photo", "photograph", "canon", "ccd", "sensor", "exposure", "macro lens"),
    "PHILOSOPHY": ("philosophy", "philosophical", "epistemology", "ontology", "solips", "consciousness"),
    "EDUCATION": ("teach", "teaching", "student", "lesson", "classroom", "education"),
    "WRITING": ("writing", "rewrite", "essay", "story", "fiction", "prose", "draft"),
    "LANGUAGE": ("language", "word", "phrase", "grammar", "translation", "etymology"),
    "ART-DESIGN": ("art", "artist", "design", "drawing", "illustration", "aesthetic"),
    "MUSIC-AUDIO": ("music", "audio", "sound", "podcast", "recording", "song"),
    "FILM-MEDIA": ("film", "movie", "video", "media", "episode"),
    "HISTORY": ("history", "historical", "century", "ancient", "modern era"),
    "POLITICS-POLICY": ("politics", "political", "election", "policy", "government"),
    "LAW-LEGAL": ("legal", "law", "court", "charge", "attorney", "case"),
    "WORK-CAREER": ("job", "career", "workplace", "resume", "interview", "employer"),
    "PERSONAL-BIOGRAPHICAL": ("my life", "when i was", "i worked", "i lived", "my family", "my friend"),
}

BUNDLES: dict[str, tuple[str, ...]] = {
    "EPISTEMOLOGY": ("know", "knowledge", "evidence", "epistem", "justify", "confidence", "certain", "uncertain", "believe", "credibility"),
    "METHODOLOGY": ("method", "approach", "procedure", "workflow", "test", "audit", "compare", "rule", "criterion", "rubric"),
    "REASONING": ("reason", "because", "therefore", "if ", "then ", "follows", "means", "implies", "chain", "so that"),
    "IDEATION": ("idea", "what if", "could we", "can we", "suppose", "imagine", "maybe try", "wonder"),
    "SPECULATION": ("maybe", "perhaps", "might", "could", "possibly", "hunch", "speculat", "i wonder"),
    "HYPOTHESIS": ("hypothesis", "hypothesize", "hypothesise", "proposal", "propose that"),
    "TESTING-VALIDATION": ("validate", "validation", "falsif", "test", "check", "benchmark", "constraint", "prediction"),
    "COMPARISON": ("compare", "comparison", "versus", " vs ", "relative to", "against"),
    "DEFINITION": ("define", "definition", "means that", "when i say", "term"),
    "CLASSIFICATION": ("classify", "category", "rubric", "tag", "bucket", "type of"),
    "PLANNING": ("plan", "next step", "priority", "roadmap", "agenda", "task"),
    "DECISION": ("decide", "decision", "choose", "choice", "prefer", "go with"),
    "REVISION": ("revise", "revision", "change that", "update", "replace", "rework"),
}

DISCOURSE_PATTERNS: dict[str, tuple[str, ...]] = {
    "URGENCY": ("immediately", "right now", "urgent", "stop work", "do this now", "must"),
    "INSISTENCE": ("i insist", "do not", "don't", "must", "always", "never", "i cannot emphasize"),
    "DIDACTICISM": ("the point is", "what i mean is", "understand that", "the way to think", "remember"),
    "POINTEDNESS": ("the point", "specifically", "exactly what", "precisely", "in point of fact"),
    "BLUNTNESS": ("blunt", "simply", "just ", "no.", "wrong", "nonsense"),
    "COARSENESS": ("fuck", "fucking", "shit", "damn", "bullshit"),
    "CORRECTIVE": ("actually", "correction", "correct that", "take that back", "not exactly", "rather", "instead", "that's not"),
    "NEGATING": (" no ", "not ", "isn't", "aren't", "doesn't", "don't", "cannot", "can't", "never"),
    "COUNTERMANDING": ("stop", "do not", "don't", "cancel", "ignore that", "forget that", "revert", "go back"),
    "COMPLAINING": ("problem", "issue", "not happy", "frustrat", "annoy", "why are you", "you keep"),
    "BLOVIATING": ("let me ramble", "long story", "i'm going on", "to belabor"),
    "ADVERSARIALISM": ("disagree", "challenge", "push back", "argue", "objection", "no, because"),
    "CHALLENGE": ("prove", "show me", "convince me", "check it", "audit", "test this"),
    "GENTLE-REDIRECTION": ("well,", "okay, but", "ok, but", "yes, but", "i think instead", "let's instead"),
    "CLARIFICATION": ("what i mean", "to clarify", "more precisely", "in other words", "by that i mean", "specifically"),
    "NUANCE": ("although", "however", "but", "except", "on the other hand", "at least", "mostly", "partly"),
    "HESITANCY": ("well,", "i'm not sure", "i am not sure", "my feeling is", "the way i see it", "i think", "i suspect", "maybe", "perhaps"),
    "ENTHUSIASTIC-AGREEMENT": ("precisely", "exactly", "correct", "that's right", "thats right", "i agree", "yes!", "yes.", "right."),
    "QUALIFICATION": ("to an extent", "insofar", "as far as", "roughly", "basically", "mostly", "probably", "provisionally"),
    "SELF-CORRECTION": ("i take that back", "rather,", "no, wait", "scratch that", "i mean"),
}

SKIP_DIR_NAMES = {".git", "__pycache__", ".venv", "node_modules"}
GENERATED_PREFIXES = ("WORKSPACES/COMMON/analysis/", "indexes/autotag/", "CONVERSATION_VIEWER/data/")


def norm(s: str) -> str:
    return re.sub(r"\s+", " ", s.lower()).strip()


def phrase_hits(text: str, phrases: tuple[str, ...]) -> list[str]:
    t = f" {norm(text)} "
    return [p for p in phrases if p and p in t]


def extract_text(message: dict[str, Any]) -> str:
    content = message.get("content") or {}
    parts = content.get("parts") or []
    out: list[str] = []
    for p in parts:
        if isinstance(p, str):
            out.append(p)
        elif isinstance(p, dict) and isinstance(p.get("text"), str):
            out.append(p["text"])
    return "\n".join(out).strip()


def conversation_objects(obj: Any) -> list[dict[str, Any]]:
    if isinstance(obj, dict) and isinstance(obj.get("mapping"), dict):
        return [obj]
    if isinstance(obj, list):
        return [x for x in obj if isinstance(x, dict) and isinstance(x.get("mapping"), dict)]
    return []


def load_conversations(path: Path) -> list[tuple[str, str | None, list[dict[str, Any]]]]:
    obj = json.loads(path.read_text(encoding="utf-8"))
    out = []
    for conv in conversation_objects(obj):
        title = conv.get("title") or path.stem
        conv_id = conv.get("id") or conv.get("conversation_id")
        rows = []
        for node_id, node in (conv.get("mapping") or {}).items():
            msg = (node or {}).get("message")
            if not isinstance(msg, dict):
                continue
            text = extract_text(msg)
            if not text:
                continue
            author = msg.get("author") or {}
            rows.append({"node_id": node_id, "message_id": msg.get("id") or node_id,
                         "parent": (node or {}).get("parent"), "role": author.get("role"),
                         "author_name": author.get("name"), "recipient": msg.get("recipient"),
                         "create_time": msg.get("create_time"), "text": text})
        rows.sort(key=lambda r: (r["create_time"] is None, r["create_time"] or 0, r["node_id"]))
        if rows:
            out.append((title, conv_id, rows))
    return out


def topic_tags(text: str) -> set[str]:
    return {tag for tag, phrases in TOPICS.items() if phrase_hits(text, phrases)}


def rhetorical_tags(text: str) -> set[str]:
    t = norm(text)
    out = {tag for tag, phrases in BUNDLES.items() if phrase_hits(text, phrases)}
    out |= {tag for tag, phrases in DISCOURSE_PATTERNS.items() if phrase_hits(text, phrases)}
    words = re.findall(r"\b\w+[’']?\w*\b", text, re.UNICODE)
    wc = len(words)
    if wc >= 220: out.add("LOGORRHEA")
    if wc >= 120: out.add("LONG-FORM")
    if wc <= 12: out.add("SHORT-TURN")
    if "—" in text or "--" in text: out.add("PRECISION:EM-DASH")
    if "..." in text or "…" in text: out.add("PRECISION:ELLIPSIS")
    if re.search(r"\([^\n]{3,}\)", text): out.add("PRECISION:PARENTHETICAL")
    if re.search(r"\[[^\n]{3,}\]", text) or re.search(r"\{[^\n]{3,}\}", text): out.add("PRECISION:BRACKETING")
    sub = len(re.findall(r"\b(although|because|unless|while|whereas|which|that|if|when|except|but)\b", t))
    punct = sum(text.count(x) for x in (",", ";", ":", "—", "("))
    if wc >= 45 and sub >= 3 and punct >= 6: out.add("PRECISION:NESTED-CLAUSES")
    if re.search(r"\b(NO|DO NOT|NEVER|STOP|WRONG|EXACTLY|PRECISELY)\b", text): out.add("EMPHASIS:ALL-CAPS")
    if text.count("!") >= 2: out.add("EMPHASIS:EXCLAMATORY")
    if text.count("?") >= 3: out.add("QUESTION-BURST")
    return out


def layer_score(tags: set[str]) -> float:
    return min(16.0, float(len(tags)))


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def discover_json(root: Path) -> list[Path]:
    if root.is_file() and root.suffix.lower() == ".json": return [root]
    if not root.exists(): return []
    files = []
    for p in root.rglob("*.json"):
        if any(part in SKIP_DIR_NAMES for part in p.parts): continue
        rel = p.as_posix()
        if any(rel.startswith(prefix) for prefix in GENERATED_PREFIXES): continue
        if p.is_file(): files.append(p)
    return sorted(files)


def read_index_strings(path: Path | None) -> set[str]:
    if not path or not path.exists(): return set()
    try: obj = json.loads(path.read_text(encoding="utf-8"))
    except Exception: return set()
    found: set[str] = set()
    def walk(x: Any) -> None:
        if isinstance(x, str) and x.lower().endswith(".json"): found.add(x.replace("\\", "/"))
        elif isinstance(x, dict):
            for v in x.values(): walk(v)
        elif isinstance(x, list):
            for v in x: walk(v)
    walk(obj)
    return found


def process_conversation(path: Path, title: str, conv_id: str | None, rows: list[dict[str, Any]], window: int,
                         indexed_paths: set[str]) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    direct_topics = [topic_tags(r["text"]) for r in rows]
    all_conv_topics = set().union(*direct_topics) if direct_topics else set()
    user_rhetoric = [rhetorical_tags(r["text"]) if r["role"] == "user" else set() for r in rows]
    conv_density = sum(bool(x) for x in direct_topics) / max(1, len(rows))
    conv_tags = {f"CONV:{t}" for t in all_conv_topics}
    if conv_density >= .45: conv_tags.add("CONV:HIGH-TOPIC-DENSITY")
    elif conv_density >= .15: conv_tags.add("CONV:TOPIC-DENSE")
    elif conv_density > 0: conv_tags.add("CONV:TOPIC-SPARSE")
    relpath = path.as_posix()
    index_present = relpath in indexed_paths if indexed_paths else None
    if index_present is False: conv_tags.add("INDEX-GAP-CANDIDATE")
    if "SAT-HSH" in all_conv_topics: conv_tags.add("CONV:SAT-HSH")
    if "ARCHIVE-INDEXING" in all_conv_topics: conv_tags.add("CONV:ARCHIVE-WORK")
    records = []
    for i, r in enumerate(rows):
        lo, hi = max(0, i-window), min(len(rows), i+window+1)
        near, weighted_adj, weight_total = set(), 0.0, 0.0
        for j in range(lo, hi):
            if j == i: continue
            d, w = abs(j-i), 1.0/abs(j-i)
            near |= direct_topics[j]; weighted_adj += w*layer_score(direct_topics[j]); weight_total += w
        adj_strength = weighted_adj / weight_total if weight_total else 0.0
        msg_topics, rhetoric = direct_topics[i], user_rhetoric[i]
        adj_rel = min(12.0, adj_strength + (2.0 if near else 0.0))
        msg_rel = min(12.0, layer_score(msg_topics) + (2.0 if msg_topics else 0.0))
        conv_rel = min(12.0, 12.0*conv_density + min(3.0, len(all_conv_topics)/8.0))
        discourse_bonus = min(4.0, .22*len(rhetoric - {"SHORT-TURN", "PRECISION:ELLIPSIS"}))
        retrieval_score = 3*adj_rel + 2*msg_rel + conv_rel + discourse_bonus
        layers = (["ADJACENCY"] if adj_rel > .5 else []) + (["MESSAGE"] if msg_rel > .5 else []) + (["CONVERSATION"] if conv_rel > .5 else [])
        if r["role"] == "user":
            bucket = ("WINNOW:A-ADJACENCY" if adj_rel >= 1 else "WINNOW:B-MESSAGE" if msg_rel >= 1 else
                      "WINNOW:C-CONVERSATION" if conv_rel >= 1 else "WINNOW:D-DISCOURSE-ONLY" if rhetoric else "DROP-FOR-NOW")
        else: bucket = "CONTEXT-NONUSER"
        rec = dict(r)
        rec.update({"title": title, "conversation_id": conv_id, "source_path": relpath,
                    "conversation_density": round(conv_density, 6), "conversation_tags": sorted(conv_tags),
                    "adjacency_tags": sorted(f"ADJ:{t}" for t in near), "message_tags": sorted(f"MSG:{t}" for t in msg_topics),
                    "discourse_tags": sorted(rhetoric), "relevance_layers": layers,
                    "adjacency_relevance": round(adj_rel,4), "message_relevance": round(msg_rel,4),
                    "conversation_relevance": round(conv_rel,4), "retrieval_score": round(retrieval_score,4),
                    "winnow_bucket": bucket, "structural_index_present": index_present,
                    "AUTO_TAG_ONLY": True, "NOT_VERIFIED_COMPENDIUM_ENTRY": True})
        records.append(rec)
    user_rows = [r for r in records if r["role"] == "user"]
    times = [r["create_time"] for r in rows if isinstance(r["create_time"], (int,float))]
    summary = {"source_path": relpath, "title": title, "conversation_id": conv_id, "message_count": len(rows),
               "user_message_count": len(user_rows), "first_create_time": min(times) if times else None,
               "last_create_time": max(times) if times else None, "conversation_density": round(conv_density,6),
               "topic_tags": sorted(all_conv_topics), "conversation_tags": sorted(conv_tags),
               "discourse_tags": sorted(set().union(*user_rhetoric) if user_rhetoric else set()),
               "structural_index_present": index_present, "index_gap_candidate": index_present is False,
               "top_retrieval_score": max((r["retrieval_score"] for r in user_rows), default=0)}
    return records, summary


def write_markdown_index(path: Path, summaries: list[dict[str, Any]], parse_errors: list[tuple[str,str]], scanned: int, skipped: int) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    topic_counts = Counter(t for s in summaries for t in s["topic_tags"]); gaps = [s for s in summaries if s["index_gap_candidate"]]
    with path.open("w", encoding="utf-8") as f:
        f.write("# Conversation Autotag Index\n\n**Machine-generated retrieval/indexing redundancy.** Tags are discovery aids, not verified authorship or theory status.\n\n")
        f.write(f"- JSON files scanned: {scanned}\n- conversation exports recognized: {len(summaries)}\n- non-conversation JSON skipped: {skipped}\n- parse errors: {len(parse_errors)}\n- structural-index gap candidates: {len(gaps)}\n\n## Topic coverage\n\n")
        for tag,n in topic_counts.most_common(): f.write(f"- `{tag}`: {n} conversations\n")
        f.write("\n## Conversation inventory\n\n")
        for s in sorted(summaries, key=lambda x:(x["source_path"],x["title"])):
            gap = " **INDEX-GAP-CANDIDATE**" if s["index_gap_candidate"] else ""; topics = ", ".join(f"`{x}`" for x in s["topic_tags"][:24]) or "`UNTAGGED-TOPIC`"
            f.write(f"### `{s['source_path']}`{gap}\n\n- title: {s['title']}\n- messages/user: {s['message_count']}/{s['user_message_count']}\n- density: {s['conversation_density']}; top retrieval score: {s['top_retrieval_score']}\n- topics: {topics}\n\n")
        if parse_errors:
            f.write("## Parse errors\n\n")
            for p,e in parse_errors: f.write(f"- `{p}` — `{e}`\n")


def main() -> None:
    ap = argparse.ArgumentParser(); ap.add_argument("roots", nargs="*", type=Path, default=[Path(".")])
    ap.add_argument("--out", type=Path, required=True); ap.add_argument("--summary", type=Path, required=True)
    ap.add_argument("--index", type=Path, required=True); ap.add_argument("--manifest", type=Path, required=True)
    ap.add_argument("--user-tag-index", type=Path, required=True); ap.add_argument("--structural-index-state", type=Path, default=Path("indexes/index-state.json"))
    ap.add_argument("--window", type=int, default=4); ap.add_argument("--limit-files", type=int); args = ap.parse_args()
    roots = args.roots or [Path(".")]; files = sorted(dict.fromkeys(p for root in roots for p in discover_json(root)))
    if args.limit_files: files = files[:args.limit_files]
    indexed_paths = read_index_strings(args.structural_index_state); records=[]; conv_summaries=[]; parse_errors=[]; nonconversation=0
    for p in files:
        try: convs = load_conversations(p)
        except Exception as exc: parse_errors.append((p.as_posix(), repr(exc))); continue
        if not convs: nonconversation += 1; continue
        digest = sha256(p)
        for title,conv_id,rows in convs:
            rs,sm = process_conversation(p,title,conv_id,rows,args.window,indexed_paths)
            for r in rs: r["source_sha256"] = digest
            sm["source_sha256"] = digest; records.extend(rs); conv_summaries.append(sm)
    sha_paths: dict[str,list[str]] = defaultdict(list)
    for s in conv_summaries: sha_paths[s["source_sha256"]].append(s["source_path"])
    for s in conv_summaries: s["exact_duplicate_paths"] = [x for x in sha_paths[s["source_sha256"]] if x != s["source_path"]]
    for r in records: r["exact_duplicate_paths"] = [x for x in sha_paths[r["source_sha256"]] if x != r["source_path"]]
    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w",encoding="utf-8") as f:
        for r in records: f.write(json.dumps(r,ensure_ascii=False)+"\n")
    args.user_tag_index.parent.mkdir(parents=True, exist_ok=True)
    with args.user_tag_index.open("w",encoding="utf-8") as f:
        for r in records:
            if r["role"] != "user": continue
            compact = {k:r.get(k) for k in ("source_path","title","conversation_id","message_id","create_time","recipient","conversation_tags","adjacency_tags","message_tags","discourse_tags","relevance_layers","retrieval_score","winnow_bucket","structural_index_present","source_sha256","exact_duplicate_paths")}; compact["AUTO_TAG_ONLY"]=True
            f.write(json.dumps(compact,ensure_ascii=False)+"\n")
    args.manifest.parent.mkdir(parents=True, exist_ok=True); args.manifest.write_text(json.dumps({"generated_by":"WORKSPACES/COMMON/scripts/layered_autotag_nathan.py","scope":[str(x) for x in roots],"json_files_scanned":len(files),"conversation_exports_recognized":len(conv_summaries),"nonconversation_json_skipped":nonconversation,"parse_errors":[{"path":p,"error":e} for p,e in parse_errors],"conversations":conv_summaries},ensure_ascii=False,indent=2),encoding="utf-8")
    users=[r for r in records if r["role"]=="user"]; kept=[r for r in users if r["winnow_bucket"].startswith("WINNOW")]; ranked=sorted(kept,key=lambda r:r["retrieval_score"],reverse=True)
    bucket_counts=Counter(r["winnow_bucket"] for r in users); discourse_counts=Counter(t for r in users for t in r["discourse_tags"]); layer_counts=Counter(t for r in users for t in r["relevance_layers"]); topic_counts=Counter(t.removeprefix("MSG:") for r in records for t in r["message_tags"])
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    with args.summary.open("w",encoding="utf-8") as f:
        f.write("# Archive-wide Layered Conversation Autotag Summary\n\nMachine pre-tags only. Nothing here is automatically promoted to VERIFIED.\n\n")
        f.write(f"- JSON files scanned: {len(files)}\n- conversation exports recognized: {len(conv_summaries)}\n- non-conversation JSON skipped: {nonconversation}\n- message records: {len(records)}\n- user messages: {len(users)}\n- bulk winnow: {len(kept)}\n- parse errors: {len(parse_errors)}\n- structural-index gap candidates: {sum(s['index_gap_candidate'] for s in conv_summaries)}\n- buckets: `{dict(bucket_counts)}`\n- relevance layers: `{dict(layer_counts)}`\n\n## Most common message topics\n\n")
        for tag,n in topic_counts.most_common(60): f.write(f"- `{tag}`: {n}\n")
        f.write("\n## Most common discourse/precision tags\n\n")
        for tag,n in discourse_counts.most_common(50): f.write(f"- `{tag}`: {n}\n")
        f.write("\n## Highest-ranked user turns\n\n")
        for r in ranked[:150]:
            ex=r["text"].replace("\n"," "); ex=ex if len(ex)<=360 else ex[:357]+"..."
            f.write(f"### {r['title']} — `{r['message_id']}`\n- source: `{r['source_path']}`\n- `{r['winnow_bucket']}` score `{r['retrieval_score']}` layers `{', '.join(r['relevance_layers'])}`\n- message: `{', '.join(r['message_tags'])}`\n- adjacency: `{', '.join(r['adjacency_tags'])}`\n- discourse: `{', '.join(r['discourse_tags'])}`\n> {ex}\n\n")
        if parse_errors:
            f.write("## Parse errors\n\n")
            for p,e in parse_errors: f.write(f"- `{p}` — `{e}`\n")
    write_markdown_index(args.index,conv_summaries,parse_errors,len(files),nonconversation)
    print(json.dumps({"json_files_scanned":len(files),"conversation_exports_recognized":len(conv_summaries),"nonconversation_json_skipped":nonconversation,"messages":len(records),"user_messages":len(users),"winnow":len(kept),"index_gap_candidates":sum(s["index_gap_candidate"] for s in conv_summaries),"buckets":dict(bucket_counts),"errors":len(parse_errors),"index":str(args.index),"manifest":str(args.manifest),"user_tag_index":str(args.user_tag_index)},indent=2))

if __name__ == "__main__": main()
