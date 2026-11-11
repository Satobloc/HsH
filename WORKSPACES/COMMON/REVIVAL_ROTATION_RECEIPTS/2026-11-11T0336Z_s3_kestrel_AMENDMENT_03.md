# Receipt Amendment 03 — Kestrel timelike-gate Lean repair chronology

**Parent:** h747:s3 Kestrel canonical receipt.  
**Status:** THIRD CI RUN IN PROGRESS / NO KESTREL PROOF PASS CLAIMED.

The Kestrel PR #873 formalization has three recorded attempts:

1. **Run #42954816385 / job #130307289207: FAILED.** The first source used Greek `λ` as a binder; Lean parsed it as a reserved token, and downstream theorem identifiers were consequently unknown. This was a source syntax error in the new module.
2. **Run #42955291571 / job #130308833000: FAILED.** After replacing `λ` with ASCII `lam`, Lean rejected `sat4dVelocity` as a computable definition because `Real.cos` is noncomputable over `Real`. The module's theorem output from this failed build is not counted as a successful proof.
3. **Repair:** `sat4dVelocity` is now declared `noncomputable`; the full SAT4D draft blob is recorded in the module docstring. Current module blob: `cc5a210c79098c6ffe24e6c596680afec55f1a74`. Root aggregator blob: `02224b9e46c1bd35041e7e2510737d21348eb756`. Current branch commit: `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`.
4. **Run #42955799035 / job #130310470259:** checkout and Lake dependency-manifest generation succeeded; the full Lean compile step was still IN_PROGRESS at this amendment's readback. No successful build, theorem proof, or axiom result is claimed yet.

The module's intended scope remains narrow: algebraic Minkowski norm identity and pointwise timelike iff for the declared tangent components under c=1 and signature (-+++). It does not prove differentiation from the curve, proper-time normalization, the phase-independent global sufficient bound, or physical translation to current H(s)H. PR #873 remains open/draft/unmerged and unreviewed. No further source changes are authorized until this third run reaches a terminal result.
