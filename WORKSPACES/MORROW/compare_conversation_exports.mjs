#!/usr/bin/env node
// Morrow: bounded raw-export comparator, 2026-09-13.
// Read-only. Supply files in the intended earlier-to-later order.
// 2026-11-12: child-edge additions are reported separately from removals and split by shared/new parent.\n// Payload equality includes the ENTIRE content object. This does not infer
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
function auditGraph(mapping) {
  // Whole-mapping diagnostic: do not repair or normalize source edges.
  const ids=Object.keys(mapping);
  const danglingParents=[],danglingChildren=[],parentChildMismatches=[],childParentMismatches=[];
  const duplicateChildEdges=[],selfEdges=[],malformedNodes=[],malformedParents=[],malformedChildren=[];
  const messageKeyMismatches=[],parentCycles=[];
  let parentPointers=0,childEdges=0,roots=0;
  for(const id of ids) {
    const node=mapping[id];
    if(!node||typeof node!=="object"||Array.isArray(node)) {
      malformedNodes.push(id); continue;
    }
    const parent=node.parent;
    if(parent===null||parent===undefined) roots++;
    else {
      parentPointers++;
      if(typeof parent!=="string"||parent.length===0) malformedParents.push([id,parent??null]);
      else if(parent===id) selfEdges.push([id,parent]);
      else if(!Object.prototype.hasOwnProperty.call(mapping,parent)) danglingParents.push([id,parent]);
      else if(!Array.isArray(mapping[parent]?.children)||!mapping[parent].children.includes(id)) parentChildMismatches.push([id,parent]);
    }
    if(node.children!==undefined&&!Array.isArray(node.children)) {
      malformedChildren.push([id,"children_not_array"]);
    } else {
      const children=Array.isArray(node.children)?node.children:[];
      const seen=new Set();
      for(const child of children) {
        childEdges++;
        if(typeof child!=="string"||child.length===0) {
          malformedChildren.push([id,child??null]); continue;
        }
        if(seen.has(child)) duplicateChildEdges.push([id,child]);
        seen.add(child);
        if(child===id) selfEdges.push([id,child]);
        if(!Object.prototype.hasOwnProperty.call(mapping,child)) danglingChildren.push([id,child]);
        else if(mapping[child]?.parent!==id) childParentMismatches.push([id,child,mapping[child]?.parent??null]);
      }
    }
    if(node.message&&node.message.id!=null&&String(node.message.id)!==id) {
      messageKeyMismatches.push([id,String(node.message.id)]);
    }
  }
  // Detect parent-pointer cycles in every component, not only current_node ancestry.
  const finished=new Set();
  for(const start of ids) {
    if(finished.has(start)) continue;
    const path=[],position=new Map();
    let cursor=start;
    while(cursor&&Object.prototype.hasOwnProperty.call(mapping,cursor)&&!finished.has(cursor)) {
      if(position.has(cursor)) {
        parentCycles.push(path.slice(position.get(cursor)).concat(cursor));
        break;
      }
      position.set(cursor,path.length);
      path.push(cursor);
      const parent=mapping[cursor]?.parent;
      cursor=typeof parent==="string"&&parent.length>0?parent:null;
    }
    for(const id of path) finished.add(id);
  }
  const errorCounts={
    dangling_parents:danglingParents.length,
    dangling_children:danglingChildren.length,
    parent_child_mismatches:parentChildMismatches.length,
    child_parent_mismatches:childParentMismatches.length,
    duplicate_child_edges:duplicateChildEdges.length,
    self_edges:selfEdges.length,
    malformed_nodes:malformedNodes.length,
    malformed_parents:malformedParents.length,
    malformed_children:malformedChildren.length,
    mapping_message_id_mismatches:messageKeyMismatches.length,
    parent_cycles:parentCycles.length
  };
  const errorCount=Object.values(errorCounts).reduce((sum,n)=>sum+n,0);
  return {
    valid:errorCount===0,node_count:ids.length,root_count:roots,
    parent_pointer_count:parentPointers,child_edge_count:childEdges,error_count:errorCount,
    error_counts:errorCounts,
    samples:{
      dangling_parents:danglingParents.slice(0,5),dangling_children:danglingChildren.slice(0,5),
      parent_child_mismatches:parentChildMismatches.slice(0,5),child_parent_mismatches:childParentMismatches.slice(0,5),
      duplicate_child_edges:duplicateChildEdges.slice(0,5),self_edges:selfEdges.slice(0,5),
      malformed_nodes:malformedNodes.slice(0,5),malformed_parents:malformedParents.slice(0,5),
      malformed_children:malformedChildren.slice(0,5),mapping_message_id_mismatches:messageKeyMismatches.slice(0,5),
      parent_cycles:parentCycles.slice(0,3)
    }
  };
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
  const graphIntegrity=auditGraph(j.mapping);
  const roles={};
  for(const m of Object.values(messages)) roles[m.author?.role ?? "unknown"]=(roles[m.author?.role ?? "unknown"]||0)+1;
  const times=Object.values(messages).map(m=>m.create_time).filter(t=>typeof t==="number");
  return {conversation_id:j.conversation_id,current_node:j.current_node,node_count:Object.keys(j.mapping).length,message_count:Object.keys(messages).length,roles,duplicates,branch,branchErrors:errors,graphIntegrity,first_time:Math.min(...times),last_time:Math.max(...times),messages,nodesForMessage};
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
  const changedParentNodeIds=Object.keys(ja.mapping).filter(nid=>Object.prototype.hasOwnProperty.call(jb.mapping,nid)&&(ja.mapping[nid].parent??null)!==(jb.mapping[nid].parent??null));
  const missingOldChildEdges=[];
  for(const [nid,node] of Object.entries(ja.mapping)) for(const child of node.children||[])
    if(!(jb.mapping[nid]?.children||[]).includes(child)) missingOldChildEdges.push([nid,child]);
  const addedNodeIds=Object.keys(jb.mapping).filter(nid=>!Object.prototype.hasOwnProperty.call(ja.mapping,nid));
  const removedNodeIds=Object.keys(ja.mapping).filter(nid=>!Object.prototype.hasOwnProperty.call(jb.mapping,nid));
  const addedChildEdges=[];
  for(const [nid,node] of Object.entries(jb.mapping)) for(const child of node.children||[])
    if(!(ja.mapping[nid]?.children||[]).includes(child)) addedChildEdges.push([nid,child]);
  const addedChildEdgesFromSharedParent=addedChildEdges.filter(([nid])=>Object.prototype.hasOwnProperty.call(ja.mapping,nid));
  const addedChildEdgesFromNewParent=addedChildEdges.filter(([nid])=>!Object.prototype.hasOwnProperty.call(ja.mapping,nid));
  let prefix=0;while(prefix<a.branch.length&&prefix<b.branch.length&&a.branch[prefix]===b.branch[prefix])prefix++;
  return {same_conversation:a.conversation_id===b.conversation_id,smaller_messages:A.length,larger_messages:B.length,shared_messages:shared.length,missing_ids:missing,added_count:added.length,changed_payload_ids:changed,changed_raw_message_ids:exactChanged,changed_raw_fields:fieldChanges,changed_parent_ids:changedParents,changed_parent_node_ids:changedParentNodeIds,graph_integrity_from:a.graphIntegrity,graph_integrity_to:b.graphIntegrity,added_node_ids:addedNodeIds,removed_node_ids:removedNodeIds,added_child_edges:addedChildEdges,added_child_edges_from_shared_parent:addedChildEdgesFromSharedParent,added_child_edges_from_new_parent:addedChildEdgesFromNewParent,missing_old_child_edges:missingOldChildEdges,old_branch_messages:a.branch.length,new_branch_messages:b.branch.length,common_branch_prefix:prefix,old_branch_is_id_prefix:prefix===a.branch.length,old_branch_payloads_unchanged:a.branch.every(id=>id in b.messages&&stable(payload(a.messages[id]))===stable(payload(b.messages[id]))),current_node_transition:{from:ja.current_node,to:jb.current_node},old_current_node_on_new_active_branch:b.branch.includes(String(ja.mapping[a.current_node]?.message?.id || a.current_node))};
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
