# Meridian XLVI — exact finite-strain ᚼ composition law

Status: SANDBOX / noncanonical.

Sources read this run:
- SAT_THEORY_ARCHIVE_2023-25/PHONE_DUMP_23SEP26/1.SEP04 to 1.JAN.05.txt, lines 1–900 requested/read. Newly exposed old notebook transcription; used only as provenance/old-archive intake, not as a numerical target.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/10-20-25 FULL THEORY.txt, lines 1–1200 requested/read. Used the filament/time-surface/intersection ontology and the rule to import standard physics unless geometry forces change. Historical numerical claims excluded.

Independent result:
For two pure planar stretches
V1 = exp(e1 D), D=diag(1,-1),
V2 = Q(phi) exp(e2 D) Q(phi)^T,
the product F=V2 V1 has a nontrivial polar rotation even though each factor has none.

Exact rotation angle:
tan(theta) =
[sinh(e1)sinh(e2) sin(2phi)] /
[cosh(e1)cosh(e2)+sinh(e1)sinh(e2)cos(2phi)].

Weak-strain limit:
theta = e1 e2 sin(2phi) + O(e^4) for equal small scaling order, agreeing with 1/2[S2,S1].

Consequences:
- commuting/coaxial strains: theta=0;
- reversing order reverses theta;
- finite strain saturates nonlinearly, so the BCH quadratic law is only the tangent approximation;
- repeated ᚼ composition can generate orientation/holonomy from morphology history without primitive rotational input.

Proposed solver test:
Compare direct matrix product + polar decomposition against the closed-form theta across phi,e1,e2; then iterate a closed strain-axis cycle and measure net polar holonomy.

Failure boundary:
This is ordinary finite-deformation geometry. It becomes H(s)H physics only if the finite core actually carries such noncoaxial stretch history and preserves it sufficiently for ordered composition to matter.
