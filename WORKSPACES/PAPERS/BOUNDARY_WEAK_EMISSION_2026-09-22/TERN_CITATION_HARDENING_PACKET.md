# GRURPLE-B — Citation Hardening + Claim/Source Typing Packet

**Prepared:** 2026-09-22
**Prepared by:** Tern / Comptroller
**Disposition:** FEED_FORWARD — merge-ready support packet; Originator scientific/editorial disposition remains Mercer-side.
**Target:** `DRAFT_R0.md`
**Purpose:** remove the remaining conventional-literature TBDs, verify the existing working references against primary publication records, and flag claim-strength changes needed before freeze.

## 1. Primary references verified

### B-EXT-01 — material nanograting / atom-surface interaction
Alexander D. Cronin and John D. Perreault, “Phasor analysis of atom diffraction from a rotated material grating,” *Physical Review A* **70**, 043607 (2004). DOI: `10.1103/PhysRevA.70.043607`.

**Source type:** primary experimental/theoretical atom-optics paper.

**Supports:** atom diffraction through a material grating is modified by atom-surface interaction; sodium/silicon-nitride data are consistent with nonretarded van der Waals interaction; material gratings are not merely ideal Boolean masks.

**Does not support:** weak/neutrino emission; SAT/H(s)H mechanism; a universal statement about all boundary interactions.

**Recommended manuscript use:** replace working reference 6.

### B-EXT-02 — foundational fabricated transmission grating
D. W. Keith, M. L. Schattenburg, H. I. Smith, and D. E. Pritchard, “Diffraction of Atoms by a Transmission Grating,” *Physical Review Letters* **61**, 1580–1583 (1988). DOI: `10.1103/PhysRevLett.61.1580`.

**Source type:** primary experiment.

**Supports:** coherent sodium-atom diffraction by a fabricated periodic structure; useful background for the physical material-grating apparatus.

**Does not by itself support:** the stronger atom-surface phase-shift claim; use Cronin–Perreault for that.

**Recommended manuscript use:** optional companion citation, especially if the introduction wants a foundational material-grating reference.

### B-EXT-03 — standard neutrino-pair bremsstrahlung
George G. Festa and Malvin A. Ruderman, “Neutrino-Pair Bremsstrahlung from a Degenerate Electron Gas,” *Physical Review* **180**, 1227 (1969). DOI: `10.1103/PhysRev.180.1227`.

**Source type:** primary Standard-Model-era weak-process calculation.

**Supports:** a concrete neutrino-pair bremsstrahlung channel from electron–nucleus Coulomb scattering in hot degenerate matter.

**Does not support:** ordinary low-energy slit/grating neutrino production; “generic consequence of matter interactions” without qualification.

**Recommended manuscript use:** retain working reference 4, but narrow the associated prose as below.

### B-EXT-04 — macrocoherent radiative emission of neutrino pairs
M. Tashiro, B. P. Das, J. Ekman, P. Jönsson, N. Sasao, and M. Yoshimura, “Macro-coherent radiative emission of neutrino pair between parity-even atomic states,” *European Physical Journal C* **79**, 907 (2019). DOI: `10.1140/epjc/s10052-019-7430-z`.

**Source type:** primary atomic-neutrino proposal/calculation.

**Supports:** radiative emission of neutrino pairs from atomic de-excitation and a macrocoherent scheme intended for neutrino-mass spectroscopy.

**Does not support:** ordinary boundary-induced emission; it is a distinct atomic transition/coherence mechanism.

**Recommended manuscript use:** replace working reference 5.

### B-EXT-05 — proposed superradiant neutrino source
B. J. P. Jones and J. A. Formaggio, “Superradiant Neutrino Lasers from Radioactive Condensates,” *Physical Review Letters* **135**, 111801 (2025). DOI: `10.1103/l3c1-yg2l`.

**Source type:** primary theoretical proposal.

**Supports:** the radioactive-BEC superradiant-neutrino-source proposal discussed in §6.

**Does not support:** the boundary mechanism in this paper.

**Status:** existing working reference 1 verified.

### B-EXT-06 — no-go for single-fermion Dicke superradiance
Yu-Kun Lu, Hanzhen Lin, and Wolfgang Ketterle, “Fundamental Impossibility of a Superradiant Neutrino Laser,” *Physical Review Letters* **137**, 101804 (2026). DOI: `10.1103/8x7k-rwx2`.

**Source type:** primary theoretical no-go analysis.

**Supports:** for the analyzed single-fermion emission problem, maximum emission scales as N rather than N²; ordinary Dicke-like single-fermion superradiance is ruled out under the paper's stated framework.

**Does not support:** a universal no-go for every conceivable coherent precursor/conversion mechanism; manuscript is already appropriately cautious on that distinction.

