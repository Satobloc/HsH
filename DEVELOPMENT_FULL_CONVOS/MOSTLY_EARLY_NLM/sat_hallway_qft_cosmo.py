
    """
    SAT Back-Hallway Harness (QFT → Cosmology) — minimal, runnable

    Usage:
      python sat_hallway_qft_cosmo.py

    Requires sat_full.py in the same folder.
    """
    import math
    import importlib.util
    from dataclasses import dataclass
    from typing import Dict

    # --- Load sat_full.py as a module ---
    def load_sat_module(path: str = "sat_full.py"):
        spec = importlib.util.spec_from_file_location("sat_full_mod", path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)  # type: ignore
        return mod

    @dataclass
    class Primitives:
        lam: float            # ladder slope
        dK_e_mu: int          # integer step from e to mu
        dK_mu_tau: int        # integer step from mu to tau
        m_mu_GeV: float       # anchor mass (muon)
        g_theta_gamma: float  # EM coupling to theta4 for birefringence
        delta_theta4: float   # domain-wall jump (radians), ~ 2π/3

    class SATAdapter:
        def __init__(self, sat):
            self.sat = sat

        # Project SAT primitives to QFT observables (subset: e, mu, tau masses)
        def project_qft(self, P: Primitives) -> Dict[str, float]:
            # Using ratios controlled by lambda and integer K steps
            m_e = P.m_mu_GeV * math.exp(-P.lam * P.dK_e_mu)
            m_mu = P.m_mu_GeV
            m_tau = P.m_mu_GeV * math.exp(+P.lam * P.dK_mu_tau)
            return {"m_e": m_e, "m_mu": m_mu, "m_tau": m_tau}

        # Invert QFT masses to primitives (lam fixed): assign K's by rounding
        def invert_qft(self, masses: Dict[str, float], lam: float):
            m_e, m_mu, m_tau = masses["m_e"], masses["m_mu"], masses["m_tau"]
            Ke, Km, Kt, dK_e_mu, dK_mu_tau = self.sat.assign_K_three_masses(m_e, m_mu, m_tau, lam)
            return Primitives(lam=lam, dK_e_mu=dK_e_mu, dK_mu_tau=dK_mu_tau,
                              m_mu_GeV=m_mu, g_theta_gamma=1e-3, delta_theta4=2*math.pi/3)

        # Project SAT primitives to Cosmology (subset: birefringence beta)
        def project_cosmo(self, P: Primitives) -> Dict[str, float]:
            beta_deg = self.sat.delta_beta_deg(P.g_theta_gamma, P.delta_theta4)
            return {"beta_deg": beta_deg}

    def main():
        sat = load_sat_module()
        A = SATAdapter(sat)
        # Observed lepton masses
        masses_obs = {
            "m_e": sat.CONSTS["leptons"]["electron_mass_GeV"],
            "m_mu": sat.CONSTS["leptons"]["muon_mass_GeV"],
            "m_tau": sat.CONSTS["leptons"]["tau_mass_GeV"],
        }
        lam = sat.CONSTS["defaults"]["lambda"]
        # Invert QFT → primitives
        P = A.invert_qft(masses_obs, lam)
        # Round-trip check
        masses_pred = A.project_qft(P)
        # Hallway prediction QFT→Cosmo
        cosmo_pred = A.project_cosmo(P)

        # Report
        def rel_err(a,b): return abs(a-b)/b
        print("=== SAT QFT→Cosmo Harness Demo ===")
        print(f"lambda = {P.lam:.6f}, dK_e_mu = {P.dK_e_mu}, dK_mu_tau = {P.dK_mu_tau}")
        print("Round-trip masses (GeV):")
        for k in ["m_e","m_mu","m_tau"]:
            print(f"  {k}: obs={masses_obs[k]:.9f}  pred={masses_pred[k]:.9f}  rel_err={rel_err(masses_pred[k], masses_obs[k]):.3e}")
        print("
Cosmo prediction (given g and Δθ4):")
        print(f"  g_theta_gamma = {P.g_theta_gamma:.2e}, delta_theta4 = {P.delta_theta4:.5f} rad")
        print(f"  -> beta = {cosmo_pred['beta_deg']:.4f} deg")
        print("
Sensitivity (analytic): d beta / d g = 0.5 * Δθ4 * 180/π")
        print(f"  d beta / d g = {0.5 * P.delta_theta4 * 180.0/math.pi:.3f} deg per unit g")

    if __name__ == "__main__":
        main()
