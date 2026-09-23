# SANDBOXED — PRE-REVIEW DRAFT

> **Status:** hypothesis/proposal paper; not validated. This manuscript deliberately separates established physics from SAT/H(s)H-motivated conjecture. SAT/H(s)H provenance citations are source-typed where recovered; later mechanism links remain under audit.

# A Direct Search for Weak Secondary Emission from Controlled Boundary-Passage Experiments

## Abstract

Interference and diffraction experiments traditionally ask how a material boundary modifies a propagating quantum. The reciprocal question—whether repeated quantum passages near engineered boundaries generate rare secondary radiation from the interaction region—has received far less direct experimental attention. We propose a differential search for neutrino-like weak secondary emission from a high-throughput slit, grating, or close-boundary apparatus operated inside or immediately adjacent to a low-background neutrino-sensitive detector. The experiment is intentionally theory-agnostic: beam flux, wall distance, slit width, material, curvature, and boundary multiplicity are modulated while detector events are compared against matched beam-off, apparatus-off, wide-aperture, and geometry-swapped controls. Standard electroweak theory contains specific neutrino-pair emission processes in matter under appropriate conditions, but known rates are generally discussed in atomic, nuclear, dense-matter, or astrophysical regimes rather than as a dedicated by-product search around ordinary interferometric boundary apparatus. The proposed measurement therefore has value as a direct null test even if no new mechanism exists. A positive geometry-correlated signal would motivate immediate characterization of spectrum, multiplicity, directionality, timing, material dependence, and coherence. One motivation for the search comes from SAT/H(s)H, a speculative geometric framework in which boundary-mediated deformations may support transient internal modes; however, the experimental proposal does not depend on that framework, and the present manuscript does not claim that SAT/H(s)H has yet derived a neutrino-emission rate. Recent proposals and no-go analyses concerning superradiant neutrino sources sharpen the technological significance of any controllable laboratory neutrino-production mechanism while remaining conceptually distinct from the boundary mechanism tested here.

## 1. The reciprocal interferometer question

Single-particle interference experiments are usually organized around a familiar question: given a source, an aperture or grating, and a detector, what distribution is produced by individual quanta traversing the apparatus? In that framing the boundary is part of the dynamics but the principal measured output is the transmitted or scattered quantum.

A complementary question is operationally simple:

> **What does the passage do to the apparatus and its surrounding environment?**

The distinction matters because a real slit or grating is not an inert Boolean mask. Matter waves can acquire boundary-dependent phase shifts and amplitude changes through atom-surface interactions, and material gratings are therefore physical interaction regions rather than merely geometrical exclusions. This motivates a direct search for rare secondary products correlated with controlled near-boundary passage.

The proposed observable is not inferred from missing energy or from a modification of the interference pattern. It is a separate detector channel surrounding the interaction region. The first target considered here is neutrino-like weak radiation because it provides a sharply falsifiable and technologically consequential channel, not because ordinary slit physics is expected to produce a measurable neutrino signal.

## 2. Established physics: boundaries are active, weak radiation exists

Two established facts motivate taking the reciprocal question seriously while also defining the conventional background.

First, boundary interactions can modify a matter wave. Nanofabricated gratings used in atom diffraction can act as phase as well as amplitude masks because atom-surface potentials vary strongly across the slit. Such effects are routinely incorporated through a complex transmission function rather than an ideal binary aperture. The detailed outgoing diffraction pattern can therefore encode real wall interactions.

Second, established electroweak theory contains specific matter processes that emit neutrino pairs. Examples include neutrino-pair bremsstrahlung from electron-nucleus scattering in dense matter and radiative emission of neutrino pairs from atomic transitions. Macrocoherent atomic schemes have been studied specifically as possible ways to enhance otherwise rare neutrino-pair processes. These examples do **not** imply an observable neutrino yield from an ordinary slit or grating. They establish only that weak secondary radiation from interacting matter is a legitimate calculational category and that any proposed experiment must compare against the Standard Model floor appropriate to its actual beam, material, geometry, and energy scale.

The immediate theory task for any concrete implementation is therefore to calculate the conventional weak-emission expectation for the chosen apparatus. If that rate is many orders below sensitivity, the experiment becomes a clean search for additional production channels; if it is non-negligible, it becomes both a measurement and a background.

## 3. Experimental proposal

