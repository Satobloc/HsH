// Glass Sausage Factory — universal page Listen runtime
// Browser Web Speech API. Sanitizes presented page text before speech so the
// audio layer does not read URLs, code, navigation chrome, raw markup, or
// backend/control material aloud.

import { normalizeMathForSpeech } from './math-speech.js';

const DEFAULT_SKIP_SELECTORS = [
  'script','style','noscript','svg','canvas','form','nav','footer',
  '[aria-hidden="true"]','[data-no-speech]','.no-speech','.source-raw',
  '.provenance-raw','.code','.code-block','pre','code'
];

export function cleanPageTextForSpeech(text,{mathMode='scientist'}={}){
  let s=String(text||'');
  s=s.replace(/```[\s\S]*?```/g,' ');
  s=s.replace(/`[^`]*`/g,' ');
  s=s.replace(/https?:\/\/\S+/gi,' ');
  s=s.replace(/www\.\S+/gi,' ');
  s=s.replace(/\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}\b/gi,' ');
  s=s.replace(/^\s{0,3}#{1,6}\s+/gm,'');
  s=s.replace(/^\s*[-*+]\s+/gm,'');
  s=s.replace(/^\s*>\s?/gm,'');
  s=s.replace(/\[(.*?)\]\([^)]*\)/g,'$1');
  s=s.replace(/<[^>]+>/g,' ');
  s=s.replace(/\b(?:sha|commit|blob|branch|packet|queue|handoff|workflow)\s*[:#]?\s*[0-9a-f]{7,40}\b/gi,' ');
  s=s.replace(/\b(?:PUBLIC_SITE|WORKSPACES|DEVELOPMENT_FULL_CONVOS|derived|indexes|runtime)\/[A-Za-z0-9_./()\[\] -]+/g,' ');
  s=normalizeMathForSpeech(s,{mode:mathMode});
  return s.replace(/\s+/g,' ').trim();
}

function splitForSpeech(text,maxChars=900){
  const cleaned=String(text||'').replace(/\s+/g,' ').trim();
  if(!cleaned)return[];
  const sentences=cleaned.match(/[^.!?]+[.!?]+|[^.!?]+$/g)||[cleaned];
  const out=[]; let current='';
  for(const sentence of sentences){
    const part=sentence.trim(); if(!part)continue;
    if((current+' '+part).trim().length<=maxChars){current=(current+' '+part).trim();continue;}
    if(current)out.push(current);
    if(part.length<=maxChars)current=part;
    else{for(let i=0;i<part.length;i+=maxChars)out.push(part.slice(i,i+maxChars));current='';}
  }
  if(current)out.push(current);
  return out;
}

export function extractReadablePageText({root=document,contentSelector='main, article, [data-reader-content], .reader-content',skipSelectors=DEFAULT_SKIP_SELECTORS,mathMode='scientist'}={}){
  const source=root.querySelector(contentSelector)||root.body||root.documentElement;
  if(!source)return'';
  const clone=source.cloneNode(true);
  for(const selector of skipSelectors){
    try{clone.querySelectorAll(selector).forEach(el=>el.remove());}catch(_){/* ignore invalid optional selector */}
  }
  clone.querySelectorAll('a').forEach(a=>{
    const label=(a.textContent||'').trim();
    if(label)a.replaceWith(root.createTextNode(label)); else a.remove();
  });
  clone.querySelectorAll('img').forEach(img=>{
    const alt=(img.getAttribute('alt')||'').trim();
    if(alt)img.replaceWith(root.createTextNode(` Image: ${alt}. `)); else img.remove();
  });
  return cleanPageTextForSpeech(clone.textContent||'',{mathMode});
}

export class PageListen{
  constructor({getText=null,rate=1.5,pitch=1,volume=1,language='en-US',mathMode='scientist',onState=()=>{}}={}){
    this.getText=getText||(()=>extractReadablePageText({mathMode}));
    this.rate=rate;this.pitch=pitch;this.volume=volume;this.language=language;this.mathMode=mathMode;this.onState=onState;
    this.queue=[];this.index=0;this.playing=false;this.paused=false;this.generation=0;
  }
  supported(){return typeof window!=='undefined'&&'speechSynthesis'in window&&typeof SpeechSynthesisUtterance!=='undefined';}
  play(){
    this.stop();
    this.queue=splitForSpeech(cleanPageTextForSpeech(this.getText(),{mathMode:this.mathMode}));
    this.index=0;
    if(!this.supported()){this.onState({state:'unsupported'});return false;}
    if(!this.queue.length){this.onState({state:'empty'});return false;}
    this.playing=true;this.paused=false;const generation=++this.generation;this.onState({state:'playing',index:0,total:this.queue.length});this._next(generation);return true;
  }
  pause(){if(this.supported()&&this.playing&&!this.paused){window.speechSynthesis.pause();this.paused=true;this.onState({state:'paused',index:this.index,total:this.queue.length});}}
  resume(){if(this.supported()&&this.paused){window.speechSynthesis.resume();this.paused=false;this.onState({state:'playing',index:this.index,total:this.queue.length});}}
  toggle(){if(this.paused)this.resume();else if(this.playing)this.pause();else this.play();}
  stop(){this.generation+=1;if(this.supported())window.speechSynthesis.cancel();this.queue=[];this.index=0;this.playing=false;this.paused=false;this.onState({state:'stopped',index:0,total:0});}
  _next(generation){
    if(!this.playing||generation!==this.generation)return;
    if(this.index>=this.queue.length){this.playing=false;this.onState({state:'complete',index:this.queue.length,total:this.queue.length});return;}
    const u=new SpeechSynthesisUtterance(this.queue[this.index]);u.lang=this.language;u.rate=this.rate;u.pitch=this.pitch;u.volume=this.volume;
    u.onend=u.onerror=()=>{if(generation!==this.generation)return;this.index+=1;this._next(generation);};window.speechSynthesis.speak(u);
  }
}

export function attachUniversalListenButton({root=document,hostSelector='[data-page-actions], header .actions, main',label='Listen'}={}){
  if(root.querySelector('[data-universal-listen]'))return;
  const host=root.querySelector(hostSelector)||root.body;
  if(!host)return;
  const player=new PageListen({onState:({state})=>{button.dataset.state=state;button.textContent=state==='playing'?'Pause':state==='paused'?'Resume':'Listen';}});
  const button=root.createElement('button');button.type='button';button.dataset.universalListen='true';button.className='universal-listen-button';button.textContent=label;button.setAttribute('aria-label','Listen to this page');button.addEventListener('click',()=>player.toggle());host.prepend(button);
}
