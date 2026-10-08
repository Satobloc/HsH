# MK153 | Three-dimensional time-normal texture
Morrow/Kestrel, 2026-10-08. SILOED SANDBOX; no physical claim.

## Primary sources read
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt: first ~26,000 characters substantially read, from 233,643 fetched. Historical compilation: Euclidean 4D, SO(4), unit time-flow normal; not independently validated.
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md: complete, 5,017 characters. Finite-core support geometry.
- Satobloc/HsH/WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK152_2026-10-08_TIME_NORMAL_ESCAPE_Z2.md: complete, 4,207 characters.
- Satobloc/HsH/🔑/O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md: complete, 2,629 characters.
Onboarding, reference desk, War Room overview, toolkit routes and Mersearch stable release guidance read; no quarantined material. No corpus-wide absence claim.

## Local construction
On compactified three-space, define a positive local scale a, r²=x²+y²+z² and
u=((r²-a²),2ax,2ay,2az)/(r²+a²).
Then |u|=1, Q_tex=integral det[u,du/dx,du/dy,du/dz]/(2pi²) d³x=-1. This is an integer 3D texture despite pi1(S³)=0. The metric-only director g=I-2uu^T targets RP³, whose pi3 is Z. It has g(center)=g(infinity) despite nontrivial interior texture.

With *new assumed* Euclidean-gradient energy coefficients K2,K4>0:
E2=6pi² K2 a; E4=3pi² K4/a; stationary scale a*=sqrt(K4/(2K2)).
Without E4, the texture collapses under scaling. Metric-only versions exist using |dg|² and squared commutators [dg,dg]. These are toy energies, not Einstein equations or established HsH dynamics.

**Failure discriminator:** g00=1-2((r²-a²)/(r²+a²))² becomes positive between r/a=sqrt(2)-1 and sqrt(2)+1. A fixed global coordinate-time foliation is not spacelike there. The full metric remains Lorentzian; this does not prove acausality. If the project requires globally fixed spacelike instantiation, this texture fails.

Independent Python quadrature gave Q_tex=-1 for a=.3,1,3 and verified exact energies; finite-difference checks passed. Next test: dynamical stability and whether any nonzero texture survives the project's actual foliation and finite-core constraints. Full numerical fixture and Class-P figures preserved in the task thread bundle.
