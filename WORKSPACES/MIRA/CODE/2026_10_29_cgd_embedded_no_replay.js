#!/usr/bin/env node
"use strict";
/*
 * Mira 2026-10-29, original archived ConsistencyBench CGD extraction QA.
 * Usage: node 2026_10_29_cgd_embedded_no_replay.js /path/to/results
 * Requires 17 original <model>_cgd.json files. No network/API calls.
 * Source: aayambansal/ConsistencyBench src/evaluate.py Git blob
 * 0453540cb7c19227601e59fb342fa93e736da849.
 * This script checks recorded label consistency and lexical exposure;
 * it does NOT adjudicate answer meaning or identify a causal effect.
 */
const fs=require("fs"), path=require("path"), crypto=require("crypto");
const blobs={
"claude-3.5-sonnet":"5e486f26e16bcd3d9994670ef3c85ad79a8d82bf",
"claude-opus-4.6":"c9f6e92cc21a30497b2264e17e0b59a3a843b710",
"claude-sonnet-4.5":"d259dfa14fcb901323191fd99dc06be0feebc0ac",
"claude-sonnet-4.6":"a5b440f9d5e9e8b8294d68938d3fb667a83e6a75",
"deepseek-v3.2":"5dd5ec233d563acdc385f56270b2868c2a439d09",
"gemini-2.0-flash":"3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729",
"gemini-2.5-flash":"abf7a0b99c54ff8155700e80e283d1d7081f09f6",
"gemini-2.5-pro":"1d7ee27ecefddc6e0d67833aeef2370430a7c9c4",
"gpt-4.1":"9ab86f214197d1c60279807850a07d9da75344b8",
"gpt-4o":"3f94994e131e25bf9bf52f43867fbe6b229756b1",
"gpt-5":"25bb4f61e2454467626592396f20384c9858cb6b",
"gpt-5-mini":"aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b",
"gpt-5.2":"acf59928c7d754c78a93f648c76c6497fc7e5b11",
"llama-3.1-70b":"b7b9db7ff20a502f25064df9b786507b4d58a6a3",
"llama-3.3-70b":"c3845de12a952cfe050f1fbab9e91f8ab10a6a36",
"o3":"4f408b9d207d50b2bbbd31b1283f50798173e602",
"qwen-2.5-72b":"38393e09d44de963d109b00f66a1378f5b431720"
};
const uncertain=["cannot be determined","cannot determine","insufficient information","not enough information","cannot conclude","indeterminate","we cannot","it is not possible to determine","not necessarily"];
const noRecode=["cannot conclude","cannot be determined","not necessarily","we cannot","insufficient","cannot determine","not enough"];
function classify(raw){
  let text=String(raw??"").trim();
  if(text.toUpperCase().includes("FINAL ANSWER:"))text=text.toUpperCase().split("FINAL ANSWER:").at(-1).trim();
  const lower=text.toLowerCase();
  if(lower.startsWith("yes"))return {label:"Yes",embedded:false};
  if(lower.startsWith("no"))return {label:noRecode.some(p=>lower.slice(0,100).includes(p))?"Cannot be determined":"No",embedded:false};
  if(uncertain.some(p=>lower.slice(0,150).includes(p)))return {label:"Cannot be determined",embedded:false};
  const prefix=lower.slice(0,200),hasYes=prefix.includes("yes"),hasNo=prefix.includes("no");
  if(hasYes&&!hasNo)return {label:"Yes",embedded:false};
  if(hasNo&&!hasYes)return {label:"No",embedded:!(/\\bno\\b/.test(prefix))};
  return {label:"Unclear",embedded:false};
}
function gitBlobSha(buffer){
  const header=Buffer.from("blob "+buffer.length+"\\0","utf8");
  return crypto.createHash("sha1").update(header).update(buffer).digest("hex");
}
function expectedLabel(expected){
  const e=String(expected).toLowerCase();
  return e.startsWith("yes")?"Yes":e.startsWith("no")?"No":"Cannot be determined";
}
const root=process.argv[2];if(!root)throw Error("Provide local original results directory");
const summary={files:0,records:0,stageRecords:0,replayMismatches:0,initialEmbedded:0,finalEmbedded:0,affectedUnion:0,finalKeyCorrect:0,finalKeyWrong:0,finalNoWholeWordAnywhere:0,finalYesAnywhere:0,byModel:{},byCategory:{}};
for(const [model,sha] of Object.entries(blobs)){
  const buf=fs.readFileSync(path.join(root,model+"_cgd.json"));
  if(gitBlobSha(buf)!==sha)throw Error("Git blob mismatch for "+model);
  const data=JSON.parse(buf.toString("utf8"));
  let initial=0,final=0,union=0,records=0;
  for(const set of data.results){
    for(const row of set.evaluation.results){
      records++;summary.records++;
      const a=classify(row.initial_response);
      const finalRaw=row.revision_response===null||row.revision_response===undefined?row.initial_response:row.revision_response;
      const b=classify(finalRaw);
      summary.stageRecords+=2;
      if(a.label!==row.initial_answer||b.label!==row.extracted_answer)summary.replayMismatches++;
      if(a.embedded){initial++;summary.initialEmbedded++;}
      if(b.embedded){
        final++;summary.finalEmbedded++;
        summary.byCategory[set.category]=(summary.byCategory[set.category]||0)+1;
        if(expectedLabel(row.expected)==="No")summary.finalKeyCorrect++;else summary.finalKeyWrong++;
        if(!/\\bno\\b/i.test(String(finalRaw)))summary.finalNoWholeWordAnywhere++;
        if(/\\byes\\b/i.test(String(finalRaw)))summary.finalYesAnywhere++;
      }
      if(a.embedded||b.embedded){union++;summary.affectedUnion++;}
    }
  }
  summary.files++;
  summary.byModel[model]={records,initial,final,union};
}
if(summary.files!==17||summary.records!==19550||summary.stageRecords!==39100||summary.replayMismatches!==0)throw Error("Source alignment or extraction replay failed");
if(summary.initialEmbedded!==402||summary.finalEmbedded!==294||summary.affectedUnion!==438)throw Error("Exposure-count regression failed");
console.log(JSON.stringify(summary,null,2));
