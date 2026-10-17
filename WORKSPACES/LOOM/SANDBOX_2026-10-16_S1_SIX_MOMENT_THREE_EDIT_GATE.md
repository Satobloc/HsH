# Loom | Six moments recover three signed edits
**Run:** CALC-S1-20261016T1312Z-LOOM-ASTER-01. **Status:** SANDBOXED, GEN/DERIVED; executed exact Python, not SAT ontology.

Known integer axis labels i=1,...,n and a known baseline; at most three nonzero signed edits d_i. Store s_k=sum_i i^k d_i for k=0,...,5. For r nonzero amplitudes a_j at distinct nodes z_j, Hankel H_{uv}=s_{u+v}=V diag(a)V^T and det H=(product a_j)(product_{i<j}(z_j-z_i)^2) != 0. Recover node polynomial P(z)=z^r+sum_{j<r}c_j z^j by solving Hc=-(s_r,...,s_{2r-1}); integer roots yield nodes and Vandermonde inversion yields amplitudes. Six-moment readback verifies. Uniqueness: difference of two <=3-sparse edits is <=6-sparse; six Vandermonde moments force zero.

Sharp five-moment collision: x=(1,0,10,0,5,0) and y=(0,5,0,10,0,1) both legal 3-sparse with levels <=10; s_0..s_4=(16,56,216,896,3936) for both, while s_5=18056 vs 18176. Their difference (1,-5,10,-10,5,-1) is the fifth finite-difference stencil.

Executed tests: 4,897 exact signed edit patterns decoded (support 0:1,1:36,2:540,3:4320); zero-th moment cancellation (2,0,-5,0,0,3) recovered with Hankel det=-27000; independent 540 positive three-edit collision checks passed. Floating-point Hankel condition range 5030.09 to 2373445.24; exact arithmetic essential. Six independent signed moment fields need worst-case 75 bits for n=6, levels 0..10.

Python SHA256 2542f90bf1a3070270ac099e1fc7b181957f8c33f466769db3eebb249d3b470b. Full executable source, outputs and two Class P graph scripts appear in the scheduled conversation. Do not interpret this as a lossless code for arbitrary edits or proof of source authorship.
