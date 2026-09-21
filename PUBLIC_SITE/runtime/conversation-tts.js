// Glass Sausage Factory — Conversation Viewer text-to-speech helper
// Client-side MVP using the browser Web Speech API. No API key required.
// Integration is adapter-based because viewer DOM/data bindings may change.

function splitForSpeech(text, maxChars = 900) {
  const cleaned = String(text || '')
    .replace(/```[\s\S]*?```/g, ' Code block omitted. ')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/https?:\/\/\S+/g, ' link ')
    .replace(/\s+/g, ' ')
    .trim();

  if (!cleaned) return [];
  const sentences = cleaned.match(/[^.!?]+[.!?]+|[^.!?]+$/g) || [cleaned];
  const chunks = [];
  let current = '';
  for (const sentence of sentences) {
    const s = sentence.trim();
    if (!s) continue;
    if ((current + ' ' + s).trim().length <= maxChars) {
      current = (current + ' ' + s).trim();
      continue;
    }
    if (current) chunks.push(current);
    if (s.length <= maxChars) {
      current = s;
    } else {
      for (let i = 0; i < s.length; i += maxChars) chunks.push(s.slice(i, i + maxChars));
      current = '';
    }
  }
  if (current) chunks.push(current);
  return chunks;
}

function defaultNormalizeMath(text) {
  // Conservative MVP: keep ordinary prose readable and suppress the worst
  // raw-TeX failure modes. Replace this hook with a math-aware speech layer.
  return String(text || '')
    .replace(/\$\$[\s\S]*?\$\$/g, ' displayed equation ')
    .replace(/\$([^$]+)\$/g, (_, inner) => ` equation ${inner.replace(/[{}\\]/g, ' ')} `)
    .replace(/\\\[[\s\S]*?\\\]/g, ' displayed equation ')
    .replace(/\\\([\s\S]*?\\\)/g, ' equation ');
}

export class ConversationTTS {
  constructor({
    getTurns,
    normalizeText = defaultNormalizeMath,
    rate = 1,
    pitch = 1,
    volume = 1,
    language = 'en-US',
    announceRole = true,
    onState = () => {},
    onTurn = () => {},
  } = {}) {
    if (typeof getTurns !== 'function') throw new Error('ConversationTTS requires getTurns()');
    this.getTurns = getTurns;
    this.normalizeText = normalizeText;
    this.rate = rate;
    this.pitch = pitch;
    this.volume = volume;
    this.language = language;
    this.announceRole = announceRole;
    this.onState = onState;
    this.onTurn = onTurn;

    this.queue = [];
    this.queueIndex = 0;
    this.playing = false;
    this.paused = false;
    this.generation = 0;
  }

  supported() {
    return typeof window !== 'undefined' &&
      'speechSynthesis' in window &&
      typeof SpeechSynthesisUtterance !== 'undefined';
  }

  setRate(rate) {
    this.rate = Math.max(0.5, Math.min(2.5, Number(rate) || 1));
  }

  buildTurnQueue(turn) {
    if (!turn) return [];
    const role = this.announceRole && turn.role ? `${turn.role}. ` : '';
    const normalized = this.normalizeText(`${role}${turn.text || ''}`, turn);
    return splitForSpeech(normalized).map(text => ({ text, turn }));
  }

  playTurn(turnId) {
    const turns = this.getTurns();
    const turn = turns.find(t => String(t.id) === String(turnId));
    if (!turn) return false;
    this.stop();
    this.queue = this.buildTurnQueue(turn);
    this.queueIndex = 0;
    this._start();
    return true;
  }

  playConversation({ fromTurnId = null, roles = null } = {}) {
    let turns = this.getTurns();
    if (roles && roles.length) {
      const allowed = new Set(roles);
      turns = turns.filter(t => allowed.has(t.role));
    }
    if (fromTurnId != null) {
      const idx = turns.findIndex(t => String(t.id) === String(fromTurnId));
      if (idx >= 0) turns = turns.slice(idx);
    }

    this.stop();
    this.queue = turns.flatMap(turn => this.buildTurnQueue(turn));
    this.queueIndex = 0;
    this._start();
    return this.queue.length > 0;
  }

  pause() {
    if (!this.supported() || !this.playing || this.paused) return;
    window.speechSynthesis.pause();
    this.paused = true;
    this.onState({ state: 'paused', index: this.queueIndex, total: this.queue.length });
  }

  resume() {
    if (!this.supported() || !this.paused) return;
    window.speechSynthesis.resume();
    this.paused = false;
    this.onState({ state: 'playing', index: this.queueIndex, total: this.queue.length });
  }

  stop() {
    this.generation += 1;
    if (this.supported()) window.speechSynthesis.cancel();
    this.queue = [];
    this.queueIndex = 0;
    this.playing = false;
    this.paused = false;
    this.onState({ state: 'stopped', index: 0, total: 0 });
  }

  _start() {
    if (!this.supported()) {
      this.onState({ state: 'unsupported' });
      return;
    }
    if (!this.queue.length) {
      this.onState({ state: 'empty' });
      return;
    }
    this.playing = true;
    this.paused = false;
    const generation = ++this.generation;
    this.onState({ state: 'playing', index: 0, total: this.queue.length });
    this._speakNext(generation);
  }

  _speakNext(generation) {
    if (!this.playing || generation !== this.generation) return;
    if (this.queueIndex >= this.queue.length) {
      this.playing = false;
      this.paused = false;
      this.onState({ state: 'complete', index: this.queue.length, total: this.queue.length });
      return;
    }

    const item = this.queue[this.queueIndex];
    this.onTurn({ turn: item.turn, index: this.queueIndex, total: this.queue.length });

    const utterance = new SpeechSynthesisUtterance(item.text);
    utterance.lang = this.language;
    utterance.rate = this.rate;
    utterance.pitch = this.pitch;
    utterance.volume = this.volume;
    utterance.onend = () => {
      if (generation !== this.generation) return;
      this.queueIndex += 1;
      this._speakNext(generation);
    };
    utterance.onerror = () => {
      if (generation !== this.generation) return;
      this.queueIndex += 1;
      this._speakNext(generation);
    };
    window.speechSynthesis.speak(utterance);
  }
}

export function attachConversationTTSControls({
  tts,
  root = document,
  turnSelector = '[data-turn-id]',
  controlsSelector = '[data-turn-controls]',
  getTurnId = el => el.dataset.turnId,
  buttonClass = 'conversation-tts-turn-button',
  buttonLabel = '▶ Read aloud',
} = {}) {
  if (!tts) throw new Error('tts instance required');

  root.querySelectorAll(turnSelector).forEach(turnEl => {
    if (turnEl.querySelector(`.${buttonClass}`)) return;
    const host = turnEl.querySelector(controlsSelector) || turnEl;
    const button = document.createElement('button');
    button.type = 'button';
    button.className = buttonClass;
    button.textContent = buttonLabel;
    button.setAttribute('aria-label', 'Read this conversation turn aloud');
    button.addEventListener('click', () => tts.playTurn(getTurnId(turnEl)));
    host.appendChild(button);
  });
}
