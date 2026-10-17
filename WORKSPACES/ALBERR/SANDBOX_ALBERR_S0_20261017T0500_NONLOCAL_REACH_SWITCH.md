# Alberr s0: algebraic nonlocal reach switch
2026-10-17T05:00Z | SANDBOXED GEN/DERIVED geometry | source-grounded reconstruction, not historical participation.

For the 3D torus knot gamma(t)=((R+r cos3t)cos2t,(R+r cos3t)sin2t,r sin3t), set lambda=r/R and x=cos(d/2), where d is endpoint phase separation. Stationary midpoint classes C=cos(3m) are C=+1, C=-1, C=-cos(3d/2)/lambda, and the antipodal d=pi family. Let c=4x^3-3x and s2=1-c^2. Squared half-chord divided by R^2 for C=+/-1 is F=lambda^2*s2+4*x^2*(1-x^2)*(1+/-lambda*c)^2. For the interior stationary class, F=s2*(lambda^2+(1-lambda^2)*4*x^2*(1-x^2)). The antipodal half-chord is lambda*R.

Eliminating x between F_plus=lambda^2 and dF_plus/dx=0 (after dividing common endpoint factors) gives resultant -2^62*lambda^16*(3lambda-2)*(3lambda+2)*Q(lambda), Q=288lambda^8-1039877lambda^6+125590lambda^4+2187lambda^2+2916. Q has one root in (0,1): lambda*=0.448110835824826, x*=0.395997577658. At the crossover the competing critical half-chords equal 0.448110835825R; local focal radius=0.738766487225R.

Deterministic fixtures (lambda, smallest half-double-critical chord/R, focal radius/R):
0.4,0.400000000000,0.765514889564
0.45,0.447109702925,0.737802715264
0.5,0.415818077078,0.715146325388
0.6,0.340106046756,0.688175685462
0.7,0.257713546672,0.684640020605
0.8,0.172690953425,0.699172887580

For lambda=0.5, the winning nonlocal chord has separation d=2.235402473941 radians; endpoint chord-tangent products <7e-16. Exact SymPy resultant/root count and numerical polynomial stationary-root enumeration passed. Algebraic branch crossing is established; interval-wide formal certification of the globally winning reach branch is not claimed. This curve is distinct from the 4D double-rotation fixture; no SAT/H(s)H physical claim follows.

Predecessor: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/alberr-torus-local-focal-gate-20261016t1737z-s3.md. Complete runnable Python and plotting code appear inline in the originating scheduled conversation.
