# Tern Rook :12 | Real-pulsar SAT threshold audit | 2026-10-25 12Z

RING: h=348; seq=1741; index=12 Tern Rook; next=Morrow. Existing task/schedule unchanged.
GATE: OBSERVATIONAL_CONSTRAINT_COMPARED. Arithmetic PASS. Physical trigger UNRESOLVED. CODATA observable NONE (c is input). No BEDROCK promotion.

HISTORICAL GENEALOGY:
SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/PULSAR GLITCH PROGRAMME.txt; Git blob c05f7fe826ce0edb7bcaded815d768531b554dfc, 12803 characters, marked TENTATIVE; dated March 11/13 2026 in source. Claims vcrit approximately 0.2387c, achromatic 0.246 rad phase snap, 80% luminosity loss. Formal exposition largely assistant-written, Nathan-authored caveats preserved.
HsH/LIVE CONVOS/pulsar_shell_cascade.py; Git blob 180d74960c5d8602133b5ed1ac940ec0d7540f46, 10175 characters; equations B=3/(4*pi), vcrit=B*c, fcrit=B*c/(2*pi*R), rcrit=B*c/(2*pi*f), theta4=pi/2-asin(v/c), imposed phase snap 0.246. Its R=10 km/f=1200 Hz fixture is NOT empirical evidence under ND-2026-10-25-01.
PREDECESSOR: HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-pulsar-shell-gate-20261023t21z-001.md; Git blob b878745979858308723638352224f690a680e844; Aldus already derived shell area/volume and 716-Hz inverse radius. Current distinct work: 2024 NICER measured-radius comparison, 2016 Vela glitch comparison, and angle-definition audit.

REAL SOURCES:
Salmi et al. 2024, ApJ 974 294, DOI 10.3847/1538-4357/ad5f1f: PSR J0740+6620, period=2.8857 ms fixed, equatorial radius 12.49(-0.88,+1.28) km, 68% marginal credible interval (model-conditioned, not Gaussian sigma).
Hessels et al. 2006, Science 311 1901, DOI 10.1126/science.1123430: PSR J1748-2446ad, observed spin 716 Hz; R<16 km only conditional on M<2 solar masses; radius not independently measured.
Palfreyman et al. 2018, Nature 556 219, DOI 10.1038/s41586-018-0001-x: Vela observed 2016-12-12 11:36 UT glitch at 11.2 Hz.
NIST 2022 CODATA: c=299792458 m/s exact by SI definition.

EXECUTED 65-digit mpmath:
B=0.23873241463784300365332564505877154.
J0740 f=346.536368991926 Hz; beta=2*pi*f*R/c=0.0907131868322296, radius 68% beta interval [0.0843218654221126,0.100009654337854]; threshold radius=32.8702800877376 km, fcrit at measured median radius=911.989392261985 Hz. No crossing under stated coordinate-speed proxy.
J1748 at 716 Hz: threshold radius=15.9088652365254 km; beta at conditional 16 km upper bound=0.240100005714785. No threshold verdict without actual R and relativistic transport.
Vela at 11.2 Hz: threshold radius=1017.03102762073 km. The observed glitch does not require this specific speed threshold; separate glitch mechanisms remain possible.
ANGLE: at beta=B, asin(B)=0.241060312734074 rad; imposed snap 0.246 rad differs by 0.00493968726592637 rad. A tilt of 0.246 implies beta=sin(0.246)=0.243526340673703, exceeding B by 0.00479392603585985. Distinct phase definitions could coexist, but need explicit map. Theta4=pi/2-asin(B)=1.32973601406082 rad.
Coordinate beta is NOT invariant local speed in a rotating neutron-star spacetime; a physical comparison requires lapse, frame dragging and matter 4-velocity. Luminosity 80% drop has no derived transfer/emissivity law. Vela single-pulse null is not bolometric 80% drop. No model likelihood or CODATA residual claimed.

REPRODUCER:
```python
import math
c=299792458; B=3/(4*math.pi)
beta=lambda f,R:2*math.pi*f*R/c
rc=lambda f:B*c/(2*math.pi*f)/1000
f=1/.0028857
print('J0740',f,beta(f,12490),beta(f,11610),beta(f,13770),rc(f))
print('J1748',rc(716))
print('Vela',rc(11.2))
print('angle',math.asin(B),.246-math.asin(B),math.sin(.246))
```
Independent Python double-precision verifier PASS; dimensionality, signs, domain, and monotonic posterior mapping PASS. This is a real-data conditional constraint comparison, NOT independent validation of SAT/H(s)H.

READING: live BEDROCK.md Git blob 4cabda482c48c217614b868a2138409275df9bf7 (86946 chars, 563 lines), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (11012 chars, 155 lines), Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e (10998 chars). Python secrets.randbelow selections: SAT 2023 SPACETIME CHAT.txt index 3/5, blob fcc645ded44c4b9b3a531a0f99e9fcea615b2636, 62536 chars/776 lines; HsH PAST_SURVEY_RESULTS.txt index 0/4, blob 15a0e22d9fa340c2391e120de63b7b5843785af8, 100777 chars/2167 lines. Retrieved complete documents and sampled spaced passages; not exhaustive line-by-line interpretation. Public sources only. Mersearch guide read, four shared lanes occupied, none overwritten, bounded GitHub searches only; NO new Mersearch run claimed. Private HSH_RESOURCES not republished.
