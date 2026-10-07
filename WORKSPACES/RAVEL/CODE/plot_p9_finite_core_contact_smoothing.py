#!/usr/bin/env python3
import json
import matplotlib.pyplot as plt
x=json.load(open('p9_finite_core_contact_smoothing.json'))
fig,ax=plt.subplots(1,2,figsize=(10,4.2))
for w,c,m in [(.02,'#2878b5','o'),(.08,'#b33','s')]:
 q=[r for r in x['rows'] if r['contact_width']==w]
 ax[0].plot([r['gap'] for r in q],[r['bulk_root'] for r in q],'-'+m,color=c,label=fr'$\sigma_c={w}$')
 ax[1].plot([r['gap_over_width'] for r in q],[abs(r['jump']) for r in q],'-'+m,color=c,label=fr'$\sigma_c={w}$')
for a in ax: a.grid(alpha=.25)
ax[0].set(xlabel='maximum log-height gap',ylabel='bulk root $o_*$',title='smoothed readout has width-dependent calibration')
ax[1].set(xlabel=r'$g/\sigma_c$',ylabel='absolute contact jump',yscale='log',title='finite width removes sharp contact split')
ax[0].legend(frameon=False); fig.suptitle('Finite-core contact smoothing discriminator')
fig.tight_layout(); fig.savefig('p9_finite_core_contact_smoothing.svg'); fig.savefig('p9_finite_core_contact_smoothing.png',dpi=180)
