"""
Hagalaz constrained local-generator / discrete-step reference v0.1

This is a sandbox formalization, not a canonical SAT/H(s)H definition.

A framed order state is:
    S = (c, r, F)
where
    c in R^4      center
    r > 0         sphere/order scale
    F in SO(4)    sphere-locked frame (columns are local axes x,y,z,w)

A general finite relative framed-sphere similarity has:
    translation: 4 DOF
    scale:       1 DOF
    rotation:    6 DOF  (SO(4))
= 11 continuous DOF.

The eight-slot specialization assumes center displacement is rung/tangent locked:
    d = xi * e_w
so translation contributes only one scalar:
    6 rotation + 1 scale + 1 rung = 8.
"""
from dataclasses import dataclass
import numpy as np
from scipy.linalg import expm

PLANE_ORDER = ("xy","xz","xw","yz","yw","zw")
AX = {"x":0, "y":1, "z":2, "w":3}

def so4_generator(**omega):
    """Return a 4x4 skew generator in the sphere-locked x,y,z,w frame."""
    A = np.zeros((4,4), dtype=float)
    for plane in PLANE_ORDER:
        val = float(omega.get(plane, 0.0))
        i, j = AX[plane[0]], AX[plane[1]]
        A[i,j] = -val
        A[j,i] =  val
    return A

def finite_rotation(**theta):
    """Finite SO(4) rotation from one chosen Lie-algebra chart/path."""
    return expm(so4_generator(**theta))

@dataclass
class SphereState:
    c: np.ndarray       # shape (4,)
    r: float
    F: np.ndarray       # shape (4,4), SO(4)

@dataclass
class HagalazStep:
    mu: float           # inter-order scale ratio
    xi: float           # normalized rung displacement in local +w direction
    Q: np.ndarray       # finite relative frame rotation, SO(4)

    @property
    def d_local(self):
        return np.array([0.0, 0.0, 0.0, self.xi])

def apply_step(S: SphereState, H: HagalazStep) -> SphereState:
    # Local rung-locked center shift.
    c2 = S.c + S.r * (S.F @ H.d_local)
    r2 = H.mu * S.r
    F2 = S.F @ H.Q
    return SphereState(c=c2, r=r2, F=F2)

def iterate(S0: SphereState, H: HagalazStep, n: int):
    states = [S0]
    S = S0
    for _ in range(n):
        S = apply_step(S, H)
        states.append(S)
    return states

def closed_form_center_offset(H: HagalazStep, n: int):
    """
    Dimensionless local-frame center offset after n identical steps:
        sum_{k=0}^{n-1} mu^k Q^k d
    """
    acc = np.zeros(4)
    Qk = np.eye(4)
    factor = 1.0
    d = H.d_local
    for _ in range(n):
        acc += factor * (Qk @ d)
        factor *= H.mu
        Qk = Qk @ H.Q
    return acc

def general_relative_dof():
    return {"translation":4, "scale":1, "SO4_rotation":6, "total":11}

def constrained_relative_dof():
    return {"rung_translation":1, "scale":1, "SO4_rotation":6, "total":8}

if __name__ == "__main__":
    # A deliberately noncanonical toy step: equal rotation in complementary planes.
    Q = finite_rotation(xy=np.pi/6, zw=np.pi/6)
    H = HagalazStep(mu=1.0, xi=1.0, Q=Q)
    S0 = SphereState(c=np.zeros(4), r=1.0, F=np.eye(4))
    states = iterate(S0, H, 3)
    for i,S in enumerate(states):
        print(i, "c=", np.round(S.c,6), "r=", S.r)
    print("closed-form Δc(3) =", np.round(closed_form_center_offset(H, 3),6))
