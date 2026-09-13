#!/usr/bin/env python3
"""Context-selective wrapper for layered_autotag_nathan_v2.py.

V1 remains the archive-wide high-recall substrate. V2 adds token-boundary
matching, conversation salience, and more selective adjacency rescue. V3 keeps
those behaviors and adds semantic guards for short/common terms whose literal
presence is not enough to establish a topic (for example: ``case``, ``action``,
``current``, ``cell``, ``star``, ``metric``, and lower-case ``sat``).

V3 also adds retrieval-only candidate tags for definition, terminology
crosswalk, and supersession language. These are discovery surfaces, not
verified glossary entries or claims of equivalence.
"""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path
from typing import Iterable

HERE = Path(__file__).resolve().parent
V2 = HERE / "layered_autotag_nathan_v2.py"
spec = importlib.util.spec_from_file_location("layered_autotag_nathan_v2", V2)
if spec is None or spec.loader is None:
    raise RuntimeError(f"Could not load {V2}")
v2 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v2)


EXTRA_TOPIC_TERMS: dict[str, tuple[str, ...]] = {
    "SAT-HSH": (
        "scalar-angular-torsion",
        "spacetime atomic theory",
        "spacetime atom",
        "hyperhelical worldtube",
    ),
    "LAW-LEGAL": (
        "judge", "lawyer", "counsel", "filing", "motion", "appeal", "statute",
        "warrant", "arraignment", "prosecutor", "defendant", "misdemeanor",
        "felony", "indictment", "plea", "criminal charges", "civil action",
    ),
}


CONTEXT_TERMS: dict[tuple[str, str], tuple[str, ...]] = {
    ("LAGRANGIAN", "action"): (
        "lagrangian", "euler-lagrange", "hamiltonian", "stationary action",
        "action principle", "action integral", "variational", "variation",
        "functional", "equations of motion",
    ),
    ("METRIC", "metric"): (
        "spacetime", "geometry", "geometric", "minkowski", "lorentz",
        "lorentzian", "signature", "tensor", "manifold", "line element",
        "proper time", "metric tensor", "effective metric", "geodesic",
    ),
    ("ELECTROMAGNETISM", "current"): (
        "electric", "electrical", "electromagnetic", "magnetic", "maxwell",
        "voltage", "ampere", "amps", "circuit", "coulomb", "current density",
        "charge density", "electric field", "magnetic field",
    ),
    ("ELECTROMAGNETISM", "charge"): (
        "electric", "electrical", "electromagnetic", "maxwell", "electron",
        "proton", "coulomb", "charge density", "electric field", "field strength",
    ),
    ("BIOLOGY", "cell"): (
        "biology", "biological", "cellular", "membrane", "nucleus", "tissue",
        "organism", "gene", "genetic", "protein", "dna", "rna", "bacteria",
        "neuron", "mitosis", "cytoplasm",
    ),
    ("ASTRONOMY", "star"): (
        "astronomy", "astronomical", "stellar", "planet", "moon", "solar",
        "sun", "galaxy", "telescope", "supernova", "neutron star", "pulsar",
        "celestial", "orbit", "main sequence",
    ),
    ("ART-DESIGN", "art"): (
        "artist", "artistic", "design", "drawing", "illustration", "aesthetic",
        "painting", "photograph", "photography", "image", "museum", "gallery",
        "visual art", "fine art",
    ),
    ("LAW-LEGAL", "case"): (
        "legal", "law", "court", "attorney", "lawyer", "judge", "filing",
        "motion", "statute", "criminal", "civil", "police", "arrest",
        "prosecutor", "defendant", "counsel", "plea", "hearing", "warrant",
        "lawsuit", "case law",
    ),
    ("LAW-LEGAL", "charge"): (
        "legal", "court", "attorney", "lawyer", "judge", "criminal", "police",
        "arrest", "prosecutor", "defendant", "felony", "misdemeanor", "offense",
        "plea", "indictment", "hearing", "bail", "bond", "jail", "warrant",
    ),
    ("LAW-LEGAL", "law"): (
        "legal", "court", "attorney", "lawyer", "judge", "statute",
        "constitution", "criminal", "civil", "police", "prosecutor", "defendant",
        "counsel", "lawsuit", "case law", "law firm",
    ),
    ("PROVENANCE-HISTORY", "original"): (
        "archive", "provenance", "timeline", "version", "earlier", "later",
        "date", "document", "conversation", "repository", "repo", "theory",
        "sat", "h(s)h", "hsh", "first", "earliest", "source", "development",
        "record",
    ),
    ("PROVENANCE-HISTORY", "history"): (
        "archive", "provenance", "timeline", "version", "earlier", "later",
        "document", "conversation", "repository", "repo", "theory", "sat",
        "h(s)h", "hsh", "source", "development", "record",
    ),
    ("PROVENANCE-HISTORY", "used to"): (
        "version", "earlier", "later", "theory", "sat", "h(s)h", "hsh",
        "term", "definition", "called", "model", "archive", "development",
    ),
    ("PROVENANCE-HISTORY", "later version"): (
        "version", "earlier", "theory", "sat", "h(s)h", "hsh", "model",
        "archive", "development",
    ),
    ("CODING", "class"): (
        "python", "javascript", "typescript", "code", "object", "method",
        "function", "constructor", "import", "module", "inheritance",
    ),
    ("UI", "ui"): (
        "interface", "user interface", "button", "control", "screen", "viewer",
        "display", "layout", "panel", "menu", "widget",
    ),
    ("CHEMISTRY", "element"): (
        "chemistry", "chemical", "atomic", "atom", "periodic", "molecule",
        "molecular", "isotope", "hydrogen", "oxygen", "carbon", "metal",
    ),
}


