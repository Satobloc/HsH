# Standard Physics Master Map — Backbone Expansion I
**Date:** 2026-11-01  
**Status:** Stage A conventional floor-plan expansion; source-backed working map; non-canonical pending edge and theory-card audits.  
**Scope:** Electromagnetism, optics, special relativity, general relativity, quantum mechanics, relativistic wave equations, quantum field theory, electroweak theory, QCD and the Standard Model.

> **GEOMETRY-FIRST STATUS UPDATE (2026-11-03):** This artifact is a Stage-A conventional theory-network/textual navigation skeleton only. It is **not Factory Floor eligible** and is not a geometric plot of the physical/theoretical objects represented by its nodes. Each system requires its own source-faithful quaternary geometric plot, hostile fidelity review and embedded display before Factory Floor routing. Where dynamics are material, a precision tertiary software geometry is also required. See [mandatory Factory Floor Geometry-First Admission Gate](../FACTORY_FLOOR_GEOMETRY_FIRST_GATE_2026-11-03.md). This update does not invalidate the source-audit/navigation work; it limits its status and blocks geometry-based promotion.

## 1. Build rule

This document extends the conventional physics floor plan specified in `STANDARD_PHYSICS_MASTER_MAP_CHARTER_2026-10-24.md`. It is not an H(s)H interpretation, not a SAT overlay, and not a claim that every historical arrow is a mathematical derivation. Edges below are typed and scoped. The standard-physics map and SAT/H(s)H atlas remain separate.

The current pass prioritizes a usable backbone over exhaustive object/occurrence registration. Detailed symbol registration follows this map. No new numerical physical calculation was required or performed.

## 2. Conventional backbone

```text
Electric charge + currents
  ├─ Coulomb / Gauss electrostatics
  ├─ Oersted / Ampère magnetostatics
  └─ Faraday induction
          ↓ synthesis + displacement current
      Maxwell electrodynamics
          ├─ Lorentz force → charged-particle dynamics
          ├─ EM wave equation → radio / microwave / IR / visible / UV / X-ray / gamma
          │      ├─ geometric optics (short-wavelength approximation)
          │      ├─ physical wave optics (interference / diffraction / polarization)
          │      └─ quantum optics / photon description
          ├─ electromagnetic stress-energy and radiation pressure
          └─ U(1) gauge-field formulation
                    ↓ quantization
                  QED

Lorentz invariance / invariant spacetime interval
          ├─ relativistic particle kinematics and energy-momentum
          ├─ covariant Maxwell electrodynamics
          ├─ relativistic wave equations
          │      ├─ Klein–Gordon (spin 0)
          │      └─ Dirac (spin 1/2)
          └─ local inertial structure of GR
                    ↓ dynamical spacetime geometry
              General Relativity
                    ├─ Einstein field equations
                    ├─ geodesic motion / gravitational lensing
                    ├─ gravitational waves
                    └─ relativistic cosmology (FLRW → ΛCDM)

Quantum mechanics
  ├─ Hilbert-space states / operators / Born probabilities
  ├─ Schrödinger evolution (nonrelativistic)
  ├─ atomic, molecular, nuclear and condensed-matter applications
  └─ relativistic quantum theory
          ↓ fields + locality + relativistic covariance
       Quantum Field Theory
          ├─ U(1) gauge theory → QED
          ├─ SU(2)_L × U(1)_Y → electroweak theory
          │        └─ Higgs mechanism / electroweak symmetry breaking
          └─ SU(3)_c → QCD
                    ↓ combined gauge structure + matter content
                Standard Model
                    ├─ quark/lepton generations
                    ├─ CKM flavour mixing / CP violation
                    ├─ neutrino mixing (mass mechanism beyond minimal SM)
                    └─ Higgs sector
```

This is a navigation skeleton. In particular, it does not imply that GR is quantized by the same settled procedure as QED, that QED and QCD are interchangeable, or that all Standard Model parameters are derived internally.

## 3. Sector cards (backbone level)

### EM-01 — Classical electromagnetism / Maxwell theory
- **Domain:** electric and magnetic fields, charges, currents, induction, radiation and electromagnetic momentum/energy.
- **Core objects:** electromagnetic field \(\mathbf E,\mathbf B\); sources \(\rho,\mathbf J\); potentials \(\phi,\mathbf A\); field tensor \(F_{\mu\nu}\).
- **Vacuum SI differential equations:**
  \[
  \nabla\cdot\mathbf E=\rho/\epsilon_0,\qquad
  \nabla\cdot\mathbf B=0,
  \]
  \[
  \nabla\times\mathbf E=-\partial_t\mathbf B,\qquad
  \nabla\times\mathbf B=\mu_0\mathbf J+\mu_0\epsilon_0\partial_t\mathbf E.
  \]
