# OV-77 reproduction formulas (exact rational arithmetic)

Let reviewer accuracy q=7/10, and worlds LOW and HIGH have prevalence pi=1/5 and pi=4/5 respectively.

Retention probabilities (YES, NO): LOW (15/19, 5/31), HIGH (15/31, 5/19).

For each world, the archived YES probability is rY * [pi*q + (1-pi)*(1-q)]. Archived NO probability is rN * [pi*(1-q)+(1-pi)*q]. Missing is one minus their sum. Both worlds yield exactly (3/10, 1/10, 3/5). With independent facts, probability of every length-n visible archive sequence is a product of these equal per-record factors, hence is identical under both worlds.

Truth probability for a new saved YES report is pi*q / [pi*q+(1-pi)*(1-q)], which is 7/19 in LOW and 28/31 in HIGH.

For n independent audited truth labels with k YES, the HIGH-world posterior is

P(HIGH | k,n) = B(n,k;4/5) / [B(n,k;4/5)+B(n,k;1/5)],

where B(n,k;p) = choose(n,k) p^k (1-p)^(n-k). The predicted truth probability for a new saved YES is (1-P(HIGH))*7/19 + P(HIGH)*28/31.

Enumerate k=0..n and both true worlds with prior 1/2 to obtain exact expected Brier score and optimal world-identification error, breaking ties randomly. At n=5 these are 0.173656962756 and 0.05792; at n=0, 0.231551995988 and 0.5.

Negative control: retain every report, yielding visible YES probabilities 19/50 in LOW and 31/50 in HIGH. They are now distinguishable.

Full stdlib executable and generated 52-prompt bank are in the OV-77 local research package, not this repository. No real model trials administered.