DEFINITION_PATTERNS = (
    r"\bdefine(?:d|s)?\b",
    r"\bdefinition of\b",
    r"\bby .{0,48}? i mean\b",
    r"\bwhen i (?:say|use|refer to)\b",
    r"\bi use the term\b",
    r"\b(?:we|i)(?:'ll| will) call (?:this|that|it)\b",
    r"\bcall (?:this|that)\b",
    r"\bterm for\b",
)

CROSSWALK_PATTERNS = (
    r"\bequivalent to\b",
    r"\bstructurally equivalent\b",
    r"\bsame as\b",
    r"\bcorresponds to\b",
    r"\bmaps? (?:onto|to)\b",
    r"\banalogous to\b",
    r"\boverlaps? with\b",
    r"\bsynonym(?:ous)?\b",
    r"\bstandard term(?:inology)?\b",
    r"\bconventional term(?:inology)?\b",
    r"\bconventional physics\b",
    r"\bknown as\b",
)

SUPERSESSION_PATTERNS = (
    r"\bsupersed(?:e|ed|es|ing)\b",
    r"\bno longer (?:use|call|mean)\b",
    r"\bcurrent definition\b",
    r"\bcurrent term\b",
    r"\bolder term\b",
    r"\bobsolete\b",
    r"\bretire (?:this|that|the term)\b",
    r"\bfrom now on\b",
    r"\breplace (?:this|that|the term)\b",
    r"\buse .{0,40}? instead\b",
)


def has_any(text: str, phrases: Iterable[str]) -> bool:
    return any(v2.strict_phrase_hit(text, p) for p in phrases)


def phrase_allowed(tag: str, phrase: str, text: str) -> bool:
    p = v2.v1.norm(phrase)
    normalized = v2.v1.norm(text)

    # Lower-case English "sat" is common. Treat the acronym as a direct SAT
    # marker only when the source actually writes it in all caps.
    if tag == "SAT-HSH" and p == "sat":
        return re.search(r"(?<!\w)SAT(?!\w)", text) is not None

    # "State of the art" should not become an art/design hit by itself.
    if tag == "ART-DESIGN" and p == "art" and "state of the art" in normalized:
        return False

    context = CONTEXT_TERMS.get((tag, p))
    if context is not None:
        return has_any(text, context)
    return True


def semantic_surface_tags(text: str) -> set[str]:
    normalized = v2.v1.norm(text)
    tags: set[str] = set()
    if any(re.search(pattern, normalized) for pattern in DEFINITION_PATTERNS):
        tags.add("DEFINITION-CANDIDATE")
    if any(re.search(pattern, normalized) for pattern in CROSSWALK_PATTERNS):
        tags.add("CROSSWALK-CANDIDATE")
    if any(re.search(pattern, normalized) for pattern in SUPERSESSION_PATTERNS):
        tags.add("SUPERSESSION-CANDIDATE")
    return tags


def topic_tags(text: str) -> set[str]:
    tags: set[str] = set()
    topic_names = set(v2.v1.TOPICS) | set(EXTRA_TOPIC_TERMS)
    for tag in topic_names:
        phrases = tuple(v2.v1.TOPICS.get(tag, ())) + tuple(EXTRA_TOPIC_TERMS.get(tag, ()))
        if any(v2.strict_phrase_hit(text, p) and phrase_allowed(tag, p, text) for p in phrases):
            tags.add(tag)
    tags |= semantic_surface_tags(text)
    return tags


# V2's process_conversation resolves its global topic_tags at runtime. Replace
# that function while keeping the V2 scoring/salience implementation and the
# V1 command-line/output machinery.
v2.topic_tags = topic_tags
v2.v1.topic_tags = topic_tags
v2.v1.process_conversation = v2.process_conversation

if __name__ == "__main__":
    v2.v1.main()
