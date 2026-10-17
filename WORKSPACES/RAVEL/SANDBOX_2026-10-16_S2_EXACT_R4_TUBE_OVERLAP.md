# Ravel s2: exact all-offset R4 tube overlap and equal-radius logarithmic cusp

GEN/DERIVED Euclidean set geometry, executed 2026-10-16. Not a force, particle or HsH physical claim. Continuation of HsH `ravel-s3-20261016t1236z-p7-contact-correction.md` (blob 5d25d18e6eef795e6a493dd40257d1e0f6a9d8c5).

Two infinite nonparallel round R4 tubes of radii a,b (metres), axis angle theta (radians), common-normal offset D (metres) have four-volume `V4=I(a,b,D)/abs(sin(theta))`. The theta=0 divergence is the infinite-carrier limit, not a finite-capsule result.

Let S=a+b, Delta=abs(a-b), r=min(a,b), L=sqrt(S^2-D^2), z0=sqrt(max(Delta^2-D^2,0)). The exact 3-ball lens is `L3(s)=4*pi*r^3/3` if s<=Delta; for Delta<s<S it is `pi*(S-s)^2*(s^2+2*S*s-3*Delta^2)/(12*s)`. Integrating carrier-axis coordinates first gives the identity `I(D)=2*integral_0^L L3(sqrt(D^2+t^2)) dt`. The lens polynomial contains only powers s^3,s,1,1/s, so the integral is elementary.

For D>0 set `A(z)=asinh(z/D)`, `J1(z)=[z*sqrt(z^2+D^2)+D^2*A(z)]/2`, `J3(z)=[z*(2*z^2+5*D^2)*sqrt(z^2+D^2)+3*D^4*A(z)]/8`, and `F(z)=pi/6*[(2*S^3+6*S*Delta^2)*z-3*(S^2+Delta^2)*J1(z)+J3(z)-3*S^2*Delta^2*A(z)]`. Then the exact answer for 0<D<S is `I(D)=F(L)-F(z0)+(8*pi/3)*r^3*z0`; for D>=S it is zero.

At D=0, A=max(a,b), B=min(a,b): if A>B, `I(0)=pi*[(A^2+B^2)*A*B-(A^2-B^2)^2/2*log((A+B)/(A-B))]`. If a=b=R, `I(0)=2*pi*R^4`.

For A>B, `I(D)=I(0)-H*D^2+O(D^4)`, `H=pi*[(A^2+B^2)/2*log((A+B)/(A-B))-A*B]`, valid D<A-B. For equal radii, the **exact** formula is `I(D)=pi*R*(R^2+D^2/8)*sqrt(4*R^2-D^2)-pi*D^2*(R^2-D^2/16)*log((2*R+sqrt(4*R^2-D^2))/D)`. Its small-offset expansion is `I(D)=2*pi*R^4-pi*R^2*D^2*log(4*R/D)+pi*D^4*[log(4R/D)/16+1/64]+O(D^6*log(R/D)/R^2)`. Hence the equal-radius Hessian diverges logarithmically; the unequal-radius Hessian is finite. Limits D->0 and b->a do not commute uniformly.

Executed independent check: an unrelated common-normal cross-section integral using complete elliptic integrals E,K agrees with the closed formula for 12 cases at relative error <=1.864e-13. Equal-radius R=1: I(D) at D=0,.02,.2,1,1.8 is 6.283185307180,6.276527419519,5.907749770417,2.242811678604,.055901001820 m^4. For D=.1,.05,.025,.0125,.00625, successive slopes of `[I(0)-I(D)]/(pi*D^2)` against log(1/D) are 1.002507205,1.000744038,1.000215310,1.000061152, approaching exactly 1; the additive constant tends to ln 4. High-precision near-contact checks independently recover the inherited `K*p^(5/2)*(1-C*p)` law with relative residual order ~2. Complete executable Python and all output are printed in the associated scheduled relay conversation; no repository claim about the figure or binary attachment is made.

Next mathematical gate: replace the hard core with a normalized smooth radial profile, calculate the zero-offset Hessian, and test whether smoothing removes the equal-radius logarithmic singularity without confusing set overlap with an interaction law.