- **Matter coupling:** \(\mathbf F=q(\mathbf E+\mathbf v\times\mathbf B)\). Material media require constitutive relations (e.g. \(\mathbf D,\mathbf H\)); vacuum relations must not be silently applied to arbitrary media.
- **Important structure:** Maxwell's displacement-current term repairs the capacitor-surface inconsistency in the pre-Maxwell Ampère law and makes electromagnetic waves possible. Maxwell theory is Lorentz covariant; its field and source descriptions must transform together.
- **Authoritative anchor:** OpenStax University Physics Vol. 2, §16.1 (integral laws, displacement current and Lorentz force); Utah State University classical field theory notes (potential, field-strength two-form and Lagrangian density).
- **Status:** current standard classical field theory; quantum electrodynamics is the quantum field theory of electromagnetic interactions.

### OPT-01 — Optics and electromagnetic radiation
- **Domain:** propagation, reflection, refraction, interference, diffraction, polarization, imaging and light–matter interaction.
- **Branches:** geometric optics; physical/wave optics; Fourier optics; radiometry; quantum optics.
- **Map relation:** geometric optics is a short-wavelength/eikonal approximation to wave propagation under appropriate smoothness and scale-separation assumptions, not a separate fundamental interaction. Wave optics retains phase, diffraction and interference. Quantum optics treats quantized radiation and its interaction with matter.
- **Boundary warning:** ray optics loses phase information and fails near caustics, apertures and structures on wavelength scales; wave optics is still not a complete account of all light–matter phenomena.
- **Status:** several nested calculational regimes of electromagnetic theory, with quantum descriptions required for photon statistics and nonclassical states.

### SR-01 — Special relativity
- **Domain:** spacetime kinematics and dynamics in inertial frames; Lorentz symmetry.
- **Core objects:** events, Minkowski spacetime, four-vectors/tensors, proper time, energy-momentum.
- **Convention used here:** metric signature \((-+++ )\), so \(ds^2=-c^2dt^2+dx^2+dy^2+dz^2\).
- **Lorentz invariant:** \(ds^2\) is unchanged between inertial coordinate systems; Lorentz transformations replace Galilean transformations when relative speeds are not negligible compared with \(c\).
- **Energy-momentum shell:** \(E^2=p^2c^2+m^2c^4\).
- **Bridge:** Newtonian mechanics is recovered as a low-speed approximation (\(v/c\to0\)) with the appropriate identification of rest and kinetic energy; this does not make Newtonian and relativistic spacetime structures identical.
- **EM connection:** Maxwell electrodynamics is naturally Lorentz covariant; special relativity supplies the spacetime transformation structure.
- **Authoritative anchor:** OpenStax University Physics Vol. 3, §5.5 and §5 key equations; MIT OCW 8.033 (2024) provides a sequence from spacetime kinematics through covariant electrodynamics and gravity.
- **Status:** current standard kinematics and framework for relativistic nongravitational physics.

### GR-01 — General relativity
- **Domain:** gravitation as dynamical spacetime geometry; relativistic gravitating systems.
- **Core objects:** spacetime manifold, metric \(g_{\mu\nu}\), connection, curvature tensors, stress-energy tensor \(T_{\mu\nu}\), geodesics.
- **Convention used here:** metric signature \((-+++ )\); curvature sign conventions must be stated when importing formulae.
- **Einstein field equation:**
  \[
  G_{\mu\nu}+\Lambda g_{\mu\nu}
  =\frac{8\pi G}{c^4}T_{\mu\nu}.
  \]
- **Einstein–Hilbert action (with standard boundary-term qualifications):**
  \[
  S_{EH}=\frac{c^3}{16\pi G}\int d^4x\,\sqrt{-g}\,(R-2\Lambda)+S_{matter}.
  \]
- **Bridge:** the Newtonian gravitational field equation is recovered in the weak-field, slow-motion regime with suitable matter assumptions. The geodesic equation describes ideal freely falling test bodies; matter fields and non-gravitational forces still require their own dynamics.
- **Cross-sector connections:** Maxwell fields can be formulated on curved spacetime; electromagnetic and other matter stress-energy contribute to \(T_{\mu\nu}\). GR cosmology uses homogeneous/isotropic metric ansätze (FLRW) and matter/energy contents.
- **Authoritative anchor:** MIT OCW 8.962, Lecture 12 (Einstein curvature tensor and field equation); UCI Physics 255 lectures 11–13 (field equations, Einstein–Hilbert action, variational principle, weak-field expansion).
- **Status:** current standard classical theory of gravitation; not a completed quantum theory.

