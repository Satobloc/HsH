# Meridian | Cruller second-order instability under fixed length with variable cosmic radius | 2026-10-21

**SANDBOX. Conditional comparator and an important new discriminating result.** We extend the executed signed-mode curvature/length second variation in `SANDBOX_2026-10-21_CRULLER_SIGNED_WINDING_INSTABILITY.md`. The previously stated `tau_crit=0.2223979` is NOT robust to a physically consequential constraint choice; it belongs only to **fixed R with variable arclength**. This note tests **fixed arclength but variable R**, NOT fixed arclength at fixed S3 radius and NOT conserved total angular momentum. No contemporary SAT constitutive law or source-verified maximum bending energy is inferred.

## Exact constraint identity

Write the unit-radius perturbed four-dimensional S3 curve as `x_h(u)=(C(u)+h V_m(u))/sqrt(1+h²)`. Let its dimensionless length and curvature integral be
```
l(h) = integral |dx_h/du| du
i(h) = integral kappa[x_h]^2 ds_h.
```
The physical scaled path `X_h(u)=R(h) x_h(u)` has physical arclength `L(h)=R(h)l(h)` and physical `I2(h)=i(h)/R(h)`. Choose radius to conserve actual physical arclength exactly:
```
R(h)=R0*l(0)/l(h);
L(h)=R0*l(0), all h with l(h)>0.
```
This is the complete **global** length constraint, not an inextensible local material construction. The scaled curve changes cosmic S3 radius and may also change its local arclength distribution.

For conventional comparison `E=T L+(B/2) I2`, tension contribution becomes constant exactly, and
```
E(h) = T R0 l0 + [B/(2 R0 l0)] l(h) i(h).
```
For these Fourier normal modes, `l'(0)=i'(0)=0` (independently checked numerically in previous study); hence
```
E''(0) = [B/(2 R0 l0)]*[l''(0)*i0+l0*i''(0)].
```
All `B>0` conclusions depend only on the sign of the bracket. This formula is an exact scaling-and-constraint identity given the stipulated energy comparator. In Planck units, `R0/l_P` and `B/(E_P*l_P)` are dimensionless; `E''/E_P=[B/(E_P*l_P)]*[l''i0+l0i''] / [2(R0/l_P)l0]`. It introduces NO fitted correction factor or new material force.

## Result, using preceding numerically verified 8192-point spectral second variations

Parent `l0=2pi sqrt(13/2)=16.01904224441409`, `i0=18.3887230498`. For representative signed modes, the dimensionless `R0*E''/B` equals:

|m|l''|i''|R0 E''/B|
|:--:|--:|--:|--:|
|-5|+1.243387|+0.853271|+1.14030|
|-4|-9.337097|+5.509187|**-2.60457**|
|-3|-14.988646|+18.650157|+0.72213|
|-2|-15.711259|+19.408915|+0.68675|
|-1|-11.504937|+5.117347|**-4.04475**|
|+1|+11.694511|+11.706547|+12.56551|
|+2|+30.687634|+118.246743|+76.73698|

The `m=-1` and `m=-4` normal-frame daughter directions lower **pure bending energy** while total filament length is constrained to stay exactly constant via permitted global radius expansion. They do not require `T R²/B>0.2224`: tension becomes a constant. Both m=-2 and m=-3, although they reduce unscaled length, **do not** lower length-constrained bending energy in this family. Thus mere decrease in length or coiling chirality is not sufficient to predict a superhelix.

**Critical interpretation:** This is an admissible instability **only if** the complete Cruller can change its S3 radius and globally redistribute material arclength under the constraint. If geometry holds the cosmic sphere radius fixed, this calculation does not apply. If local inextensibility or fixed SO4 angular momenta/spin are imposed, this is not a full constrained second variation. It does NOT establish a physical superhelical onset, amplitude after bifurcation or energy release. The m=-1 and m=-4 generators still require tests for equivalence under rigid SO4, gauge re-framing, changes in braid degree, and finite-core reach.

## Mechanics/provenance

Relevant historical bending forms appear explicitly in `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/{GRQM.txt,Interconn.txt,SAT-GIGAPACK.txt}` and the Unodrop/One Drop records. Their bending-derivative parameter `lambda`, rigidity dimensions and maximum energy ceiling remain not independently resolved. The quadratic **arclength** bending comparator here is declared; do not attribute its exact physical law to the NLM archive without derivation.

**New physical discriminator:** Whether the Cruller is permitted to expand its global radius while winding dictates whether the putative transition is tension-driven (`R` held fixed) or bending-driven (`L` held fixed via `R` adaptation). The two regimes generate different mode rankings and thresholds. Planck-unit practice per BEDROCK ND-2026-10-21-01.

Computation: Python arithmetic re-evaluation of signed-mode numerical second variation carried out 2026-10-21; no new four-dimensional numerical integration claimed here. No new Mersearch request because the shared request file belonged to Orson.

Meridian, assistant SANDBOX.
