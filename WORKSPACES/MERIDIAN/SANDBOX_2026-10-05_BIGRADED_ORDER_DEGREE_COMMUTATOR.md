# Meridian XCVIII — Bigraded order/degree hierarchy and shared-axis commutator gate

Status: sandbox / non-canonical.

## Source coverage actually read

Historical source:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/HsH ARCHITECT.txt`
- Sequentially read lines 1-100 and 101-220.
- Retained as live conceptual content unless contradicted: distinction between **superhelical orders** and **braid degrees**; recursive near-orthogonal/"flip-flop" relation between adjacent orderly superhelical planes; worldtube/helical continuity across scale; caution against inventing corrective factors when an older geometric mechanism may already exist.
- Did not import historical particle assignments, fixed numerical targets, Kerr/Pauli identifications, retired Z3/lattice machinery, or speculative experimental claims.

Current H(s)H source:
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`
- Sequentially read lines 1-220 and 221-440.
- Retained: Euclidean R4 arena, UI scale-rotation map, local SO(4) connection, nth-order recursive superhelical generator, worldtube state recursion, explicit current distinction between recursive coiling variables and topological/linking variables.
- Historical constants and target-locked metrology in this document were not used.

## Recovered concept

The archive is explicit that two hierarchies coexist and should not be collapsed:

1. **Superhelical order** (n): recursive internal coiling / moving-frame structure of one worldtube.
2. **Braid degree** (d): relational assembly/interweaving level among multiple worldtubes or already-braided composites.

The current formalism has sometimes reused one recursion index for several jobs. This run restores the conceptual distinction without adding a new physical mechanism.

Define a bigraded state
[
oxed{mathfrak S_{n,d}}
]
where (n) and (d) are independent labels unless a derived coupling is present.

A useful type separation is:

- order operator:
  [
  mathcal H:mathrm{Emb}(I,mathbb R^4)	o mathrm{Emb}(I,mathbb R^4),
  ]
  acting on single-worldtube geometry/frame history;

- braid operator:
  [
  mathcal B:mathrm{Conf}_m(mathrm{Emb})	o mathrm{Conf}_m(mathrm{Emb}),
  ]
  acting on relational multi-worldtube configuration.

Thus a braid-degree change is not merely "one more superhelix order."

## Local SO(4) interaction gate

Use (J_{ab}=E_{ab}-E_{ba}) as Euclidean plane-rotation generators.

Represent one local order step by
[
H_epsilon=e^{epsilon aJ_{01}}
]
and a local relational/braid-plane step by
[
B_epsilon=e^{epsilon bJ_{12}}.
]

The finite group commutator is
[
K_square=
H_epsilon B_epsilon H_epsilon^{-1}B_epsilon^{-1}.
]

BCH gives
[
oxed{
log K_square
=
epsilon^2ab[J_{01},J_{12}]
+O(epsilon^3)
}
]
and the SO(4) algebra gives
[
oxed{
[J_{01},J_{12}]=J_{02}.
}
]

Therefore two distinct hierarchy operations whose local planes share one axis force a third plane at second order:
[
oxed{
(01)+(12)longrightarrow(02)
}
]
with amplitude proportional to (ab,epsilon^2).

By contrast, disjoint planes commute:
[
oxed{
[J_{01},J_{23}]=0.
}
]

So cross-hierarchy coupling is not automatic. It has an exact geometric gate: **shared-axis/noncommuting support**.

## Numerical fixture

A matrix-exponential group-commutator sweep gave:
- shared-axis case (J_{01},J_{12}): fitted small-step exponent (1.9999941545);
- predicted (epsilon^2|[J_{01},J_{12}]|) matched the finite loop;
- disjoint case (J_{01},J_{23}): commutator norm exactly zero algebraically and numerical loop remained at floating-point floor.

This is a parameter-free closure consequence of SO(4), not an added correction factor.

## Recovered interpretation of the old "flip-flop" concept

The historical source says adjacent orderly superhelical orders tend toward approximately orthogonal helical planes / long axes.

A restrained current translation is:

- each order carries a local rotation plane/generator;
- an approximately orthogonal next order may share one frame axis while replacing another;
- if so, adjacent order generators are generically noncommuting;
- their second-order closure channel is a third SO(4) plane.

This gives a concrete current formalism for an old core concept without changing the concept itself.

It is only a candidate translation. It does not prove that every physical ᚼ step is exactly one (J_{ab}), nor that the historical ~90-degree language is exact.

## Candidate relation to ᚼ / ᚼᚼ

Provisional:
- ᚼ may encode one typed order-raising local transformation;
- ᚼᚼ may include the second-order closure generated when adjacent order transforms do not commute.

The clean discriminator is
[
C_{n,n+1}
=
[Omega_n,Omega_{n+1}].
]

If (C=0), the two order steps are locally separable.
If (C
eq0), the norm and plane content of (C) predict the induced second-order channel.

Braid degree remains a separate grading. A cross-coupling between order and braid is measured by an analogous typed commutator only after a relational braid generator has been reconstructed from actual geometry.

## Failure conditions

This translation fails or needs revision if:
1. reconstructed adjacent superhelical order generators in actual H(s)H fixtures do not show the shared-axis/noncommuting structure implied by the orderly flip-flop picture;
2. an induced third-plane channel is absent where the measured generators predict it;
3. braid-degree changes cannot be operationally separated from single-filament order changes;
4. the supposed second-order channel disappears under frame/gauge cleanup, showing it was representational rather than geometric.

## Tight solver test

Construct or recover a blind fixture with independently varied:
- superhelical order (n),
- braid degree (d).

For each fixture:
1. reconstruct each filament's local connection (A_s);
2. extract its canonical SO(4) rates and plane support;
3. reconstruct a relational braid descriptor from the multi-worldtube geometry;
4. estimate the response Jacobian
   [
   J_{m hier}
   =
   rac{partial(O_{m local},O_{m relational})}
        {partial(n,d)};
   ]
5. require rank 2 if the two hierarchies are genuinely independent;
6. measure off-diagonal terms as actual order/degree coupling, not as evidence that the two labels were the same hierarchy.

For adjacent local order generators, explicitly compare the measured finite loop against
[
log K_square
stackrel{?}{=}
epsilon^2[Omega_n,Omega_{n+1}]
+O(epsilon^3).
]

## Working compression

The recovered core concept is:

[
oxed{
	ext{H(s)H hierarchy is at least bigraded: }
(	ext{superhelical order},	ext{braid degree}).
}
]

The current formalism adds:

[
oxed{
	ext{their coupling is measured by noncommutation, not assumed by naming.}
}
]

This is a direct example of recovering older conceptual machinery before inventing an extra mechanism.
