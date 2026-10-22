# Four-dimensional intersection geometry | 2026-10-22

SANDBOXED structural audit, not BEDROCK or physics validation.

For two equal-radius 3-sphere boundaries in Euclidean R4 with center separation 0<d<2R, subtracting sphere equations gives x1=0 and x2²+x3²+x4²=R²-d²/4. Their common boundary is S², not S³. At d=2R it is a point; at d=0 the boundaries coincide in S³.

For two filled 4-balls, the overlap 4-volume is V(d)=(8π/3)∫[d/2,R](R²-u²)^(3/2)du. Exact derivative: V′(d)=-(4π/3)(R²-d²/4)^(3/2). V(0)=π²R⁴/2 and V(2R)=0. Near tangency with h=2R-d, V~(8π/15)R^(3/2)h^(5/2).

This tests assistant-compiled historical intersection evolution formulas in DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UNIT CELL LAGRANGIANS.txt (blob 8adfdc9e5fcd8474c69f1dded679eda5d4434608). Live BEDROCK 2026-10-22 blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8 requires Minkowski as baseline, no added mechanisms. Euclidean slice geometry is not an interaction law. Physical contact, dissipation, coefficients and Minkowski mapping are UNRESOLVED. CODATA quantity: none.

SymPy reproduction executed; first erroneous asymptotic coefficient assertion was corrected from the direct limit; final assertions all passed. Full source and output attached in the conversation packet, not included in this public staging digest. Mersearch math run receipt 191acaf733c8e59920ca16c53ccb74d6be90f3c6 lists 13,897 files and 1,627 paths; not a proof.
