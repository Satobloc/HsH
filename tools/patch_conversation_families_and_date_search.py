from pathlib import Path

builder = Path('tools/build_conversation_viewer.py')
viewer = Path('CONVERSATION_VIEWER/viewer.js')
css = Path('CONVERSATION_VIEWER/viewer.css')
buildwf = Path('.github/workflows/build-conversation-viewer.yml')
deploywf = Path('.github/workflows/deploy-conversation-viewer-pages.yml')

b = builder.read_text(encoding='utf-8')
v = viewer.read_text(encoding='utf-8')
c = css.read_text(encoding='utf-8')
bw = buildwf.read_text(encoding='utf-8')
dw = deploywf.read_text(encoding='utf-8')

def once(text, old, new, label):
    n = text.count(old)
    if n != 1:
        raise SystemExit(f'{label}: expected 1 match, found {n}')
    return text.replace(old, new, 1)

# Catalog: accept successfully parsed JSON-shaped conversation exports even when saved as .txt.
b = once(b,
    'RAW_SUFFIX_RE = re.compile(r"\\s+[—-]\\s+raw(?:\\s*\\(\\d+\\))?\\.json$", re.I)\n',
    'RAW_SUFFIX_RE = re.compile(r"\\s+[—-]\\s+raw(?:\\s*\\(\\d+\\))?\\.(?:json|txt)$", re.I)\nSUPPORTED_CONVERSATION_SUFFIXES = {".json", ".txt"}\n',
    'builder suffix regex')
b = once(b,
    '    if not isinstance(candidate, str) or not candidate.lower().endswith(".json"):\n        return None\n',
    '    if not isinstance(candidate, str) or Path(candidate).suffix.lower() not in SUPPORTED_CONVERSATION_SUFFIXES:\n        return None\n',
    'builder canonical suffix')
b = once(b,
    '    if name.lower().endswith(".json"):\n        name = name[:-5]\n',
    '    if Path(name).suffix.lower() in SUPPORTED_CONVERSATION_SUFFIXES:\n        name = str(Path(name).with_suffix(""))\n',
    'builder display title suffix')

# Build workflow: watch txt exports and allow them in validation.
bw = bw.replace("      - 'DEVELOPMENT_FULL_CONVOS/**/*.json'\n", "      - 'DEVELOPMENT_FULL_CONVOS/**/*.json'\n      - 'DEVELOPMENT_FULL_CONVOS/**/*.txt'\n")
bw = bw.replace("      - 'LIVE CONVOS/**/*.json'\n", "      - 'LIVE CONVOS/**/*.json'\n      - 'LIVE CONVOS/**/*.txt'\n")
bw = once(bw,
    "          assert all(x['path'].lower().endswith('.json') or x.get('external') for x in data['conversations'])\n",
    "          assert all(Path(x['path']).suffix.lower() in {'.json', '.txt'} or x.get('external') for x in data['conversations'])\n",
    'build validation suffix')

# Deploy workflow: regenerate catalog before Pages artifact upload.
dw = once(dw,
    '''      - name: Configure GitHub Pages\n        uses: actions/configure-pages@v5\n\n      - name: Upload conversation viewer\n''',
    '''      - name: Set up Python\n        uses: actions/setup-python@v5\n        with:\n          python-version: '3.x'\n\n      - name: Rebuild conversation catalog for deployment\n        run: python tools/build_conversation_viewer.py\n\n      - name: Configure GitHub Pages\n        uses: actions/configure-pages@v5\n\n      - name: Upload conversation viewer\n''',
    'deploy rebuild step')

