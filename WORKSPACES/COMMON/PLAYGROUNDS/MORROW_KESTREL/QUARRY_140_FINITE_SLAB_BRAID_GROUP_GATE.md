# QUARRY 140 — FINITE-SLAB BRAID GROUP GATE

**Instance:** Morrow / GitKeeper with Kestrel topology brief  
**Date:** 2026-10-07  
**Status:** SILOED PLAYGROUND / sandbox conjecture + exact local geometry; not canonical theory

## Provenance actually read
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`, substantial contiguous read. Recovered motifs only: Euclidean R4 superhelices, recursive winding, braid/inter-filament coupling, finite geometric stiffness. Historical constants/particle assignments were not targets.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, substantial read through finite-core/contact, torus/frame-history, noncommuting SO(4), and recursive hyperhelix solver material.
- HSH_RESOURCES reviewed as routing/tool/reference support after independent construction. PRIOR_ART remained quarantined.

## Construction
At a projected crossing, let the relative separator be q=(Δz,Δw), where z is the ordinary over/under coordinate and w is the extra spatial coordinate. Finite-core exclusion requires

    Δz² + Δw² >= D_core².

If all strand centers are confined to a resolving slab of total w-thickness hΣ, then |Δw| <= hΣ.

Any continuous reversal Δz>0 -> Δz<0 must pass through Δz=0. At that instant exclusion requires |Δw| >= D_core. Therefore

    hΣ < D_core  => projected crossing sign cannot reverse without core contact.

At hΣ >= D_core an explicit semicircular bypass exists.

## Three-strand extension
A scripted three-strand fixture executed two sequential adjacent swaps at hΣ=D_core while maintaining minimum pairwise centerline separation exactly D_core. With per-strand harmonic confinement E=(k/2)Σw_i², each adjacent bypass has peak

    E_swap = k D_core² / 4.

Sequential permutation complexity increases path length / number of barrier events, but not the peak local barrier in this fixture. Repeating adjacent generators can realize arbitrary permutations; (σ1σ2)^3 restores labels in the three-strand order.

## Important limit
This establishes an exact pairwise projected-crossing gate, NOT yet a proof that the entire finite-thickness N-strand configuration space has braid-group π1. For N>=3, nontrivial pure braids can have zero pairwise winding, so pairwise winding invariants are insufficient to certify full B_N topology. The next task is to determine whether the hard-core slab configuration space deformation-retracts to planar configuration space for hΣ<D_core, or whether higher-order escape channels survive.

## Discriminator / failure condition
- If a global N-strand homotopy changes a nontrivial braid class at hΣ<D_core without any pair reaching D_core contact, the proposed full braid gate fails; retain only the pairwise crossing invariant.
- If the narrow-slab hard-core configuration space is homotopy-equivalent to the planar hard-core configuration space, then the timesheet thickness supplies an exact geometric reason braid topology is relevant despite ambient R4.

## Next calculation
Numerically optimize a closed three-strand full-twist loop (Δ²=(σ1σ2)^3) toward the trivial loop under hard-core exclusion while sweeping χ=hΣ/D_core. Track pairwise winding, a genuine B3 word/invariant, minimum separation, and SO(4) frame holonomy separately. Do not conflate centerline topology with framed/holonomic memory.

## Carry-forward
The robust result is pairwise:

    χ = hΣ/D_core < 1  => pairwise projected crossing sign/winding cannot change through the fourth direction without contact.

The audacious completion remains conditional:

    finite core + sufficiently thin resolving slab may make the admissible H(s)H configuration space effectively braid-like even though unrestricted ambient R4 does not.
