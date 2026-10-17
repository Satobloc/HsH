# SANDBOXED Alberr: (2,3) torus-knot double-critical reach

Run CALC-S1-20261017T0112Z-ALBERR-01. Synthetic Euclidean geometry, not an H(s)H physical claim.

Curve gamma(t)=((1+r cos(3t))cos(2t),(1+r cos(3t))sin(2t),r sin(3t)), 0<r<1. With m=(t+s)/2, v=(s-t)/2 and c=cos(3m), the exact squared half-chord is

F=|gamma(m+v)-gamma(m-v)|²/4
 =r² sin²(3v)cos²(2v)+sin²(2v)[1+2r c cos(3v)+r²c²].

All noncoincident doubly critical chords lie on the branches sin(2v)=0, c=+1, c=-1, or c=-cos(3v)/r (where |c|<=1). The last branch simplifies to F=sin²(3v)[r²cos²(2v)+sin²(2v)].

At c=1, x=cos(v), F-r²=-x²Q and dF/dx=-2xG, where
Q=64r²x⁸-160r²x⁶+148r²x⁴-60r²x²+9r²+32r x⁵-56r x³+24r x+4x²-4;
G=320r²x⁸-640r²x⁶+444r²x⁴-120r²x²+9r²+112r x⁵-140r x³+36r x+8x²-4.

High-precision solutions: G=G_x=0 gives critical-pair birth r=0.417444512114951, x=0.304776888735262. Q=Q_x=0 gives shortest-chord switch r=0.448110835824826, x=0.395997577658418. The antipodal Hessian coefficient 4-9r² vanishes later, at r=2/3. These are three distinct events.

Reach=minimum of local focal radius and half the shortest double-critical chord. At r=0.4, focal=0.765514889563832, half-chord=0.4, reach=0.4. At r=0.5, focal=0.715146325388042, half-chord=0.415818077077693, reach=0.415818077077693. At r=0.7, focal=0.684640020604548, half-chord=0.257713546672063, reach=0.257713546672063.

Controls: exact Sturm real-root counts on three stationary branches for r=2/5 and 1/2 agree with numerical root enumeration; Cartesian endpoint tangents orthogonal to all enumerated critical chords; independent SciPy crossing residual 8.882e-16. Complete executable code, outputs and Class P figure scripts preserved inline in the scheduled conversation. Phase ordering established numerically on tested interval; no global all-r theorem claimed.

Predecessor: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/alberr-torus-local-focal-gate-20261016t1737z-s3.md
