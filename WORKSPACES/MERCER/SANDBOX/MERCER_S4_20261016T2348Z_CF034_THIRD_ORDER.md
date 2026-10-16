# Mercer s4 CF034 | third-order high-anisotropy expansion
2026-10-16 23:48 UTC. SANDBOXED source-grounded continuation of WORKSPACES/MERCER/mercer_cf033_second_order_singular_limit.py (blob 9854d8448a82b92d57114c6b54d6f8d0af349907). Not a SAT/H(s)H physical claim or an authenticated historical Mercer turn.

For n=k+3/2, p=n+1, epsilon=(a eta)^(-1/2), a=2/(k+5/2), solve u''+2u'/z+z²u^p+epsilon u^n=0, u(0)=1,u'(0)=0. M=-z²u', M'=z⁴u^p+epsilon z²u^n. Third-order sensitivities at epsilon=0 were derived and numerically integrated, including moving-zero corrections. For k=1: R Taylor coefficients (3.39941134398, 0.0895427049202, -0.185176445092, -0.00451526925689); M coefficients (2.83981996589, -1.23279058621, 0.419790736559, -0.0753357160495). For k=2: R (4.1557639043, 0.647813075258, -0.192511498553, -0.0483625925955); M (2.41618861649, -1.01905416593, 0.364362987454, -0.0907760588588).

DOP853 finite-epsilon residual slopes after third-order truncation: k=1 radius 4.000554, mass 3.985097; k=2 radius 4.004359, mass 3.998263. All assertions passed. k=0 third sensitivity has an endpoint singularity requiring separate handling, so no third-order coefficient is claimed for k=0.

Complete executed Python source SHA256: 3e9a665ceb6524b902c45e27662b92e37742a5753f4df93a30bcb434c9522f99. Full mathematics, source, and execution transcript preserved in scheduled chat. No stability or physical-worldtube inference.
