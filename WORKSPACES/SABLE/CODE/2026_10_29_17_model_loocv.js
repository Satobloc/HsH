"use strict";
// Sable 2026-10-29 08:48Z: source-locked 17-model leave-one-out replay.
// Archived recorded model outputs only; no API calls or physical fixtures.
const fs=require("node:fs"),path=require("node:path"),crypto=require("node:crypto"),assert=require("node:assert/strict");
const manifest="gpt-4o 3f94994e131e25bf9bf52f43867fbe6b229756b1\ngpt-4.1 9ab86f214197d1c60279807850a07d9da75344b8\ngemini-2.5-pro 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4\nclaude-opus-4.6 c9f6e92cc21a30497b2264e17e0b59a3a843b710\nclaude-3.5-sonnet 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf\nclaude-sonnet-4.5 d259dfa14fcb901323191fd99dc06be0feebc0ac\nclaude-sonnet-4.6 a5b440f9d5e9e8b8294d68938d3fb667a83e6a75\ndeepseek-v3.2 5dd5ec233d563acdc385f56270b2868c2a439d09\ngemini-2.0-flash 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729\ngemini-2.5-flash abf7a0b99c54ff8155700e80e283d1d7081f09f6\ngpt-5-mini aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b\ngpt-5.2 acf59928c7d754c78a93f648c76c6497fc7e5b11\ngpt-5 25bb4f61e2454467626592396f20384c9858cb6b\nllama-3.1-70b b7b9db7ff20a502f25064df9b786507b4d58a6a3\nllama-3.3-70b c3845de12a952cfe050f1fbab9e91f8ab10a6a36\no3 4f408b9d207d50b2bbbd31b1283f50798173e602\nqwen-2.5-72b 38393e09d44de963d109b00f66a1378f5b431720".split("\n").map(s=>s.split(" "));
function norm(v){const s=String(v).trim().toLowerCase();if(s.startsWith("yes"))return "yes";if(["cannot be determined","cannot conclude","not necessarily","we cannot","insufficient","cannot determine"].some(t=>s.includes(t)))return "cannot_determine";if(s.startsWith("no"))return "no";if(s==="unclear")return "unclear";return s;}
function gitsha(raw){return crypto.createHash("sha1").update(Buffer.from("blob "+raw.length+String.fromCharCode(0))).update(raw).digest("hex");}
function main(root){
 const models=manifest.map(([name,sha])=>{
  const raw=fs.readFileSync(path.join(root,"results",name+"_cgd.json"));
  assert.equal(gitsha(raw),sha,"source blob mismatch "+name);
  const json=JSON.parse(raw.toString("utf8"));assert.equal(json.results.length,300);
  const rows=json.results.flatMap(s=>s.evaluation.results.map((q,j)=>({id:s.set_id+"|"+j,question:q.question,key:norm(q.expected),a:norm(q.initial_answer),b:norm(q.extracted_answer)})));
  assert.equal(rows.length,1150);return{name,rows};
 });
 const ref=models[0].rows,n=models.length;
 const total={initial:0,final:0,fixedInitial:0,fixedFinal:0,fixedPairs:0};
 const contrib=models.map(m=>({model:m.name,all:0,fixed:0,fixedPairs:0}));
 for(let q=0;q<ref.length;q++){
  const rows=models.map(m=>m.rows[q]);
  for(const r of rows)assert.ok(r.id===ref[q].id&&r.question===ref[q].question&&r.key===ref[q].key,"alignment "+q);
  for(let i=0;i<n;i++)for(let j=i+1;j<n;j++){
   const x=rows[i],y=rows[j],a=Number(x.a===y.a),b=Number(x.b===y.b),d=b-a;
   total.initial+=a;total.final+=b;contrib[i].all+=d;contrib[j].all+=d;
   if([x.a,x.b,y.a,y.b].every(v=>v!=="unclear")){
    total.fixedPairs++;total.fixedInitial+=a;total.fixedFinal+=b;
    contrib[i].fixed+=d;contrib[j].fixed+=d;
    contrib[i].fixedPairs++;contrib[j].fixedPairs++;
   }
  }
 }
 assert.deepEqual(total,{initial:105795,final:104673,fixedInitial:102797,fixedFinal:102881,fixedPairs:137911});
 const all=total.final-total.initial,fixed=total.fixedFinal-total.fixedInitial;
 const loo=contrib.map(c=>({model:c.model,inclusiveDelta:all-c.all,fixedDelta:fixed-c.fixed,fixedPairs:total.fixedPairs-c.fixedPairs,removedInclusiveContribution:c.all,removedFixedContribution:c.fixed}));
 assert.equal(loo.filter(x=>x.fixedDelta<0).length,6);
 assert.ok(loo.every(x=>x.inclusiveDelta<0));
 assert.equal(contrib.reduce((s,c)=>s+c.fixed,0),2*fixed);
 console.log(JSON.stringify({manifest,total,fullDelta:{inclusive:all,fixed},loo},null,2));
}
if(process.argv.length!==3)throw Error("Usage: node 2026_10_29_17_model_loocv.js /path/to/ConsistencyBench");
main(process.argv[2]);
