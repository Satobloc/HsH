#!/usr/bin/env python3
"""Meridian 029: variable-frame fourth-derivative false-positive gate.

SANDBOX / conditional mathematics, not a physical SAT/H(s)H claim.

Let a represented vector be y~=S(s)y and define B=S'S^{-1}.  The pushed-
forward derivative is nabla=D-B, so S D^4 S^{-1}=nabla^4.  For the commuting
fixture B(s)=theta'(s)A, the fully expanded operator is

 nabla^4 y = y'''' - 4B y''' + (6B^2-6B') y''
   + (-4B''+12BB'-4B^3)y'
   + (-B'''+4BB''+3(B')^2-6B^2B'+B^4)y.

The test uses Meridian's 2:3 carrier and a real moving SO(4) frame
S(s)=exp[epsilon sin(s) J13].  Ordinary D^4 produces apparent sidebands;
nabla^4 cancels them.  Complex numbers appear only inside NumPy's FFT
implementation, as a representation of real periodic data.
"""

from __future__ import annotations

import math
import numpy as np


def generator(i: int, j: int) -> np.ndarray:
    a = np.zeros((4, 4))
    a[i, j] = -1.0
    a[j, i] = 1.0
    return a


A = generator(0, 2)
I4 = np.eye(4)


def mv(m: np.ndarray, v: np.ndarray) -> np.ndarray:
    return np.einsum("nij,nj->ni", m, v)


