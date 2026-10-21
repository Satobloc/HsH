# Cruller | Physical 3D mesh of corrugated emission wavefront and repeat observer intersections (SANDBOX)

**2026-10-21. Code executed, plot, animation, and watertight STL generated.**

Nathan requested a larger geometric distortion as an actual surface projected into observable three-space, revealing how a fixed observer could intersect a propagating surface, then cease intersecting, then intersect again.

Construct explicit embedded star-shaped, evolving 3D surface:
r(t,theta,phi)=t*[1+0.72 sin(theta)^2 cos(2phi-5.5t)] (c=1 normalized).
Coordinates X=r sin(theta)cos(phi), Y=r sin(theta)sin(phi), Z=r cos(theta). Since 0.72<1 the radius stays positive and the surface is closed and embedded at each t>0. The scalar r is actual coordinate distance of each vertex, not a color map.

Fixed observer at x=2.1,y=z=0. Its relative crossing condition is r(t,pi/2,0)=2.1, equivalent to t*(1+0.72 cos 5.5t)=2.1. SciPy brentq root-finding found five crossings for 0<t<4.65:
t=2.0104504943, 2.6212732719, 3.0596426002, 3.8363884534, 4.1466615373.
Thus this *imposed* corrugated kinematics exhibits interleaved inside/outside intervals, repeated contact by the same fixed observer.

Artifacts:
- /mnt/data/cruller_physical_wavefront_multi_crossing.png (large 3D solid shaded geometry, equatorial cut, crossing time chart)
- /mnt/data/cruller_physical_wavefront_multi_crossing.svg
- /mnt/data/cruller_physical_wavefront_multi_crossing.gif (animated surface)
- /mnt/data/cruller_physical_wavefront_surface.stl (watertight 3D triangular mesh, suitable for 3D viewing)
- /mnt/data/cruller_folded_wavefront_surface.py

**Essential physics limitation:** This is an intentionally prescribed rapidly rotating surface, *not* a null wavefront integrated from a Lorentzian metric, not proven compatible with Einstein equations, energy conditions, or causal wavefront transport. The time dependence has local coordinate radial speeds, including possible inward motion and speeds beyond c, which would be unacceptable for the same simple radial null generators in Minkowski space. A general wavefront may have folds/multivalued projected directions and multiple geodesic arrival paths, but the animation does not derive a physically admissible light signal or demonstrate actual stellar blink-out. For a single flash, multiple images reach at different delayed times along different paths, often seen as distinct pulses, not necessarily persistent absence followed by return. Actual total flux and detectability must be calculated. Surface crossings as a mathematical illustration should not be described as a verified Cruller prediction.

Next physically constrained calculation: specify proper 3+1 Lorentzian g sourced by allowed finite-core response, integrate a congruence of null geodesics, project equal-observer-time slices into three-space, compute caustic singularity, observer intersections, affine delays, redshift and all-path flux. Independent metric derivation must come before invoking Rubin prediction.