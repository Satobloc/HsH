from pathlib import Path

script = r'''#!/usr/bin/env python3
"""
SAT / HSUCV equation propagation model

Purpose
-------
Define ONE master scale (`ell_f`) and propagate it through the algebraic
relations in the supplied equation catalog.

Important:
- The source contains multiple competing variants and several equations that
  are dimensionally/model-wise ambiguous. This script therefore keeps variants
  separate instead of silently choosing one as "correct".
- A few quantities cannot mathematically be determined from `ell_f` alone.
  Those are exposed as explicit dimensionless ratios or physical constants.
- This is an algebraic calculator, not a validation of the underlying theory.

Usage
-----
    python sat_model.py

Or import it:
    from sat_model import SATModel
    model = SATModel(ell_f=1.0e-15)
    print(model.summary())
"""

from __future__ import annotations

from dataclasses import dataclass, asdict
import json
import math
from typing import Any, Dict


PI = math.pi


@dataclass
class SATModel:
    # ------------------------------------------------------------------
    # THE ONE MASTER NUMBER
    # ------------------------------------------------------------------
    # Changing this one value propagates through all quantities that are
    # defined from the dimensionless ratios below.
    ell_f: float = 1.0e-15

    # ------------------------------------------------------------------
    # Dimensionless model ratios / independent physical inputs
    # ------------------------------------------------------------------
    # epsilon = epsilon_ratio * ell_f
    epsilon_ratio: float = 0.01

    # R = R_ratio * ell_f
    R_ratio: float = 1.0

    # r_mode = r_mode_ratio * ell_f
    r_mode_ratio: float = 1.0

    # r_h = r_h_ratio * ell_f
    r_h_ratio: float = 1.0

    # Particle mass anchor. This is independent unless you explicitly
    # choose a mass-scaling convention.
    m0: float = 9.1093837015e-31

    # Physical constants
    c: float = 299_792_458.0
    epsilon_0: float = 8.8541878128e-12
    e_charge: float = 1.602176634e-19

    # Projection/lattice parameters
    delta_lattice: float = 0.0
    B_override: float | None = None

    # Overlap / lattice parameters
    Omega: float = 1.0
    n: int = 1
    N_nodes: int = 1

    # Model parameters that are not fixed by ell_f alone
    lambda_s_hat: float = 1.0
    k_hat: float = 1.0
    u_over_c: float = 1.0

    # Hydrogen / particle inputs
    quantum_n: int = 1
    l_quantum: int = 0
    mass_for_schrodinger: float | None = None

    # Orbit inputs
    M_source: float = 1.0
    semi_major_axis: float = 1.0
    eccentricity: float = 0.0

    def __post_init__(self) -> None:
        if self.ell_f <= 0:
            raise ValueError("ell_f must be positive.")
        if self.epsilon_ratio <= 0:
            raise ValueError("epsilon_ratio must be positive.")
        if self.R_ratio <= 0:
            raise ValueError("R_ratio must be positive.")
        if self.r_mode_ratio <= 0 or self.r_h_ratio <= 0:
            raise ValueError("radius ratios must be positive.")
        if self.quantum_n <= 0:
            raise ValueError("quantum_n must be >= 1.")
        if self.n <= 0 or self.N_nodes <= 0:
            raise ValueError("n and N_nodes must be positive integers.")
        if self.mass_for_schrodinger is None:
            self.mass_for_schrodinger = self.m0

    # ==================================================================
    # BASIC SCALES
    # ==================================================================

    @property
    def epsilon(self) -> float:
        """Filament radius: epsilon = epsilon_ratio * ell_f."""
        return self.epsilon_ratio * self.ell_f

    @property
    def R(self) -> float:
        """Hypersphere radius."""
        return self.R_ratio * self.ell_f

    @property
    def r_mode(self) -> float:
        return self.r_mode_ratio * self.ell_f

    @property
    def r_h(self) -> float:
        return self.r_h_ratio * self.ell_f

    # ==================================================================
    # PROJECTION CONSTANTS / MIXING
    # ==================================================================

    @property
    def B0(self) -> float:
        """Pure projection constant: B0 = 3/(4*pi)."""
        return 3.0 / (4.0 * PI)

    @property
    def B_eff(self) -> float:
        """Lattice-stabilized projection constant."""
        if self.B_override is not None:
            return self.B_override
        return self.B0 * (1.0 + self.delta_lattice)

    @property
    def theta_12(self) -> float:
        """Cabibbo-style mixing relation."""
        B = self.B_eff
        return B * (1.0 - B**2)

    @property
    def delta_CP(self) -> float:
        return 3.0 * PI / 2.0

    # ==================================================================
    # MASS / STIFFNESS / PLANCK-SCALE CHAIN
    # ==================================================================

    @property
    def kappa(self) -> float:
        """
        Filament stiffness inversion:
            kappa = 4*m0*c^2*ell_f^3 / ((2*pi)^4*epsilon^2)
        """
        return (
            4.0 * self.m0 * self.c**2 * self.ell_f**3
            / ((2.0 * PI)**4 * self.epsilon**2)
        )

    @property
    def kink_energy(self) -> float:
        """
        E_kink = kappa*(2*pi)^4*epsilon^2/(4*ell_f^3)
        """
        return (
            self.kappa * (2.0 * PI)**4 * self.epsilon**2
            / (4.0 * self.ell_f**3)
        )

    @property
    def hinge_uncorrected(self) -> float:
        """lambda_l * m0*c^2/kappa."""
        return self.lambda_l * self.m0 * self.c**2 / self.kappa

    @property
    def hinge_filament_corrected(self) -> float:
        """lambda_l * m0*c^2*ell_f/kappa."""
        return (
            self.lambda_l * self.m0 * self.c**2 * self.ell_f / self.kappa
        )

    @property
    def hinge_regulator_substituted(self) -> float:
        """lambda_l * (2*pi)^4*epsilon^2/(4*ell_f^2)."""
        return (
            self.lambda_l
            * (2.0 * PI)**4
            * self.epsilon**2
            / (4.0 * self.ell_f**2)
        )

    @property
    def hbar(self) -> float:
        """Structural definition: hbar = m0*c*ell_f*B."""
        return self.m0 * self.c * self.ell_f * self.B_eff

    @property
    def lambda_bar_C(self) -> float:
        """Reduced Compton length hbar/(m*c)."""
        return self.hbar / (self.mass_for_schrodinger * self.c)

    # ==================================================================
    # S^3 / LAPLACE-BELTRAMI SPECTRUM
    # ==================================================================

    @property
    def lambda_l(self) -> float:
        """lambda_l = l(l+2)/R^2."""
        l = self.l_quantum
        return l * (l + 2.0) / self.R**2

    @property
    def lambda_n(self) -> float:
        """lambda_l = (n^2 - 1)/R^2."""
        n = self.quantum_n
        return (n**2 - 1.0) / self.R**2

    # ==================================================================
    # RESONANCE
    # ==================================================================

    @property
    def lambda_s(self) -> float:
        """
        We need a dimensionalized lambda_s to evaluate the resonance
        equations. It is parameterized as:

            lambda_s = lambda_s_hat * kappa / ell_f^4

        This is a modeling convention, not an extra equation from the
        source catalog.
        """
        return self.lambda_s_hat * self.kappa / self.ell_f**4

    @property
    def omega4_unshifted(self) -> float:
        return -2.0 * self.lambda_s * self.r_h**2 / self.kappa

    @property
    def omega4_shifted(self) -> float:
        return (
            2.0
            * self.lambda_s
            * (self.R**2 - self.r_h**2)
            / self.kappa
        )

    @property
    def omega_shifted(self) -> float:
        """Real positive fourth root when omega4_shifted >= 0."""
        if self.omega4_shifted < 0:
            return float("nan")
        return self.omega4_shifted ** 0.25

    # ==================================================================
    # FINE STRUCTURE
    # ==================================================================

    @property
    def alpha_geometry(self) -> float:
        """alpha_eff ~ ell_f/r_mode."""
        return self.ell_f / self.r_mode

    @property
    def alpha_inverse_power_series(self) -> float:
        """
        alpha^-1 ≈ 1/[B0^3*(3/2)*(1-B0/2)]
        """
        return 1.0 / (
            self.B0**3 * 1.5 * (1.0 - self.B0 / 2.0)
        )

    @property
    def alpha_power_series(self) -> float:
        return 1.0 / self.alpha_inverse_power_series

    @property
    def alpha_standard(self) -> float:
        return (
            self.e_charge**2
            / (4.0 * PI * self.epsilon_0 * self.hbar * self.c)
        )

    # ==================================================================
    # GRAVITY / SCHWARZSCHILD
    # ==================================================================

    @property
    def G_emergent(self) -> float:
        """G = c^2 * ell_f/m0 * Omega."""
        return self.c**2 * self.ell_f / self.m0 * self.Omega

    @property
    def ell_G(self) -> float:
        """ell_G = G*M/c^2."""
        return self.G_emergent * self.M_source / self.c**2

    @property
    def r_s_overlap(self) -> float:
        """r_s = 2*ell_f*Omega*(M/m0)."""
        return 2.0 * self.ell_f * self.Omega * (
            self.M_source / self.m0
        )

    @property
    def r_s_stiffness(self) -> float:
        """
        r_s = 8*ell_f^4*Omega*M*c^2 /
              (kappa*(2*pi)^4*epsilon^2)
        """
        return (
            8.0
            * self.ell_f**4
            * self.Omega
            * self.M_source
            * self.c**2
            / (self.kappa * (2.0 * PI)**4 * self.epsilon**2)
        )

    @property
    def r_s_whirligig(self) -> float:
        """r_s = M*c^2/(4*pi*ell_f^2)."""
        return (
            self.M_source * self.c**2
            / (4.0 * PI * self.ell_f**2)
        )

    @property
    def perihelion_precession(self) -> float:
        """Delta theta = 6*pi*G*M/[a*(1-e^2)*c^2]."""
        denom = (
            self.semi_major_axis
            * (1.0 - self.eccentricity**2)
            * self.c**2
        )
        return 6.0 * PI * self.G_emergent * self.M_source / denom

    # ==================================================================
    # VOLUMETRIC OCCUPANCY / OVERLAP
    # ==================================================================

    @property
    def occupied_volume_one_node(self) -> float:
        """
        Using the supplied coiling approximation:
            V = integral_0^ell_f pi*epsilon^2*(1 + ell_f*2*pi/ell_f) ds
              = ell_f*pi*epsilon^2*(1+2*pi)
        """
        return (
            self.ell_f
            * PI
            * self.epsilon**2
            * (1.0 + 2.0 * PI)
        )

    @property
    def occupied_volume_total(self) -> float:
        return self.N_nodes * self.occupied_volume_one_node

    @property
    def node_volume_variant1(self) -> float:
        """V_node ~ ell_f^3*B."""
        return self.ell_f**3 * self.B_eff

    @property
    def node_volume_variant2(self) -> float:
        """V_max ~ (4/3)*pi*(ell_f*B)^3."""
        return (
            (4.0 / 3.0)
            * PI
            * (self.ell_f * self.B_eff)**3
        )

    @property
    def overlap_variant1(self) -> float:
        """omega_i = exp[-alpha*V_occupied/V_node]."""
        return math.exp(
            -self.alpha_standard
            * self.occupied_volume_total
            / self.node_volume_variant1
        )

    @property
    def overlap_variant2(self) -> float:
        return math.exp(
            -self.alpha_standard
            * self.occupied_volume_total
            / self.node_volume_variant2
        )

    # ==================================================================
    # MASS RATIOS / MASS RECOVERY
    # ==================================================================

    @property
    def proton_electron_ratio_v1(self) -> float:
        """mu = 3/(2*B^5)."""
        return 3.0 / (2.0 * self.B_eff**5)

    @property
    def mass_linear(self) -> float:
        """m_linear = Q*m0/(2B). Default Q=1."""
        Q = 1.0
        return Q * self.m0 / (2.0 * self.B_eff)

    @property
    def mass_eff_smoothing(self) -> float:
        """M_eff = m_linear*S. Default S=1."""
        S = 1.0
        return self.mass_linear * S

    # ==================================================================
    # NODE CLUSTER / MICRO BLACK HOLE
    # ==================================================================

    @property
    def R_cluster(self) -> float:
        return (
            self.ell_f
            * self.N_nodes ** (1.0 / 3.0)
            * (3.0 * self.B_eff / (4.0 * PI)) ** (1.0 / 3.0)
        )

    @property
    def M_cluster(self) -> float:
        return self.N_nodes * self.n * self.m0

    @property
    def r_s_cluster(self) -> float:
        """Using the overlap-sourced Schwarzschild form."""
        return (
            2.0
            * self.ell_f
            * self.Omega
            * self.M_cluster
            / self.m0
        )

    @property
    def cluster_collapse_ratio(self) -> float:
        """r_s_cluster / R_cluster; >= 1 means collapse criterion met."""
        return self.r_s_cluster / self.R_cluster

    @property
    def critical_N_nodes_catalog(self) -> float:
        """
        Directly evaluates the supplied catalog expression:
            N >= [
                1/(2*Omega*n) * (3B/(4*pi))^(1/3)
            ]^(3/2)

        Note: this is retained exactly as supplied, even though the
        algebraic exponent can be re-derived independently from the
        preceding inequality.
        """
        return (
            (
                1.0
                / (2.0 * self.Omega * self.n)
                * (3.0 * self.B_eff / (4.0 * PI)) ** (1.0 / 3.0)
            )
            ** (3.0 / 2.0)
        )

    # ==================================================================
    # NORMALIZED EQUATIONS
    # ==================================================================

    @property
    def beta(self) -> float:
        """beta = v/c."""
        return self.u_over_c

    @property
    def normalized_wave_speed_factor(self) -> float:
        """Coefficient multiplying nabla^2 in normalized wave equation."""
        return self.u_over_c**2

    @property
    def normalized_schrodinger_coefficient(self) -> float:
        """lambda_bar_C/2."""
        return self.lambda_bar_C / 2.0

    # ==================================================================
    # REPORT
    # ==================================================================

    def summary(self) -> Dict[str, Any]:
        """Return the main propagated values as a dictionary."""
        return {
            "MASTER INPUT": {
                "ell_f": self.ell_f,
            },
            "BASIC SCALES": {
                "epsilon": self.epsilon,
                "R": self.R,
                "r_mode": self.r_mode,
                "r_h": self.r_h,
            },
            "PROJECTION": {
                "B0": self.B0,
                "B_eff": self.B_eff,
                "theta_12": self.theta_12,
                "delta_CP": self.delta_CP,
            },
            "MASS / STIFFNESS": {
                "m0": self.m0,
                "kappa": self.kappa,
                "E_kink": self.kink_energy,
                "hbar": self.hbar,
                "lambda_bar_C": self.lambda_bar_C,
            },
            "S3 SPECTRUM": {
                "lambda_l": self.lambda_l,
                "lambda_n": self.lambda_n,
            },
            "RESONANCE": {
                "lambda_s": self.lambda_s,
                "omega4_unshifted": self.omega4_unshifted,
                "omega4_shifted": self.omega4_shifted,
                "omega_shifted": self.omega_shifted,
            },
            "FINE STRUCTURE": {
                "alpha_geometry": self.alpha_geometry,
                "alpha_power_series": self.alpha_power_series,
                "alpha_standard": self.alpha_standard,
            },
            "GRAVITY": {
                "G_emergent": self.G_emergent,
                "r_s_overlap": self.r_s_overlap,
                "r_s_stiffness": self.r_s_stiffness,
                "r_s_whirligig": self.r_s_whirligig,
                "perihelion_precession": self.perihelion_precession,
            },
            "OCCUPANCY / OVERLAP": {
                "V_occupied_total": self.occupied_volume_total,
                "V_node_variant1": self.node_volume_variant1,
                "V_node_variant2": self.node_volume_variant2,
                "Omega_overlap_variant1": self.overlap_variant1,
                "Omega_overlap_variant2": self.overlap_variant2,
            },
            "MASS RATIOS": {
                "mu_proton_electron_v1": self.proton_electron_ratio_v1,
                "m_linear": self.mass_linear,
                "M_eff_smoothing": self.mass_eff_smoothing,
            },
            "NODE CLUSTER": {
                "R_cluster": self.R_cluster,
                "M_cluster": self.M_cluster,
                "r_s_cluster": self.r_s_cluster,
                "collapse_ratio": self.cluster_collapse_ratio,
                "critical_N_nodes_catalog": self.critical_N_nodes_catalog,
            },
            "NORMALIZED": {
                "beta": self.beta,
                "wave_speed_factor": self.normalized_wave_speed_factor,
                "Schrodinger_coefficient": self.normalized_schrodinger_coefficient,
            },
        }

    def print_summary(self) -> None:
        print("=" * 72)
        print("SAT / HSUCV PROPAGATION MODEL")
        print("=" * 72)
        print(f"MASTER ell_f = {self.ell_f:.8e}")
        print()

        for section, values in self.summary().items():
            if section == "MASTER INPUT":
                continue
            print(f"[{section}]")
            for key, value in values.items():
                if isinstance(value, float):
                    print(f"  {key:32s} = {value:.10e}")
                else:
                    print(f"  {key:32s} = {value}")
            print()

    def to_json(self) -> str:
        return json.dumps(self.summary(), indent=2)


if __name__ == "__main__":
    # ================================================================
    # CHANGE THIS ONE NUMBER
    # ================================================================
    MASTER_NUMBER = 1.0e-15

    model = SATModel(
        ell_f=MASTER_NUMBER,

        # These are dimensionless conventions / independent inputs.
        # Keep them fixed if you want a pure "one-number sweep".
        epsilon_ratio=0.01,
        R_ratio=1.0,
        r_mode_ratio=1.0,
        r_h_ratio=1.0,

        # Physical anchor
        m0=9.1093837015e-31,

        # Projection/lattice choice
        delta_lattice=0.0,

        # Overlap / cluster
        Omega=1.0,
        n=1,
        N_nodes=1,

        # Resonance convention
        lambda_s_hat=1.0,
    )

    model.print_summary()

    # Optional machine-readable output:
    # print(model.to_json())
'''

path = Path("/mnt/data/sat_model.py")
path.write_text(script, encoding="utf-8")
print(f"Created {path}")