### 3.1 Core geometry

Place a high-throughput beam apparatus containing a controllable slit, grating, channel, near-wall trajectory, or related engineered boundary inside or immediately adjacent to a neutrino-sensitive detector. The interaction region should be compact, mechanically stable, and designed so that the dominant geometric control can be altered without changing beam power or detector configuration.

The primary comparison is not simply beam-on versus beam-off. The informative variable is boundary geometry.

A minimal run set is:

- **B0:** detector background with beam and apparatus inactive;
- **B1:** beam active with a wide/open passage designed to minimize near-wall interaction;
- **B2:** beam active with one nearby boundary;
- **B3:** beam active through a two-boundary slit or channel;
- **B4:** a geometry selected to maximize the hypothesized boundary interaction while holding flux and material budget as constant as practical;
- **B5:** geometry-matched material or orientation controls.

Additional scans should vary closest wall distance, slit width, wall curvature, surface material, beam energy, beam species, flux, and passage cadence.

### 3.2 Observable

Let \(R_D(G,t,E_r,\ldots)\) be the neutrino-detector event rate in reconstructed detector variables for apparatus geometry \(G\). The basic differential observable is

\[
\Delta R_D(G_i,G_j)=R_D(G_i)-R_D(G_j),
\]

with matched exposure, beam conditions, and detector state.

The detector-level rate is related to any source flux through the usual response convolution,

\[
R_D = \int dE_\nu\,d\Omega\;\Phi_\nu(E_\nu,\Omega)\,\sigma_D(E_\nu)\,\epsilon_D(E_\nu,\Omega) + R_{\rm bkg},
\]

where \(\sigma_D\) and \(\epsilon_D\) represent the relevant interaction probability and detector efficiency. A null result therefore constrains the product of source yield and detector response, not an abstract “neutrino count” independent of detection physics.

### 3.3 Modulation and timing

Geometry modulation is essential. If the apparatus can alternate between near-identical control states on a known cadence, an event search can use that cadence to reject stationary or slowly varying backgrounds. Pulsed beams add a second timing handle. A genuine apparatus-correlated signal should survive blinded comparisons of active and control geometries while respecting detector dead time, latency, and the physical time-of-flight window appropriate to the baseline.

### 3.4 Systematic controls

Any credible search must rule out ordinary sources of correlated detector activity, including electromagnetic pickup, beam-induced neutrons, activation, radioactivity, heating, vibration, cosmic-ray modulation, changes in shielding, electronic cross-talk, and material-dependent backgrounds. Geometry changes should be designed so that these nuisance channels can be independently monitored.

Where practical, a sham geometry should reproduce mechanical motion, thermal load, electrical state, and material inventory without reproducing the targeted close-pass configuration.

## 4. What would count as evidence?

A single excess in a beam-on state would not establish boundary-induced neutrino production. The evidentiary target is a reproducible signal with a parameter dependence tied to the interaction geometry and inconsistent with identified backgrounds.

The most useful hierarchy is:

1. repeatable excess associated with passage rather than detector drift;
2. dependence on closest boundary distance or other geometric control at fixed flux;
3. reproducible material dependence;
4. a stable reconstructed energy/time signature;
5. directional or multiplicity information, if accessible;
6. scaling with the number of equivalent interaction sites;
7. any phase- or coherence-sensitive behavior in deliberately synchronized arrays.

Conversely, a null result produces an upper bound on the source yield per passage once detector response and exposure are specified:

\[
P_{\nu/{\rm pass}} < P_{\rm max}(E_\nu,\text{model assumptions}).
\]

Publishing such a bound would make the experiment useful even if the motivating nonstandard mechanism is absent.

## 5. SAT/H(s)H motivation and the limit of the present claim

One motivation for this experiment comes from SAT/H(s)H, a speculative geometric framework that treats particle-like and medium-like degrees of freedom in terms of structured four-dimensional geometry and includes a medium-response layer in its current mathematical toolbox.