# Viewer family + date search helpers before renderCatalog.
marker = '  function renderCatalog() {\n'
helpers = r'''  function familyKey(c) {
    const title = String(c.title || "").toLocaleLowerCase().replace(/\s+/g, " ").trim();
    const start = String(c.start_local || "unknown").replace(/([+-]\d\d:\d\d|Z)$/, "");
    return `${title}||${start}`;
  }

  function dateSearchText(c) {
    const values = [];
    for (const value of [c.start_local, c.end_local]) {
      if (!value) continue;
      const d = new Date(value);
      values.push(String(value));
      if (Number.isNaN(d.getTime())) continue;
      values.push(d.toLocaleDateString([], { year:"numeric", month:"long", day:"numeric" }));
      values.push(d.toLocaleDateString([], { year:"numeric", month:"short", day:"numeric" }));
      values.push(d.toLocaleDateString([], { year:"numeric", month:"long" }));
      values.push(d.toLocaleDateString([], { year:"numeric", month:"short" }));
      values.push(String(d.getFullYear()));
      values.push(d.toISOString().slice(0, 10));
      values.push(d.toISOString().slice(0, 7));
    }
    return values.join(" ").toLocaleLowerCase();
  }

  function looksDateLike(query) {
    const q = String(query || "").trim().toLocaleLowerCase();
    return /\b(?:19|20)\d{2}\b/.test(q) || /\b(?:jan(?:uary)?|feb(?:ruary)?|mar(?:ch)?|apr(?:il)?|may|jun(?:e)?|jul(?:y)?|aug(?:ust)?|sep(?:t(?:ember)?)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)\b/.test(q) || /\b\d{4}[-/.]\d{1,2}(?:[-/.]\d{1,2})?\b/.test(q);
  }

  function catalogMatch(c, query) {
    const q = String(query || "").trim().toLocaleLowerCase();
    if (!q) return { matched: true, score: 0 };
    const ordinary = `${c.title || ""} ${c.path || ""}`.toLocaleLowerCase();
    const dates = dateSearchText(c);
    const ordinaryHit = ordinary.includes(q);
    const dateHit = dates.includes(q);
    if (!ordinaryHit && !dateHit) return { matched: false, score: -1 };
    const dateLike = looksDateLike(q);
    let score = 0;
    if (dateHit) score += dateLike ? 100 : 12;
    if (ordinaryHit) score += dateLike ? 20 : 60;
    if (String(c.title || "").toLocaleLowerCase().includes(q)) score += 20;
    if (dateLike && String(c.start_local || "").toLocaleLowerCase().startsWith(q)) score += 35;
    return { matched: true, score };
  }

  function familyMembers(catalog) {
    const groups = new Map();
    for (const c of catalog) {
      const key = familyKey(c);
      if (!groups.has(key)) groups.set(key, []);
      groups.get(key).push(c);
    }
    return [...groups.values()].map(members => {
      members.sort((a, b) => (Number(b.message_count) - Number(a.message_count)) || String(b.end_local || "").localeCompare(String(a.end_local || "")) || a.path.localeCompare(b.path));
      return { primary: members[0], members };
    });
  }

  function versionLabel(item, primary) {
    const sameSpan = item.start_local === primary.start_local && item.end_local === primary.end_local;
    const sameCount = Number(item.message_count) === Number(primary.message_count);
    if (sameSpan && sameCount) return "duplicate save";
    return "alternate / branch";
  }

'''
v = once(v, marker, helpers + marker, 'viewer catalog helpers')

