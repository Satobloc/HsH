#!/usr/bin/env node
// Morrow: bounded raw-export comparator, 2026-09-13.
// Read-only. Supply files in the intended earlier-to-later order.
// 2026-11-12: child-edge additions are reported separately from removals and split by shared/new parent.\n// Payload equality includes the ENTIRE content object. This does not infer
// runtime identity or authorize deletion; export-wide metadata is not compared.\n// Message-level conversation-context citations are summarized separately; they do not establish runtime retrieval or causal transfer.
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

// Conversation-context citations are a separate evidence graph, not parent/child
// edges and not proof of runtime retrieval or causal context transfer.
function contentText(m) {
  const c=m?.content ?? {};
  const parts=Array.isArray(c.parts)?c.parts.filter(p=>typeof p==="string").join("\\n"):"";
  const text=typeof c.text==="string"?c.text:"";
  return [parts,text].filter(Boolean).join("\\n");
}
function normalizeMatchText(s) {
  return String(s??"").normalize("NFKC").toLowerCase().replace(/\\s+/g," ").trim();
}
function extractCitations(j) {
  const out=[];
  for(const [nodeId,node] of Object.entries(j.mapping)) {
    const m=node?.message,meta=m?.metadata ?? {};
    const list=meta.conversation_context_citation_metadata;
    if(!m || !Array.isArray(list)) continue;
    for(let i=0;i<list.length;i++) {
      const item=list[i] ?? {};
      const c=item.citation && typeof item.citation==="object" ? item.citation : item;
      const url=typeof c.url==="string" ? c.url : null;
      out.push({
        source_node_id:nodeId,
        source_message_id:String(m.id || nodeId),
        source_role:m.author?.role ?? null,
        source_time:m.create_time ?? null,
        metadata_status:meta.conversation_context_citation_metadata_status ?? null,
        citation_index:i,
        citation_uuid:c.citation_uuid ?? item.citation_uuid ?? null,
        context_type:c.conversation_context_type ?? null,
        title:c.title ?? null,
        conversation_title:c.conversation_title ?? null,
        target_conversation_id:url?.match(/\\/c\\/([^/?#]+)/)?.[1] ?? null,
        pub_date:c.pub_date ?? null,
        attribution:c.attribution ?? null,
        snippet:c.snippet ?? null
      });
    }
  }
  return out;
}
function citationKey(e) {
  const id=e.citation_uuid || stable({
    context_type:e.context_type,title:e.title,conversation_title:e.conversation_title,
    target_conversation_id:e.target_conversation_id,pub_date:e.pub_date,
    attribution:e.attribution,snippet:e.snippet
  });
  return e.source_message_id+"\\u0000"+id;
}
function compareCitations(a,b) {
  const A=new Map(a.map(e=>[citationKey(e),e]));
  const B=new Map(b.map(e=>[citationKey(e),e]));
  const added=[...B.keys()].filter(k=>!A.has(k));
  const removed=[...A.keys()].filter(k=>!B.has(k));
  const shared=[...A.keys()].filter(k=>B.has(k));
  const changed=shared.filter(k=>stable(A.get(k))!==stable(B.get(k)));
  const sample=e=>({
    source_message_id:e.source_message_id,citation_uuid:e.citation_uuid,
    context_type:e.context_type,target_conversation_id:e.target_conversation_id,
    metadata_status:e.metadata_status
  });
  const changedSample=k=>{
    const before=A.get(k),after=B.get(k);
    const fields=[...new Set([...Object.keys(before),...Object.keys(after)])]
      .filter(field=>stable(before[field])!==stable(after[field]));
    return {before:sample(before),after:sample(after),changed_fields:fields};
  };
  return {
    from_count:a.length,to_count:b.length,shared_count:shared.length,
    added_count:added.length,removed_count:removed.length,changed_count:changed.length,
    added_samples:added.slice(0,8).map(k=>sample(B.get(k))),
    removed_samples:removed.slice(0,8).map(k=>sample(A.get(k))),
    changed_samples:changed.slice(0,8).map(changedSample)
  };
}
function resolveCitations(edges,knownConversations) {
  return edges.map(e=>{
    const target=knownConversations.get(e.target_conversation_id);
    const needle=normalizeMatchText(e.snippet).replace(/(?:\\.{3,}|…+)$/,"").trim();
    const matches=target && needle
      ? target.messages.filter(m=>normalizeMatchText(m.text).includes(needle))
      : [];
    return {
      ...e,
      target_export_loaded:!!target,
      target_archive_title:target?.title ?? null,
      target_create_time:target?.create_time ?? null,
      pub_date_matches_target_create_time:
        typeof target?.create_time==="number" && e.pub_date===target.create_time,
      pub_date_matches_target_message_time:
        !!target && target.messages.some(m=>m.create_time===e.pub_date),
      snippet_prefix_match_message_ids:matches.slice(0,10).map(m=>m.id),
      snippet_prefix_match_count:matches.length
    };
  });
}
function summarizeCitations(edges) {
  const byType={},byStatus={},byTarget={};
  for(const e of edges) {
    const type=e.context_type ?? "unknown";
    const status=e.metadata_status ?? "missing";
    const target=e.target_conversation_id ?? "no-target";
    byType[type]=(byType[type]||0)+1;
    byStatus[status]=(byStatus[status]||0)+1;
    byTarget[target]=(byTarget[target]||0)+1;
  }
  return {
    count:edges.length,
    by_type:byType,
    by_metadata_status:byStatus,
    by_target_conversation:byTarget,
    target_export_resolved_count:edges.filter(e=>e.target_export_loaded).length,
    pub_date_matches_target_create_time_count:edges.filter(e=>e.pub_date_matches_target_create_time).length,
    pub_date_matches_target_message_time_count:edges.filter(e=>e.pub_date_matches_target_message_time).length,
    snippet_prefix_match_edge_count:edges.filter(e=>e.snippet_prefix_match_count>0).length,
    edges:edges.map(e=>({
      source_node_id:e.source_node_id,
      source_message_id:e.source_message_id,
      source_role:e.source_role,
      source_time:e.source_time,
      metadata_status:e.metadata_status,
      citation_index:e.citation_index,
      citation_uuid:e.citation_uuid,
      context_type:e.context_type,
      title:e.title,
      conversation_title:e.conversation_title,
      target_conversation_id:e.target_conversation_id,
      target_export_loaded:e.target_export_loaded,
      target_archive_title:e.target_archive_title,
      pub_date:e.pub_date,
      target_create_time:e.target_create_time,
      pub_date_matches_target_create_time:e.pub_date_matches_target_create_time,
      pub_date_matches_target_message_time:e.pub_date_matches_target_message_time,
      snippet_prefix_match_message_ids:e.snippet_prefix_match_message_ids,
      attribution:e.attribution
    }))
  };
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
  return {conversation_id:j.conversation_id,current_node:j.current_node,node_count:Object.keys(j.mapping).length,message_count:Object.keys(messages).length,roles,duplicates,branch,branchErrors:errors,graphIntegrity,citations,first_time:Math.min(...times),last_time:Math.max(...times),messages,nodesForMessage};
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
  return {same_conversation:a.conversation_id===b.conversation_id,smaller_messages:A.length,larger_messages:B.length,shared_messages:shared.length,missing_ids:missing,added_count:added.length,changed_payload_ids:changed,changed_raw_message_ids:exactChanged,changed_raw_fields:fieldChanges,changed_parent_ids:changedParents,changed_parent_node_ids:changedParentNodeIds,graph_integrity_from:a.graphIntegrity,graph_integrity_to:b.graphIntegrity,added_node_ids:addedNodeIds,removed_node_ids:removedNodeIds,added_child_edges:addedChildEdges,added_child_edges_from_shared_parent:addedChildEdgesFromSharedParent,added_child_edges_from_new_parent:addedChildEdgesFromNewParent,missing_old_child_edges:missingOldChildEdges,old_branch_messages:a.branch.length,new_branch_messages:b.branch.length,common_branch_prefix:prefix,old_branch_is_id_prefix:prefix===a.branch.length,old_branch_payloads_unchanged:a.branch.every(id=>id in b.messages&&stable(payload(a.messages[id]))===stable(payload(b.messages[id]))),current_node_transition:{from:ja.current_node,to:jb.current_node},old_current_node_on_new_active_branch:b.branch.includes(String(ja.mapping[a.current_node]?.message?.id || a.current_node)),citation_diff:a.conversation_id===b.conversation_id?compareCitations(a.citations,b.citations):null};
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
const knownConversations=new Map(inputs.map(({j})=>[
  j.conversation_id,
  {
    title:j.title ?? null,
    create_time:j.create_time ?? null,
    messages:Object.entries(j.mapping)
      .filter(([id,node])=>node?.message)
      .map(([id,node])=>({
        id:String(node.message.id || id),
        create_time:node.message.create_time ?? null,
        text:contentText(node.message)
      }))
  }
]));
const summaries=inputs.map(({path,sha,j,inspected})=>{
  const {messages,nodesForMessage,branch,citations,...summary}=inspected;
  return {
    path,sha,...summary,branch_messages:branch.length,
    citation_summary:summarizeCitations(resolveCitations(citations,knownConversations))
  };
});
const pairs=[];
for(let a=0;a<inputs.length;a++) for(let b=a+1;b<inputs.length;b++)
  pairs.push({from:inputs[a].sha,to:inputs[b].sha,...compare(inputs[a].inspected,inputs[b].inspected,inputs[a].j,inputs[b].j)});
process.stdout.write(JSON.stringify({summaries,pairs},null,2)+"\n");
