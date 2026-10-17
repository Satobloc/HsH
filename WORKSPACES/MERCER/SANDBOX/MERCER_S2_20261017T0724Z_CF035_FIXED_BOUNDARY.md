# Mercer CF035 | k=0 fixed-boundary third-order continuation

SANDBOXED / GEN-DERIVED. Source: HsH CF033 second-order solver, blob 9854d8448a82b92d57114c6b54d6f8d0af349907; CF034 third-order report, blob 787538ba8d7ea626d40c6c7c9947e300d386e9ca. Reconstructed mathematical result, not authenticated historical Mercer participation or a physical SAT/H(s)H claim.

For n=3/2, solve u''+2u'/z+z²u^(5/2)+eps*u^(3/2)=0, u(0)=1,u'(0)=0,u(R)=0, M=-R²u'(R). With x=z/R(eps), U(x,eps)=u(Rx,eps), the fixed-boundary equation is U_xx+2U_x/x+R^4*x²U^(5/2)+eps*R²U^(3/2)=0; U(1)=0 and M=-R*U_x(1). The boundary-vanishing sensitivities remove the apparent fixed-z endpoint singularity under regularity assumptions.

Numerical symmetric degree-7 continuation coefficients, j=0..4:
R=[2.881732424034,-0.205785506932,-0.133443731222,0.022978383903,0.019214962960]
M=[3.461991460928,-1.489512399295,0.485847705511,-0.058985678688,-0.020639823506].

Independent DOP853 moving-boundary integration and fixed-boundary BVP agree to max 9.095e-13 across five eps values. Cubic remainder slopes: R 3.989160, M 3.985098; quartic slopes: R 5.041668, M 5.020411. All executed assertions passed. Numerical coefficients, not a formal analyticity theorem. Full executed Python source SHA256 8988bce1ed52735fbefecc5794bfb4010fa9063aabd8eb4b7e0c62c3a1cf9454, preserved in scheduled conversation.
