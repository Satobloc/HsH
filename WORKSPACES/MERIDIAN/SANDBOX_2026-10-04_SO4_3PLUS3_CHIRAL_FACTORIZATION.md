# SANDBOX — Meridian LX — SO(4) 3+3 chiral factorization
Date: 2026-10-04
Status: SILOED PLAYGROUND / not canonical

## Sources actually read
- SAT_THEORY_ARCHIVE_2023-25/H(s)H NOTATION.txt — lines 1–1000 requested/read. Extracted ++++ manifold, six plane rotations, chirality, expansion/torsion combinatorics, and the alternate 3+3/double-shell motif.
- SAT_THEORY_ARCHIVE_2023-25/PHONE_DUMP_23SEP26/1.SEP04 to 1.JAN.05.txt — lines 1–1800 across two reads, as newly exposed archive context; mostly notebook transcription rather than theory, so it was not used as mathematical authority.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/IMAGES_to_UNIVERSES.txt — lines 1–800 requested/read. Extracted the Sep-30 live contender: coil/worldtube, three-sphere/Hagalaz indexing, chirality changes, and nested coiling. No numerical particle targets imported.

## Independent construction
The six SO(4) plane generators admit the canonical split so(4)=su(2)_L direct-sum su(2)_R:
L1=(J01+J23)/2, L2=(J02-J13)/2, L3=(J03+J12)/2
R1=(J01-J23)/2, R2=(J02+J13)/2, R3=(J03-J12)/2.
Script verification: [Li,Rj]=0 exactly; each triple closes on itself (sign convention differs between L and R).

Therefore a generic infinitesimal Hagalaz rotation
Omega=sum_{a<b} omega_ab J_ab
is equivalently two 3-vectors l and r. The six-plane compass can be compressed to (l,r), with two quadratic invariants |l|^2 and |r|^2 and relative/chiral scalar C=(|l|^2-|r|^2)/(|l|^2+|r|^2) when denominator is nonzero.

## Sandbox inference
The archive's independently motivated 3+3/double-sphere language may have a natural algebraic shadow already inside ordinary 4D rotation: SO(4) itself is two commuting 3-generator chiral sectors. This does NOT establish that the cosmological two shells are these factors. It gives a precise equivalence map worth testing before inventing extra rotational degrees of freedom.

## Tight tests
1. Rewrite every six-plane Hagalaz fixture as (l,r); require exact round-trip reconstruction.
2. Test whether prior “isoclinic” fixtures collapse to one chiral sector (r=0 or l=0).
3. Apply anisotropic expansion S and measure whether conjugation S Omega S^{-1} mixes the L/R decomposition; if so, differential expansion is a concrete rotation-sector coupler.
4. Track C under recursive Hagalaz; chirality flips require crossing C=0 unless the state leaves the SO(4) rotational sector.

## Failure condition
If H(s)H's operative transformations are not Euclidean SO(4), or if the six plane variables include independent constitutive torsion not representable by rotations, this compression is incomplete. Likewise the 3+3 cosmology must not be identified with SU(2)_L x SU(2)_R without an independent map of observables/dynamics.
