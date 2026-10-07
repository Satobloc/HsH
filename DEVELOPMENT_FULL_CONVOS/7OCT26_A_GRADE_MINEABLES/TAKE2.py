from pathlib import Path

script = r'''#!/usr/bin/env python3
"""
SAT / HSUCV interconnected-equation calculator.

This script implements the equations supplied in the source compilation.
It is intentionally dependency-driven: enter one or more anchor inputs and
the script propagates them through every equation that can be evaluated.

Important source-status rules:
  * The deprecated linear mass law is retained but clearly labelled.
  * The corrected mass law is retained separately.
  * Equations that require quantities not supplied by the source are not
    invented; the calculator reports them as "not computable".
  * The G -> ell_f and J_eff -> B chains are implemented exactly as supplied.
  * B(J_eff,S) has no closed-form expression in the source, so a numerical
    root solve is used for the stated implicit equation.

Typical examples:
    python sat_calculator.py
    python sat_calculator.py --G 6.67430e-11
    python sat_calculator.py --J-eff 0.03265 --S 0.2621
    python sat_calculator.py --B 0.23873241 --m0 1.0073e-27
    python sat_calculator.py --G 6.67430e-11 --J-eff 0.03265 --S 0.2621

For a guided interactive session:
    python sat_calculator.py --interactive

No third-party packages are required.
"""

from __future__ import annotations

import argparse
import json
import math
import sys
from dataclasses import dataclass, asdict
from typing import Optional


# ---------------------------------------------------------------------------
# Physical constants
# ---------------------------------------------------------------------------

PI = math.pi
C = 299_792_458.0
H = 6.62607015e-34
HBAR = H / (2.0 * PI)
E_CHARGE = 1.602176634e-19
EPSILON_0 = 8.8541878128e-12

# Source values / structural defaults
B_GEOMETRIC = 3.0 / (4.0 * PI)
S_DEFAULT = 0.2621
DELTA_BRIDGE_DEFAULT = 8.2e-5
M0_DEFAULT = 1.0073e-27
F_HE3_DEFAULT = 8.665e8
ALPHA_DEFAULT = 7.2973525693e-3


# ---------------------------------------------------------------------------
# Utility functions
# ---------------------------------------------------------------------------

def fmt(x: float) -> str:
    if x is None:
        return "not available"
    if isinstance(x, float) and (math.isnan(x) or math.isinf(x)):
        return "not available"
    if x == 0:
        return "0"
    return f"{x:.10e}"


def require_positive(name: str, x: float) -> None:
    if x <= 0:
        raise ValueError(f"{name} must be > 0; received {x}")


def bisect_root(func, lo: float, hi: float, iterations: int = 200) -> float:
    """Simple dependency-free bisection solver."""
    flo = func(lo)
    fhi = func(hi)

    if abs(flo) < 1e-15:
        return lo
    if abs(fhi) < 1e-15:
        return hi

    # If there is no sign change, scan the interval for one.
    if flo * fhi > 0:
        previous_x = lo
        previous_f = flo
        for i in range(1, 1001):
            x = lo + (hi - lo) * i / 1000.0
            fx = func(x)
            if previous_f * fx <= 0:
                lo, hi = previous_x, x
                flo, fhi = previous_f, fx
                break
            previous_x, previous_f = x, fx
        else:
            raise ValueError(
                "Could not bracket a B solution for the supplied J_eff and S."
            )

    for _ in range(iterations):
        mid = 0.5 * (lo + hi)
        fmid = func(mid)
        if abs(fmid) < 1e-14:
            return mid
        if flo * fmid <= 0:
            hi, fhi = mid, fmid
        else:
            lo, flo = mid, fmid

    return 0.5 * (lo + hi)


# ---------------------------------------------------------------------------
# Input container
# ---------------------------------------------------------------------------

@dataclass
class Inputs:
    # Primary anchors
    B: Optional[float] = None
    ell_f: Optional[float] = None
    G: Optional[float] = None
    J_eff: Optional[float] = None

    # Mass-sector inputs
    m0: float = M0_DEFAULT
    S: float = S_DEFAULT
    delta_bridge: float = DELTA_BRIDGE_DEFAULT

    # CKM / CP
    theta_12: Optional[float] = None

    # Optional quantum inputs
    l: int = 1
    R: Optional[float] = None

    # Melting-point / periodic interpolation inputs
    A_A: Optional[float] = None
    A_B: Optional[float] = None
    A_X: Optional[float] = None
    Tm_A: Optional[float] = None
    Tm_B: Optional[float] = None
    ThetaD_A: Optional[float] = None
    ThetaD_B: Optional[float] = None
    ThetaD_X: Optional[float] = None

    # Standard chemistry interpolation inputs
    M_A: Optional[float] = None
    M_B: Optional[float] = None
    M_X: Optional[float] = None
    Vm_A: Optional[float] = None
    Vm_B: Optional[float] = None
    Vm_X: Optional[float] = None
    Z_A: Optional[float] = None
    Z_B: Optional[float] = None
    Z_X: Optional[float] = None

    # Output mode
    json_output: bool = False


# ---------------------------------------------------------------------------
# Calculator
# ---------------------------------------------------------------------------

class SATCalculator:
    def __init__(self, inp: Inputs):
        self.i = inp
        self.r: dict[str, float | str] = {}
        self.notes: list[str] = []

    def set(self, name: str, value):
        if value is not None:
            self.r[name] = value

    def calculate(self) -> dict:
        i = self.i

        # ---------------------------------------------------------------
        # 1. PRIMARY ANCHORS
        # ---------------------------------------------------------------

        # B = 3/(4*pi)
        if i.B is None:
            # If J_eff and S are available, solve the implicit equation
            # J_eff = (3/4) B(1-B^2) S(1-S).
            if i.J_eff is not None:
                if i.S <= 0 or i.S >= 1:
                    self.notes.append(
                        "J_eff -> B inversion requires 0 < S < 1."
                    )
                else:
                    target = i.J_eff
                    factor = 0.75 * i.S * (1.0 - i.S)

                    def f(B):
                        return factor * B * (1.0 - B * B) - target

                    try:
                        i.B = bisect_root(f, 1e-12, 0.999999)
                        self.notes.append(
                            "B was numerically inverted from J_eff and S."
                        )
                    except ValueError:
                        pass

            if i.B is None:
                i.B = B_GEOMETRIC
                self.notes.append(
                    "B defaulted to the geometric projection constant 3/(4*pi)."
                )

        require_positive("B", i.B)
        self.set("B", i.B)

        # ell_f from G:
        # ell_f(G) = sqrt(G/(8*pi*c^4))
        if i.ell_f is None and i.G is not None:
            require_positive("G", i.G)
            i.ell_f = math.sqrt(i.G / (8.0 * PI * C**4))
            self.notes.append("ell_f calculated from G using the supplied SAT relation.")

        # ell_f from the supplied He3 anchoring expression:
        # ell_f = (h*c/(2*pi*f_He3*alpha^2))^(1/3)
        if i.ell_f is None:
            i.ell_f = (
                H * C
                / (2.0 * PI * F_HE3_DEFAULT * ALPHA_DEFAULT**2)
            ) ** (1.0 / 3.0)
            self.notes.append(
                "ell_f calculated from the supplied He3/Rydberg anchoring expression."
            )

        require_positive("ell_f", i.ell_f)
        self.set("ell_f", i.ell_f)

        # ---------------------------------------------------------------
        # 2. PROJECTION / CKM
        # ---------------------------------------------------------------

        B = i.B
        S = i.S

        theta12 = B * (1.0 - B**2)
        theta23 = B**2 * (1.0 - S)
        theta13 = B**3 * S
        J_eff_from_B = 0.75 * theta12 * S * (1.0 - S)
        J_obs = J_eff_from_B * B**5
        delta_cp = 270.0
        delta_cp_rad = 3.0 * PI / 2.0

        self.set("theta_12", theta12)
        self.set("theta_23", theta23)
        self.set("theta_13", theta13)
        self.set("J_eff_from_B", J_eff_from_B)
        self.set("J_obs", J_obs)
        self.set("delta_CP_deg", delta_cp)
        self.set("delta_CP_rad", delta_cp_rad)

        if i.J_eff is not None:
            self.set("J_eff_input", i.J_eff)
            self.set("J_eff_residual", J_eff_from_B - i.J_eff)

        # ---------------------------------------------------------------
        # 3. MASS SECTOR
        # ---------------------------------------------------------------

        m0 = i.m0
        require_positive("m0", m0)

        # Deprecated:
        # m_linear = Q*m0/(2B)
        # For proton Q=3.
        mp_deprecated = 3.0 * m0 / (2.0 * B)

        # Corrected master mass law:
        # m_eff = Q*m0*B^f*S*(1+delta_bridge)
        #
        # Source specifies f=4 for Q=1 and f=-1 for Q=3.
        me_corrected = m0 * B**4 * S * (1.0 + i.delta_bridge)
        mp_corrected = (
            3.0 * m0 * B**(-1.0) * S * (1.0 + i.delta_bridge)
        )

        # Separate "mass gears" explicitly given in the derivation:
        # mp = 3m0/(2B), me = m0 B^4
        mp_gear = 3.0 * m0 / (2.0 * B)
        me_gear = m0 * B**4

        mu_basic = 3.0 / (2.0 * B**5)
        mu_bridge = mu_basic * (1.0 + i.delta_bridge)

        self.set("m0", m0)
        self.set("m_linear_proton_DEPRECATED", mp_deprecated)
        self.set("m_eff_electron_corrected", me_corrected)
        self.set("m_eff_proton_corrected", mp_corrected)
        self.set("m_proton_mass_gear", mp_gear)
        self.set("m_electron_mass_gear", me_gear)
        self.set("mu_basic", mu_basic)
        self.set("mu_with_bridge", mu_bridge)

        # ---------------------------------------------------------------
        # 4. GRAVITY / FILAMENT SCALE
        # ---------------------------------------------------------------

        # Source relation:
        # G/c^4 -> 8*pi*ell_f^2
        # and its stated inversion ell_f(G)=sqrt(G/(8*pi*c^4)).
        G_from_ell = 8.0 * PI * i.ell_f**2 * C**4

        self.set("G_from_ell_f", G_from_ell)

        if i.G is not None:
            self.set("G_input", i.G)
            self.set("G_residual", G_from_ell - i.G)

        # ---------------------------------------------------------------
        # 5. QUANTUM / S3
        # ---------------------------------------------------------------

        R = i.R if i.R is not None else i.ell_f
        require_positive("R", R)

        lam = i.l * (i.l + 2.0) / R**2

        self.set("R", R)
        self.set("lambda_l", lam)

        # ---------------------------------------------------------------
        # 6. UNIFICATION FROM J_eff / J_obs
        # ---------------------------------------------------------------

        # B^5 = J_obs/J_eff
        # The source also states:
        # mu = 3 J_eff / (2 J_obs) * (1+delta_bridge)
        if i.J_eff is not None and i.J_eff != 0 and J_obs != 0:
            self.set(
                "mu_from_J_eff_J_obs",
                3.0 * i.J_eff / (2.0 * J_obs)
                * (1.0 + i.delta_bridge),
            )

        self.set(
            "B5",
            B**5,
        )
        self.set(
            "B5_from_Jobs_over_Jeff",
            J_obs / J_eff_from_B if J_eff_from_B != 0 else float("nan"),
        )

        # ---------------------------------------------------------------
        # 7. MELTING POINT: SAT VERSION
        # ---------------------------------------------------------------

        if all(
            x is not None
            for x in (
                i.A_A, i.A_B, i.A_X,
                i.Tm_A, i.Tm_B,
                i.ThetaD_A, i.ThetaD_B, i.ThetaD_X,
            )
        ):
            QA = 3.0 * i.A_A
            QB = 3.0 * i.A_B
            QX = 3.0 * i.A_X

            def smoothing(Q):
                # Source gives S≈0.2621 for dense weaves and does not give
                # a complete universal S(Q) function. Use the supplied
                # constant for all three when this calculation is requested.
                return S

            SA = smoothing(QA)
            SB = smoothing(QB)
            SX = smoothing(QX)

            denom = QB * SB - QA * SA
            if denom != 0:
                interpolation = (
                    QX * SX - QA * SA
                ) / denom

                TmX_sat = (
                    i.Tm_A
                    + interpolation
                    * (
                        i.Tm_B * (i.ThetaD_X / i.ThetaD_B)
                        - i.Tm_A * (i.ThetaD_X / i.ThetaD_A)
                    )
                )

                self.set("Q_A", QA)
                self.set("Q_B", QB)
                self.set("Q_X", QX)
                self.set("Tm_X_SAT", TmX_sat)

        # ---------------------------------------------------------------
        # 8. MELTING POINT: STANDARD CHEMISTRY VERSION
        # ---------------------------------------------------------------

        if all(
            x is not None
            for x in (
                i.M_A, i.M_B, i.M_X,
                i.Vm_A, i.Vm_B, i.Vm_X,
                i.ThetaD_A, i.ThetaD_B, i.ThetaD_X,
                i.Tm_A, i.Tm_B,
                i.Z_A, i.Z_B, i.Z_X,
            )
        ):
            etaA = i.Tm_A / (
                i.M_A * i.ThetaD_A**2 * i.Vm_A**(2.0 / 3.0)
            )
            etaB = i.Tm_B / (
                i.M_B * i.ThetaD_B**2 * i.Vm_B**(2.0 / 3.0)
            )

            zden = i.Z_B - i.Z_A
            if zden != 0:
                etaX = etaA + (
                    (i.Z_X - i.Z_A) / zden
                ) * (etaB - etaA)

                TmX_standard = etaX * i.M_X * (
                    i.ThetaD_X**2
                ) * i.Vm_X**(2.0 / 3.0)

                self.set("eta_A", etaA)
                self.set("eta_B", etaB)
                self.set("eta_X", etaX)
                self.set("Tm_X_standard", TmX_standard)

        return self.r

    def report(self) -> str:
        if not self.r:
            self.calculate()

        groups = {
            "PRIMARY ANCHORS": [
                "B", "ell_f", "G_input", "G_from_ell_f", "J_eff_input",
            ],
            "CKM / CP": [
                "theta_12", "theta_23", "theta_13",
                "J_eff_from_B", "J_obs",
                "delta_CP_deg", "delta_CP_rad",
            ],
            "MASS SECTOR": [
                "m0", "m_linear_proton_DEPRECATED",
                "m_eff_electron_corrected", "m_eff_proton_corrected",
                "m_proton_mass_gear", "m_electron_mass_gear",
                "mu_basic", "mu_with_bridge",
                "mu_from_J_eff_J_obs",
            ],
            "GRAVITY / SCALE": [
                "G_from_ell_f", "G_residual",
            ],
            "S3 / QUANTUM": [
                "R", "lambda_l",
            ],
            "MELTING POINT": [
                "Q_A", "Q_B", "Q_X",
                "Tm_X_SAT",
                "eta_A", "eta_B", "eta_X",
                "Tm_X_standard",
            ],
        }

        lines = []
        lines.append("=" * 78)
        lines.append("SAT / HSUCV INTERCONNECTED EQUATION CALCULATOR")
        lines.append("=" * 78)

        for group, keys in groups.items():
            lines.append(f"\n[{group}]")
            for key in keys:
                if key in self.r:
                    value = self.r[key]
                    if isinstance(value, (int, float)):
                        lines.append(f"{key:38s} = {fmt(float(value))}")
                    else:
                        lines.append(f"{key:38s} = {value}")

        if self.notes:
            lines.append("\n[CALCULATION NOTES]")
            for note in self.notes:
                lines.append(f"- {note}")

        lines.append("\n[UNAVAILABLE / REQUIRES ADDITIONAL INPUT]")
        lines.append(
            "- Equations needing quantities not supplied as inputs are left unevaluated."
        )
        lines.append(
            "- The SAT melting-point S(Q) law is incomplete in the source; "
            "the supplied S=0.2621 is therefore used when that calculation is requested."
        )

        return "\n".join(lines)


# ---------------------------------------------------------------------------
# Interactive input
# ---------------------------------------------------------------------------

def interactive() -> Inputs:
    print("\nSAT / HSUCV calculator")
    print("Press Enter to accept the default or leave a field blank.\n")

    def ask_float(label, default=None):
        suffix = f" [{default}]" if default is not None else ""
        raw = input(f"{label}{suffix}: ").strip()
        if not raw:
            return default
        return float(raw)

    def ask_int(label, default=None):
        suffix = f" [{default}]" if default is not None else ""
        raw = input(f"{label}{suffix}: ").strip()
        if not raw:
            return default
        return int(raw)

    return Inputs(
        B=ask_float("B", None),
        ell_f=ask_float("ell_f (m)", None),
        G=ask_float("G", None),
        J_eff=ask_float("J_eff", None),
        m0=ask_float("m0 (kg)", M0_DEFAULT),
        S=ask_float("S", S_DEFAULT),
        delta_bridge=ask_float("Delta_bridge", DELTA_BRIDGE_DEFAULT),
        l=ask_int("S3 angular index l", 1),
        R=ask_float("R (m)", None),
    )


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def build_parser():
    p = argparse.ArgumentParser(
        description="Interconnected SAT / HSUCV equation calculator."
    )

    p.add_argument("--B", type=float, help="Projection constant B.")
    p.add_argument("--ell-f", type=float, dest="ell_f",
                   help="Filament scale ell_f in metres.")
    p.add_argument("--G", type=float, help="Newton gravitational constant.")
    p.add_argument("--J-eff", type=float, dest="J_eff",
                   help="Effective Jarlskog invariant.")
    p.add_argument("--m0", type=float, default=M0_DEFAULT,
                   help="Universal mass anchor in kg.")
    p.add_argument("--S", type=float, default=S_DEFAULT,
                   help="Braid-smoothing factor.")
    p.add_argument("--delta-bridge", type=float,
                   default=DELTA_BRIDGE_DEFAULT,
                   help="Holonomy bridge correction.")
    p.add_argument("--l", type=int, default=1,
                   help="S3 angular index l.")
    p.add_argument("--R", type=float,
                   help="S3 radius. Defaults to ell_f.")

    # SAT melting-point calculation
    p.add_argument("--A-A", type=float, dest="A_A")
    p.add_argument("--A-B", type=float, dest="A_B")
    p.add_argument("--A-X", type=float, dest="A_X")
    p.add_argument("--Tm-A", type=float, dest="Tm_A")
    p.add_argument("--Tm-B", type=float, dest="Tm_B")
    p.add_argument("--ThetaD-A", type=float, dest="ThetaD_A")
    p.add_argument("--ThetaD-B", type=float, dest="ThetaD_B")
    p.add_argument("--ThetaD-X", type=float, dest="ThetaD_X")

    # Standard chemistry melting-point calculation
    p.add_argument("--M-A", type=float, dest="M_A")
    p.add_argument("--M-B", type=float, dest="M_B")
    p.add_argument("--M-X", type=float, dest="M_X")
    p.add_argument("--Vm-A", type=float, dest="Vm_A")
    p.add_argument("--Vm-B", type=float, dest="Vm_B")
    p.add_argument("--Vm-X", type=float, dest="Vm_X")
    p.add_argument("--Z-A", type=float, dest="Z_A")
    p.add_argument("--Z-B", type=float, dest="Z_B")
    p.add_argument("--Z-X", type=float, dest="Z_X")

    p.add_argument("--interactive", action="store_true")
    p.add_argument("--json", action="store_true",
                   help="Print results as JSON.")
    return p


def main():
    parser = build_parser()
    args = parser.parse_args()

    if args.interactive:
        inp = interactive()
    else:
        inp = Inputs(
            B=args.B,
            ell_f=args.ell_f,
            G=args.G,
            J_eff=args.J_eff,
            m0=args.m0,
            S=args.S,
            delta_bridge=args.delta_bridge,
            l=args.l,
            R=args.R,
            A_A=args.A_A,
            A_B=args.A_B,
            A_X=args.A_X,
            Tm_A=args.Tm_A,
            Tm_B=args.Tm_B,
            ThetaD_A=args.ThetaD_A,
            ThetaD_B=args.ThetaD_B,
            ThetaD_X=args.ThetaD_X,
            M_A=args.M_A,
            M_B=args.M_B,
            M_X=args.M_X,
            Vm_A=args.Vm_A,
            Vm_B=args.Vm_B,
            Vm_X=args.Vm_X,
            Z_A=args.Z_A,
            Z_B=args.Z_B,
            Z_X=args.Z_X,
            json_output=args.json,
        )

    try:
        calc = SATCalculator(inp)
        results = calc.calculate()

        if inp.json_output:
            print(json.dumps(results, indent=2, allow_nan=False))
        else:
            print(calc.report())

    except (ValueError, ZeroDivisionError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
'''

path = Path("/mnt/data/sat_calculator.py")
path.write_text(script, encoding="utf-8")

# Also create a compact README with examples.
readme = r"""# SAT / HSUCV Calculator

Run:

```bash
python sat_calculator.py
```

Examples:

```bash
python sat_calculator.py --B 0.23873241 --m0 1.0073e-27
python sat_calculator.py --G 6.67430e-11
python sat_calculator.py --J-eff 0.03265 --S 0.2621
python sat_calculator.py --G 6.67430e-11 --J-eff 0.03265 --S 0.2621
python sat_calculator.py --interactive
python sat_calculator.py --B 0.23873241 --json
```

The calculator preserves the supplied source's competing formulations,
including the deprecated linear mass law and the corrected mass law, rather
than silently replacing one with the other.
"""
Path("/mnt/data/README_sat_calculator.md").write_text(readme, encoding="utf-8")

print(path)
print(Path("/mnt/data/README_sat_calculator.md"))