def mm(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    return np.einsum("nij,njk->nik", a, b)


def spectral_derivative(values: np.ndarray, order: int, cutoff: int) -> np.ndarray:
    """Periodic derivative with a declared anti-roundoff Fourier cutoff."""
    n = values.shape[0]
    modes = np.fft.fftfreq(n, d=1.0 / n)
    coeff = np.fft.fft(values, axis=0)
    coeff[np.abs(modes) > cutoff] = 0.0
    derived = np.fft.ifft((1j * modes)[:, None] ** order * coeff, axis=0)
    return derived.real


def carrier(s: np.ndarray) -> tuple[np.ndarray, ...]:
    root2 = math.sqrt(2.0)
    h0 = np.column_stack(
        (np.cos(2*s), np.sin(2*s), np.cos(3*s), np.sin(3*s))
    ) / root2
    h1 = np.column_stack(
        (-2*np.sin(2*s), 2*np.cos(2*s), -3*np.sin(3*s), 3*np.cos(3*s))
    ) / root2
    h2 = np.column_stack(
        (-4*np.cos(2*s), -4*np.sin(2*s), -9*np.cos(3*s), -9*np.sin(3*s))
    ) / root2
    h3 = np.column_stack(
        (8*np.sin(2*s), -8*np.cos(2*s), 27*np.sin(3*s), -27*np.cos(3*s))
    ) / root2
    h4 = np.column_stack(
        (16*np.cos(2*s), 16*np.sin(2*s), 81*np.cos(3*s), 81*np.sin(3*s))
    ) / root2
    return h0, h1, h2, h3, h4


def frame_and_connection(
    s: np.ndarray, epsilon: float
) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    theta = epsilon * np.sin(s)
    project = -(A @ A)
    frame = (
        I4[None, :, :]
        + np.sin(theta)[:, None, None] * A[None, :, :]
        + (1.0 - np.cos(theta))[:, None, None] * (A @ A)[None, :, :]
    )
    # project is used only as an independent SO(4) residual check.
    assert np.linalg.norm(project - np.diag([1.0, 0.0, 1.0, 0.0])) < 1e-15
    scalars = (
        epsilon * np.cos(s),
        -epsilon * np.sin(s),
        -epsilon * np.cos(s),
        epsilon * np.sin(s),
    )
    b, bp, bpp, bppp = [x[:, None, None] * A[None, :, :] for x in scalars]
    return frame, b, bp, bpp, bppp


def evaluate(epsilon: float, n: int, cutoff: int) -> dict[str, object]:
    s = 2.0 * math.pi * np.arange(n) / n
    h0, h1, h2, h3, h4 = carrier(s)
    frame, b, bp, bpp, bppp = frame_and_connection(s, epsilon)
    y = mv(frame, h0)
    derivatives = [y] + [spectral_derivative(y, p, cutoff) for p in range(1, 5)]

    # Recursive definition of (D-B)^4.
    recursive = y.copy()
    for _ in range(4):
        recursive = spectral_derivative(recursive, 1, cutoff) - mv(b, recursive)

    b2, b3, b4 = mm(b, b), None, None
    b3 = mm(b2, b)
    b4 = mm(b3, b)
    c2 = 6.0*b2 - 6.0*bp
    c1 = -4.0*bpp + 12.0*mm(b, bp) - 4.0*b3
    c0 = (
        -bppp + 4.0*mm(b, bpp) + 3.0*mm(bp, bp)
        - 6.0*mm(b2, bp) + b4
    )
    expanded = (
        derivatives[4] - 4.0*mv(b, derivatives[3])
        + mv(c2, derivatives[2]) + mv(c1, derivatives[1]) + mv(c0, y)
    )
    target = mv(frame, h4)
    naive_residual = derivatives[4] - target
    covariant_residual = expanded - target
    recursion_residual = recursive - expanded

    amplitudes = 2.0 * np.linalg.norm(
        np.fft.fft(naive_residual, axis=0) / n, axis=1
    )
    amplitudes[0] *= 0.5
    return {
        "s": s,
        "h": (h0, h1, h2, h3, h4),
        "naive": naive_residual,
        "naive_rms": float(np.sqrt(np.mean(np.sum(naive_residual**2, axis=1)))),
        "covariant_rms": float(np.sqrt(np.mean(np.sum(covariant_residual**2, axis=1)))),
        "expanded_recursive_rms": float(np.sqrt(np.mean(np.sum(recursion_residual**2, axis=1)))),
        "frame_orthogonality": float(np.max(np.linalg.norm(
            np.swapaxes(frame, 1, 2) @ frame - I4, axis=(1, 2)
        ))),
        "amplitudes": amplitudes,
    }


def linear_naive_residual(s: np.ndarray, h: tuple[np.ndarray, ...]) -> np.ndarray:
    h0, h1, h2, h3, _ = h
    bracket = (
        4.0*np.cos(s)[:, None]*h3
        - 6.0*np.sin(s)[:, None]*h2
        - 4.0*np.cos(s)[:, None]*h1
        + np.sin(s)[:, None]*h0
    )
    return np.einsum("ij,nj->ni", A, bracket)


def main() -> None:
    zero = evaluate(0.0, n=512, cutoff=32)
    fine = evaluate(0.2, n=512, cutoff=48)
    coarse = evaluate(0.2, n=256, cutoff=32)
    small = evaluate(1.0e-6, n=512, cutoff=32)

    linear = linear_naive_residual(small["s"], small["h"])
    linear_error = float(np.sqrt(np.mean(np.sum(
        (small["naive"] / 1.0e-6 - linear) ** 2, axis=1
    ))))
    resolution_delta = abs(fine["naive_rms"] - coarse["naive_rms"])

    positive_modes = np.asarray(fine["amplitudes"])[1:20]
    leaders = np.argsort(positive_modes)[::-1][:6] + 1

    print(f"epsilon0_naive_rms={zero['naive_rms']:.3e}")
    print(f"epsilon0_covariant_rms={zero['covariant_rms']:.3e}")
    print(f"epsilon0p2_naive_rms={fine['naive_rms']:.12f}")
    print(f"epsilon0p2_covariant_rms={fine['covariant_rms']:.3e}")
    print(f"expanded_vs_recursive_rms={fine['expanded_recursive_rms']:.3e}")
    print(f"frame_orthogonality_residual={fine['frame_orthogonality']:.3e}")
    print(f"linearization_rms_error_at_1e-6={linear_error:.3e}")
    print(f"naive_rms_256_to_512_delta={resolution_delta:.3e}")
    print("dominant_naive_modes=" + ",".join(
        f"{int(k)}:{fine['amplitudes'][k]:.9f}" for k in leaders
    ))

    assert zero["naive_rms"] < 2e-9
    assert zero["covariant_rms"] < 2e-9
    assert fine["naive_rms"] > 5.0
    assert fine["covariant_rms"] < 2e-8
    assert fine["expanded_recursive_rms"] < 2e-8
    assert fine["frame_orthogonality"] < 2e-15
    assert linear_error < 2e-4
    assert resolution_delta < 2e-10
    print("status=PASS")
    print(
        "boundary=real moving-frame fixture only; ordinary-derivative sidebands "
        "are a demonstrated false positive, not a dynamics or physical claim"
    )


if __name__ == "__main__":
    main()
