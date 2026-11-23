import argparse, importlib.util, json, tempfile, unittest
from pathlib import Path
from unittest.mock import patch
spec=importlib.util.spec_from_file_location('discovery',Path(__file__).parents[1]/'tools/site_discovery.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class DiscoveryTests(unittest.TestCase):
 def test_square_boundaries_and_exclusions(self):
  for w,h,yes in [(1000,1000,True),(900,1000,True),(1100,1000,True),(899,1000,False),(1101,1000,False),(127,127,False),(1000,1500,False)]:self.assertEqual(m.square(w,h),yes)
  for p in ['PRIOR_ART/a.pdf','WORKSPACES/QUARANTINE/a.md','LIVE CONVOS/Science Made Stupid.json','PUBLIC_SITE/generated/a.md']:self.assertFalse(m.eligible(p))
  self.assertTrue(m.eligible('WORKSPACES/MERCER/2026-10-11_note.md'))
  self.assertTrue(m.workspace_record('WORKSPACES/MERCER/2026-10-11_note.md'))
  self.assertFalse(m.workspace_record('LIBRARY/presented/example.pdf'))
 def test_incremental_revision_deletion_and_last_good(self):
  with tempfile.TemporaryDirectory() as tmp:
   root=Path(tmp);out=root/'out';trees=root/'trees';trees.mkdir()
   def save(name,files):m.atomic(trees/(name+'.json'),{'sha':'commit','truncated':False,'tree':[{'type':'blob','path':p,'sha':s,'size':20} for p,s in files]})
   save('hsh',[('WORKSPACES/worker/2026-10-11_note.md','a')]);save('sat',[('old.pdf','b')]);args=argparse.Namespace(out=str(out),tree_dir=str(trees),excerpts=0)
   self.assertEqual(m.run(args),0);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertFalse(any(x['revision_detected'] for x in d['documents']))
   save('hsh',[('WORKSPACES/worker/2026-10-11_note.md','c'),('WORKSPACES/worker/new.pdf','d')]);save('sat',[]);m.run(args);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertTrue(all(x['revision_detected'] for x in d['documents']));self.assertTrue(all(x['repo']=='hsh' for x in d['documents']))
   m.atomic(trees/'hsh.json',{'truncated':True,'tree':[]});self.assertEqual(m.run(args),2);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertEqual(d['repositories']['hsh']['status'],'stale')
 def test_workspace_metadata_only_and_legacy_leakage_removed(self):
  with tempfile.TemporaryDirectory() as tmp:
   root=Path(tmp);out=root/'out';trees=root/'trees';trees.mkdir()
   a='WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex'
   b='WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md'
   regular='LIBRARY/presented/reader-approved.md'
   old=[{'id':'hsh:'+a,'repo':'hsh','path':a,'sha':'a','size':10,'kind':'tex','title':'old title','reader':'reader.html?mode=browse&path='+a,'excerpt':'old raw excerpt','excerpt_scope':'legacy','first_seen':'first','changed_at':'old','revision_detected':False},
        {'id':'hsh:'+b,'repo':'hsh','path':b,'sha':'b','size':10,'kind':'md','title':'old title','reader':'reader.html?mode=browse&path='+b,'excerpt':'old raw excerpt','excerpt_scope':'legacy','first_seen':'first','changed_at':'old','revision_detected':False}]
   m.atomic(out/'discovery.json',{'documents':old,'docket':[x['id'] for x in old],'visuals':[]})
   def save(name,files):m.atomic(trees/(name+'.json'),{'sha':'commit','truncated':False,'tree':[{'type':'blob','path':p,'sha':s,'size':20} for p,s in files]})
   save('hsh',[(a,'a'),(b,'b'),(regular,'c')]);save('sat',[('archive.pdf','d')])
   args=argparse.Namespace(out=str(out),tree_dir=str(trees),excerpts=10)
   with patch.object(m,'excerpt',return_value={'title':'approved title','excerpt':'approved excerpt','excerpt_scope':'test scope'}):
    self.assertEqual(m.run(args),0)
   d=m.load(out/'discovery.json',{});docs={x['path']:x for x in d['documents']}
   for path in (a,b):
    self.assertIn(path,docs) # metadata discovery is retained
    self.assertIsNone(docs[path]['reader'])
    self.assertEqual(docs[path]['presentation_state'],'PRESENTATION_PENDING')
    self.assertNotIn('excerpt',docs[path])
    self.assertNotIn('excerpt_scope',docs[path])
    self.assertNotIn('reader.html',json.dumps(docs[path]))
   self.assertNotIn('hsh:'+a,d['docket'])
   self.assertNotIn('hsh:'+b,d['docket'])
   self.assertIn('hsh:'+regular,d['docket'])
   self.assertEqual(docs[regular]['reader'],m.route('hsh',regular))
   self.assertEqual(docs[regular]['excerpt'],'approved excerpt')
 def test_stale_repository_sanitizes_legacy_workspace_records(self):
  with tempfile.TemporaryDirectory() as tmp:
   root=Path(tmp);out=root/'out';trees=root/'trees';trees.mkdir()
   workspace='WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md'
   regular='LIBRARY/presented/reader-approved.md'
   old=[
    {'id':'hsh:'+workspace,'repo':'hsh','path':workspace,'sha':'workspace-sha','size':20,'kind':'md','title':'Paper B','reader':'reader.html?mode=browse&path='+workspace,'excerpt':'legacy raw excerpt','excerpt_scope':'legacy','first_seen':'first','changed_at':'old','revision_detected':False},
    {'id':'hsh:'+regular,'repo':'hsh','path':regular,'sha':'regular-sha','size':20,'kind':'md','title':'Approved reader','reader':'reader.html?mode=browse&path='+regular,'excerpt':'approved excerpt','excerpt_scope':'approved source','first_seen':'first','changed_at':'old','revision_detected':False}
   ]
   m.atomic(out/'discovery.json',{'documents':old,'docket':[x['id'] for x in old],'visuals':[]})
   m.atomic(trees/'hsh.json',{'sha':'last-good-hsh','truncated':True,'tree':[]})
   m.atomic(trees/'sat.json',{'sha':'current-sat','truncated':False,'tree':[{'type':'blob','path':'archive.pdf','sha':'pdf-sha','size':20}]})
   args=argparse.Namespace(out=str(out),tree_dir=str(trees),excerpts=10)
   self.assertEqual(m.run(args),2)
   d=m.load(out/'discovery.json',{});docs={x['path']:x for x in d['documents']}
   self.assertEqual(d['repositories']['hsh']['status'],'stale')
   self.assertEqual(d['repositories']['sat']['status'],'complete')
   stale=docs[workspace]
   self.assertEqual(stale['sha'],'workspace-sha')
   self.assertEqual(stale['title'],'Paper B')
   self.assertIsNone(stale['reader'])
   self.assertEqual(stale['presentation_state'],'PRESENTATION_PENDING')
   self.assertNotIn('excerpt',stale)
   self.assertNotIn('excerpt_scope',stale)
   self.assertNotIn('hsh:'+workspace,d['docket'])
   control=docs[regular]
   self.assertEqual(control['reader'],'reader.html?mode=browse&path='+regular)
   self.assertEqual(control['excerpt'],'approved excerpt')
   self.assertIn('hsh:'+regular,d['docket'])
 def test_truncated_tree_walk(self):
  with patch.object(m,'api',side_effect=[{'sha':'root','truncated':True,'tree':[]},{'tree':[{'type':'tree','path':'nested','sha':'dir'}]},{'tree':[{'type':'blob','path':'a.pdf','sha':'a'}]}]):self.assertEqual(m.tree('Satobloc/HsH')['tree'][0]['path'],'nested/a.pdf')
if __name__=='__main__':unittest.main()
