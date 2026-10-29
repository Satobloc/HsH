#!/usr/bin/env node
// Replay on a real checkout of Satobloc/SAT_THEORY_ARCHIVE_2023-25.
// Historical source fidelity only, not physical validation.
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';

const root=process.argv[2];
if(!root) throw new Error('Usage: node sato_d1d8_source_fidelity_20261029.mjs /path/to/SAT_THEORY_ARCHIVE_2023-25');
const dir=path.join(root,'SAT O Derivations');
const files=[
 ['CODE-LOCKED DERIVS.txt','783b05d39d59bf854b92090e15d205e6823b51c8'],
 ['SAT_D1_CANONICAL_QUANTIZATION.txt','1720af778e962f265be531928f9ae350d7049851'],
 ['SAT_D2_MODE_EXPANSION.txt','6844c72027e9569e4f8da3a85a24434e0ad080cf'],
 ['SAT_D3_TOPOLOGICAL_SUPPRESSION.txt','d24129728c1c5fb235004e5196398ee52ad80e26'],
 ['SAT_D4_STRAIN_CURVATURE_MAPPING.txt','d07d6cf34498a9b81e685724a523384e71a7fd61'],
 ['SAT_D5_GAUGE_TOPOLOGY.txt','a29ad0141b8c1283f6d4dee43b7cc57209afbee7'],
 ['SAT_D6_LEGACY_TRANSLATION.txt','da3c1c2b193bd4038287f5f3d66cb382e2215694'],
 ['SAT_D7_FIELD_MAPPING_PSI.txt','17e660f0a78ce8ddf0e8dceea70565a80df142b1'],
 ['SAT_D8_SUMMARY_INTERACTIONS.txt','dd158494958246e249b032695323b81f03863bdc']
];
const docs=new Map();
for(const [name,sha] of files){
 const bytes=fs.readFileSync(path.join(dir,name));
 const hash=crypto.createHash('sha1').update(Buffer.from('blob '+bytes.length+'\0')).update(bytes).digest('hex');
 assert.equal(hash,sha,'Git blob mismatch: '+name);
 docs.set(name,bytes.toString('utf8'));
}
function norm(s){
 return s.replace(/\r\n/g,'\n')
 .replace(/filecite[^]+/g,'')
 .replace(/:contentReference\[oaicite:\d+\]\{index=\d+\}/g,'')
 .replace(/\\section\{Conclusion\}\s*$/,'')
 .replace(/[\u2010-\u2015]/g,'-')
 .replace(/\s+\./g,'.')
 .replace(/\s+/g,' ').trim();
}
const lines=docs.get(files[0][0]).replace(/\r\n/g,'\n').split('\n');
const starts=lines.map((line,i)=>({line,i})).filter(x=>/^\\section\*\{Derivation D[2-8]:/.test(x.line));
assert.equal(starts.length,7,'Expected expanded D2-D8 only');
const results=[];
for(let d=1;d<=8;d++){
 const standalone=norm(docs.get(files[d][0]));
 const start=starts.find(x=>x.line.includes('Derivation D'+d+':'));
 if(d===1){assert.equal(start,undefined);results.push({d,class:'STANDALONE_ONLY_EXPANDED'});continue;}
 const end=starts.find(x=>x.i>start.i);
 const master=norm(lines.slice(start.i,end?.i).join('\n'));
 let cls;
 if(standalone===master) cls='NORMALIZED_EXACT';
 else if(standalone.replace(/\.$/,'')===master.replace(/\.$/,'')) cls='TRAILING_PUNCTUATION_ONLY';
 else if(d===3 && standalone.replace('\\frac{\\alpha_{\\rm shape}}','\\frac{\\alpha_{\\rm_shape}}')===master) cls='D3_TEX_MACRO_VARIANT';
 else throw new Error('Unclassified source difference D'+d);
 results.push({d,class:cls,master_start:start.i+1,master_end:end?end.i:lines.length});
}
console.log(JSON.stringify({repo:'Satobloc/SAT_THEORY_ARCHIVE_2023-25',master_blob:files[0][1],results},null,2));
