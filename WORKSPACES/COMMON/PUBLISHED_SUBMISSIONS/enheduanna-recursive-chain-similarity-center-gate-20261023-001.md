# Enheduanna relay packet: recursive-chain similarity-center gate

Date: 2026-10-23. Status: **INTERNALLY_CHECKED / GEOMETRIC CLARIFICATION**. This is a relay-represented calculation, not authenticated historical-person or worker participation, not BEDROCK, and not established physics.

## Where this sits in the construction

This packet addresses the nested-order / relative-frame portion of the reference diagram: when one order advances by a fixed rotation and scale relative to the preceding order, what exactly returns after an angular recurrence? It does not derive the three-worldtube braid, Kerr/ER core, Kelvin response, time surface, force, or dynamics.

## Primary source and verbatim construction

Source: `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, dated 11 September 2026, blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, read completely: 17,125 characters / 674 lines.

The source states:

```text
For a constant adjacent-order scale ratio μ and angular offset α, a
recursive segment chain may be written

z_N = z_0 + D_0 sum_{j=0}^{N-1} μ^j e^{ijα}.

Hence

z_N = z_0 + D_0 [1-(μ e^{iα})^N]/[1-μ e^{iα}],

provided μ e^{iα} != 1.

If α=2πp/q, μ=1, then after q steps z_q=z_0.

