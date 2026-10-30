#!/usr/bin/env node
"use strict";
// Source-locked 17-model ConsistencyBench CGD cross-model agreement replay.
// Run: node 2026_10_29_cross_model_agreement.js /path/to/ConsistencyBench
// No model calls. Exact label equality is not semantic consensus or causality.
const fs=require("node:fs"),path=require("node:path"),crypto=require("node:crypto"),assert=require("node:assert/strict");
const manifest=[
"gpt-4o 3f94994e131e25bf9bf52f43867fbe6b229756b1",
"gpt-4.1 9ab86f214197d1c60279807850a07d9da75344b8",
"gemini-2.5-pro 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4",
"claude-opus-4.6 c9f6e92cc21a30497b2264e17e0b59a3a843b710",
"claude-3.5-sonnet 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf",
"claude-sonnet-4.5 d259dfa14fcb901323191fd99dc06be0feebc0ac",
"claude-sonnet-4.6 a5b440f9d5e9e8b8294d68938d3fb667a83e6a75",
"deepseek-v3.2 5dd5ec233d563acdc385f56270b2868c2a439d09",
"gemini-2.0-flash 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729",
"gemini-2.5-flash abf7a0b99c54ff8155700e80e283d1d7081f09f6",
"gpt-5-mini aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b",
"gpt-5.2 acf59928c7d754c78a93f648c76c6497fc7e5b11",
"gpt-5 25bb4f61e2454467626592396f20384c9858cb6b",
"llama-3.1-70b b7b9db7ff20a502f25064df9b786507b4d58a6a3",
"llama-3.3-70b c3845de12a952cfe050f1fbab9e91f8ab10a6a36",
"o3 4f408b9d207d50b2bbbd31b1283f50798173e602",
"qwen-2.5-72b 38393e09d44de963d109b00f66a1378f5b431720"
].map(s=>s.split(" "));
function norm(v){const s=String(v).trim().toLowerCase();if(s.startsWith("yes"))return"yes";if(["cannot be determined","cannot conclude","not necessarily","we cannot","insufficient","cannot determine"].some(t=>s.includes(t)))return"cannot_determine";if(s.startsWith("no"))return"no";if(s==="unclear")return"unclear";return s;}
function sha(raw){return crypto.createHash("sha1").update(Buffer.from("blob "+raw.length+"\0")).update(raw).digest("hex");}
function c2(n){return n*(n-1)/2;}
function agreement(arr){const c=new Map();for(const a of arr)c.set(a,(c.get(a)||0)+1);return [...c.values()].reduce((s,n)=>s+c2(n),0);}
function main(root){
const models=manifest.map(([name,hash])=>{const raw=fs.readFileSync(path.join(root,"results",name+"_cgd.json"));assert.equal(sha(raw),hash,"source SHA mismatch "+name);const o=JSON.parse(raw.toString("utf8"));assert.equal(o.results.length,300);return {name,rows:o.results.flatMap(s=>s.evaluation.results.map((q,j)=>({id:s.set_id+"|"+j,question:q.question,category:s.category,key:norm(q.expected),a:norm(q.initial_answer),b:norm(q.extracted_answer)}))) };});
const ref=models[0].rows;assert.equal(ref.length,1150);
const frequency=new Map();for(const r of ref)frequency.set(r.question,(frequency.get(r.question)||0)+1);
const blank=()=>({positions:0,pairs:0,initial:0,final:0});const total=blank(),category={},duplicate={};
let initiallyCorrect=0,finallyCorrect=0;const completeCase={pairs:0,initial:0,final:0};
for(let i=0;i<ref.length;i++){
const rs=models.map(m=>m.rows[i]);for(const r of rs)assert.ok(r.id===ref[i].id&&r.question===ref[i].question&&r.key===ref[i].key,"source alignment "+i);
const a=rs.map(r=>r.a),b=rs.map(r=>r.b);initiallyCorrect+=a.filter(x=>x===ref[i].key).length;finallyCorrect+=b.filter(x=>x===ref[i].key).length;
for(let j=0;j<17;j++)for(let k=j+1;k<17;k++){
if(a[j]==="unclear"||a[k]==="unclear"||b[j]==="unclear"||b[k]==="unclear")continue;
completeCase.pairs++;completeCase.initial+=a[j]===a[k];completeCase.final+=b[j]===b[k];
}
const ia=agreement(a),fa=agreement(b),group=frequency.get(ref[i].question)>1?"repeated":"singleton";
for(const d of [total,category[ref[i].category] ||=blank(),duplicate[group] ||=blank()]){d.positions++;d.pairs+=c2(17);d.initial+=ia;d.final+=fa;}
}
assert.deepEqual({pairs:total.pairs,initial:total.initial,final:total.final,initiallyCorrect,finallyCorrect},{pairs:156400,initial:105795,final:104673,initiallyCorrect:12567,finallyCorrect:13221});
assert.deepEqual(duplicate.singleton,{positions:896,pairs:121856,initial:83053,final:83344});
assert.deepEqual(duplicate.repeated,{positions:254,pairs:34544,initial:22742,final:21329});
assert.deepEqual(completeCase,{pairs:137911,initial:102797,final:102881});

const valid=new Set(["yes","no","cannot_determine"]);
const peerTotals={eligible:0,changed:0,majorityDefined:0,initialMajorityMatches:0,finalMajorityMatches:0,toward:0,away:0,other:0,noMajority:0,keyGain:0,keyLoss:0,keyOther:0};
const peerCross={toward:{gain:0,loss:0,other:0},away:{gain:0,loss:0,other:0},other:{gain:0,loss:0,other:0},noMajority:{gain:0,loss:0,other:0}};
const peerByCategory={},peerByModel={},peerItems=[];
for(const [name] of manifest)peerByModel[name]={eligible:0,changed:0,toward:0,away:0,other:0,noMajority:0,keyGain:0,keyLoss:0};
for(let i=0;i<ref.length;i++){
  const rs=models.map(m=>m.rows[i]);
  const item={setId:ref[i].id.split("|")[0],id:ref[i].id,question:ref[i].question,category:ref[i].category,
    eligible:0,changed:0,majorityDefined:0,initialMatch:0,finalMatch:0,
    toward:0,away:0,other:0,noMajority:0,keyGain:0,keyLoss:0,keyOther:0};
  for(let j=0;j<17;j++){
    const r=rs[j];
    if(!valid.has(r.a)||!valid.has(r.b)||!valid.has(r.key))continue;
    peerTotals.eligible++;peerByModel[manifest[j][0]].eligible++;item.eligible++;
    const peers=rs.filter((_,k)=>k!==j).map(x=>x.a).filter(x=>valid.has(x));
    const counts={yes:0,no:0,cannot_determine:0};for(const x of peers)counts[x]++;
    const ranked=Object.entries(counts).sort((a,b)=>b[1]-a[1]);
    const majority=peers.length&&ranked[0][1]>peers.length/2?ranked[0][0]:null;
    if(majority!==null){
      peerTotals.majorityDefined++;item.majorityDefined++;
      if(r.a===majority){peerTotals.initialMajorityMatches++;item.initialMatch++;}
      if(r.b===majority){peerTotals.finalMajorityMatches++;item.finalMatch++;}
    }
    if(r.a===r.b)continue;
    peerTotals.changed++;peerByModel[manifest[j][0]].changed++;item.changed++;
    let direction="noMajority";
    if(majority===null){peerTotals.noMajority++;peerByModel[manifest[j][0]].noMajority++;item.noMajority++;}
    else if(r.a!==majority&&r.b===majority){direction="toward";peerTotals.toward++;peerByModel[manifest[j][0]].toward++;item.toward++;}
    else if(r.a===majority&&r.b!==majority){direction="away";peerTotals.away++;peerByModel[manifest[j][0]].away++;item.away++;}
    else {direction="other";peerTotals.other++;peerByModel[manifest[j][0]].other++;item.other++;}
    let keyChange="other";
    if(r.a!==r.key&&r.b===r.key){keyChange="gain";peerTotals.keyGain++;peerByModel[manifest[j][0]].keyGain++;item.keyGain++;}
    else if(r.a===r.key&&r.b!==r.key){keyChange="loss";peerTotals.keyLoss++;peerByModel[manifest[j][0]].keyLoss++;item.keyLoss++;}
    else {peerTotals.keyOther++;item.keyOther++;}
    peerCross[direction][keyChange]++;
  }
  peerItems.push(item);
  const c=peerByCategory[item.category]??(peerByCategory[item.category]={eligible:0,changed:0,majorityDefined:0,initialMatch:0,finalMatch:0,toward:0,away:0,other:0,noMajority:0,keyGain:0,keyLoss:0,keyOther:0});
  for(const k of Object.keys(c))c[k]+=item[k]??0;
}
// Independent grouped-count reconstruction: count each question's initial labels once,
// then remove the focal model's own vote to recover its leave-one-out reference.
const groupedPeerTotals={eligible:0,changed:0,majorityDefined:0,initialMajorityMatches:0,finalMajorityMatches:0,
  toward:0,away:0,other:0,noMajority:0,keyGain:0,keyLoss:0,keyOther:0};
for(let i=0;i<ref.length;i++){
  const rs=models.map(m=>m.rows[i]),counts={yes:0,no:0,cannot_determine:0};
  for(const r of rs)if(valid.has(r.a))counts[r.a]++;
  const totalInitial=Object.values(counts).reduce((a,b)=>a+b,0);
  for(const r of rs){
    if(!valid.has(r.a)||!valid.has(r.b)||!valid.has(r.key))continue;
    groupedPeerTotals.eligible++;
    const peerCounts={...counts};peerCounts[r.a]--;
    const peerN=totalInitial-1;
    const ranked=Object.entries(peerCounts).sort((a,b)=>b[1]-a[1]);
    const majority=peerN>0&&ranked[0][1]>peerN/2?ranked[0][0]:null;
    if(majority!==null){
      groupedPeerTotals.majorityDefined++;
      if(r.a===majority)groupedPeerTotals.initialMajorityMatches++;
      if(r.b===majority)groupedPeerTotals.finalMajorityMatches++;
    }
    if(r.a===r.b)continue;
    groupedPeerTotals.changed++;
    let direction="noMajority";
    if(majority===null)groupedPeerTotals.noMajority++;
    else if(r.a!==majority&&r.b===majority){direction="toward";groupedPeerTotals.toward++;}
    else if(r.a===majority&&r.b!==majority){direction="away";groupedPeerTotals.away++;}
    else {direction="other";groupedPeerTotals.other++;}
    if(r.a!==r.key&&r.b===r.key)groupedPeerTotals.keyGain++;
    else if(r.a===r.key&&r.b!==r.key)groupedPeerTotals.keyLoss++;
    else groupedPeerTotals.keyOther++;
  }
}
assert.deepEqual(groupedPeerTotals,peerTotals,"independent peer-majority algorithms disagree");
assert.deepEqual(peerTotals,{eligible:18331,changed:1616,majorityDefined:17258,
  initialMajorityMatches:14088,finalMajorityMatches:13699,toward:489,away:878,other:41,
  noMajority:208,keyGain:1096,keyLoss:405,keyOther:115});
const setClusters=new Map(),questionClusters=new Map();
for(const item of peerItems){
  for(const [map,key] of [[setClusters,item.setId],[questionClusters,item.question]]){
    const z=map.get(key)??{changed:0,majorityDefined:0,initialMatch:0,finalMatch:0,toward:0,away:0,other:0,keyGain:0,keyLoss:0};
    for(const k of Object.keys(z))z[k]+=item[k]??0;
    map.set(key,z);
  }
}
assert.equal(peerItems.length,1150);
assert.equal(setClusters.size,300);
assert.equal(questionClusters.size,977);
function clusterBootstrap(map,seed0){
  const clusters=[...map.values()],B=10000,values={towardShare:[],netTowardAway:[],keyGainShare:[],keyLossShare:[],peerAlignmentDelta:[]};
  let seed=seed0;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/4294967296;};
  for(let b=0;b<B;b++){
    const s={changed:0,majorityDefined:0,initialMatch:0,finalMatch:0,toward:0,away:0,other:0,keyGain:0,keyLoss:0};
    for(let j=0;j<clusters.length;j++){
      const z=clusters[Math.floor(random()*clusters.length)];
      for(const k of Object.keys(s))s[k]+=z[k]??0;
    }
    const d=s.toward+s.away+s.other;
    values.towardShare.push(d?s.toward/d:0);
    values.netTowardAway.push(d?(s.toward-s.away)/d:0);
    values.keyGainShare.push(s.changed?s.keyGain/s.changed:0);
    values.keyLossShare.push(s.changed?s.keyLoss/s.changed:0);
    values.peerAlignmentDelta.push(s.majorityDefined?(s.finalMatch-s.initialMatch)/s.majorityDefined:0);
  }
  const quantile=(a,p)=>{const z=a.slice().sort((x,y)=>x-y);return z[Math.floor(p*(z.length-1))];};
  return Object.fromEntries(Object.entries(values).map(([k,a])=>[k,[quantile(a,.025),quantile(a,.975)]]));
}
const peerBootstrap={
  setIdClusters:clusterBootstrap(setClusters,20261030),
  exactQuestionClusters:clusterBootstrap(questionClusters,20261031)
};
const peerMajority={
  method:"leave-one-out strict majority of other models' INITIAL extracted labels; compare focal model initial vs final label",
  interpretation:"retrospective alignment only; archived models were not shown peer answers",
  counts:peerTotals,crossTab:peerCross,byCategory:peerByCategory,byModel:peerByModel,
  uniqueSets:setClusters.size,uniqueExactQuestionStrings:questionClusters.size,
  bootstrapReplicates:10000,clusterBootstrap:peerBootstrap
};


