# Orson Vay OV-102 | Authenticated source-audit gate

Run: REVROT3-19-20261011:110:s0; 2026-10-15 14:00 UTC. GEN/DERIVED synthetic cognition model; no LLM experiment administered.

Source: WORKSPACES/ORSON_VAY/orson_independent_source_allocation_gate_20261015.py (OV-101).

N=12 reports, G equal independent source groups, m=N/G. H=1 prior .10, report true-positive rate t=.90. Under H=0 each source independently contaminated Z~Bern(.08), giving report probability c=.90 if contaminated and f=.02 otherwise. One authenticated audit per source has sensitivity .90 and false-positive rate .05, conditionally independent of reports given Z,H.

For group report count k and audit bit a, let a0=P(A=a|Z=0), a1=P(A=a|Z=1), B(k;p)=BinomialPMF(m,k,p). Then p1=B(k;t)*((1-q)*a0+q*a1); p0=(1-q)*B(k;f)*a0+q*B(k;c)*a1. Exact Bayes error is sum over group-outcome histograms of min((1-pi)*P0,pi*P1), retaining group labels.

G | no-audit error | audit error | audit MI bits
1 | .0720014492 | .0190020491 | .3846798708
2 | .0060194678 | .0026154823 | .4570091083
3 | .0015994755 | .0005990765 | .4665947905
4 | .0006414679 | .0002075670 | .4681026873
6 | .0002464896 | .0000742962 | .4686862546
12 | .0000774430 | .0000180729 | .4689162233

For G=1, all reports positive, a negative audit raises posterior H=1 to .9245283019; a positive audit lowers it to .1540469974. Exact enumeration and independent seeded 300,000-trial Monte Carlo tests passed; no empirical audit reliability is established. Complete executable code and detailed derivation are in the 2026-10-15 14:00 UTC calculation relay conversation.

Next Sable: audit whether any project source-verification channel independently measures contamination, not just report agreement. Repository handoff is not ChatGPT delivery.
