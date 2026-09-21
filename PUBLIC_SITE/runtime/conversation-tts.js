// Glass Sausage Factory — Conversation Viewer TTS runtime
// Browser Web Speech API; no external TTS service or API key required.

import { normalizeMathForSpeech } from './math-speech.js';

function splitForSpeech(text,maxChars=850){
  const cleaned=String(text||'').replace(/\s+/g,' ').trim(); if(!cleaned)return[];
  const sentences=cleaned.match(/[^.!?]+[.!?]+|[^.!?]+$/g)||[cleaned],chunks=[]; let current='';
  for(const sentence of sentences){const s=sentence.trim();if(!s)continue;
    if((current+' '+s).trim().length<=maxChars){current=(current+' '+s).trim();continue;}
    if(current)chunks.push(current); if(s.length<=maxChars)current=s; else{for(let i=0;i<s.length;i+=maxChars)chunks.push(s.slice(i,i+maxChars));current='';}}
  if(current)chunks.push(current);return chunks;
}
function roleName(role){const r=String(role||'').toLowerCase();if(['user','human','nathan'].includes(r))return'Nathan';if(['assistant','ai','model','chatgpt'].includes(r))return'Assistant';if(r==='system')return'System';return role||'';}

export class ConversationTTS{
  constructor({getTurns,normalizeText=null,rate=1,pitch=1,volume=1,language='en-US',mathMode='scientist',announceRole=true,voiceForTurn=null,onState=()=>{},onTurn=()=>{}}={}){
    if(typeof getTurns!=='function')throw new Error('ConversationTTS requires getTurns()');
    this.getTurns=getTurns;this.normalizeText=normalizeText;this.rate=rate;this.pitch=pitch;this.volume=volume;this.language=language;this.mathMode=mathMode;this.announceRole=announceRole;this.voiceForTurn=voiceForTurn;this.onState=onState;this.onTurn=onTurn;this.queue=[];this.queueIndex=0;this.playing=false;this.paused=false;this.generation=0;
  }
  supported(){return typeof window!=='undefined'&&'speechSynthesis'in window&&typeof SpeechSynthesisUtterance!=='undefined';}
  setRate(rate){this.rate=Math.max(.5,Math.min(2.5,Number(rate)||1));}
  setMathMode(mode){this.mathMode=['scientist','literal','skip'].includes(mode)?mode:'scientist';}
  buildTurnQueue(turn){if(!turn)return[];const prefix=this.announceRole&&turn.role?`${roleName(turn.role)}. `:'';let raw=`${prefix}${turn.text||''}`;const normalized=this.normalizeText?this.normalizeText(raw,turn,this.mathMode):normalizeMathForSpeech(raw,{mode:this.mathMode});return splitForSpeech(normalized).map(text=>({text,turn}));}
  playTurn(turnId){const turn=this.getTurns().find(t=>String(t.id)===String(turnId));if(!turn)return false;this.stop();this.queue=this.buildTurnQueue(turn);this.queueIndex=0;this._start();return this.queue.length>0;}
  playConversation({fromTurnId=null,roles=null}={}){let turns=this.getTurns();if(roles?.length){const allowed=new Set(roles.map(x=>String(x).toLowerCase()));turns=turns.filter(t=>allowed.has(String(t.role||'').toLowerCase()));}if(fromTurnId!=null){const i=turns.findIndex(t=>String(t.id)===String(fromTurnId));if(i>=0)turns=turns.slice(i);}this.stop();this.queue=turns.flatMap(t=>this.buildTurnQueue(t));this.queueIndex=0;this._start();return this.queue.length>0;}
  pause(){if(!this.supported()||!this.playing||this.paused)return;window.speechSynthesis.pause();this.paused=true;this.onState({state:'paused',index:this.queueIndex,total:this.queue.length});}
  resume(){if(!this.supported()||!this.paused)return;window.speechSynthesis.resume();this.paused=false;this.onState({state:'playing',index:this.queueIndex,total:this.queue.length});}
  togglePause(){this.paused?this.resume():this.pause();}
  stop(){this.generation+=1;if(this.supported())window.speechSynthesis.cancel();this.queue=[];this.queueIndex=0;this.playing=false;this.paused=false;this.onState({state:'stopped',index:0,total:0});}
  _start(){if(!this.supported()){this.onState({state:'unsupported'});return;}if(!this.queue.length){this.onState({state:'empty'});return;}this.playing=true;this.paused=false;const generation=++this.generation;this.onState({state:'playing',index:0,total:this.queue.length});this._speakNext(generation);}
  _speakNext(generation){if(!this.playing||generation!==this.generation)return;if(this.queueIndex>=this.queue.length){this.playing=false;this.paused=false;this.onState({state:'complete',index:this.queue.length,total:this.queue.length});return;}const item=this.queue[this.queueIndex];this.onTurn({turn:item.turn,index:this.queueIndex,total:this.queue.length});const u=new SpeechSynthesisUtterance(item.text);u.lang=this.language;u.rate=this.rate;u.pitch=this.pitch;u.volume=this.volume;if(typeof this.voiceForTurn==='function'){const v=this.voiceForTurn(item.turn,window.speechSynthesis.getVoices());if(v)u.voice=v;}u.onend=u.onerror=()=>{if(generation!==this.generation)return;this.queueIndex+=1;this._speakNext(generation);};window.speechSynthesis.speak(u);}
}

export function attachConversationTTSControls({tts,root=document,turnSelector='[data-turn-id]',controlsSelector='[data-turn-controls]',getTurnId=el=>el.dataset.turnId,buttonClass='conversation-tts-turn-button',buttonLabel='▶'}={}){
  if(!tts)throw new Error('tts instance required');root.querySelectorAll(turnSelector).forEach(turnEl=>{if(turnEl.querySelector(`.${buttonClass}`))return;const host=turnEl.querySelector(controlsSelector)||turnEl,button=document.createElement('button');button.type='button';button.className=buttonClass;button.textContent=buttonLabel;button.title='Read this turn aloud';button.setAttribute('aria-label','Read this conversation turn aloud');button.addEventListener('click',ev=>{ev.stopPropagation();tts.playTurn(getTurnId(turnEl));});host.appendChild(button);});
}
