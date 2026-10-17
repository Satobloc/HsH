"""Deterministic verification and internal-source redaction for compact receipt."""
import importlib.util
from pathlib import Path
sp = importlib.util.spec_from_file_location('receipt', Path(__file__).with_name('mersearch_compact_receipt.py'))
m = importlib.util.module_from_spec(sp)
sp.loader.exec_module(m)

sample = {
 'tool_name': 'Mercer_Searcher_1.0', 'tool_version':'1.0', 'query':'"test"',
 'roots':['archive','hsh-main','resources'],
 'coverage':{'files_scanned':9,'records_scanned':44,'hits':3},
 'hits':[
  {'path':'archive/A.txt','locator':'L3','matched_terms':['test'],'excerpt':'TEST A'},
  {'path':'hsh-main/B.json','locator':'message:1','matched_terms':['long special phrase','test'],'excerpt':'TEST B'},
  {'path':'resources/SECRET/private.txt','locator':'L9','matched_terms':['SENSITIVE'],'excerpt':'TOP SECRET'}
 ]
}
out = m.build(sample,'testsha')
text = m.markdown(out)
assert out['counted_hits'] == 3
assert out['results_by_root']['resources'] == 1
assert all(x['root'] != 'resources' for x in out['top_sources'])
assert 'TOP SECRET' not in text
assert 'SENSITIVE' not in text
assert 'SECRET/private' not in text
assert out == m.build(sample,'testsha')
print('PASS compact receipt, deterministic ranking and private-source redaction')
