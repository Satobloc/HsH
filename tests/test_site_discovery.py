import argparse, importlib.util, json, tempfile, unittest
from pathlib import Path
from unittest.mock import patch
spec=importlib.util.spec_from_file_location('discovery',Path(__file__).parents[1]/'tools/site_discovery.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class DiscoveryTests(unittest.TestCase):
 def test_square_boundaries_and_exclusions(self):
  for w,h,yes in [(1000,1000,True),(900,1000,True),(1100,1000,True),(899,1000,False),(1101,1000,False),(127,127,False),(1000,1500,False)]:self.assertEqual(m.square(w,h),yes)
  for p in ['PRIOR_ART/a.pdf','WORKSPACES/QUARANTINE/a.md','LIVE CONVOS/Science Made Stupid.json','PUBLIC_SITE/generated/a.md']:self.assertFalse(m.eligible(p))
  self.assertTrue(m.eligible('WORKSPACES/MERCER/2026-10-11_note.md'))
 def test_incremental_revision_deletion_and_last_good(self):
  with tempfile.TemporaryDirectory() as tmp:
   root=Path(tmp);out=root/'out';trees=root/'trees';trees.mkdir()
   def save(name,files):m.atomic(trees/(name+'.json'),{'sha':'commit','truncated':False,'tree':[{'type':'blob','path':p,'sha':s,'size':20} for p,s in files]})
   save('hsh',[('WORKSPACES/worker/2026-10-11_note.md','a')]);save('sat',[('old.pdf','b')]);args=argparse.Namespace(out=str(out),tree_dir=str(trees),excerpts=0)
   self.assertEqual(m.run(args),0);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertFalse(any(x['revision_detected'] for x in d['documents']))
   save('hsh',[('WORKSPACES/worker/2026-10-11_note.md','c'),('WORKSPACES/worker/new.pdf','d')]);save('sat',[]);m.run(args);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertTrue(all(x['revision_detected'] for x in d['documents']));self.assertTrue(all(x['repo']=='hsh' for x in d['documents']))
   m.atomic(trees/'hsh.json',{'truncated':True,'tree':[]});self.assertEqual(m.run(args),2);d=m.load(out/'discovery.json',{});self.assertEqual(len(d['documents']),2);self.assertEqual(d['repositories']['hsh']['status'],'stale')
 def test_truncated_tree_walk(self):
  with patch.object(m,'api',side_effect=[{'sha':'root','truncated':True,'tree':[]},{'tree':[{'type':'tree','path':'nested','sha':'dir'}]},{'tree':[{'type':'blob','path':'a.pdf','sha':'a'}]}]):self.assertEqual(m.tree('Satobloc/HsH')['tree'][0]['path'],'nested/a.pdf')
if __name__=='__main__':unittest.main()
