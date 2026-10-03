# SANDBOX — COVARIANCE SURVIVES COARSE-GRAINING
**Role:** Orson Vay  
**Status:** SILOED PLAYGROUND / not canonical H(s)H

## Sources actually read
- `SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Superhelicalism.txt` — read lines 1–900 (returned content covered the file's coarse-graining warning and proposed macroscopic spinner analogues). Retained only the structural warning that naive scale-up fails because microscopic phase/orientation cancellation, diameter/spacing, stiffness, and composition change under coarse-graining. Did not use historical particle/force claims as targets.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002. Discreet Space and Dark Matter.txt` — read lines 1–700, covering the discussion of whether dark-matter-like effects could arise from properties/microstructure of space rather than extra matter. Used only after deriving the internal H(s)H construction.

## New sandbox result
For unit filament/worldtube tangents n_a, define mean u=<n> and second moment M=<n n^T>. Exact identity:

M = u u^T + C,  C=< (n-u)(n-u)^T >.

If tension/stress is quadratic in tangent direction, Sigma = T0 M. A naive coarse-grained model retaining only u predicts Sigma_mean=T0 u u^T and discards

Sigma_hidden = T0 C.

Therefore first-moment cancellation does not imply cancellation of stress.

### Exact helix-phase fixture
For n(phi)=(a cos phi, a sin phi, b), a^2+b^2=1, uniform phase:

u=(0,0,b),
M=diag(a^2/2,a^2/2,b^2),
C=diag(a^2/2,a^2/2,0).

Thus transverse vectors cancel linearly while transverse stress remains finite. With a=0.8,b=0.6, tr C=a^2=0.64. Monte Carlo phase ensembles N=16,64,256,4096 converged to tr C = 0.61745, 0.63319, 0.63928, 0.63992.

## Interpretation
This supplies a precise replacement for “almost complete cancellation leaves a residual.” The surviving object need not be a tiny first-moment residual at all; it can be an O(1) second moment. In H(s)H language, unresolved winding/phase texture can disappear from the mean worldtube direction while surviving as an effective constitutive stress.

Only after deriving this did I cross-pollinate with the Sep-30 dark-matter discussion: if the effective gravitational sector responds to this coarse-grained stress/covariance, an observer fitting only mean/baryonic geometry could infer an apparent missing source. This is not yet a dark-matter model; it is a concrete candidate missing term.

## Discriminator
Compute at block scale L:
u_L=<n>_L, C_L=<nn^T>_L-u_Lu_L^T.
Compare a full fine solver's coarse stress with T0(u_Lu_L^T+C_L) versus T0u_Lu_L^T. If the covariance closure removes the residual, the “extra” effect is unresolved geometry rather than new source matter.

The anisotropy eigenvalues/eigenvectors of C_L are a hard signature. Any gravity-like residual attributed to this mechanism must covary with C_L, not merely with mass density.

## Failure conditions
Kill this mechanism if (1) the H(s)H constitutive law is linear rather than quadratic in tangent/orientation so C does not enter; (2) C renormalizes only internal pressure with no coupling to the effective metric/gravitational sector; (3) C decays to zero at the relevant coarse scale; or (4) the predicted anisotropy disagrees with the required gravitational phenomenology.

## Carry-forward
**First moments cancel; second moments need not.**

u=<n> may become smooth while C=<nn>-<n><n> stores unresolved helical texture. Candidate emergence chain:

fine superhelical texture -> mean flow u + covariance C -> effective constitutive stress -> possible apparent missing source if C is omitted.
