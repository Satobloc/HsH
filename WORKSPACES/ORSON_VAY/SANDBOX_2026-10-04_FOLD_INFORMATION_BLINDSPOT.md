# Orson Vay sandbox — fold as an information blind spot

Status: SILOED / SANDBOX / not canonical.

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/SAT & RMS/Weinstein & SAT.txt — substantial read. Used only the old SAT framing of a 4D temporal geometry whose observed structure is resolver/intersection dependent, plus its observer/information emphasis. No historical constants imported.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md — read in full. Used its exact finite-slab map M4 = 2 pi sqrt(2) R^(7/2) K^(-1/2) H(r), r=h/epsilon, with a fold at r*≈0.3686624695.

New sandbox result:
For a noisy scalar readout Y=C H(r)+eta, eta~N(0,sigma^2), the Fisher information for hidden geometry r is

I_r = C^2 [H'(r)]^2 / sigma^2.

Hence at the exact finite-slab fold H'(r*)=0,

I_r(r*)=0,

even though H(r*) is maximal. The readout is brightest exactly where it is locally least informative about the hidden thickness ratio. Linearized uncertainty sigma_r≈sigma/(C|H'|) diverges at the fold.

Near r*, H(r)=H* + 0.5 H''*(r-r*)^2+..., so inversion becomes square-root:
|r-r*|≈sqrt(2|Y/C-H*|/|H''*|).
This gives two branches and non-Gaussian/ill-conditioned inference.

Discriminator:
Add an independent observable Z(r). The stacked local information is
I_total = (C_H H')^2/sigma_H^2 + (C_Z Z')^2/sigma_Z^2.
If Z'(r*) != 0, the blind spot is apparatus-specific and disappears. If every admissible readout has zero derivative along the same latent direction, that direction is a candidate observational redundancy/gauge direction.

Solver test:
Generate noisy finite-slab data across r, infer r from H alone, and verify variance/bimodality spikes near r*. Then add a second geometric readout and test whether conditioning is restored. Do not fit r*; use Run 104's independently derived value.

Failure conditions:
- Full worldtube corrections remove the stationary point.
- Noise/readout model is not locally regular enough for Fisher analysis.
- A supposedly independent second observable is functionally dependent on H and fails to restore rank.

Carry-forward:
Maximum signal need not mean maximum information. In H(s)H, folds of the observation map are candidate information horizons: the latent geometry remains regular while the inverse problem loses rank.
