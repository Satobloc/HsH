# Nadir Voss | GP-B joint covariance conditional bound | 2026-10-27T13:12Z

**SANDBOX / CURRENT ASSISTANT SOURCE RECONSTRUCTION, NOT HISTORICAL NADIR.** No H(s)H prediction or BEDROCK promotion.

**Real system:** Gravity Probe B, Earth-orbiting gyroscopes, 2004-08-28 to 2005-08-14. Everitt et al., Phys. Rev. Lett. 106, 221101 (2011), Table II, DOI 10.1103/PhysRevLett.106.221101. Published joint geodetic -6601.8 +/-18.3 mas/yr, frame dragging -37.2 +/-7.2 mas/yr; GR baseline -6606.1 and -39.2 mas/yr. Full experimental 2x2 covariance and systematic likelihood NOT recovered.

**Executed Python exact-fraction arithmetic:** standardized residuals a=43/183=0.23497267759562843 and b=5/18=0.2777777777777778. For a DECLARED two-channel Gaussian covariance with unknown correlation rho in (-1,1), chi2(rho)=(a^2+b^2-2*rho*a*b)/(1-rho^2). Exact identity chi2(rho)-b^2=(a-rho*b)^2/(1-rho^2)>=0. Conditional minimum is b^2=25/324=0.07716049382716049, attained at algebraic rho*=a/b=258/305. **rho* is NOT a measured or fitted correlation.** Independence reference chi2(0)=159589/1205604=0.13237265304361964. Thus marginal error bars do not uniquely fix the joint score. No experiment-wide joint significance or p-value inferred.

**Original math provenance:** SAT Donut canon Git blob be985c292bfcae7352983d596c38e7f172f6029d is assistant-generated loop/holonomy/torus mathematics with later Nathan-informed corrections. Nadir Playground 001 blob a9e8798df8873e98574ce9271ec05c91892210f5 is assistant-created finite-core SO(4) candidate. Nadir Playground 004 blob e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f is source genealogy and closure repair. HAGALAZ_DEF+ blob f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4 labels oriented similarity a CANDIDATE. No physically derived GP-B worldtube connection/readout exists yet.

**Lean:** draft PR #744 https://github.com/Satobloc/HsH/pull/744, stacked on prior compiled Nadir PR #715. Six conditional Mathlib theorems submitted, imported into verification root. CI run #40510863408: PENDING at submission; verify actual compiler logs before declaring proof. Existing prior #715 CI #40480990700 SUCCESS, 8945 jobs, six conditional theorems, separate axiom audit skipped.

**Method:** BEDROCK 4cabda482c48c217614b868a2138409275df9bf7; Steering b9b8de55f8d5add7c42cf80be7c34677ee36305e; Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0. Four Mersearch bridge lanes occupied and untouched; bounded direct original-source GitHub reads are NOT an exhaustive Mersearch run. Python source and full packet are retained in run artifacts. No scheduler change, secret, signet, cross-chat delivery or theory promotion.

**Next:** recover experiment's actual covariance/likelihood, specify physical native SO(4) connection and observation projection, independent hostile review, and preserve Enheduanna's source-critical remit at the next handoff.
