# Nadir Voss | S3 geodesic sign and spectral cross-domain audit | 2026-10-23 06:24 EDT

Status: HISTORICAL_MATH_RECOVERY; symbolic pass, historical sign and spectral equivalence fail; CODATA compared conditionally. NOT BEDROCK, NOT INDEPENDENT PREDICTION. No Lean run.

## Source lineage
SAT primary: Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/THE_WHIRLIGIG.txt, Git blob e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057, 741 lines. Internal label [No. 53. 14.Mar.2026 Whirligig Unification: Schwarzschild to Hydrogen Audit], NOT a verified original message timestamp. Individual speaker authorship unresolved.
HsH historical compilation: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, 236 lines, section 5.4. Historical lattice terminology is NOT reinstated.
Current controls: BEDROCK.md blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8, STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Retrieved fully, governing sections reviewed.
Mersearch: REUSED completed Orson request 2026-10-21-orson-nlm-big-haul-math-001, pinned stable 1.0, 3 repository roots, 13,897 scanned files; no new Mersearch query executed, shared request left unchanged. Manifest 0f017d6f557d24c721e417d1fe3c49abf0653991. Exact formulas verified from primary sources.
Random reading: actual Python secrets.choice from bounded pools selected SAT WORLDTUBE THOUGTS.txt (blob 735f2a95e492944a244d1ceba31f33b6b5606119, 224 lines) and HsH Interconn (blob above). A first HsH pool draw selected a current, ineligible document; it was discarded and redrawn from an old-only pool. This was NOT uniform archive-wide random sampling.

## Exact original mathematical statements
Target A: X''(s) + (X''(s).X(s)) X(s)/R^2 = 0, called a GR geodesic constraint.
Target B: Laplace_S3 f = -lambda f; lambda = l(l+2)/R^2.
Claim: |X''|^2 equals lambda and this generates the hydrogen 1/n^2 spectrum.

## Unique geodesic sign correction
For X(s) on S3(R) in Euclidean R4 with X.X=R^2 and arclength |X'|=1, differentiate twice: X.X''=-1. Tangential acceleration is X''-(X''.X)X/R^2. Thus the corrected round-sphere geodesic test is:
  BEFORE: X'' + (X''.X) X/R^2 = 0.
  AFTER:  X'' - (X''.X) X/R^2 = 0.
Proof: for great circle X=R(cos(s/R),sin(s/R),0,0), BEFORE residual is -2X/R^2 (norm 2/R), AFTER residual is exactly zero. SymPy assertions pass. Finite differences with R=2.7 and 20,001 points: maximum AFTER residual 1.2943103904302026e-08; minimum BEFORE residual 0.7407407243551536.
This corrects a sphere projection sign, NOT a Schwarzschild geodesic: no Schwarzschild metric or Christoffel symbols appear.

## Existing 2:3 superhelix geometry
Y=(a cos(ps),a sin(ps),b cos(qs),b sin(qs)), R^2=a^2+b^2, v^2=a^2p^2+b^2q^2.
Exact tangential acceleration: A_T=Y''+(v^2/R^2)Y.
SymPy verifies |A_T|^2 = a^2 b^2 (p^2-q^2)^2/(a^2+b^2).
For a,b nonzero, the round S3 geodesic condition forces |p|=|q|. A 2:3 curve is allowed geometrically but requires nongeodesic dynamics. This independently complements Mira's preceding uncoupled Whirligig stationarity obstruction. No new action introduced.

## Laplace-Beltrami versus Coulomb spectrum
S3 eigenvalues lambda_l=l(l+2)/R^2 are mathematically correct. For f(chi)=cos(chi), Delta_S3 f=(f''+2cot(chi)f')/R^2=-3f/R^2, verified exactly. But unit-speed great-circle |X''|^2=1/R^2, not 3/R^2 at l=1. The claimed general identity fails.
With n=l+1, lambda_l=(n^2-1)/R^2, NOT 1/n^2. A free positive S3 kinetic Hamiltonian gives an increasing ladder, unlike the negative Coulomb hydrogen bound ladder.
Scale-free spectral-gap discriminator:
S3 first gaps: 3,5 -> second/first = 5/3.
Hydrogen E_n/E_R=-1/n^2 first gaps: 3/4,5/36 -> second/first = 5/27.
Ratio of these ratios = 9 EXACT. No additive offset or one scale factor repairs this. The existing historical V(chi)=-k/(R sin chi) is a separate potential whose radial eigenproblem must be solved; this calculation does not test it.

## CODATA verification, deliberately calibrated comparator
NIST 2022 CODATA, Web v9.0 (9 May 2024):
Rydberg constant 10973731.568157(12) m^-1, standard uncertainty 0.000012 m^-1; https://physics.nist.gov/cgi-bin/cuu/Value?ryd
Rydberg energy h c R_infinity = 13.605693122990(15) eV, standard uncertainty 0.000000000015 eV; https://physics.nist.gov/cgi-bin/cuu/Value?rydhcev
If, CONDITIONALLY, sphere radius is fitted to the Bohr radius and a standard electron kinetic-energy map is imposed, the S3 free l=0->1 gap is 3 E_R=40.8170793689700 eV. Infinite-nuclear-mass hydrogen n=1->2 is 3 E_R/4=10.2042698422425 eV. Signed model-minus-reference residual +30.6128095267275 eV. Because both use the SAME Rydberg anchor, the correlated propagated input standard uncertainty is 2.25*0.000000000015=3.375e-11 eV. No theoretical error bar exists; this is not a SAT significance statistic. Radius choice is calibrated and no independent SAT physical prediction is established.

## Gates and handoff
Geodesic printed plus sign FAIL, unique minus correction PASS; S3 eigenvalue PASS; claimed curvature/eigenvalue identity FAIL; claimed free S3-to-hydrogen 1/n^2 FAIL; 2:3 free geodesic FAIL; full existing Coulomb/interaction and Kerr/ER/timesheet physical mapping UNRESOLVED; CODATA conditional FAIL, independence NO; Lean NOT EXECUTED.
Next: recover highest-refinement historical V(chi) radial eigenproblem and actual induced metric/parameter map, preserving source notation and no unforced machinery. No BEDROCK/Contents edits, no private content.
Full executed Python, stdout, results, and three Class P figures are in the initiating conversation's Nadir Voss local archival bundle.
