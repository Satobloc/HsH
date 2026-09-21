// Glass Sausage Factory — repository-backed update-packet consumer
// Public repo only. This module does not grant theory authority and does not
// publish candidate/ready packets by itself.

const OWNER = 'Satobloc';
const REPO = 'HsH';
const BRANCH = 'main';
const PACKET_DIR = 'PUBLIC_SITE/live_influx/packets';
const API_DIR = `https://api.github.com/repos/${OWNER}/${REPO}/contents/${PACKET_DIR}?ref=${BRANCH}`;
const RAW_ROOT = `https://raw.githubusercontent.com/${OWNER}/${REPO}/${BRANCH}/`;
const CACHE_KEY = 'gsf-public-site-update-packets-v1';
const DEFAULT_TTL_MS = 5 * 60 * 1000;

function validPacket(p) {
  return Boolean(
    p &&
    p.schema_version === 1 &&
    typeof p.packet_id === 'string' &&
    typeof p.title === 'string' &&
    typeof p.status === 'string' &&
    typeof p.summary === 'string' &&
    Array.isArray(p.kinds) &&
    Array.isArray(p.sources) &&
    Array.isArray(p.destinations) &&
    p.epistemic && typeof p.epistemic === 'object'
  );
}

function normalizeAsset(asset) {
  if (!asset || typeof asset !== 'object') return null;
  const out = { ...asset };
  if (typeof out.path === 'string' && !/^https?:\/\//.test(out.path)) {
    out.url = RAW_ROOT + out.path.split('/').map(encodeURIComponent).join('/').replace(/%2F/g, '/');
  } else if (typeof out.path === 'string') {
    out.url = out.path;
  }
  return out;
}

function normalizePacket(packet, sourcePath) {
  return {
    ...packet,
    _packet_path: sourcePath,
    _packet_url: RAW_ROOT + sourcePath.split('/').map(encodeURIComponent).join('/').replace(/%2F/g, '/'),
    assets: Array.isArray(packet.assets) ? packet.assets.map(normalizeAsset).filter(Boolean) : [],
  };
}

function readCache(ttlMs) {
  try {
    const raw = sessionStorage.getItem(CACHE_KEY);
    if (!raw) return null;
    const cached = JSON.parse(raw);
    if (!cached || Date.now() - cached.saved_at > ttlMs) return null;
    return cached.packets;
  } catch (_) {
    return null;
  }
}

function writeCache(packets) {
  try {
    sessionStorage.setItem(CACHE_KEY, JSON.stringify({ saved_at: Date.now(), packets }));
  } catch (_) {
    // Caching is optional; failure must not block the feed.
  }
}

export async function loadSiteUpdatePackets({ ttlMs = DEFAULT_TTL_MS, force = false } = {}) {
  if (!force) {
    const cached = readCache(ttlMs);
    if (cached) return cached;
  }

  const listingResponse = await fetch(API_DIR, {
    headers: { Accept: 'application/vnd.github+json' },
  });
  if (!listingResponse.ok) {
    throw new Error(`update packet listing failed: HTTP ${listingResponse.status}`);
  }

  const listing = await listingResponse.json();
  const entries = Array.isArray(listing)
    ? listing.filter(x => x.type === 'file' && x.name.endsWith('.json'))
    : [];

  const packets = [];
  for (const entry of entries) {
    const response = await fetch(entry.download_url, { cache: 'no-store' });
    if (!response.ok) continue;
    try {
      const packet = await response.json();
      if (validPacket(packet)) packets.push(normalizePacket(packet, entry.path));
    } catch (_) {
      // Malformed packet is skipped; consumer remains failure-soft.
    }
  }

  packets.sort((a, b) => String(b.created).localeCompare(String(a.created)) || b.packet_id.localeCompare(a.packet_id));
  writeCache(packets);
  return packets;
}

export function packetsForSurface(packets, surface, {
  statuses = ['incorporated'],
  includeKinds = null,
} = {}) {
  const statusSet = new Set(statuses);
  const kindSet = includeKinds ? new Set(includeKinds) : null;

  return packets.filter(packet => {
    if (!statusSet.has(packet.status)) return false;
    if (!packet.destinations.some(d => d && d.surface === surface)) return false;
    if (kindSet && !packet.kinds.some(k => kindSet.has(k))) return false;
    return true;
  });
}

export function editorialInbox(packets) {
  // For site-builder/editorial tooling, not direct polished-public rendering.
  return packets.filter(p => ['ready', 'candidate', 'needs-source-check', 'parked'].includes(p.status));
}

export function workerStream(packets) {
  // Optional radical-transparency surface. A site choosing to expose this must
  // visibly retain producer + epistemic labels. This function does not render.
  return packets.filter(p => ['ready', 'candidate'].includes(p.status));
}