### QM-01 — Nonrelativistic quantum mechanics
- **Domain:** quantum states and measurement predictions for nonrelativistic systems.
- **Core objects:** Hilbert space, state vector/wavefunction, operators, observables, Born probabilities, Hamiltonian.
- **Time-dependent Schrödinger equation:**
  \[
  i\hbar\frac{\partial}{\partial t}\Psi(\mathbf x,t)
  =\hat H\Psi(\mathbf x,t).
  \]
  For a single particle with scalar potential in Cartesian coordinates,
  \(\hat H=-\hbar^2\nabla^2/(2m)+U(\mathbf x,t)\).
- **Scope:** the displayed one-particle Hamiltonian is not the universal Hamiltonian for all quantum systems; spin, gauge coupling, many-body interactions, constraints and relativistic effects require extensions.
- **Bridge:** classical mechanics is approached in suitable semiclassical/high-quantum-number regimes and for appropriate observables; this is not a blanket identity between a wavefunction and a classical trajectory.
- **Authoritative anchor:** OpenStax University Physics Vol. 3, §7.3 and §7 key equations.
- **Status:** current standard nonrelativistic quantum framework.

### RQM-01 — Relativistic wave equations
- **Klein–Gordon:** relativistic scalar wave equation associated with the spin-0 energy-momentum relation.
- **Dirac:** relativistic spinor equation for spin-1/2 fields/particles; its structure brings spin and antiparticle solutions into the relativistic quantum description.
- **Map role:** these equations are important historical and formal bridges from relativistic particle kinematics to quantum fields. Their single-particle interpretations have limitations; QFT provides the standard framework for particle creation/annihilation and interacting relativistic fields.
- **Source anchor:** Cambridge University Press, *Fundamentals of Particle Physics*, chapter “From Wave Functions to Quantum Fields” (2023), which explicitly develops Schrödinger, Klein–Gordon, Dirac and Maxwell equations toward quantized fields.

### QFT-01 — Quantum field theory
- **Domain:** relativistic quantum systems with fields as the fundamental dynamical variables; particle states arise as excitations in appropriate regimes.
- **Core objects:** operator-valued or path-integral fields, actions/Lagrangians, propagators, symmetries, currents, gauge fields, renormalized parameters and scattering amplitudes.
- **Structural role:** combines quantum principles with relativistic locality/covariance and supports variable particle number. It is the framework from which QED, electroweak theory and QCD are constructed.
- **Boundary warning:** “QFT” is a framework family, not one unique equation or one theory. A particular QFT requires field content, symmetry, action, couplings, state/vacuum and a definition of its observables.
- **Status:** current standard framework for nongravitational fundamental interactions.

### SM-01 — Standard Model of particle physics
- **Domain:** known elementary-particle fields and strong, weak and electromagnetic interactions (not gravity).
- **Gauge-structure shorthand:** \(SU(3)_c\times SU(2)_L\times U(1)_Y\), with the electroweak sector spontaneously broken to the observed low-energy electromagnetic \(U(1)_{EM}\). Global quotient choices and representation conventions matter in more precise mathematical statements.
- **Main sectors:** QCD (strong interaction); electroweak theory (weak and electromagnetic interactions); Higgs sector; quark/lepton matter fields; flavour mixing and CP violation.
- **Map relation:** QED is the electromagnetic quantum gauge theory; QCD is the non-Abelian color gauge theory; electroweak theory unifies electromagnetic and weak interactions above/before symmetry breaking. These are related but not interchangeable theories.
- **Boundary:** the Standard Model does not incorporate gravity; neutrino masses/mixing require extension beyond its minimal original field content. It contains empirically determined parameters.
- **Authoritative anchor:** Particle Data Group 2026 Review of Particle Physics, Standard Model & Related Topics index: dedicated reviews for QCD, electroweak constraints, Higgs, CKM, CP violation, neutrino mixing and lattice QCD.
- **Status:** current standard particle-physics framework within its domain; extensions are active research, not part of the established minimal model.

## 4. Typed backbone edges

