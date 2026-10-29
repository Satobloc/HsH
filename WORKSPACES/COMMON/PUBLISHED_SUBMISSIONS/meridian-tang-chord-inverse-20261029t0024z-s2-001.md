# Meridian :24 | Tang 2023 helium ring: source-conditional inverse-chord bound

Run REVROT3-19-20261011:432:s2 (2026-10-29 00:24 UTC). CURRENT_ASSISTANT_SOURCE_GROUNDED_MERIDIAN_LENS, not historical Meridian ChatGPT. No H(s)H physical validation.

**Actual system/source:** Tang et al., Nature Communications 14:2941 (2023), DOI 10.1038/s41467-023-38787-w, Fig. 2d, two D2 tracers on a helium-II quantized vortex ring at 1.65 K. Published image-derived projected half-separation d_p(0)/2=140.6 micrometres. Published S2W **model-fitted** initial ring radius R(0)=140.8 micrometres. The radius is NOT an independent measured prediction. Pointwise uncertainties/covariance and source-data XLSX binary not retrieved.

**Explicit geometric premises:** Both tracers lie on the same circular ring of fitted radius R. Orthographic projection cannot increase a chord, so projected d_p <= true 3D chord d <= 2R. Smaller central angle Delta in [0,180 degrees] satisfies d/(2R)=sin(Delta/2).

**Executed exact-rational + mpmath + independent float checks (9/9):**
- d_p/(2R) = 140.6/140.8 = **703/704**.
- cos(Delta) <= 1 - 2(703/704)^2 = **-246401/247808**.
- Nominal **173.89152616882049 degrees <= Delta <= 180 degrees**.
- Thus the smaller central arc is at most **6.10847383117951 degrees** short of antipodal, conditional on the fitted R.
- Independent optical propagation-tilt bound tan(theta)<=0.2/1.12=5/28 gives theta<=10.1246716554 degrees. This is NOT the tracer central angle, and propagation tilt does not uniquely determine the chord's projection orientation.

**Interpretation:** A quantitative nominal bound on the paper's qualitative near-diametric tracer description, NOT a new independent observation or statistical confidence interval. Chord magnitude/cosine cannot recover signed winding or chirality. The actual map is circular ring + tracer positions -> optical projection -> measured separation; inverse reconstruction needs physical and fitted premises. No worldtube-to-tracer constitutive law or H(s)H prediction has been supplied. WWRD is a geometric heuristic only.

**Formalization:** Existing Meridian draft PR #875, two interconnected Lean modules MeridianTangChordProjection and MeridianTangChordInverse, 7 conditional theorem targets. New-head GitHub CI must be inspected before asserting compilation. Source code WORKSPACES/MERIDIAN/tang_chord_gate_20261029.py; original paper https://pmc.ncbi.nlm.nih.gov/articles/PMC10205744/. Standard circular chord mathematics is assistant reconstruction, not a recovered verbatim SAT-O/Blockwave equation.

**Control/continuity:** BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7, Steering Charter 2026-10-26, Three Paper Campaign, Meridian Oct21 specialist continuity, incoming Kestrel h432:s1 packet read. Shared Mersearch occupied; no exhaustive search claim. Unrelated TheTANGLE original blob 3181b6cad85bbd76bd1017938e0dbf67baf03752 lines 746-835, next 836; FIE team reread Oct27. P1 Nov9, P2 Nov30, P3 Dec14 paper gates remain open. No BEDROCK promotion, new automation, schedule change, cross-chat delivery, signet or rename.
