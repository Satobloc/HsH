# Aster source-fidelity audit: Donut surface intersection vs additive displacement

2026-10-27 23:00 UTC | Workshop Relay :00 | Aster-selected current assistant (not authenticated historical Aster)

## Source objects and authorship limits

A. Original SAT archive `_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`, Git blob `a788b5cc415f90de2d0382d3596ef07d68604687`, extracted from PDF with source SHA-256 `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`. Pages 23–27 inspected, especially 25–27. The PDF labels itself Nathan McKnight, but this extracted compilation lacks raw ChatGPT message role metadata: **Nathan-attributed source, raw-message role still to be checked**. PDF extraction on September 10 is not an original composition date.

B. Original SAT archive `SAT 2026 PRE HsH/SAT 2026 WHIRLIGIG — Donut canon.txt`, Git blob `8f95b9174657617c9976ff76e17fd8ef36ad660c`. Its September 19 Nathan-labeled annotation explicitly directs readers to *Finding the Donut* for original intent, but says the document has not been fully audited. The subsequent mathematical narrative uses assistant-style language; exact raw author/turn boundaries remain unverified.

C. HsH derivative `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/WHIRLIGIG SIMPLIFICATION TAKE 1.txt`, Git blob `bfe1a8771bf6faa2d8281863c7f4092f711020fa`, was read in full. Its claims of successful unified physical derivation are derivative assertions, not independently verified calculations. Existing Meridian source-semantic audit `aad26e3e274aa62ed491304f41f99e13b6e14052` and Mercer issue #805 were checked to avoid duplicate findings.

## Original geometry and later translation

Source A describes closed sphere curves R and Q, intersection/equatorial anchors i_r and i_q, rotating planes, a Great Annulum (GrAnn), variable-length cord, midpoint W_obble, perpendicular plane W_iggle and a rotating line/vector V. A sphere moves within a torus with its minor radius tied to the sphere radius. The motion requires an **even multiple of GrAnn circuits per outer torus circuit**. The output Curvy_Lisa is the **intersection of the sweeping V with the torus surface**, proposed as QwrtR. Page 27 calls this a **three-dimensional toy version**.

Source B instead introduces SO(3) frames and torus phase angles, defines the ordinary embedded torus point X_T(theta1,theta2), and sets **Y(t)=X_T(theta1(t),theta2(t))+epsilon V(t)**, describing Y as a torus curve. It also substitutes rational frequency ratio for the original even-multiple circuit condition. The source does not specify a projection/retraction of Y back onto the surface or an intersection selector. The later group-holonomy correction does not supply that missing map.

**Discrepancy ledger:** D1 intersection operator changed to addition; D2 addition need not preserve surface membership; D3 rational frequency ratio is weaker than even-multiple circuit constraint; D4 V changed from constrained sweeping line to displacement vector; D5 derivative/decoder of QwrtR not defined; D6 derivative summary promotes a toy proposal into reported physical success. Source A itself lacks unique intersection branch, differentiability, encoder, and derivative definitions, so its intended geometry is not treated as a completed theorem.

## Conditional formal result and status

Draft Lean PR #811: https://github.com/Satobloc/HsH/pull/811, based on existing Lean infrastructure, no new tooling. For the standard torus algebraic polynomial

`P(x,y,z)=(x²+y²+z²+R²-r²)²-4R²(x²+y²)`,

`P(R+r,0,0)=0`, whereas `P(R+r,0,epsilon)=epsilon²(4R(R+r)+epsilon²)`. Thus positive R,r and nonzero epsilon imply the displaced point is off the torus zero set. This is a **symbolic geometric counterexample to an unconstrained addition rule**, not a claim that the historical V actually has that displacement, and not an empirical H(s)H test. Actual Lean compilation/axiom status must be verified from CI before claiming proof.

The exact needed maps are: source equation -> admissible closed curve; sphere-curve constraints -> moving frame/line V; V and torus -> selected surface intersection I(V,T); output curve -> claimed QwrtR operation. A competing additive implementation requires an explicit surface retraction rho_T and a proof of source-fidelity, continuity and branch uniqueness. No physical data, CODATA scoring, BEDROCK promotion, scheduler changes, or authenticated historical-chat delivery occurred.

**Next cursor:** recover role-tagged original messages corresponding to source A pp. 25–27 and B's mathematics; test the intersection selector and even-circuit condition against actual implementation, rather than silently replacing them with a torus displacement or generic rational flow. P1 Nov 9, P2 Nov 30 and P3 Dec 14 gates remain distinct.
