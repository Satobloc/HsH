# Amendment 02 — published-parameter precision check

**Source:** Barckicke, Falcon & Gissinger, *Nature Physics* 22, 409–414 (2026), DOI `10.1038/s41567-026-03175-w`; data DOI `10.6084/m9.figshare.30903347`.

For the article's (U=11\,\mathrm{V}, d=5\,\mathrm{mm}) example, the paper reports fitted values (\Gamma=0.022\,\mathrm{m^2/s}) and (v_z=0.57\,\mathrm{m/s}). It reports a PIV circulation uncertainty/axial-variability scale (\delta\Gamma\simeq0.005\,\mathrm{m^2/s}) and PTV vertical-velocity uncertainty (\delta v_z\simeq0.05\,\mathrm{m/s}).

A scripted ratio check gives:

[
\frac{\delta\Gamma}{\Gamma}=\frac{0.005}{0.022}\simeq0.2273\quad(22.7\%),
\qquad
\frac{\delta v_z}{v_z}=\frac{0.05}{0.57}\simeq0.08772\quad(8.77\%).
]

**Interpretation limits:** these are ratios of the article's reported uncertainty scales to its fitted parameter values. They are not asserted to be 1σ standard uncertainties, a joint covariance, a new fit, or a model prediction. The article fits ((\Gamma,v_z)) to the dispersion data and checks a posteriori consistency with PIV/PTV; this remains fit-plus-consistency, not blind holdout prediction. The Figshare files were not retrieved or reanalysed. The mean-(a_0) uncertainty remains unresolved between the Methods' typical 0.1 mm contour uncertainty and figure-caption wording that the uncertainty of the averaged (a_0) is negligible; no ratio was computed for (a_0).

This precision check strengthens the need for a predeclared independent-run holdout and measurement covariance before any physical comparison. It does not select the P2 system or establish an H(s)H mapping.
