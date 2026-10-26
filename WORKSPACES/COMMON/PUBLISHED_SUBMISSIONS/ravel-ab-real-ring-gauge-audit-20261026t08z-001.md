# Ravel workshop | Real mesoscopic AB comparator and historical charge-derivation gate
Run: REVROT3-19-20261011:368:s1 | nominal 2026-10-26T08:12Z (hour basis observed fallback, runtime 08:32Z)
h=368; seq=5*h+1=1841; index 17=Ravel; next index 18=Orson Vay.
Identity: source-grounded current assistant research in Ravel's co-theorist/source-reconciliation remit. NOT authenticated original Ravel instance, NOT cross-chat delivery.

## One source-backed experiment
Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25, PUB DRAFTS/APPENDIX C.txt, Git blob 078ed2ddd118925b9befb7f78f4a8f7486ed8ce4 (2,988 characters; full text read). The draft says single-valuedness forces q*integral_C A = 2*pi*n and concludes it determines the numerical elementary charge. Original message role/date not established; classify as an archived draft, NOT automatically Nathan Direct.
Later Ravel source: Satobloc/HsH, WORKSPACES/RAVEL/SANDBOX_2026-10-11_MATERIAL_FRAME_ACTION_AND_LEAKAGE.md, blob 27efcf287fd3e5e4b8dcf6a33cead996dba20e32 (14,410 characters; source reviewed). Its normal-frame geometric holonomy and stochastic response are conditional material-apparatus constructions, NOT ordinary electromagnetic AB flux and NOT a particle prediction.

Actual measured system: Behner et al., "Aharonov-Bohm Interference and Phase-Coherent Surface-State Transport in Topological Insulator Rings," Nano Letters 23 (2023) 6347-6353, DOI 10.1021/acs.nanolett.3c00905; open full text https://pmc.ncbi.nlm.nih.gov/articles/PMC10375586/. Real Sb2Te3 devices:
- Sample A ring: reported inner/outer radii 100/150 nm, observed AB magnetic-field period about 82.5 mT, Fourier peak about 12 per tesla (Figures 1 and 2).
- Sample C nanoribbon: reported width 100 nm and film thickness 20 nm, observed Fourier peak about 0.45 per tesla, reported inferred area 1.86e-15 m^2 (Figure 5).
No published one-sigma uncertainties for these rounded geometry/peak values were recovered; path-radius interval is NOT a statistical error bar. No uncertainty-normalized z score is defensible.

## Reproducible measured-system comparator
Standard EM phase: delta_phase = (q/hbar)*Phi (mod 2*pi). For electrons the h/e flux period is Phi0 = h/e = 4.135667696923859e-15 Wb, using exact 2019 SI h=6.62607015e-34 J s and e=1.602176634e-19 C. These are defined reference inputs, not independent SAT predictions.
A: r_mean=125 nm, area=pi*r_mean^2, predicted deltaB=Phi0/area=84.25113048971605 mT; observed about 82.5 mT; difference +1.75113048971605 mT (+2.12258% relative to observed). Ring path-radius range 100-150 nm corresponds to periods 131.6424 to 58.5077 mT; observed period lies within that nonstatistical geometry range. Observed period implies effective r=126.31965 nm. Predicted FFT frequency=11.86928/T versus reported ~12/T.
C: width*thickness=2.0e-15 m^2; standard expected Fourier frequency area/Phi0=0.4835978484/T; observed ~0.45/T (difference +7.46619% relative to observed). Observed FFT gives area=1.8610504636e-15 m^2, consistent with authors' rounded 1.86e-15 m^2.
Actual Python script executed with assert checks and independent 60-digit Decimal check; source SHA-256 ff0480e07a265497ab28e26e20301366cf0441fb9f787b5a5cc0ca6ad83559a0; results JSON SHA-256 c9797e00c19925e024b5f35029770716bb1fefa9f534eee3112aa6e906f8b7da. Script/results are attached in scheduled conversation sandbox, not falsely claimed as committed in GitHub.

Minimal reproducible computation:
```python
from math import pi, sqrt
h=6.62607015e-34; e=1.602176634e-19
flux=h/e
r=(100e-9+150e-9)/2
B=flux/(pi*r*r)
print(flux,B*1000,100*(B/(82.5e-3)-1))
area=100e-9*20e-9
print(area/flux,0.45*flux)
```
Expected:
```text
4.135667696923859e-15 84.25113048971605 2.1225824117770298
0.48359784841698356 1.8610504636157365e-15
```

## Source-correction gate
Historical draft's statement q*integral A=2*pi*n is NOT a general consequence of wavefunction single-valuedness for an AB interferometer. The gauge-invariant interference phase can vary continuously with enclosed magnetic flux; the observable is periodic under flux CHANGE Phi->Phi+h/e, not restricted to integer flux at every field. In physical SI units the phase requires /hbar. Compact U(1) representations constrain relative charge multiples given assumptions, but do NOT determine the measured numerical SI value of e without a dimensionful reference; the draft explicitly imports empirical e. Preserve the draft unchanged; classify the claim "derived numerical e" as REJECTED AS INDEPENDENT PREDICTION and the continuous-flux correction as standard electromagnetic comparator. Original authorship/date unresolved, no retrospective Nathan attribution.
Ravel's later geometric normal-bundle mechanism is DIFFERENT from electromagnetic AB. Planar ring centerline torsion is zero in the ideal planar limit, yet the measured ring has electromagnetic AB oscillations. This is a necessary null discriminator, NOT a falsification of a separate geometric response in a physically nonplanar tube. No measured tube deformation/noise spectrum or HsH-only parameter was extracted; those predictions remain UNRESOLVED.

## Methods / status / return cursor
Mersearch FIRST: checked four occupied request lanes; no overwrite. Existing three-root results are accessible through compact receipts; no new query. Fallback GitHub code searches across SAT, HsH and HSH_RESOURCES found historical Appendix C and later Ravel source; fallback is not a completed new Mersearch run. HSH_RESOURCES contents not republished. Ravel README blob 8830694ecaecece0c61ba8b0ae3b67a6ff3315, STATE blob c46ed667c0475c7060091d1b2860a9363b5ce5c4, Oct 11 continuation blob c33b0b9922fab1408a114fe58bde75bfc8b30788; current BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 (86,946 chars retrieved; key ND-2026-10-25-01 and ND-2026-10-18-02/03 reviewed), STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, Oct 26 steering charter d086da524760b722090fb8209dc798c94f65f5eb, paper campaign bad9627ce11f7fffcb82fbd48eb03a6bb651d0a9, rotation v3 90863a2a2b82b2d8e37ba1bd9f796389066f5409. P2 issue #565 read.
Method shift from prior gravity-only numerical runs: historical source-error audit plus two actual experimental-device controls and independent numerical check.
Gate: standard AB numerical control PASS within geometric path ranges, NO statistical z, HsH mechanism NOT TESTED, historical charge numerical derivation REJECTED, CODATA quantity e/h used as exact defined inputs, no independent prediction. No BEDROCK promotion or manuscript completion.
Next Ravel cursor: obtain genuine ring geometry, field/temperature traces and uncertainty/covariance from Behner et al. supplement or authors' data; separately derive an independently constrained normal-frame observable and null prediction without tuning. This is P2 source/data reconnaissance, not a ready P2 manuscript.
Next identity Orson Vay: protect Nov 9 P1 LLM-cognition remit. Start with Orson original cognition charter, archived studies and latest P1 issue #564; do not hand him general ring math. ChatGPT cross-thread send unavailable, repo handoff only.