| From → To | Edge class | Relation | Scope / qualification |
|---|---|---|---|
| Coulomb/Gauss, Ampère, Faraday → Maxwell | K | SYNTHESIS / GENERALIZES | Maxwell's displacement-current completion is central; not merely chronological succession. |
| Maxwell → EM wave equation | K | DERIVES_FROM | Vacuum source-free region; material media change constitutive relations and wave speed. |
| Maxwell → geometric optics | K | LIMIT_OF | Short-wavelength/eikonal regime with suitable smoothness and scale separation. |
| Maxwell → wave optics | K | CONTAINS | Interference, diffraction and polarization remain wave-level effects. |
| Maxwell → Lorentz force | K | COUPLED_WITH | Field equations determine fields from sources; Lorentz force governs charged test-particle response. |
| Maxwell ↔ special relativity | K | LORENTZ_COVARIANT_WITH | Covariant formulation; the field and sources transform as relativistic objects. |
| Newtonian mechanics → SR | K | LOW-SPEED_LIMIT_OF | Requires \(v/c\ll1\) and consistent energy reference. |
| SR → Klein–Gordon / Dirac | K | RELATIVISTIC_WAVE_FORM | Distinct spin representations and physical interpretations. |
| Schrödinger QM → QFT | R | HISTORICAL_AND_FORMAL_PRECURSOR | Not a simple direct quantization arrow; field degrees of freedom and variable particle number change the framework. |
| Relativistic wave equations → QFT | K | FIELD_THEORY_GENERALIZATION | QFT handles interacting fields and particle creation/annihilation; do not equate the equations with the full framework. |
| U(1) gauge field → QED | K | QUANTIZATION_OF | Gauge-field quantization with charged matter and renormalized interactions. |
| SU(2)_L × U(1)_Y → electroweak theory | K | GAUGE_THEORY | Higgs mechanism yields electroweak symmetry breaking and low-energy electromagnetic sector. |
| SU(3)_c → QCD | K | GAUGE_THEORY | Color gauge interaction; non-Abelian. |
| QED + electroweak + QCD + Higgs/matter content → Standard Model | K | COMPONENTS_OF | Unified gauge-theory framework with empirically specified parameters. |
| SR → GR | K | LOCAL_INERTIAL_LIMIT / GENERALIZES | GR has locally Minkowskian tangent-space structure; global spacetime need not be flat. |
| Einstein–Hilbert action → Einstein field equation | K | VARIATIONAL_DERIVATION | Boundary terms and sign/metric conventions must be stated. |
| GR → Newtonian gravity | K | WEAK_FIELD_SLOW_MOTION_LIMIT | Not equality outside the limiting regime. |
| GR + matter fields → relativistic cosmology | K | SPECIALIZED_COSMOLOGICAL_SOLUTIONS | FLRW symmetry assumptions plus stress-energy content and dynamical equations. |
| GR ↔ QFT | S | QUANTUM_GRAVITY_INTERFACE | Semiclassical QFT on curved spacetime is developed; a complete experimentally confirmed quantum theory of gravity is not established. |

**Edge notation:** K = established derivation, limit, framework inclusion or standard mathematical relationship within the stated assumptions; R = reported/historical relation; S = live unresolved interface. No A (asserted programme claim) or analogy-only edge is promoted to K.

## 5. Cross-sector architecture observations

1. **Electromagnetism is a structural hinge.** Maxwell theory links charge/current, wave propagation, optics, Lorentz covariance, gauge fields and (after quantization) QED.
2. **Relativity is not a detachable correction.** Lorentz symmetry is built into Maxwell theory and relativistic QFT; GR replaces fixed global Minkowski geometry with dynamical geometry while retaining local Lorentzian structure.
3. **Quantum theory branches by regime and object content.** Schrödinger theory is highly effective for nonrelativistic systems; relativistic wave equations lead toward, but do not alone exhaust, QFT.
4. **The Standard Model is a structured assembly, not a single force law.** QCD, electroweak theory, Higgs dynamics and flavour structure have distinct mathematical objects and observables.
5. **The gravity–quantum interface remains an actual gap.** QFT on curved backgrounds and semiclassical gravity are important intermediate frameworks; neither should be mislabeled as a completed unification.

## 6. Source register

The following sources were opened and checked during this pass. Search-result snippets alone are not treated as full-text review.

