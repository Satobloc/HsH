# Orson Vay | OV-38 | Relative azimuth and 4D contact
**2026-10-09 | SANDBOXED | LOCAL:OV38 | no theory promotion**

**Primary sources substantially read this run:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026 discussions/FOUNDATIONAL ARGUMENT.txt` lines 400–1100 (Nathan's geometric representability discussion; assistant text distinguished); `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt` lines 950–1750 (assistant-heavy synthesis, candidate Interfilament interactions, not authority). Exact paths above are the source anchors. Onboarding, current Common state, symbol registry, October 5 reference desk and War Room declaration read. Supporting HSH_RESOURCES inventoried for tool/source routing, no PRIOR_ART ingress. After deriving: abstract-level comparator Golestanian, Goulian & Kardar (1996), DOI 10.1209/EPL/I1996-00327-4, distinct fluctuation-mediated rod interaction.

## Construction and result
Local Euclidean R4 straight worldline segments `X(s)=s u`, `Y(t)=t v+b` with `u=(cosθ,sinθ,0,0)`, `v=(cosθ,sinθ cosφ,sinθ sinφ,0)`. θ measures angle **to the chosen time axis**, not historical θ₄. φ is relative spatial azimuth; a is **Gaussian range, not a core radius**; L is total arclength. All symbols LOCAL:OV38.

Provisional pair-history energy: `E_L/λ=∫_{-L/2}^{L/2}ds∫_{-L/2}^{L/2}dt exp[-|su-tv-b|²/(2a²)]`. This double-history kernel is an *assumption*, not established causal H(s)H physics.

For b=0 and nonparallel infinite lines, `E∞/λ=2πa²/sinγ`, where `cosγ=cos²θ+sin²θ cosφ`. At θ=30°, L/a=50, finite exact quadrature gives E/λ (in a² units): φ=0: **123.331414**; φ=π/2: **9.499283**; φ=π: **7.255197**. Same individual time-axis angle, **17-fold** different contact.

Finite length regularizes parallel alignment: `E_L(0,0)/λ=2[La sqrt(π/2)erf(L/(sqrt2 a))-a²(1-exp(-L²/(2a²)))]`. For centered uniform azimuth, `<E_L>/λ=(2a²/sinθ) ln(L/a)+O(a²)`; predicted log slope 4a² at θ=30°, numerical slope 4.01356a² over L/a=100..800. Nested double quadrature vs 1D analytic-reduced quadrature agrees ~1e-14.

**Decisive conditioning control:** for unobserved Gaussian 4D translation b~N(0,σ_b² I4), `<E_L>_b/λ=(a²/(a²+σ_b²))² E_L(0,φ; sqrt(a²+σ_b²))/λ`. Aligned/opposite ratio falls from 16.999 (σ_b=0) to 1.00016 (σ_b/a=100). Exact unnormalized all-translation integral `∫d⁴b E_L/λ=(2πa²)²L²` is angle-independent. This does **not** assert a normalized uniform distribution on infinite space.

**Consequence:** individual inclination is insufficient for pair contact; relative azimuth, displacement and their ensemble correlations are indispensable. The centered-ensemble log enhancement is not automatically a physical collective force. The double-history coupling might be physically prohibited; no SAT constant or particle datum was fitted.

**Next cursor:** OV-37 identical-inclination/first-curvature but different-torsion curves, rigidly align at an event, compute finite-core pair energies against the same second curve; vary curvature/range and translation; compare independent-history vs contemporaneous-only kernels. Failure if differences vanish after alignment or no physically admissible constitutive law supplies the interaction.

**Reproducible local artifacts in this task thread:** `orson_ov38_pair_contact.py`, `orson_ov38_results.json`, 4 precision figures, 8 exact-answer cognition assays, complete OV-38 checkpoint and ZIP. No canonical status.

**Orson Vay**