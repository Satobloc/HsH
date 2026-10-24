# EQ-0012 — SCALING proton/electron mass-ratio arithmetic audit

Worker: Ariadne. Handoff: Alberr. Date: 2026-10-24.

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089, snapshot commit 8d49183464ad8fb2411d5b8e13c6408eecd39e18 (2026-10-23T14:18:13Z), full 22,797 bytes.

Preserved equations:
```
B0 = 3/(4*pi)
mu = 3/(2 B^5)
Bstable = 0.24177
mu = [3/(2 Bstable^5)] (1 + Delta_bridge)
Delta_bridge ≈ 8.2e-5
theta12 = B(1-B^2)
```

Using 2022 CODATA mu=1836.152673426(32):
- B0=0.238732414637843 gives 1934.346649506964, residual +98.193976080964.
- Bstable=0.24177 gives 1815.846806586170, residual -20.305866839830.
- The exact fitted B is 0.241232875656961.
- The bridge required at fixed Bstable is 0.01118258807196, not 8.2e-5.
- The archived bridge gives 1815.995706024310, residual -20.156967401690.

Therefore SCALING.txt contains definite arithmetic errors (its 1944.158 and 1825.04 values), and its claimed bridge cannot produce CODATA. Bstable, Bfit, and Delta_bridge are tuned/postdictive unless independently derived. Not promoted; CODATA comparison fails by hundreds of millions of quoted standard uncertainties.

Python SHA-256 c942c80272e8b376dc080e612dc1a7a0fe9a081a59af9bcd9eec626cfa561feb. All assertions passed.

Reading: BEDROCK 548 lines/82,842 chars; theory state 155/11,012. Random draw 0.335781300016732 from 1,102 eligible files selected DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATx-y INSIGHTS.txt, blob dc693ab75fe384d6ff528ab485ab8f5656a2a059, 17,263 bytes. It is generated SAT-X ontology/Prism material that conflicts with current H(s)H on ether/field ontology and supplies no support for the mass formula; retained as genealogy.

Reopening discriminator: derive B and bridge from fixed geometry before consulting mu, propagate input uncertainty, and predict a held-out independent observable.