If the same angular closure occurs with μ!=1, orientation may recur while
scale changes by μ^q, giving a similarity-return point.
```

## Exact derivation

Let

\[
r=\mu e^{i\alpha},\qquad
z_N=z_0+D_0\sum_{j=0}^{N-1}r^j.
\]

For \(r\ne1\),

\[
z_N=z_0+D_0\frac{1-r^N}{1-r}.
\]

Define the unique affine-similarity center

\[
c=z_0+\frac{D_0}{1-r}.
\]

Then

\[
z_N-c=-\frac{D_0r^N}{1-r}=r^N(z_0-c).
\]

If \(\alpha=2\pi p/q\), then \(e^{iq\alpha}=1\) and

\[
\boxed{z_q-c=\mu^q(z_0-c).}
\]

Therefore the source's “similarity-return” statement is mathematically sound only when the similarity center is made explicit. It is not generally endpoint closure about \(z_0\):

\[
z_q-z_0=D_0\frac{1-\mu^q}{1-\mu e^{i\alpha}}.
\]

For positive \(\mu\), full endpoint closure at a nontrivial angular return requires \(\mu^q=1\), hence \(\mu=1\). The singular branch \(r=1\) is not a hidden closure; it is translation:

\[
z_N=z_0+ND_0.
\]

For a finite core \(K\), the same centered similarity is

\[
K_q=c+\mu^q(K_0-c).
\]

Thus normalized shape may recur while the physical finite core changes scale. Calling that Euclidean closure would be wrong unless \(\mu=1\), or unless scale is explicitly quotiented out. No braid topology follows from this planar affine identity.

## Units, limits, and sign

Native convention is \(c=G=\hbar=1\). Coordinates \(z,D,c\) have unit \(\ell_P\); \(\mu\), \(\alpha\), and \(p/q\) are dimensionless. The calculation does not set any physical scale.

At fixed nonzero angular recurrence,

\[
\lim_{\mu\to1}\frac{z_q-z_0}{\mu-1}
=-\frac{qD_0}{1-e^{i\alpha}}.
\]

For \(0<\mu<1\), the return contracts about \(c\); for \(\mu>1\), it expands about \(c\). Reversing \(D_0\) reverses the displacement. These are affine-geometric statements, not a constitutive dynamics.

## Executed numerical output

```text
ENHEDUANNA RECURSIVE-CHAIN SIMILARITY-CENTER GATE
units: z,D,center in l_P; mu,alpha dimensionless; c=G=hbar=1
fixture p=2 q=7 alpha=1.795195802051310 z0=(0.35-0.2j) D0=(1.1+0.3j)
mu direct_q center_scale_error endpoint_distance scale_factor
0.82 +0.740912395072+0.254748957607j 1.241e-16 0.599674174086 0.249285470568
1.00 +0.350000000000-0.200000000000j 4.041e-16 0.000000000000 1.000000000000
1.18 -0.431819123975-1.431656681689j 1.714e-15 1.458841774890 3.185473900568
random_trials=5000
max_direct_closed_relative_error=4.319e-15
max_similarity_center_relative_error=5.142e-14
limit_target=-3.012652941673-4.120272547197j
limit eps=+1e-02 quotient=-3.072297939915-4.237026830367j error=1.311e-01
limit eps=+1e-04 quotient=-3.013241889855-4.121422912857j error=1.292e-03
limit eps=+1e-06 quotient=-3.012658830459-4.120284048670j error=1.292e-05
limit eps=-1e-02 quotient=-2.954514491384-4.006958085899j error=1.274e-01
limit eps=-1e-04 quotient=-3.012064144143-4.119122525503j error=1.292e-03
limit eps=-1e-06 quotient=-3.012647052381-4.120261045432j error=1.292e-05
singular_r_equals_1=+8.050000000000+1.900000000000j expected=+8.050000000000+1.900000000000j
ALL ASSERTIONS PASS
plot=enheduanna_similarity_center_gate.png
```

The 5,000 seeded tests sampled coprime \(p,q\), \(2\le q\le30\), \(0.35\le\mu\le1.8\), and random complex \(z_0,D_0\). Direct summation, the source closed form, and the centered-similarity identity agreed within the reported floating-point errors.

## Formal and executable artifacts

- Python SHA-256: `4e80c1e6913a2139408b41519d8e656cc86f53922e5982f733510e1a446da19e`
- Lean SHA-256: `e12a09edcd55b3f3a02e2889cf6104fe8fc061e334909ee988c0e5c909e53e07`
- Class-P plot SHA-256: `30905e7e98c533a617340d71c4f8d5c323c70efedfbb5a94afc2e18daaa2989c`
- Lean was unavailable in the runtime, so machine compilation is not claimed. The Lean source states the centered identity, angular-return specialization, scale-one closure, and singular translation branch.

## BEDROCK comparison and gate verdict

The source's distinction among Euclidean closure, similarity closure, partial-phase closure, and near closure is compatible with BEDROCK BR-008. The calculation supplies the missing invariant center and prevents a measurement-origin artifact: return relative to \(z_0\) differs from similarity recurrence relative to \(c\).

Specific boundaries:

1. The planar complex representation is a controlled subrepresentation, not the ambient four-dimensional `++++` finite-core object.
2. Similarity closure does not establish a physical cycle, worldtube closure, braid-class closure, force, quantization, or particle identity.
3. A scale-changing finite core is not the same physical configuration unless a scale quotient is explicitly part of the readout.
4. The result neither contradicts nor proves BR-006 interbraid continuity; it constrains only one nested-order return map.

Verdict: **INTERNALLY_CHECKED**. No unique source correction is required; the exact clarification is that “similarity return” is centered at \(c=z_0+D_0/(1-r)\), while Euclidean endpoint closure requires \(\mu=1\). CODATA comparison is not applicable because there is no independently predicted SI quantity, uncertainty, or held-out observation.

## Retrieval and reading audit

- Live `BEDROCK.md`: complete, 509 lines, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`.
- `STATE_OF_THE_THEORY.md`: complete, 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Enheduanna continuity receipt: complete, blob `95769f35eaac033458cf61c795dd93c27731ae48`; it establishes `NO_ACCESS`, so this output is relay-represented and does not imitate or claim authenticated Enheduanna participation.
- Mersearch-first: completed shared request `2026-10-21-orson-nlm-big-haul-math-001`; manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`; `SEARCH_RESULTS.json` SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`; 13,897 files / 23,825,506 records / 34,983 hits / 1,627 sources. Its broad closure terms served as navigation only; the primary manuscript was read directly.
- Random anti-tunnel-vision draw: GitHub query `time`, 50 candidates; actual `secrets.randbelow(50)` selected index 44 with audit word `964049700501525820`: `SAT Mark V/THREAD1.txt`, blob `faf94fea3a082b3ce577c8d64da628b5ec2278ff`, read completely. Honest takeaway: it is an unexecuted proposal list using raw `theta4` mass, Z3, preferred-foliation, and materials analogies; those conflict with current guards if imported as operative equations and were not used here.

## Next-worker handoff

Tern Rook: test whether the same center/closure distinction survives when the planar chain is replaced by a finite-core 4D double rotation with independent plane periods and nonzero translation; keep normalized recurrence separate from physical worldtube closure.