- **SRC-EM-OPENSTAX:** OpenStax, *University Physics Volume 2*, §16.1, “Maxwell’s Equations and Electromagnetic Waves.” https://openstax.org/books/university-physics-volume-2/pages/16-1-maxwells-equations-and-electromagnetic-waves — opened; lines 22–68 support Maxwell synthesis and displacement-current correction; section continues with four laws and Lorentz force.
- **SRC-EM-USU:** C. G. Torre, Utah State University, *Classical Field Theory*, lecture notes, “Electromagnetism: the simplest gauge theory.” https://www.physics.usu.edu/torre/Classical_Field_Theory/Lectures/04_EM.pdf — search-extracted text reviewed; field strength as two-form, \(F=dA\), Maxwell Lagrangian density and gauge formulation. Full PDF page-by-page audit deferred.
- **SRC-SR-OPENSTAX:** OpenStax, *University Physics Volume 3*, §5.5, “The Lorentz Transformation.” https://openstax.org/books/university-physics-volume-3/pages/5-5-the-lorentz-transformation — opened; lines 22–60 establish frame transformations and contrast Galilean/Lorentz structure.
- **SRC-SR-KEYS:** OpenStax, *University Physics Volume 3*, §5 key equations. https://openstax.org/books/university-physics-volume-3/pages/5-key-equations — search-extracted equations reviewed for Lorentz factor and invariant interval.
- **SRC-GR-MIT:** MIT OpenCourseWare 8.962, Spring 2020, Lecture 12 “The Einstein Field Equation.” https://ocw.mit.edu/courses/8-962-general-relativity-spring-2020/resources/lecture-12-the-einstein-field-equation/ — opened; course description identifies Einstein curvature tensor and field equation. Lecture transcript/equation-level review is a next pass.
- **SRC-GR-UCI:** Herbert W. Hamber, UCI Physics 255, Lectures 11–13. https://ocw.uci.edu/lectures/einsteins_general_relativity_and_gravitation_lec_11_field_equations_1.html and https://ocw.uci.edu/lectures/einsteins_general_relativity_and_gravitation_lec_12_field_equations_2.html — search results reviewed; field equations, Einstein–Hilbert action, variational principle, Palatini identity and weak-field expansion are explicitly in course scope. Full lecture materials review deferred.
- **SRC-QM-OPENSTAX:** OpenStax, *University Physics Volume 3*, §7.3, “The Schrödinger Equation.” https://openstax.org/books/university-physics-volume-3/pages/7-3-the-schrodinger-equation — opened; lines 22–80 cover the time-dependent equation, potential and interpretation.
- **SRC-RQM-CUP:** Cambridge University Press, *Fundamentals of Particle Physics: Understanding the Standard Model*, Chapter 5, “From Wave Functions to Quantum Fields” (2023). https://doi.org/10.1017/9781009171595.006 — publisher chapter summary reviewed; Schrödinger, Klein–Gordon, Dirac and Maxwell equations lead to quantized fields.
- **SRC-SM-PDG2026:** F. Takahashi et al. (Particle Data Group), *Review of Particle Physics* (2026), “Standard Model and Related Topics.” https://pdg.lbl.gov/2026/reviews/standard_model_and_related.html — opened; lines 0–52 list current reviews on QCD, electroweak constraints, Higgs, CKM, CP violation, neutrinos, lattice QCD and related topics. The individual review chapters remain to be mined.
- **SRC-QFT-MIT:** MIT OpenCourseWare 8.323, Spring 2023, “Relativistic Quantum Field Theory I” readings. https://ocw.mit.edu/courses/8-323-relativistic-quantum-field-theory-i-spring-2023/pages/readings/ — search result reviewed; Peskin–Schroeder, Weinberg and Srednicki are listed as core texts.

## 7. Explicitly deferred

- Full theory cards with dates, key figures, actions, Hamiltonians, symmetries, conserved quantities, empirical successes and known failure domains.
- QED/QCD/electroweak Lagrangian-level cards and representation content.
- Curved-spacetime Maxwell equations and stress-energy derivation.
- Cosmology trunk: FLRW, Friedmann equations, ΛCDM, inflation, BBN and observational parameter dependencies.
- Optics derivation chain from Maxwell to eikonal/ray optics and Fourier optics.
- Detailed source-by-source verification of all historical arrows.
- Historical alternatives: Lorentz ether theory, pre-relativistic electrodynamics, Weyl/Kaluza–Klein, Einstein–Cartan, teleparallel and scalar–tensor branches.
- Mersearch source retrieval when a shared request lane becomes available.

## 8. QA receipt

- **Source-first:** live project charter and namespace schema read before writing; this is conventional physics Stage A, not SAT/H(s)H subject reconstruction.
- **Data gate:** no numerical physical calculation or synthetic fixture was used.
- **Provenance:** sources and read depth are recorded individually; search snippets are not described as full-source audits.
- **Identity control:** no global symbol identity is inferred from shared glyphs; detailed occurrence registration remains downstream.
- **Epistemic control:** derivations/limits are distinguished from historical sequence, framework relations and unresolved interfaces.
- **Completion status:** BACKBONE_EXPANSION_I_PUBLISHED; not complete map, not canonical, not H(s)H candidacy or physical validation.
