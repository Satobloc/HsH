import json, sys
from pathlib import Path
sys.path.insert(0,'.')
from story_morph_v0_2 import *
raw=json.load(open('nellibeth_micro_model_v0_2.json'))
s=WorldState(state_id='',parent_state_id=None,entities=raw['entities'],
 facts={x['id']:Fact(**x) for x in raw['facts']},beliefs={x['id']:Belief(**x) for x in raw['beliefs']},
 events={x['id']:Event(**x) for x in raw['events']},relations={x['id']:Relation(**x) for x in raw['relations']},
 dependencies={x['id']:Dependency(**x) for x in raw['dependencies']},
 reinterpretations={x['id']:Reinterpretation(**x) for x in raw['reinterpretations']},metadata=raw['metadata']).rehash()
eng=Engine(); focus=Focus(['MAC','POULA','E_N2_REVEAL'],3,3,3,2,0)
# Candidate mutations are all discrete, deterministic alternatives. No repair prose is generated.
base=[
 Mutation('change_relation','R_POULA_JOB',{'type':'irrelevant_to'}),
 Mutation('change_relation','R_N_N2',{'type':'echoes_but_does_not_replace'}),
 Mutation('change_relation','R_ND_N2',{'type':'unrelated_to'}),
 Mutation('set_belief','B_MAC_DOUG',{'stance':'suspects','confidence':'low'}),
 Mutation('set_belief','B_READER_DOUG',{'stance':'believes_true','confidence':'high'}),
 Mutation('set_belief','B_POULA_RAYNE',{'stance':'suspects','confidence':'low'}),
 Mutation('set_belief','B_READER_RAYNE',{'stance':'suspects','confidence':'low'}),
 Mutation('set_event','E_NELLIBETH_DEATH',{'story_order':11}),
 Mutation('set_event','E_MAC_LIE',{'story_order':6}),
 Mutation('set_event','E_DOUG_TRUTH',{'story_order':12}),
 Mutation('set_event','E_N2_REVEAL',{'story_order':13}),
 Mutation('change_relation','R_PAT_SALE',{'type':'does_not_affect'}),
 Mutation('change_relation','R_DEBT_JOB',{'type':'background_only'}),
 Mutation('change_relation','R_CLASS_JOB',{'type':'irrelevant_to'}),
 Mutation('change_relation','R_MIS_RUP',{'type':'fails_to_motivate'}),
 Mutation('change_relation','R_LAB_MIS',{'type':'does_not_cause'}),
 Mutation('change_relation','R_DOUG_MIS',{'type':'does_not_reinforce'}),
 Mutation('change_relation','R_LIE_TRUTH',{'type':'unrelated_to'}),
 Mutation('change_relation','R_DOUG_REINT',{'type':'fails_to_correct'}),
 Mutation('change_relation','R_N2_REINT',{'type':'fails_to_correct'}),
 Mutation('set_fact','F_POULA_DOUG',{'object':True}),
 Mutation('set_fact','F_RAYNE_DRANK',{'object':True}),
 Mutation('set_fact','F_LAB_ID',{'object':'unknown_other_project'}),
 Mutation('set_fact','F_PATENT',{'object':False}),
]
for m in base: m.ensure_id()
remaining={m.mutation_id:m for m in base}
labels={**{k:v['label'] for k,v in s.entities.items()}, **{k:v.label for k,v in s.events.items()}}
def desc(m,before):
 if m.op=='change_relation':
  r=before.relations[m.target]; return f"{m.target}: {r.type} -> {m.args['type']}"
 if m.op=='set_belief':
  b=before.beliefs[m.target]; return f"{m.target} ({b.holder} about {b.fact_id}): {b.stance}/{b.confidence} -> {m.args.get('stance',b.stance)}/{m.args.get('confidence',b.confidence)}"
 if m.op=='set_event':
  e=before.events[m.target]; return f"{e.label}: story_order {e.story_order} -> {m.args['story_order']}"
 if m.op=='set_fact':
  f=before.facts[m.target]; return f"{m.target}: {f.object!r} -> {m.args.get('object')!r}"
 return m.op+':'+m.target

def diagnostic(m,rec):
 out=rec['outcome']; layers=rec['impact']['layers']
 if out=='blocked':
  return {'event':'preserved (mutation rejected)','logic':'protected','function':'protected','meaning':'unchanged','surface':'unchanged','note':'Hard invariant rejected the mutation; repair requirement recorded as a latent bud.'}
 # committed classifications
 if m.op=='set_event':
  return {'event':'survives, moved in telling','logic':'survives provisionally','function':'potentially altered by reveal timing','meaning':'reader interpretation timing changes','surface':'reordering required','note':'Current engine has no chronology/reveal-order validator, so this commits even when it may expose information too early.'}
 if m.op=='set_belief':
  return {'event':'unchanged','logic':'survives','function':'epistemic function altered','meaning':'changed for belief-holder','surface':'may remain verbatim until a later action depends on belief','note':'A belief-state mutation can alter suspense/misdirection without changing world truth.'}
 if m.op=='set_fact':
  return {'event':'historical scaffold survives provisionally','logic':'endangered','function':'endangered','meaning':'deeply changed','surface':'source conflict / replacement required','note':'World truth changed, but v0.2 does not yet validate all dependent beliefs, revelations, or prose against changed facts.'}
 # relation
 r=s.relations.get(m.target)
 required = r.required if r else False
 return {'event':'survives','logic':'survives provisionally','function':'changed or weakened','meaning':'may change','surface':'often reusable','note':'Committed relation change exposes a missing functional dependency if the ending/arc no longer performs the same job.'}

records=[]; lineage=[]
for gen in range(1,21):
 candidates=list(remaining.values())
 m,sel=eng.select(candidates,seed=20260928+gen)
 before=s
 description=desc(m,before)
 s2,rec=eng.transact(s,m,focus,sel)
 diag=diagnostic(m,rec)
 rec['generation']=gen; rec['human_mutation']=description; rec['diagnostic']=diag
 records.append(rec); lineage.append({'generation':gen,'mutation':description,'outcome':rec['outcome'],'diagnostic':diag,'issues':rec['validation']['issues'],'buds':len(rec['emergence']['buds'])})
 remaining.pop(m.mutation_id)
 if rec['outcome']=='committed': s=s2

json.dump(records,open('run20_records.json','w'),indent=2,ensure_ascii=False)
json.dump(lineage,open('run20_readable.json','w'),indent=2,ensure_ascii=False)
summary={'start_state':records[0]['parent_state_id'],'end_state':s.state_id,'generations':20,'committed':sum(x['outcome']=='committed' for x in records),'blocked':sum(x['outcome']=='blocked' for x in records),'buds_recorded':sum(len(x['emergence']['buds']) for x in records),'lineage':lineage}
json.dump(summary,open('run20_summary.json','w'),indent=2,ensure_ascii=False)
print(json.dumps(summary,indent=2,ensure_ascii=False))
