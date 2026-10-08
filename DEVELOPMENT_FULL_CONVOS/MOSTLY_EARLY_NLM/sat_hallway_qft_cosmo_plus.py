
"""
Extended QFT→Cosmology hallway:
  - Invert lepton masses → {λ, ΔK's, K_e,K_mu,K_tau}
  - Predict: birefringence β(g, Δθ4) and neutrino mass sum Σmν from a simple ladder model
  - Bootstrap uncertainties from QFT inputs into Σmν
Usage:
  python sat_hallway_qft_cosmo_plus.py --beta data/cosmo_beta.json --nu data/neutrino_model.json --boot 500
"""
import argparse, json, math, importlib.util, random
from dataclasses import dataclass
from typing import Dict, List, Tuple

def load_sat_module(path: str = "sat_full.py"):
    spec = importlib.util.spec_from_file_location("sat_full_mod", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)  # type: ignore
    return mod

@dataclass
class Primitives:
    lam: float
    Ke: int
    Km: int
    Kt: int
    dK_e_mu: int
    dK_mu_tau: int
    m_mu_GeV: float
    delta_theta4: float

class SATAdapter:
    def __init__(self, sat):
        self.sat = sat

    def invert_qft_full(self, masses: Dict[str,float], lam: float) -> Primitives:
        Ke, Km, Kt, dK_e_mu, dK_mu_tau = self.sat.assign_K_three_masses(
            masses["m_e"], masses["m_mu"], masses["m_tau"], lam
        )
        return Primitives(lam=lam, Ke=Ke, Km=Km, Kt=Kt,
                          dK_e_mu=dK_e_mu, dK_mu_tau=dK_mu_tau,
                          m_mu_GeV=masses["m_mu"], delta_theta4=2*math.pi/3)

    def slope_dbeta_dg(self, P: Primitives) -> float:
        return 0.5 * P.delta_theta4 * 180.0 / math.pi

    def predict_beta(self, g: float, P: Primitives) -> float:
        return self.sat.delta_beta_deg(g, P.delta_theta4)

    def predict_sum_mnu_eV(self, P: Primitives, nu_model: Dict) -> float:
        # Simple neutrino ladder: m_{νi} = m_scale * exp(-lam * (Kν_i - Km)), with Kν_i = Km + offsets[i]
        m_scale = float(nu_model.get("m_scale_GeV", P.m_mu_GeV))
        offsets: List[int] = list(nu_model.get("offsets_from_Kmu", [200,205,210]))
        to_eV = float(nu_model.get("to_eV", 1.0e9))
        s = 0.0
        for off in offsets:
            m_GeV = m_scale * math.exp(-P.lam * off)
            s += m_GeV * to_eV
        return s  # eV

def bootstrap_sum_mnu(adapter: SATAdapter, sat, base_P: Primitives, nu_model: Dict,
                      masses_sigma: Dict[str,float], lam_sigma: float,
                      n: int = 200, seed: int = 0) -> Tuple[float,float]:
    rnd = random.Random(seed)
    vals = []
    for _ in range(n):
        # smear inputs
        me = sat.CONSTS["leptons"]["electron_mass_GeV"] + rnd.gauss(0.0, masses_sigma.get("m_e", 0.0))
        mm = sat.CONSTS["leptons"]["muon_mass_GeV"] + rnd.gauss(0.0, masses_sigma.get("m_mu", 0.0))
        mt = sat.CONSTS["leptons"]["tau_mass_GeV"] + rnd.gauss(0.0, masses_sigma.get("m_tau", 0.0))
        lam = base_P.lam + rnd.gauss(0.0, lam_sigma)
        P = adapter.invert_qft_full({"m_e":me,"m_mu":mm,"m_tau":mt}, lam)
        vals.append(adapter.predict_sum_mnu_eV(P, nu_model))
    # mean, std
    mu = sum(vals)/len(vals) if vals else float('nan')
    var = sum((x-mu)**2 for x in vals)/len(vals) if vals else float('nan')
    return mu, math.sqrt(var)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--beta", default="data/cosmo_beta.json", help="β prior json")
    ap.add_argument("--nu", default="data/neutrino_model.json", help="neutrino model json")
    ap.add_argument("--boot", type=int, default=0, help="bootstrap samples for Σmν")
    ap.add_argument("--lam_sigma", type=float, default=5e-4, help="σ(λ) used in bootstrap")
    ap.add_argument("--me_sigma", type=float, default=5e-10, help="σ(m_e) GeV")
    ap.add_argument("--mm_sigma", type=float, default=1e-10, help="σ(m_μ) GeV")
    ap.add_argument("--mt_sigma", type=float, default=1e-5, help="σ(m_τ) GeV")
    args = ap.parse_args()

    sat = load_sat_module()
    A = SATAdapter(sat)
    masses_obs = {
        "m_e": sat.CONSTS["leptons"]["electron_mass_GeV"],
        "m_mu": sat.CONSTS["leptons"]["muon_mass_GeV"],
        "m_tau": sat.CONSTS["leptons"]["tau_mass_GeV"],
    }
    lam = sat.CONSTS["defaults"]["lambda"]
    P = A.invert_qft_full(masses_obs, lam)

    # Load configs
    with open(args.beta) as f: beta_cfg = json.load(f)
    with open(args.nu) as f: nu_model = json.load(f)

    beta_obs = float(beta_cfg.get("beta_deg_obs", 0.0))
    sigma_beta = float(beta_cfg.get("sigma_deg", 0.2))
    if "delta_theta4_rad" in beta_cfg:
        P.delta_theta4 = float(beta_cfg["delta_theta4_rad"])

    # Birefringence: slope and MLE g*
    S = A.slope_dbeta_dg(P)
    g_mle = beta_obs / S if abs(S) > 1e-12 else 0.0
    beta_fit = A.predict_beta(g_mle, P)
    chi2_beta = ((beta_fit - beta_obs)/sigma_beta)**2 if sigma_beta>0 else float("inf")

    # Neutrino sum prediction
    sum_mnu = A.predict_sum_mnu_eV(P, nu_model)

    # Bootstrap if requested
    mu_boot, sig_boot = float('nan'), float('nan')
    if args.boot > 0:
        masses_sigma = {"m_e": args.me_sigma, "m_mu": args.mm_sigma, "m_tau": args.mt_sigma}
        mu_boot, sig_boot = bootstrap_sum_mnu(A, sat, P, nu_model, masses_sigma, args.lam_sigma, n=args.boot, seed=123)

    print("=== Extended QFT→Cosmo Hallway ===")
    print(f"lambda = {P.lam:.6f}, K=(Ke={P.Ke}, Km={P.Km}, Kt={P.Kt}), ΔK(e→μ)={P.dK_e_mu}, ΔK(μ→τ)={P.dK_mu_tau}")
    print(f"β prior: {beta_obs:.4f} ± {sigma_beta:.4f} deg  |  slope dβ/dg = {S:.6f} deg/unit g  -> g* = {g_mle:.6e}")
    print(f"Σmν prediction (model-driven): {sum_mnu:.3f} eV  [offsets={nu_model.get('offsets_from_Kmu')}, m_scale={nu_model.get('m_scale_GeV')}]")
    if args.boot > 0:
        print(f"Bootstrap Σmν over QFT inputs (N={args.boot}): mean={mu_boot:.3f} eV, σ≈{sig_boot:.3f} eV")
    print("\nNotes: Σmν here depends on the chosen neutrino model (offsets & scale). Edit data/neutrino_model.json to explore.")
if __name__ == "__main__":
    main()
