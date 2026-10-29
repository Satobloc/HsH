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
let initiallyCorrect=0,finallyCorrect=0;
for(let i=0;i<ref.length;i++){
const rs=models.map(m=>m.rows[i]);for(const r of rs)assert.ok(r.id===ref[i].id&&r.question===ref[i].question&&r.key===ref[i].key,"source alignment "+i);
const a=rs.map(r=>r.a),b=rs.map(r=>r.b);initiallyCorrect+=a.filter(x=>x===ref[i].key).length;finallyCorrect+=b.filter(x=>x===ref[i].key).length;
const ia=agreement(a),fa=agreement(b),group=frequency.get(ref[i].question)>1?"repeated":"singleton";
for(const d of [total,category[ref[i].category] ||=blank(),duplicate[group] ||=blank()]){d.positions++;d.pairs+=c2(17);d.initial+=ia;d.final+=fa;}
}
assert.deepEqual({pairs:total.pairs,initial:total.initial,final:total.final,initiallyCorrect,finallyCorrect},{pairs:156400,initial:105795,final:104673,initiallyCorrect:12567,finallyCorrect:13221});
assert.deepEqual(duplicate.singleton,{positions:896,pairs:121856,initial:83053,final:83344});
assert.deepEqual(duplicate.repeated,{positions:254,pairs:34544,initial:22742,final:21329});
console.log(JSON.stringify({status:"PASS_SOURCE_LOCKED_17_CGD",manifest,total,category,duplicate,initiallyCorrect,finallyCorrect},null,2));
}
if(process.argv.length!==3)throw Error("Usage: node script.js /path/to/ConsistencyBench");
main(process.argv[2]);
