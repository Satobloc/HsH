#!/usr/bin/env node
// Morrow: bounded raw-export comparator, 2026-09-13.
// Read-only. Supply files in the intended earlier-to-later order.
// Payload equality includes the ENTIRE content object. This does not infer
// runtime identity or authorize deletion; export-wide metadata is not compared.
import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";


function stable(v) {
  if (v === undefined) return 'undefined';
  if (v === null || typeof v !== "object") return JSON.stringify(v);
  if (Array.isArray(v)) return "[" + v.map(stable).join(",") + "]";
  return "{" + Object.keys(v).sort().map(k=>JSON.stringify(k)+":"+stable(v[k])).join(",") + "}";
}
function payload(m) {
  return {role:m.author?.role ?? null,author_name:m.author?.name ?? null,content:m.content ?? null,recipient:m.recipient ?? null,channel:m.channel ?? null,create_time:m.create_time ?? null};
}
function inspect(j) {
  const messages={}, nodesForMessage={}, duplicates=[];
  for(const [nid,node] of Object.entries(j.mapping)) {
    const m=node?.message;
    if(!m || typeof m !== "object") continue;
    const id=String(m.id || nid);
    if(id in messages) duplicates.push(id);
    messages[id]=m; nodesForMessage[id]=nid;
  }
  const seen=new Set(), branchNodes=[], errors=[];
  let id=j.current_node;
  while(id) {
    if(seen.has(id)){errors.push("cycle:"+id);break;}
    seen.add(id);
    const node=j.mapping[id];
    if(!node){errors.push("missing-node:"+id);break;}
    branchNodes.push(id); id=node.parent;
  }
  branchNodes.reverse();
  const branch=branchNodes.filter(n=>j.mapping[n].message).map(n=>String(j.mapping[n].message.id || n));
  const roles={};
  for(const m of Object.values(messages)) roles[m.author?.role ?? "unknown"]=(roles[m.author?.role ?? "unknown"]||0)+1;
  const times=Object.values(messages).map(m=>m.create_time).filter(t=>typeof t==="number");
  return {conversation_id:j.conversation_id,current_node:j.current_node,node_count:Object.keys(j.mapping).length,message_count:Object.keys(messages).length,roles,duplicates,branch,branchErrors:errors,first_time:Math.min(...times),last_time:Math.max(...times),messages,nodesForMessage};
}
function compare(a,b,ja,jb) {
  const A=Object.keys(a.messages), B=Object.keys(b.messages);
  const missing=A.filter(id=>!(id in b.messages));
  const added=B.filter(id=>!(id in a.messages));
  const shared=A.filter(id=>id in b.messages);
  const changed=shared.filter(id=>stable(payload(a.messages[id]))!==stable(payload(b.messages[id])));
  const exactChanged=shared.filter(id=>stable(a.messages[id])!==stable(b.messages[id]));
  const fieldChanges={};
  for(const id of exactChanged) {
    const x=a.messages[id],y=b.messages[id];
    for(const k of new Set([...Object.keys(x),...Object.keys(y)]))
      if(stable(x[k])!==stable(y[k])) fieldChanges[k]=(fieldChanges[k]||0)+1;
  }
  const changedParents=shared.filter(id=>ja.mapping[a.nodesForMessage[id]].parent!==jb.mapping[b.nodesForMessage[id]].parent);
  const missingOldChildEdges=[];
  for(const [nid,node] of Object.entries(ja.mapping)) for(const child of node.children||[])
    if(!(jb.mapping[nid]?.children||[]).includes(child)) missingOldChildEdges.push([nid,child]);
  let prefix=0;while(prefix<a.branch.length&&prefix<b.branch.length&&a.branch[prefix]===b.branch[prefix])prefix++;
  return {same_conversation:a.conversation_id===b.conversation_id,smaller_messages:A.length,larger_messages:B.length,shared_messages:shared.length,missing_ids:missing,added_count:added.length,changed_payload_ids:changed,changed_raw_message_ids:exactChanged,changed_raw_fields:fieldChanges,changed_parent_ids:changedParents,missing_old_child_edges:missingOldChildEdges,old_branch_messages:a.branch.length,new_branch_messages:b.branch.length,common_branch_prefix:prefix,old_branch_is_id_prefix:prefix===a.branch.length,old_branch_payloads_unchanged:a.branch.every(id=>id in b.messages&&stable(payload(a.messages[id]))===stable(payload(b.messages[id]))),old_current_node_on_new_active_branch:b.branch.includes(String(ja.mapping[a.current_node]?.message?.id || a.current_node))};
}


const paths=process.argv.slice(2);
if(paths.length<2) throw new Error("Usage: node compare_conversation_exports.mjs earlier.json later.json [later-still.json]");
const inputs=paths.map(path=>{
  const bytes=readFileSync(path);
  let j=JSON.parse(bytes.toString("utf8"));
  if(Array.isArray(j)&&j.length===1) j=j[0];
  if(!j||typeof j.mapping!=="object"||!j.current_node) throw new Error("Not a supported raw conversation: "+path);
  const inspected=inspect(j);
  if(inspected.duplicates.length||inspected.branchErrors.length) throw new Error("Ambiguous IDs or invalid active branch: "+path);
  const sha=createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex");
  return {path,sha,j,inspected};
});
const summaries=inputs.map(({path,sha,inspected})=>{
  const {messages,nodesForMessage,branch,...summary}=inspected;
  return {path,sha,...summary,branch_messages:branch.length};
});
const pairs=[];
for(let a=0;a<inputs.length;a++) for(let b=a+1;b<inputs.length;b++)
  pairs.push({from:inputs[a].sha,to:inputs[b].sha,...compare(inputs[a].inspected,inputs[b].inspected,inputs[a].j,inputs[b].j)});
process.stdout.write(JSON.stringify({summaries,pairs},null,2)+"\n");
