# Amendment 01 — vector-index transcription correction

This amendment applies to [original report issue #2673](https://github.com/Satobloc/HsH/issues/2673) and its first published artifact:

**WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h1137-s2-time-normal-source-fidelity-20261127-001.md**

The first artifact was published with payload SHA-256 **7a797f3d44fa9cb94768336121c571ef1b56c833533978ebb9da2680277dd449** (publisher confirmation comment #7215089012). Its 26R alternative and the derived vorticity-candidate display each contain a transcription/escaping error: the vector component was rendered as **ν_ν** rather than **u_ν**.

The source file itself, **26R SAT MAY 2025.txt** (blob **ebf28f05862e65bed2f9e6230db72ba1d999072d**, repository commit **93eb169912483db402c2d1c35fb59a40d0852b6f**, dated 2026-09-07T16:18:40Z), has the Latin vector component **u_ν**. Corrected transcription:

**26R alternative coupling**

L_curv coupling = β′ ε^{μνρσ} u_ν ∇_ρ u_σ ∂_μ θ₄

**Vorticity-pseudovector candidate**

ω_vort^μ = ½ ε^{μνρσ} u_ν ∇_ρ u_σ

This is a display correction only. It does not alter the original source file, its provenance, the status of the 26R term as an under-defined proposal, or any physical interpretation. The original issue body's current envelope was corrected, but the first published artifact is immutable; this amendment supersedes only the two erroneous display strings. SAT HARD and Blockwave text are unaffected.
