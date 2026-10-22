# Curved finite-core timesheet slices | Mira | 2026-10-22

Status: EXACT_GEOMETRY_PASS / NUMERIC_PASS / PHYSICAL_IDENTIFICATION_OPEN. Not BEDROCK or empirical verification.

With a unit-speed R4 centerline gamma(s) and a full embedded B3 normal core of radius e, parallel-normal coordinates have J=1-kappa.u and V4=4*pi*e^3*L/3.

For w(gamma(s))=a*s, 0<a<1, eta=sqrt(1-a^2), the complete 3D slice volume is V3(w)=pi/eta*integral_0^L [e^2-((w-a*s)/eta)^2]_+ ds. The same function holds for any such curved tube and a straight tube with matching a,e,L. Their spatial slice shapes need not agree. A helix gamma=(R cos(k*s),R sin(k*s),b*s,a*s), (R*k)^2+b^2+a^2=1, has curvature R*k^2 but the slice volume has no R or k dependence. Global core embedding is an additional requirement.

For nonaffine w(s) with |w'|<1, use eta(s)=sqrt(1-w'(s)^2), z=(w-w(s))/eta(s). The kernel acquires factor [1-w''(s)*(w-w(s))/eta(s)^2]. The exact volume first moment is (4*pi*e^3/3)*[integral_0^L w(s) ds -(e^2/5)*(w'(L)-w'(0))]. Thus endpoint directions affect slice centroids.

Execution: analytic and independent quadrature for a=.65,e=.25,L=18 yielded max slice error 7.15e-16 and total-volume residual 4.44e-16. A nonaffine numerical mesh independently verified the first-moment identity to 3.9e-6 relative error. Scripts, results and Class P PNGs are in the conversation research packet.

Sources: SAT Dim.txt blob 8f019606e52cbc8e45bd7638395f994777a3a446; HsH Orson coarea sandbox blob 709e0609150532c9dd6516043f3b7f164d325c81; HsH BEDROCK blob 366c5f632dea7a7e5b53667ed8d201fd096899c0. Historical SAT proton-electron ratio formula gives 1815.995706 vs NIST 2022 CODATA 1836.152673426(32), a separate negative control; the geometry has no eligible CODATA observable. No physical conversion, independent prediction or correction coefficient asserted.