old_render = r'''  function renderCatalog() {
    const needle = el.conversationFilter.value.trim().toLowerCase();
    const showDev = el.showDevelopment.checked, showLive = el.showLive.checked;
    state.filteredCatalog = state.catalog.filter(c => {
      if (c.corpus === "development" && !showDev) return false;
      if (c.corpus === "live" && !showLive) return false;
      return !needle || c.title.toLowerCase().includes(needle) || c.path.toLowerCase().includes(needle);
    });
    el.conversationList.innerHTML = state.filteredCatalog.map(c => `
      <div class="conversation-card ${state.conversation?.id === c.id ? "active" : ""}" data-id="${c.id}">
        <div class="card-date">${esc(formatDay(c.start_local))}</div>
        <div class="title">${esc(c.title)}</div>
        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>
        <span>${Number(c.message_count).toLocaleString()} msgs</span></div>
      </div>`).join("");
    el.conversationList.querySelectorAll(".conversation-card").forEach(card => card.addEventListener("click", () => loadConversation(card.dataset.id, 0, true)));
  }
'''
new_render = r'''  function renderCatalog() {
    const needle = el.conversationFilter.value.trim().toLocaleLowerCase();
    const showDev = el.showDevelopment.checked, showLive = el.showLive.checked;
    const scored = state.catalog.map(c => ({ c, match: catalogMatch(c, needle) })).filter(({ c, match }) => {
      if (c.corpus === "development" && !showDev) return false;
      if (c.corpus === "live" && !showLive) return false;
      return match.matched;
    });
    scored.sort((a, b) => (b.match.score - a.match.score) || String(b.c.start_local || "").localeCompare(String(a.c.start_local || "")) || a.c.path.localeCompare(b.c.path));
    state.filteredCatalog = scored.map(x => x.c);

    const groups = familyMembers(state.filteredCatalog);
    groups.sort((a, b) => {
      const as = Math.max(...a.members.map(x => catalogMatch(x, needle).score));
      const bs = Math.max(...b.members.map(x => catalogMatch(x, needle).score));
      return (bs - as) || String(b.primary.start_local || "").localeCompare(String(a.primary.start_local || ""));
    });

    el.conversationList.innerHTML = groups.map(group => {
      const c = group.primary;
      const active = group.members.some(x => x.id === state.conversation?.id);
      const versions = group.members.length > 1 ? `
        <details class="version-group">
          <summary>${group.members.length} saved versions</summary>
          <div class="version-list">${group.members.map((item, i) => `
            <button class="version-item ${item.id === state.conversation?.id ? "active" : ""}" data-version-id="${item.id}" type="button">
              <span>${i === 0 ? "Primary" : `Version ${i + 1}`} · ${Number(item.message_count).toLocaleString()} msgs</span>
              <small>${esc(versionLabel(item, c))} · ${esc(formatDay(item.end_local || item.start_local))}</small>
            </button>`).join("")}</div>
        </details>` : "";
      return `<div class="conversation-card ${active ? "active" : ""}" data-id="${c.id}">
        <div class="card-date">${esc(formatDay(c.start_local))}</div>
        <div class="title">${esc(c.title)}</div>
        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>
        <span>${Number(c.message_count).toLocaleString()} msgs</span>${group.members.length > 1 ? `<span>${group.members.length} versions</span>` : ""}</div>
        ${versions}
      </div>`;
    }).join("");

    el.conversationList.querySelectorAll(".conversation-card").forEach(card => card.addEventListener("click", event => {
      if (event.target.closest("details, summary, .version-item")) return;
      loadConversation(card.dataset.id, 0, true);
    }));
    el.conversationList.querySelectorAll(".version-item").forEach(button => button.addEventListener("click", event => {
      event.stopPropagation(); loadConversation(button.dataset.versionId, 0, true);
    }));
  }
'''
v = once(v, old_render, new_render, 'renderCatalog replacement')

# UI styles for unobtrusive saved-version access.
c += r'''

/* Conversation-family variants: primary in the main list, alternate saves nested below. */
.version-group { margin-top: 7px; border-top: 1px solid color-mix(in srgb, var(--line), transparent 25%); padding-top: 5px; }
.version-group summary { color: var(--muted); font-size: .72rem; cursor: pointer; user-select: none; }
.version-list { display: grid; gap: 4px; margin-top: 6px; }
.version-item { width: 100%; text-align: left; padding: 6px 7px; display: grid; gap: 2px; background: rgba(255,255,255,.025); border-color: color-mix(in srgb, var(--line), transparent 20%); }
.version-item span { font-size: .72rem; color: var(--text); }
.version-item small { font-size: .66rem; color: var(--muted); }
.version-item.active { border-color: color-mix(in srgb, var(--accent), transparent 25%); }
'''

builder.write_text(b, encoding='utf-8')
viewer.write_text(v, encoding='utf-8')
css.write_text(c, encoding='utf-8')
buildwf.write_text(bw, encoding='utf-8')
deploywf.write_text(dw, encoding='utf-8')
print('Patched full conversation coverage, family grouping, date search, and deploy-time catalog rebuilding.')
