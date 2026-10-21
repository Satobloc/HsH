# Meridian | Cruller: reverse winding is relative frame rotation, not spontaneously reversed handedness | 2026-10-21

**SANDBOX / geometric clarification, prompted by Nathan Direct.** Parent handedness is already specified in SAT/H(s)H. Do NOT treat negative integer daughter-index `m` in an arbitrary moving frame as an independently created reverse-chiral physical filament.

## Existing native fixture

`C(u)=(cos2u,sin2u,cos3u,sin3u)/sqrt2` on `S3`; `V_m=cos(mu)N1+sin(mu)N2` uses periodic normal frame from `SANDBOX_2026-10-21_CRULLER_SIGNED_WINDING_INSTABILITY.md`. Exact frame rotation is `A=N1'(u)·N2(u)=12/sqrt26`. With the prior frame convention, relative normal derivative is `D_u V_m=(m+A)\cdot [90-degree-rotated V_m]` (up to corresponding sign choice for the oriented normal basis). Thus m negative can cancel **transport rotation** without flipping the parent orientation. The sign of bare m is NOT gauge invariant. Under a normal-frame rotation `N1+iN2 -> e^{i gamma(u)}(N1+iN2)`, normal coordinate phase transforms oppositely; the sum phase-gradient plus connection is invariant. The winding number changes by an integer for a periodically returning frame with nontrivial gauge winding.

The parent `C` uses a `2:3` fixed oriented angular motion; all tests of m=-1 and m=-4 remain on the same S3 without reversing either parent angular clock. A negative m is a *relative* counterrotation around a rotating carrier. It is not physical proof of reversing a primary worldtube, reversing time, invoking a reflection Q with det=-1, or creating antiparticles.

## Two independent mechanisms to test physically
1. **Kinematic frame effect (already present):** the material daughter looks counterwound in the first-order moving frame because the reference frame rotates. A parallel/Bishop-transported frame can display the same curve with different numerical phase progression. This can occur with no physical chiral reversal.
2. **Actual twist-to-writhe conversion (requires physics):** for an ordinary oriented closed 3D ribbon, `Lk=Tw+Wr`; with fixed material linking and suitable imposed torsion, carrier writhe may take the opposite sign to local material twist, depending on constrained geometry and energy. The rule is NOT directly transferable as a scalar universal theorem to arbitrary 4D worldtube normal bundles (rank-three normals and SO3 transport); specify director/normal-plane reductions before using the 3D identity. Prior SANDBOX: `PLAYGROUNDS/MORROW_KESTREL/QUARRY_068_TOPOLOGY_AS_TWIST_WRITHE_BUDGET.md`.

## Crucial audit of previous 'instability' language
The reported energy threshold `T R²/B>0.2223979` and the fixed-length-rescaling negative modes were computed in the explicitly chosen periodic moving frame and particular mode family. A physical instability is frame invariant; however assigning the result to physical 'reverse winding' solely from negative m is not justified. Furthermore, `m=-1` may contain symmetry/gauge directions; project all candidate modes orthogonal to tangent reparameterizations and ambient SO4 rigid motions, and identify frame-invariant normal holonomy before assigning *any* material secondary helix. Enforce actual material arclength and physical conservation conditions. No known primary handedness sign is treated as newly emergent.

## Native follow-up
Define an observable relative angular phase from parallel-transported director along the parent. Compute periodic holonomy and daughter twist in that gauge. Compute Hessian after quotienting SO4 and reparameterizations; compare modes by invariants, not ±m labels. Then test whether material twist/elastic energy accumulated in native Klein Fabric can drive oppositely directed geometric writhe without primary chirality inversion. Use Planck units; previous arbitrary classical elastica comparator not adopted as SAT physics.

Status: exact normal connection inherited from executed prior solver; this is a conceptual/analytic type correction; **no new eigenvalue/Hessian calculation claimed**. Meridian.
