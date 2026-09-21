from __future__ import annotations

import numpy as np
from scipy.spatial.distance import cdist

N = 520
L = 8 * np.pi
THETA0 = np.pi / 4
K_THETA = 1.0
K_PSI = 1.0
PLANE_PAIRS = [
    (0, 1, "xy"),
    (0, 2, "xz"),
    (0, 3, "xw"),
    (1, 2, "yz"),
    (1, 3, "yw"),
    (2, 3, "zw"),
]


def unit(v, eps=1e-14):
    n = np.linalg.norm(v)
    if n <= eps:
        raise ValueError("degenerate vector")
    return v / n


def resample_curve(points, n=None):
    P = np.asarray(points, float)
    n = len(P) if n is None else n
    ds = np.linalg.norm(np.diff(P, axis=0), axis=1)
    s = np.concatenate([[0.0], np.cumsum(ds)])
    if s[-1] <= 0:
        raise ValueError("degenerate curve")
    su = np.linspace(0.0, s[-1], n)
    Q = np.column_stack([np.interp(su, s, P[:, j]) for j in range(P.shape[1])])
    return Q, su


def tangents(points):
    d = np.gradient(points, axis=0)
    return d / np.linalg.norm(d, axis=1)[:, None]


def minimal_rotation(a, b):
    """SO(d) rotation taking unit a to unit b and acting minimally off span(a,b)."""
    a = unit(a)
    b = unit(b)
    c = float(np.dot(a, b))
    if c < -1 + 1e-10:
        e = np.zeros_like(a)
        e[np.argmin(np.abs(a))] = 1.0
        u = unit(e - a * np.dot(a, e))
        return np.eye(len(a)) - 2 * np.outer(a, a) - 2 * np.outer(u, u)
    K = np.outer(b, a) - np.outer(a, b)
    return np.eye(len(a)) + K + (K @ K) / (1.0 + c)


def initial_frame(t0, preferred=None):
    """Return a positively oriented local frame [N1,N2,N3,T]."""
    vecs = []
    candidates = []
    if preferred is not None:
        candidates += [preferred[:, j] for j in range(preferred.shape[1])]
    candidates += [np.eye(4)[:, j] for j in range(4)]

    for v in candidates:
        w = np.array(v, float)
        w -= t0 * np.dot(t0, w)
        for q in vecs:
            w -= q * np.dot(q, w)
        n = np.linalg.norm(w)
        if n > 1e-9:
            vecs.append(w / n)
        if len(vecs) == 3:
            break
    return np.column_stack(vecs + [t0])


def rmf(points, preferred0=None):
    """Discrete rotation-minimizing/Bishop-type frame in R4."""
    P, s = resample_curve(points, len(points))
    T = tangents(P)
    F = np.zeros((len(P), 4, 4))
    F[0] = initial_frame(T[0], preferred0)

    for i in range(len(P) - 1):
        R = minimal_rotation(T[i], T[i + 1])
        transported = R @ F[i][:, :3]
        vecs = []
        for j in range(3):
            w = transported[:, j].copy()
            w -= T[i + 1] * np.dot(T[i + 1], w)
            for q in vecs:
                w -= q * np.dot(q, w)
            n = np.linalg.norm(w)
            if n <= 1e-10:
                fallback = initial_frame(T[i + 1], F[i])
                vecs = [fallback[:, k] for k in range(3)]
                break
            vecs.append(w / n)
        F[i + 1] = np.column_stack(vecs + [T[i + 1]])
    return P, s, F


def normal_sphere_lift(carrier, rho, k_theta, k_psi, theta0=THETA0, preferred0=None):
    """Constant-radius lift whose offset direction moves on S^2 in the R4 normal space."""
    C, s, F = rmf(carrier, preferred0)
    theta = theta0 + k_theta * s
    psi = k_psi * s
    coeff = np.column_stack(
        [
            np.cos(theta),
            np.sin(theta) * np.cos(psi),
            np.sin(theta) * np.sin(psi),
        ]
    )
    radial = rho * np.einsum("nij,nj->ni", F[:, :, :3], coeff)
    lifted = C + radial
    lifted, sl = resample_curve(lifted, len(lifted))
    Fl = rmf(lifted, F[0])[2]
    return {
        "carrier": C,
        "carrier_s": s,
        "carrier_F": F,
        "curve": lifted,
        "curve_s": sl,
        "curve_F": Fl,
        "radial": radial,
    }


def hierarchy(mu, orders=3):
    """Repeated lift with the strict-similarity control rho->mu*rho, k->k/mu."""
    t = np.linspace(0.0, L, N)
    c0 = np.column_stack([np.zeros(N), np.zeros(N), np.zeros(N), t])
    f0 = np.repeat(np.eye(4)[None, :, :], N, axis=0)

    curves = [c0]
    frames = [f0]
    lifts = [None]
    rhos = [None]

    rho = 1.0
    kt = K_THETA
    kp = K_PSI
    carrier = c0
    preferred = np.eye(4)

    for _ in range(orders):
        d = normal_sphere_lift(carrier, rho, kt, kp, preferred0=preferred)
        carrier = d["curve"]
        preferred = d["curve_F"][0]
        curves.append(carrier)
        frames.append(d["curve_F"])
        lifts.append(d)
        rhos.append(rho)
        rho *= mu
        kt /= mu
        kp /= mu
    return curves, frames, lifts, rhos


def relative_generator_channels(Fa, Fb):
    """Six local channels of Q(u)=Fa(u)^T Fb(u), with u normalized to [0,1]."""
    Q = np.einsum("nij,njk->nik", np.transpose(Fa, (0, 2, 1)), Fb)
    u = np.linspace(0.0, 1.0, len(Q))
    dQ = np.gradient(Q, u, axis=0)
    Om = np.einsum("nij,njk->nik", np.transpose(Q, (0, 2, 1)), dQ)
    Om = 0.5 * (Om - np.transpose(Om, (0, 2, 1)))
    return {label: Om[:, i, j] for i, j, label in PLANE_PAIRS}


def nonlocal_min_distance(P, exclusion=14):
    D = cdist(P, P)
    idx = np.arange(len(P))
    D[np.abs(idx[:, None] - idx[None, :]) <= exclusion] = np.inf
    return float(np.min(D))


def lift_residuals(data, rho):
    radial = data["radial"]
    T = data["carrier_F"][:, :, 3]
    radius_res = float(np.max(np.abs(np.linalg.norm(radial, axis=1) - rho)) / rho)
    orth_res = float(np.max(np.abs(np.einsum("ni,ni->n", radial, T))) / rho)
    return radius_res, orth_res


def main():
    curves, frames, lifts, rhos = hierarchy(1.0)
    print("mu=1 normalized RMS channel activation")

    for a, b, name in [(0, 1, "S1->S2"), (1, 2, "S2->S3"), (2, 3, "S3->S4")]:
        ch = relative_generator_channels(frames[a], frames[b])
        rms = np.array([np.sqrt(np.mean(ch[label] ** 2)) for _, _, label in PLANE_PAIRS])
        norm = rms / max(np.max(rms), 1e-15)
        vals = ", ".join(f"{PLANE_PAIRS[i][2]}={norm[i]:.6g}" for i in range(6))
        print(name, vals)

    for order in (1, 2, 3):
        rr, oo = lift_residuals(lifts[order], rhos[order])
        dmin = nonlocal_min_distance(curves[order])
        print(
            f"order {order}: radius_res={rr:.3e}, orth_res={oo:.3e}, "
            f"amax/rho={(dmin / 2) / rhos[order]:.6g}"
        )


if __name__ == "__main__":
    main()
