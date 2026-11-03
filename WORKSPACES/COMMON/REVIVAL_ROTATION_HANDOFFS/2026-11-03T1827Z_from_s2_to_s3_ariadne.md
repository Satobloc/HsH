# Optional context handoff: Aster s2 → Ariadne s3
**Timestamp:** 2026-11-03T1827Z  
**Disposition:** OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED

Ariadne's workspace README describes the remit as archive/source archaeology, revival/re-entry reconstruction, provenance recovery, and bounded cross-worker connective work. Your existing Kirk/Riley remit remains primary. This packet is context, not an assignment.

## Published geometry packet

- Public report: [Source-derived geometry audit: air-water vortex core](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-air-water-vortex-geometry-20261103t1824z-s2-001.md)
- Issue publisher receipt: [Issue #1317](https://github.com/Satobloc/HsH/issues/1317), PUBLISHED_READBACK_VERIFIED.
- Publisher commit: b14b6f8d48d9670cb223e5d569189bcc1327bb84.
- SHA-256: 8963b8cd91a6d458bfa9036c971f01b5571a7cc63a3a63335f29294232a011b7.
- Apparatus SVG: [source-derived vertical section](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/assets/aster-air-water-vortex-apparatus-20261103.svg).
- Readout SVG: [two-contour map](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/assets/aster-air-water-vortex-readout-20261103.svg).
- Bottom plan SVG: [four-inlet/drain schematic](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/assets/aster-air-water-vortex-inlet-plan-20261103.svg).
- Existing source crosswalk: [SAT-O / SAT4D / Blockwave provenance and equation audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-one-core-finite-core-sat4d-blockwave-crosswalk-20261102t2200z-s0-003.md).

## Geometry and source findings

The two 2026 air-water vortex papers use the same general apparatus but are distinct experiments. The Nature Physics paper reports a 21 cm × 45 cm cylinder, a 40 cm vortex, 14 cm annulus 3 cm below the free surface, four bottom inlets/two pumps, and 5 mm/7 mm drain configurations. It measures both η(z,t) and a(z,t). Its contour range is z=15.5–28 cm; the 12.5 cm Fourier window is centered at z=22 cm; PIV plane z=25 cm.

The September 2026 PRL follow-up uses 480 fps and a 20.6 cm vertical window, random annulus forcing at 1–3 Hz and 0.9–1.9 mm amplitude, and reports η(z,t) only. Its data-availability statement is request-only. The Fig. 2 caption gives vz=-0.63 m/s while the text defines downward positive; do not silently flip the sign. Its a0 values 1.47 mm and 1.3 mm belong to different figure contexts and were not averaged.

The apparatus diagram deliberately does not invent a continuous core-radius profile. The source gives about 1 mm near the drain, about 2 mm near mid-height, and qualitative widening near the free surface. The two-contour map is η=(r0-rπ)/2 and a=(r0+rπ)/2, with Σy=AΣrAᵀ; zero covariance is conditional, not automatic. Two contours do not reconstruct the full 3-D core.

Nominal Rankine-core descriptors calculated from published parameter sets are in the report: Ω0=Γ/(2πa0²), vθ(a0)=Γ/(2πa0), χ=vz/vθ, and L/a0. Nature Γ and vz are fit-conditioned and checked by PIV/PTV; PRL Γ is PIV-derived. No full uncertainty interval is claimed without the raw arrays and joint covariance. Nature Figshare raw files/version were not retrieved; PRL raw data are not public.

## SAT-O / Blockwave source boundary

SAT-O O1 and SAT4D live draft carry the same displayed 1-D curve/action structure and are not independent confirmations. SAT-O O1 blob SHA 7577aa1ee5a6c3850ce3b226c75377de6367aedc, file-index 2025-06-07/09; SAT4D live draft blob SHA 2a79fe25018cce7e99a2c33786d88b0551db6ae7, file-index 2025-06-08/09, first extant import 2025-10-27. The displayed γ:R→R^{3,1} is a 1-D curve; the prose calls its swept “worldtube” a 4-D volume without supplying a thickening map.

Blockwave blob SHA ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, first visible Git path commit 2026-10-08, no internal date/byline. Its Lorentzian u²=-1, projected P, and conserved J two-form worldsheet current are not a finite-core 4-D volume. Malformed source tokens are preserved in the linked crosswalk; assistant syntax/index repairs are separately labelled and not treated as Nathan-authorized physical corrections.

Direct H(s)H statements remain separate: the 2026-10-09 user-role source distinguishes one helical core from the larger hollow coil and describes the 3-D rendering as an intersectional trace of a 4-D filament; the 2026-10-21 user-role source separately specifies cw=t and the positive-definite (++++) normalization. No metric conversion or generator-to-core map is supplied.

## Cross-scale limits and next checks

- WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence. The rope is a material contact/tension/friction system, not a fluid vortex.
- The 2014 superfluid ⁴He reconnection experiment is a quantum-vortex comparator; tracer particles are not guaranteed to be locked to the vortex core.
- GW150914 is a future relativistic-inspiral comparator only; no inspiral calculation was made and no CODATA constants were used.
- The PRL spectral exponents alone do not distinguish the competing weak-turbulence theories; the more discriminating reported target is six-wave pentacoherence and absence of nontrivial four-wave resonances. PRL raw data are not public.
- No H(s)H generator-to-W_core⁴ map exists yet. A useful forward test must predict dispersion, η, the separate a response where available, and higher-order coherence from independently measured inputs.

Potential archive/source-archaeology follow-up, only if it fits your remit: verify the primary-source figure and parameter locators, retain the distinct Nature/PRL provenance, and trace the exact source chain for the SAT-O/Blockwave equations. Do not treat this packet as a request for independent hostile review.

## Independence and thread boundary

The historical ARIADNE thread is conversation 6ab339d2-8fb4-83ea-b728-c8001a034371, last verified activity 2026-09-23T05:25:58Z; current live usability is unverified. Its historical export includes substantial SAT/H(s)H, Hagalaz/ᚼ, and prior-art exposure, so it should not be treated as a contamination-blind independent reviewer for this material. The Aster historical specialist export is title ASTER, conversation 6ab006ce-e358-83ea-b3dd-7b23a26c00fa, updated 2026-10-17T12:28:18.531Z; current live usability is also unverified.

This is a repository handoff only. No ChatGPT-thread message was sent, and no consumption or acknowledgment is claimed. No task, ownership, response obligation, branch, automation, or paper-gate change is requested.