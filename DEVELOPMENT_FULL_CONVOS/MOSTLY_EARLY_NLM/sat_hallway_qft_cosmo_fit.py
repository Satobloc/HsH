
    """
    Fit-and-score for the QFT→Cosmology hallway.
    - Infers integer ladder steps from lepton masses and λ (from sat_full.py).
    - Computes birefringence slope S = d beta / d g.
    - Given a target beta_obs ± sigma, computes MLE g* = beta_obs/S and χ².
    Usage:
      python sat_hallway_qft_cosmo_fit.py --beta data/cosmo_beta.json
    """
    import argparse, json, math, importlib.util
    from dataclasses import dataclass
    from typing import Dict

    def load_sat_module(path: str = "sat_full.py"):
        spec = importlib.util.spec_from_file_location("sat_full_mod", path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)  # type: ignore
        return mod

    @dataclass
    class Primitives:
        lam: float
        dK_e_mu: int
        dK_mu_tau: int
        m_mu_GeV: float
        delta_theta4: float

    class SATAdapter:
        def __init__(self, sat):
            self.sat = sat

        def invert_qft(self, masses: Dict[str,float], lam: float) -> Primitives:
            Ke, Km, Kt, dK_e_mu, dK_mu_tau = self.sat.assign_K_three_masses(
                masses["m_e"], masses["m_mu"], masses["m_tau"], lam
            )
            return Primitives(lam=lam, dK_e_mu=dK_e_mu, dK_mu_tau=dK_mu_tau,
                              m_mu_GeV=masses["m_mu"], delta_theta4=2*math.pi/3)

        def slope_dbeta_dg(self, P: Primitives) -> float:
            # From sat_full.py formula used in the earlier harness: beta ≈ 0.5 * g * Δθ4 * 180/π
            return 0.5 * P.delta_theta4 * 180.0 / math.pi

        def predict_beta(self, g: float, P: Primitives) -> float:
            return self.sat.delta_beta_deg(g, P.delta_theta4)

    def main():
        ap = argparse.ArgumentParser()
        ap.add_argument("--beta", default="data/cosmo_beta.json", help="JSON file with beta_obs, sigma_deg, delta_theta4_rad")
        args = ap.parse_args()

        sat = load_sat_module()
        A = SATAdapter(sat)
        masses_obs = {
            "m_e": sat.CONSTS["leptons"]["electron_mass_GeV"],
            "m_mu": sat.CONSTS["leptons"]["muon_mass_GeV"],
            "m_tau": sat.CONSTS["leptons"]["tau_mass_GeV"],
        }
        lam = sat.CONSTS["defaults"]["lambda"]
        P = A.invert_qft(masses_obs, lam)

        with open(args.beta) as f:
            cfg = json.load(f)
        beta_obs = float(cfg.get("beta_deg_obs", 0.0))
        sigma = float(cfg.get("sigma_deg", 0.2))
        if "delta_theta4_rad" in cfg:
            P.delta_theta4 = float(cfg["delta_theta4_rad"])

        S = A.slope_dbeta_dg(P)  # deg per unit g
        g_mle = beta_obs / S if abs(S) > 1e-12 else 0.0
        beta_fit = A.predict_beta(g_mle, P)
        chi2 = ((beta_fit - beta_obs)/sigma)**2 if sigma>0 else float("inf")

        print("=== QFT→Cosmo: birefringence fit ===")
        print(f"lambda = {P.lam:.6f}, ΔK(e→μ) = {P.dK_e_mu}, ΔK(μ→τ) = {P.dK_mu_tau}")
        print(f"Slope dβ/dg = {S:.6f} deg per unit g")
        print(f"Input: β_obs = {beta_obs:.4f} ± {sigma:.4f} deg")
        print(f"Fit:   g* = {g_mle:.6e}")
        print(f"Pred:  β(g*) = {beta_fit:.4f} deg")
        print(f"χ²(β) = {chi2:.4f}")
        print("
Interpretation: if χ² ≲ 1, SAT can accommodate the observed β with a coupling g* of the above size.")
        print("To tighten: reduce sigma, or fix g from an independent SAT relation and re-score.")
    if __name__ == "__main__":
        main()