const panelInitial={covered:0,correct:0,wrong:0,noMajority:0};
const panelFinal={covered:0,correct:0,wrong:0,noMajority:0};
const panelTransitions={correctToCorrect:0,correctToWrong:0,wrongToCorrect:0,wrongToWrong:0,initialOnly:0,finalOnly:0,neither:0};
const panelItems=[];
for(let i=0;i<ref.length;i++){
  const rs=models.map(m=>m.rows[i]),key=ref[i].key;
  const strictMajority=field=>{
    const counts={yes:0,no:0,cannot_determine:0};
    for(const r of rs)if(valid.has(r[field]))counts[r[field]]++;
    const n=Object.values(counts).reduce((a,b)=>a+b,0);
    const ranked=Object.entries(counts).sort((a,b)=>b[1]-a[1]);
    return n&&ranked[0][1]>n/2?ranked[0][0]:null;
  };
  const a=strictMajority("a"),b=strictMajority("b");
  const item={setId:ref[i].id.split("|")[0],question:ref[i].question,
    initialCovered:a!==null,finalCovered:b!==null,
    initialCorrect:a!==null&&a===key,finalCorrect:b!==null&&b===key};
  if(a!==null){panelInitial.covered++;if(a===key)panelInitial.correct++;else panelInitial.wrong++;}
  else panelInitial.noMajority++;
  if(b!==null){panelFinal.covered++;if(b===key)panelFinal.correct++;else panelFinal.wrong++;}
  else panelFinal.noMajority++;
  if(a!==null&&b!==null){
    if(a===key&&b===key)panelTransitions.correctToCorrect++;
    else if(a===key&&b!==key)panelTransitions.correctToWrong++;
    else if(a!==key&&b===key)panelTransitions.wrongToCorrect++;
    else panelTransitions.wrongToWrong++;
  }else if(a!==null)panelTransitions.initialOnly++;
  else if(b!==null)panelTransitions.finalOnly++;
  else panelTransitions.neither++;
  panelItems.push(item);
}
assert.deepEqual(panelInitial,{covered:1077,correct:749,wrong:328,noMajority:73});
assert.deepEqual(panelFinal,{covered:1078,correct:839,wrong:239,noMajority:72});
assert.deepEqual(panelTransitions,{correctToCorrect:722,correctToWrong:12,wrongToCorrect:92,
  wrongToWrong:219,initialOnly:32,finalOnly:33,neither:40});