The currently recovered historical provenance is narrower than the proposed weak-emission mechanism and is useful precisely because that boundary can be stated explicitly. Direct Nathan-authored SAT discussion from 5–6 April 2025 explicitly connects aperture/grating/boundary language with filament–surface interaction, energy transfer, and light-like response: an aperture is posed as filament incidence on a spacetime surface that may impart energy and create light [SAT-BND-01]; a spacetime surface is analogized to a diffraction grating “combing” matter's filament structure [SAT-BND-02]; and light is proposed as an interaction boundary between line filaments and the perpendicular spacetime/time-expansion surface, with local uncertainty retained about the exact surface identity [SAT-BND-03]. These are direct exploratory questions/model proposals, not settled derivations. They establish an April-2025 antecedent for **boundary-mediated filament/surface interaction and energy/light response**. They do **not** establish that SAT predicted neutrino emission from an ordinary slit or grating, detachable weak modes, later t-/f-boson vocabulary, or a quantitative yield.

The framework has also used historical particle-mode language concerning transient intersection states and distinct substrate- and filament-associated excitations. Those terms are **not** used here as established physics, and this manuscript does not yet treat them as a completed derivation of neutrino production. The source archaeology and current-theory typing are being audited independently. Until that audit is complete, the appropriate statement is that SAT/H(s)H **motivates** a search for a transient boundary-response channel; it does not yet earn the stronger statement that it quantitatively predicts a neutrino yield.

The decisive internal theory chain is:

\[
\text{boundary passage}\rightarrow\text{local deformation}\rightarrow\text{transient mode}\rightarrow\text{detachable propagation}\rightarrow\text{detector-neutrino-like state}.
\]

Each arrow must be justified separately. In particular, a transient internal excitation need not propagate, and a propagating excitation need not map to a state that an ordinary neutrino detector would register.

This separation is deliberate: the proposed experiment remains interpretable under standard physics if the SAT/H(s)H mechanism is incomplete or wrong.

## 6. Coherence and the neutrino-source question

The technological significance of a positive result extends beyond source discovery. A controllable boundary-induced source would immediately raise questions about directional emission, multiplicity, phase memory, and collective enhancement.

This question is timely because Jones and Formaggio recently proposed a superradiant neutrino source based on radioactive Bose-Einstein condensates, while Lu, Lin, and Ketterle subsequently derived a no-go result for Dicke-like superradiance from single-fermion emission and separately showed that recoil and multimode effects strongly suppress the proposed condensate enhancement. These results concern a specific radioactive-condensate mechanism and should not be treated as evidence for or against the boundary-production mechanism proposed here.

They do, however, define an important diagnostic. If any boundary-induced channel emits ordinary fermionic neutrinos directly, the recent single-fermion superradiance bound must be confronted. If an independently derived theory instead contains a coherent precursor followed by conversion into neutrino detector states, the relevant question is not ordinary neutrino stimulated emission but whether phase information survives the conversion. No such precursor or conversion rule is assumed in the present experimental proposal.

Thus a positive source result would motivate a staged programme:

\[
\text{production}\rightarrow\text{geometry scaling}\rightarrow\text{directionality}\rightarrow\text{correlations}\rightarrow\text{phase/coherence tests}.
\]

The term “neutrino laser” should be reserved for a mechanism that actually satisfies a defensible lasing or superradiance criterion rather than used as shorthand for any intense source.

## 7. Prior-art status and novelty boundary

A preliminary literature search identified substantial neighbouring literatures: active atom-surface diffraction physics; standard weak neutrino-pair bremsstrahlung in matter; atomic radiative neutrino-pair emission and macrocoherence; and recent proposals and no-go analyses for superradiant neutrino sources. We have not yet identified a dedicated published experiment whose primary purpose is to operate an ordinary slit, grating, or close-boundary passage apparatus inside a neutrino-sensitive detector and search for a geometry-correlated neutrino excess.

This is a search result, not a universal priority claim. The statement should be revised if more specific prior art is recovered. The paper’s experimental value does not depend on novelty in the strongest historical sense: a reproducible modern implementation with explicit geometry modulation and a reported bound would still define a useful constraint.

## 8. Decision logic

The experiment has a deliberately simple interpretation tree.

**Null:** no geometry-correlated excess. Report upper limits as a function of assumed source spectrum and constrain any SAT/H(s)H boundary-emission model accordingly.

**Positive but conventionally explained:** a weak-emission channel is observed and agrees with Standard Model calculation. The result is a laboratory measurement of a rare boundary-associated weak process and provides a calibration point for source engineering.

**Positive with unexplained residual:** reproduce across detectors/materials/geometries; map spectrum and scaling; only then compare candidate beyond-standard descriptions.

