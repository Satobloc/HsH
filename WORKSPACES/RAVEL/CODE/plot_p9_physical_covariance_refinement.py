#!/usr/bin/env python3
import json
import matplotlib.pyplot as plt

new=json.load(open('p9_physical_covariance_refinement.json'))
old=json.load(open('p9_resolver_refinement.json'))
fig,ax=plt.subplots(1,2,figsize=(10.2,4.3))
series=[
 ('index AR(1)',old['strict_nested'],old['strict_nested_inherited_contact'],'#777','o'),
 ('physical GP',new['schemes']['physical_gp']['rows'],new['schemes']['physical_gp']['rows'],'#2878b5','s'),
 ('physical GP + fixed budget',new['schemes']['physical_gp_fixed_budget']['rows'],new['schemes']['physical_gp_fixed_budget']['rows'],'#b33','^')]
for label,bulk,contact,color,mark in series:
 ax[0].plot([q.get('gap',q.get('max_log_gap')) for q in bulk],
            [q.get('bulk_root',q.get('root_o')) for q in bulk],'-'+mark,label=label,color=color)
 ax[1].plot([q.get('gap',q.get('max_log_gap')) for q in contact],
            [q.get('contact_jump',q.get('sided_jump')) for q in contact],'-'+mark,label=label,color=color)
for a in ax:
 a.axhline(0,color='0.5',lw=.8); a.grid(alpha=.25); a.set_xlabel('maximum log-height gap')
ax[0].set_ylabel('bulk implicit zero $o_*$'); ax[0].set_title('bulk root depends on readout metric')
ax[1].set_ylabel('contact root jump'); ax[1].set_title('no stable contact-chart separation')
ax[0].legend(frameon=False,fontsize=8)
fig.suptitle('P9 refinement after fixing physical covariance and information budget')
fig.tight_layout(); fig.savefig('p9_physical_covariance_refinement.svg'); fig.savefig('p9_physical_covariance_refinement.png',dpi=180)
