
# SAT Test Battery: QFT → Cosmology (v0)

This folder contains a minimal, *runnable* harness that plugs into `sat_full.py` to:
- infer SAT ladder steps from lepton masses (QFT);
- project into cosmology to predict/fit CMB birefringence β;
- compute χ² against a user-specified β prior;
- provide pytest checks for round-trip consistency and the β-slope identity.

## Files
- `sat_hallway_qft_cosmo.py` — demo: inversion, round-trip, and β prediction.
- `sat_hallway_qft_cosmo_fit.py` — fits `g_{θγ}` to a supplied β prior and reports χ².
- `data/qft_min.csv` — electron/muon/tau masses with tiny uncertainties (GeV).
- `data/cosmo_beta.json` — edit this to set β_obs ± σ and Δθ4.
- `tests/test_back_hallway.py` — pytest unit tests.

## Quickstart

1) Ensure `sat_full.py` is in the same folder.
2) Demo:
   ```bash
   python sat_hallway_qft_cosmo.py
   ```
3) Fit β and score:
   ```bash
   python sat_hallway_qft_cosmo_fit.py --beta data/cosmo_beta.json
   ```
   Edit `data/cosmo_beta.json` to set your preferred (β_obs, σ).

4) Run tests:
   ```bash
   pytest -q
   ```

## Interpreting χ²
- χ² ≲ 1: SAT can match the chosen β with a coupling g* = β_obs / (dβ/dg).
- χ² ≫ 1: Under the given uncertainties, SAT (with this simple mapping) struggles.
  Options:
  - Shrink allowed g via an independent SAT relation and re-score.
  - Add additional cosmology observables (e.g., Σmν mapping) to constrain the primitives.

## Next extensions
- Add neutrino ladder mapping to predict Σmν(P) and include in χ².
- Propagate uncertainties from λ and masses (bootstrap) to σ(β).
- Implement the reverse hallway (Cosmo → QFT) to test back-prediction.


---

## Extended hallway: add Σmν and bootstrap

Configure the simple neutrino ladder in `data/neutrino_model.json`:
```json
{
  "m_scale_GeV": 0.1056583755,
  "offsets_from_Kmu": [200, 205, 210],
  "to_eV": 1e9
}
```

Run the extended script:
```bash
python sat_hallway_qft_cosmo_plus.py --beta data/cosmo_beta.json --nu data/neutrino_model.json --boot 500
```

- Reports: λ, K indices, β fit (and χ²), Σmν prediction.
- With `--boot N`, bootstraps Σmν over QFT input uncertainties and λ jitter to estimate its spread.
