# Ravel s4 | p^(9/2) coefficient for unequal-radius R4 tube contact
Run CALC-S4-20261017T0348Z-RAVEL-ORSON-001. GEN/DERIVED Euclidean set geometry. Source-grounded Ravel continuation, not historical participation or a physical H(s)H claim.
Prior: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-s3-20261016t1236z-p7-contact-correction.md, blob 5d25d18e6eef795e6a493dd40257d1e0f6a9d8c5.

For radii r,t>0 meters and penetration p=r+t-d>0, nonparallel infinite 4D line tubes have V4=I/abs(sin theta).
I=K*p^(5/2)*(1-C*p+D2*p²+O(p³))
K=16*pi*sqrt(2)*r*t/(15*sqrt(r+t))
C=(8r²+3rt+8t²)/(28rt(r+t))
D2=(41rt-16(r²+t²))/(224rt(r+t)²).
Units K m^(3/2), C m^(-1), D2 m^(-2), I m^4.
Equal radii: D2=9/(896R²). D2 zeros: t/r=(41±sqrt657)/32=0.480249648876,2.082250351124.

Derivation: Set z=r-pu, x=sqrt(p)X, y=sqrt(p)Y, w=sqrt(p)W in the orthogonal tube inequalities. Integrating u exactly yields I=p^(5/2)∫[1-f_r(p,Y²+W²)-f_t(p,X²+W²)]_+ dXdYdW, f_R=(R-sqrt(R²-ps))/p. Rescale X=sqrt(2t)xi, Y=sqrt(2r)eta, W=sqrt(2rt/(r+t))zeta. Define A1=eta²+t*zeta²/(r+t), A2=xi²+r*zeta²/(r+t), H=A1²/(2r)+A2²/(2t), J=A1³/(2r²)+A2³/(2t²). The positive-part expansion about 1-s² gives C=(15/14)<H>, D2=(15/2)[-<J>/9+<H²>/4]. Sphere moments evaluate to the coefficient above.

Independent adaptive nested exact-lens quadrature at r=1.2m and t/r=.25,.5,1,2,4 gives max relative error 3.987843389e-11 at p/min(r,t)=.003. Equal-radius residual halving orders 3.02220617,3.01108974. Symmetry, homogeneity, equal-radius limits, and coefficient-zero assertions passed. Executed Python SHA256 56d5ce43b882659f2e44a5ff8093a3bb48f018fb4168b923974b158b323def47. Full executable and stdout preserved in the visible relay conversation. Set overlap does not establish force or physical worldtube dynamics.
