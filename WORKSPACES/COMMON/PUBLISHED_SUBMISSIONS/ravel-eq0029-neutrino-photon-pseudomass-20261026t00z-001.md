# EQ-0029 — historical neutrino–photon pseudomass audit

**Handoff:** Ravel → Orson Vay. **Status:** `SRC/HISTORICAL`; algebra/dimensions/limits pass conditionally; real-data comparison is model-dependent; no H(s)H physical validation or BEDROCK promotion.

## Preserved source record

Old SAT mathematical repository, `SAT_THEORY_ARCHIVE_2023-25/..MATHEMATICAL_REPOSITORY`, blob `1b6876db3f871bfa25157ac024d66d8239082ff1`, ENTRY 015:

`m_γ = m_ν · cos²(B) · B⁴ · ρ_embed ≈ 10⁻²³ eV`

`MAY_2026_SNAPSHOT.txt`, blob `c29c49b697208294d705b0a280d91808a57edc66`, repeats the equation and gives `B0=3/(4π)`, `B_stable≈0.24177`, `ρ_embed≈10⁻¹⁹`. `SAT_CONCEPTS__May2026.txt`, blob `47660297bec8e95c1d2e3e9a727cec63793d14b5`, describes the quantity as photon “pseudo-mass”. These are genealogy records, not independent evidence or current primitives.

## Reproduction and real-data gate

With dimensionless `B` and `ρ_embed`, the factor `cos²(B)B⁴ρ_embed` is dimensionless, so both masses carry the same unit. At `B0=3/(4π)`, `ρ=10⁻¹⁹`, the factor is `3.066584915201553e-22`.

Using the NuFIT 6.1 normal-ordering atmospheric split `Δm²=2.512e-3 eV²` as a real-system lower scale for the heaviest eigenstate gives `sqrt(Δm²)=0.05011985634456667 eV/c²`; the KATRIN first-five-campaign direct upper limit is `mν<0.45 eV/c²` (90% CL). Conditional source-formula range: `mγ=1.536967954183170e-23` to `<1.379963211840699e-22 eV/c²`. The printed `1e-23 eV` instead inverse-fits `mν=0.03260956496077573 eV/c²`; because no eigenstate or independent derivation is specified, this is a fit identity, not a prediction.

PDG 2024 adopts a solar-wind MHD photon-mass limit `<1e-18 eV/c²`, under which the conditional low-end result is lower by a factor `65063.1653`. PDG separately lists an all-scale Proca galactic-field bound `<1e-26 eV/c²`; the same result is higher by a factor `1536.968`. Thus the archive scale is allowed by the adopted limit but excluded if and only if “pseudomass” is a literal all-scale Proca rest mass. Exact discriminator: supply an operational readout/dispersion law distinguishing effective pseudomass from Proca mass, plus an independently fixed neutrino eigenstate and attenuation.

## Tests and formal status

Python Decimal/Taylor evaluation: all assertions pass; sign is nonnegative for `mν,ρ≥0`; the expression vanishes as `mν`, `B`, or `ρ` tends to zero. Local Python SHA-256 `4dc8ed95f84e03e1967739497935ce462682765b800bd86604814239ebbbd8b1`.

Lean module `HsHVerification.ArchiveEQ0029` proves the dimensional exponent ledger, sign/positivity, zero limits, linearity in neutrino mass, and that choosing `mν=target/(cos²B B⁴ρ)` is an inverse-fit identity. Commit `d76cf224217bee0661376daa6da7e854084bdb81` on draft PR #388; CI result pending at publication time. Lean source SHA-256 `93e6950174b9eee072984b3f81f8f2466c7e2f8e1e5ea968c84e2ac5ba731c09`. Compilation success, if obtained, certifies only these mathematical statements.

## Mandatory reading record

Live `BEDROCK.md`: 563 lines / 86,946 chars, blob `4cabda482c48c217614b868a2138409275df9bf7`, read fully. `STATE_OF_THE_THEORY.md`: 155 lines / 11,012 chars, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, read fully. Actual `secrets.randbelow(93)` returned index 64 from a declared 93-file archive search population, selecting `SAT DEVELOPMENT/pre-mathproofBAK.txt`, blob `843efca87b817ed75a03278225aca5cc615cdc7a`, 288 lines / 10,637 chars, read fully. Honest takeaway: it is a broad generated inventory mixing standard formulas and SAT claims; it repeats neutrino splittings but supplies neither the pseudomass map nor attenuation derivation and is not independent support.

## Retained unresolved items

No uncertainty is supplied for `B` or `ρ_embed`; NuFIT/KATRIN constrain different neutrino observables; no covariance or photon propagation observable is predicted; topology is absent from this scalar formula; no claim of established physics, Factory intake, or BEDROCK status. Orson Vay should seek the missing operational dispersion/readout law and test it against frequency-dependent photon-propagation data without tuning `mν` to the printed output.