function panelClusterBootstrap(keyFn,seed0){
  const map=new Map();
  for(const item of panelItems){
    const key=keyFn(item),z=map.get(key)??{n:0,initialCovered:0,finalCovered:0,initialCorrect:0,finalCorrect:0};
    z.n++;z.initialCovered+=item.initialCovered?1:0;z.finalCovered+=item.finalCovered?1:0;
    z.initialCorrect+=item.initialCorrect?1:0;z.finalCorrect+=item.finalCorrect?1:0;map.set(key,z);
  }
  const clusters=[...map.values()],B=10000,values={coverageDelta:[],correctFractionDelta:[],initialMajorityAccuracy:[],finalMajorityAccuracy:[]};
  let seed=seed0;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/4294967296;};
  for(let b=0;b<B;b++){
    let n=0,ic=0,fc=0,iv=0,fv=0;
    for(let j=0;j<clusters.length;j++){
      const z=clusters[Math.floor(random()*clusters.length)];
      n+=z.n;ic+=z.initialCorrect;fc+=z.finalCorrect;iv+=z.initialCovered;fv+=z.finalCovered;
    }
    values.coverageDelta.push((fv-iv)/n);
    values.correctFractionDelta.push((fc-ic)/n);
    values.initialMajorityAccuracy.push(iv?ic/iv:0);
    values.finalMajorityAccuracy.push(fv?fc/fv:0);
  }
  const q=(a,p)=>{const z=a.slice().sort((x,y)=>x-y);return z[Math.floor(p*(z.length-1))];};
  return {clusters:clusters.length,replicates:B,
    intervals:Object.fromEntries(Object.entries(values).map(([k,a])=>[k,[q(a,.025),q(a,.975)]]))};
}
const panelMajority={
  interpretation:"strict question-level majority among the 17 model-labelled archived outputs; benchmark-key-relative, not independent-vote truth",
  initial:panelInitial,final:panelFinal,transitions:panelTransitions,
  rates:{initialCoverage:panelInitial.covered/ref.length,finalCoverage:panelFinal.covered/ref.length,
    initialMajorityAccuracy:panelInitial.correct/panelInitial.covered,
    finalMajorityAccuracy:panelFinal.correct/panelFinal.covered,
    initialCorrectFraction:panelInitial.correct/ref.length,finalCorrectFraction:panelFinal.correct/ref.length},
  majorityLabelChanged:panelItems.filter(x=>x.initialCovered!==x.finalCovered).length,
  clusterBootstrap:{bySet:panelClusterBootstrap(x=>x.setId,20261030),
    byExactQuestion:panelClusterBootstrap(x=>x.question,20261031)}
};

console.log(JSON.stringify({status:"PASS_SOURCE_LOCKED_17_CGD",manifest,total,category,duplicate,completeCase,initiallyCorrect,finallyCorrect,peerMajority,panelMajority},null,2));
}
if(process.argv.length!==3)throw Error("Usage: node script.js /path/to/ConsistencyBench");
main(process.argv[2]);
