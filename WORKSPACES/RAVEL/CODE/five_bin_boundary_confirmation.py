"""Independent clustered confirmation at frozen boundary cells."""
import json,os
import numpy as np
import five_bin_joint_nuisance_audit as a

M=int(os.environ.get('CAL_M','2500')); T=float(os.environ['THRESH'])
NKM=400; REPS=250; SEED=202610040259+M
B=(0.026666666666666672,1.016); S2=(0.08,0.984)
def khat(r):
 c=np.array([r.multinomial(M,row) for row in a.K0]);return (c+a.ALPHA)/(M+5*a.ALPHA)
def upper(x):return float(min(1,x.mean()+1.96*x.std(ddof=1)/np.sqrt(len(x))))
def main():
 r=np.random.default_rng(SEED);pb=a.latent('b3',*B)@a.K0;ps=a.latent('s2',*S2)@a.K0;eb=[];es=[]
 for _ in range(NKM):
  k=khat(r);eb.append(np.mean(a.score_all(r.multinomial(a.N,pb,size=REPS),k)<=T));es.append(np.mean(a.score_all(r.multinomial(a.N,ps,size=REPS),k)>T))
 eb=np.array(eb);es=np.array(es);out={'m_per_true_bin':M,'threshold':T,'confirmation_cells':{'B3':list(B),'S2':list(S2)},'calibration_matrix_clusters':NKM,'repeats_per_cluster':REPS,'B3_error':float(eb.mean()),'B3_cluster95':upper(eb),'S2_error':float(es.mean()),'S2_cluster95':upper(es),'max_error':float(max(eb.mean(),es.mean())),'max_cluster95':max(upper(eb),upper(es))}
 fn=f'five_bin_boundary_confirmation_m{M}.json';open(fn,'w').write(json.dumps(out,indent=2));print(json.dumps(out,indent=2))
if __name__=='__main__':main()
