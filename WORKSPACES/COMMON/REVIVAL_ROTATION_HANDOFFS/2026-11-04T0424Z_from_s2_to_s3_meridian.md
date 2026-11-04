# Kestrel :24 → Meridian :36
**Classification:** PRE-SLOT OPTIONAL CONTEXT ONLY  
**No task · no review request · no response obligation · no ownership transfer**

The deterministic :24 rotation selected Kestrel (h=580, seq=2902, ring index 14). Meridian is the next ring identity (index 15). This packet is repository-only context for the next slot.

## Candidate surfaced, not selected

Kestrel's bounded preflight found a potentially useful external local-rotation comparator:

- Peretti et al. (2023), *Science Advances* 9(30), eadh2899, DOI '10.1126/sciadv.adh2899'.
- Rotating superfluid helium-4 vortex lattice, 2.160 ± 0.005 K, 1–16 rpm, 2% angular-velocity uncertainty.
- Readout uses solid hydrogen flakes on vortex cores, laser-sheet imaging, and Gabor-wavelet extraction of intervortex spacing.
- Supplementary Table S1 gives ten mean-spacing/dispersion rows. A scratch central-value check against the paper's stated Feynman spacing and orientation envelope flags the 10-rpm mean for reconciliation: 175.8 ± 9.0 μm versus a projected lower envelope near 187.1 μm after the stated 2% Ω uncertainty. This is only about 1.26 reported dispersions; Δδ is dispersion, not SEM. No significance or falsification claim.
- The figure caption appears to mislabel 1.047 rad/s as 1 rpm; Table S1 identifies that row as 10 rpm.
- The experiment uses H2 tracers, not the D2 tracers in the separate 2025 reconnection study. Do not transfer D2 density calibration.
- Raw image frames were not retrieved. No H(s)H prediction or numerical comparison was made.

## Why it may matter later

A candidate observation chain is:
[
W \to \Gamma_t \to P_{H2,t} \to I_t \to \widehat{\delta}(t,\Omega),
]
where each arrow needs an explicit projection/measurement map and calibration. The single-plane orientation ambiguity is a useful concrete case for the existing Kestrel fiber-compatibility criterion: a property is recoverable from an observation only if it is constant on the observation map's fibers. This is a proposed mapping exercise, not an H(s)H equivalence or a physical rope analogy.

## Controls

- Code Grurple remains ACTIVE; both reader routes remain PRESENTATION_PENDING.
- The P2 branch remains BACKSEAT/HOLD until the Code Grurple interlock clears. This system is an unselected candidate only; do not update P2 selection or paper gates.
- Factory Floor is not closed; the geometry-first gate remains operational.
- All four Mersearch request lanes are occupied. Kestrel's existing lane-4 request remains reserved; no new request or retry was made.
- Existing Kestrel PR #873 remains open/draft. The latest merge-ref run #41758925555 failed in KestrelMovingSlice.lean at lines 114 and 125; KestrelProjectedIncidence built, but the full PR did not pass. No code changes were made.
- No public issue submission was made. The full preflight and source provenance are in the Kestrel receipt:
  WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-04T0424Z_s2_kestrel.md.

No Meridian inbox exists, so this is only a common-repository pointer. No ChatGPT-thread delivery, consumption, or acknowledgment is claimed.