**Status:** existing working reference 2 verified.

### B-EXT-07 — BEC radioactive-decay enhancement analysis
Hanzhen Lin, Yu-Kun Lu, and Wolfgang Ketterle, “Can Bose-Einstein Condensates Enhance Radioactive Decay?” *Physical Review Letters* **137**, 101805 (2026). DOI: `10.1103/rnx6-wqpf`.

**Source type:** primary theoretical analysis.

**Supports:** multimode/high-energy/coherence limitations strongly suppress the proposed radioactive-BEC enhancement; published version reports gain of 10^-16 or smaller for the proposals analyzed.

**Does not support:** the manuscript's boundary-production mechanism directly.

**Status:** existing working reference 3 verified.

## 2. Claim-strength lint before freeze

### B-CLAIM-01 — narrow “generic consequence”
Current:
> “Second, neutrino-pair emission is not forbidden as a generic consequence of matter interactions.”

Problem: the cited examples establish specific weak-interaction channels, not that neutrino-pair emission is generically a consequence of arbitrary matter interactions.

Suggested replacement:
> “Second, established electroweak theory contains specific matter processes that emit neutrino pairs.”

The following sentences can then name electron–nucleus bremsstrahlung and radiative atomic de-excitation as examples.

### B-CLAIM-02 — preserve apparatus distinction
Current wording that these examples “do not imply an observable neutrino yield from an ordinary slit or grating” is well typed and should remain.

### B-CLAIM-03 — “standard electroweak theory already permits”
Abstract wording is defensible if read as existence of specific processes, but can be sharpened:
> “Standard electroweak theory contains specific neutrino-pair emission processes in matter under appropriate conditions…”

This prevents the sentence from sounding like ordinary boundary passage is already a known weak source.

### B-CLAIM-04 — no-go scope
Keep the manuscript’s present distinction between the Lu–Lin–Ketterle single-fermion no-go and a hypothetical independently derived coherent precursor/conversion rule. Do not summarize the PRL as a no-go for all possible coherent neutrino-source mechanisms.

### B-CLAIM-05 — novelty statement
Keep §7’s wording as a bounded search statement (“We have not yet identified…”), not a priority claim. This packet does not establish exhaustive prior-art absence.

## 3. Proposed working-reference replacement

Replace working refs 5–6 with:

5. M. Tashiro, B. P. Das, J. Ekman, P. Jönsson, N. Sasao, and M. Yoshimura, “Macro-coherent radiative emission of neutrino pair between parity-even atomic states,” *Eur. Phys. J. C* **79**, 907 (2019), DOI: 10.1140/epjc/s10052-019-7430-z.
6. A. D. Cronin and J. D. Perreault, “Phasor analysis of atom diffraction from a rotated material grating,” *Phys. Rev. A* **70**, 043607 (2004), DOI: 10.1103/PhysRevA.70.043607.
7. [optional apparatus background] D. W. Keith, M. L. Schattenburg, H. I. Smith, and D. E. Pritchard, “Diffraction of Atoms by a Transmission Grating,” *Phys. Rev. Lett.* **61**, 1580–1583 (1988), DOI: 10.1103/PhysRevLett.61.1580.

Renumber SAT-BND references if the optional Keith et al. reference is inserted.

## 4. Freeze recommendation

From the conventional-literature side, **the two explicit reference-TBD holes visible in DRAFT_R0 are now removable without further broad search.** Existing references 1–4 verify cleanly against primary publication records, and references 5–6 now have concrete primary replacements.

This does **not** declare the paper scientifically complete or review-ready by itself. Mercer still controls:
1. whether the internal mechanism-specific source typing is sufficient;
2. whether any additional external comparator is publication-critical;
3. acceptance/modification of the wording patches above;
4. freeze/release of the reviewable manuscript.

If those internal/source-typing conditions are already satisfied, there is no conventional-citation reason visible in this pass to delay first-round review.

## 5. Sources consulted in this pass

Primary/near-primary publication records:
- APS / Physical Review A: Cronin & Perreault, DOI 10.1103/PhysRevA.70.043607.
- APS / Physical Review Letters: Keith et al., DOI 10.1103/PhysRevLett.61.1580.
- APS / Physical Review: Festa & Ruderman, DOI 10.1103/PhysRev.180.1227.
- Springer / EPJC: Tashiro et al., DOI 10.1140/epjc/s10052-019-7430-z.
- APS / PRL: Jones & Formaggio, DOI 10.1103/l3c1-yg2l.
- APS / PRL: Lu, Lin & Ketterle, DOI 10.1103/8x7k-rwx2.
- APS / PRL: Lin, Lu & Ketterle, DOI 10.1103/rnx6-wqpf.

No PRIOR_ART/private/quarantined material was used.
