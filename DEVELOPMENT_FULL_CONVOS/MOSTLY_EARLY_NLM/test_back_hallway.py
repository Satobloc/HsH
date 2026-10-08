
import importlib.util, math
import json

def load_sat():
    spec = importlib.util.spec_from_file_location("sat_full_mod", "sat_full.py")
    mod = importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)  # type: ignore
    return mod

def test_round_trip_masses():
    sat = load_sat()
    # prepare inversion like the harness
    Ke, Km, Kt, dKem, dKmt = sat.assign_K_three_masses(
        sat.CONSTS["leptons"]["electron_mass_GeV"],
        sat.CONSTS["leptons"]["muon_mass_GeV"],
        sat.CONSTS["leptons"]["tau_mass_GeV"],
        sat.CONSTS["defaults"]["lambda"]
    )
    # reconstruct masses using the exponential ladder relative to muon
    lam = sat.CONSTS["defaults"]["lambda"]
    m_mu = sat.CONSTS["leptons"]["muon_mass_GeV"]
    m_e_pred  = m_mu * math.exp(-lam * dKem)
    m_tau_pred= m_mu * math.exp(+lam * dKmt)

    assert abs(m_e_pred - sat.CONSTS["leptons"]["electron_mass_GeV"])/sat.CONSTS["leptons"]["electron_mass_GeV"] < 5e-3
    assert abs(m_tau_pred - sat.CONSTS["leptons"]["tau_mass_GeV"])/sat.CONSTS["leptons"]["tau_mass_GeV"] < 5e-3

def test_birefringence_slope():
    sat = load_sat()
    # numerical check that delta_beta_deg ≈ S*g with S = 0.5*Δθ4*180/π
    dtheta = 2*math.pi/3
    S = 0.5 * dtheta * 180.0/math.pi
    for g in [1e-4, 3e-4, 1e-3]:
        beta = sat.delta_beta_deg(g, dtheta)
        assert abs(beta - S*g) < 1e-6  # strict since it's algebraic