**Positive with collective or phase-sensitive scaling:** test directly against standard coherence bounds and construct a source-level amplitude model before invoking any “laser” language.

This decision structure keeps the experimental claim independent of the speculative motivation.

## 9. Conclusion

The proposed experiment reverses the usual observational emphasis of interference and diffraction studies. Instead of using a boundary primarily to interrogate the propagating quantum, it instruments the environment to ask whether repeated controlled quantum passages produce rare weak secondary radiation from the interaction region. A neutrino-sensitive implementation offers a particularly sharp test because a positive result would be both unexpected in ordinary low-energy boundary apparatus and technologically consequential, while a null result can be expressed as a quantitative upper limit on yield per passage.

The first experiment should be differential, geometry-modulated, and deliberately agnostic about mechanism. SAT/H(s)H supplies one speculative motivation for looking, but the measurement must stand on its own. If a signal exists, questions of coherence, directionality, and possible source engineering become empirical rather than rhetorical. If no signal exists, the result closes a cleanly stated experimental possibility and constrains any theory that predicts otherwise.

## References — working list

1. B. J. P. Jones and J. A. Formaggio, “Superradiant Neutrino Lasers from Radioactive Condensates,” *Phys. Rev. Lett.* **135**, 111801 (2025), DOI: 10.1103/l3c1-yg2l.
2. Yu-Kun Lu, Hanzhen Lin, and Wolfgang Ketterle, “Fundamental Impossibility of a Superradiant Neutrino Laser,” *Phys. Rev. Lett.* **137**, 101804 (2026), DOI: 10.1103/8x7k-rwx2.
3. Hanzhen Lin, Yu-Kun Lu, and Wolfgang Ketterle, “Can Bose-Einstein Condensates Enhance Radioactive Decay?” *Phys. Rev. Lett.* **137**, 101805 (2026), DOI: 10.1103/rnx6-wqpf.
4. George G. Festa and Malvin A. Ruderman, “Neutrino-Pair Bremsstrahlung from a Degenerate Electron Gas,” *Phys. Rev.* **180**, 1227 (1969), DOI: 10.1103/PhysRev.180.1227.
5. M. Tashiro, B. P. Das, J. Ekman, P. Jönsson, N. Sasao, and M. Yoshimura, “Macro-coherent radiative emission of neutrino pair between parity-even atomic states,” *Eur. Phys. J. C* **79**, 907 (2019), DOI: 10.1140/epjc/s10052-019-7430-z.
6. A. D. Cronin and J. D. Perreault, “Phasor analysis of atom diffraction from a rotated material grating,” *Phys. Rev. A* **70**, 043607 (2004), DOI: 10.1103/PhysRevA.70.043607.
7. D. W. Keith, M. L. Schattenburg, H. I. Smith, and D. E. Pritchard, “Diffraction of Atoms by a Transmission Grating,” *Phys. Rev. Lett.* **61**, 1580–1583 (1988), DOI: 10.1103/PhysRevLett.61.1580.
8. **SAT-BND-01:** Nathan McKnight, user turn, *SAT Framework Analysis*, 5 April 2025, 07:39:51 UTC, conversation CID `67f098c8-4ec0-8003-8bd1-0efa14ea4f66`, message UUID `b19a4755-9afc-40b4-a0a8-2ecb6827f4a1`, archived as `archive/SAT Framework Analysis — raw.json`. Direct exploratory question/proposal; aperture → filament/surface interaction → energy transfer → light-like response.
9. **SAT-BND-02:** Nathan McKnight, user turn, *SAT Framework Analysis*, 6 April 2025, 05:08:19 UTC, same conversation CID, message UUID `7c4551a6-44aa-40dc-a00d-1ba0fd7acbb4`. Direct exploratory diffraction-grating analogy; does not equate a laboratory material grating with the hypothesized spacetime surface.
10. **SAT-BND-03:** Nathan McKnight, user turn, *SAT Framework Analysis*, 6 April 2025, 17:59:08 UTC, same conversation CID, message UUID `ae89e7f2-7256-4e5a-8402-deed8f8b89fe`. Direct model proposal with explicit local uncertainty; boundary-mediated filament/surface interaction linked to light.

Full source typing and negative-support boundaries for SAT-BND-01–03 are retained in `SAT_ARCHIVE_CITATION_LEDGER.md` adjacent to this draft.
