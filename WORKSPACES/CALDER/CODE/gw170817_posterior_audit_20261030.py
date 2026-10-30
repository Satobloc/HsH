#!/usr/bin/env python3
"""Reproduce the GW170817 posterior-summary audit from pinned public NPZ products.

Requires Python 3.10+ and NumPy only. The NPZ products are processed extracts,
not raw strain data or independent experiments. The component-Lambda samples are
not reweighted to the paper's flat prior in effective tidal deformability.
"""
from __future__ import annotations

import hashlib
import io
import json
import urllib.request
from pathlib import Path

import numpy as np

REPO = "nuclear-multimessenger-astronomy/jester"
COMMIT = "9c75712264491178b7a5aac27eaf85a5af483b3a"
BASE = f"https://raw.githubusercontent.com/{REPO}/{COMMIT}/jesterTOV/inference/data/gw170817/"

DATASETS = {
    "P1800061-low": {
        "file": "gw170817_low_spin_posterior.npz",
        "git_blob_sha1": "3814952e60c8cfad7275fefa5c47a1a905d1c7e5",
        "expected_n": 3952,
    },
    "P1800061-high": {
        "file": "gw170817_high_spin_posterior.npz",
        "git_blob_sha1": "aa109efcc57fdff1e6f3971663710f920336c467",
        "expected_n": 9117,
    },
    "GWTC1-low": {
        "file": "gw170817_gwtc1_lowspin_posterior.npz",
        "git_blob_sha1": "6dc8d2c5afe94fe955e4d1df203236aa42aa5f41",
        "expected_n": 8078,
    },
    "GWTC1-high": {
        "file": "gw170817_gwtc1_highspin_posterior.npz",
        "git_blob_sha1": "52d871519befeb53976e90f4ba57b95e6d6999d0",
        "expected_n": 4041,
    },
}

HOST_REDSHIFT = 0.0099  # geocentric host-galaxy redshift used in the 2019 paper


def git_blob_sha1(raw: bytes) -> str:
    return hashlib.sha1(f"blob {len(raw)}\0".encode() + raw).hexdigest()


def hpd_shortest(values: np.ndarray, credibility: float = 0.90) -> tuple[float, float]:
    x = np.sort(np.asarray(values, dtype=float))
    k = int(np.floor(credibility * len(x)))
    if k < 1 or k >= len(x):
        raise ValueError("invalid HPD window")
    widths = x[k:] - x[:-k]
    i = int(np.argmin(widths))
    return float(x[i]), float(x[i + k])


def effective_tidal_lambda(m1, m2, lambda1, lambda2):
    return (16.0 / 13.0) * (
        (m1 + 12.0 * m2) * m1**4 * lambda1
        + (m2 + 12.0 * m1) * m2**4 * lambda2
    ) / (m1 + m2) ** 5


def load_dataset(label: str, spec: dict) -> dict:
    url = BASE + spec["file"]
    with urllib.request.urlopen(url, timeout=60) as response:
        raw = response.read()

    blob = git_blob_sha1(raw)
    if blob != spec["git_blob_sha1"]:
        raise RuntimeError(f"{label}: Git blob SHA mismatch: {blob}")
    sha256 = hashlib.sha256(raw).hexdigest()

    # Only numeric arrays are read. The metadata object array is deliberately ignored.
    with np.load(io.BytesIO(raw), allow_pickle=False) as archive:
        m1 = np.asarray(archive["mass_1_source"], dtype=float)
        m2 = np.asarray(archive["mass_2_source"], dtype=float)
        l1 = np.asarray(archive["lambda_1"], dtype=float)
        l2 = np.asarray(archive["lambda_2"], dtype=float)

    n = len(m1)
    if n != spec["expected_n"] or not all(len(a) == n for a in (m2, l1, l2)):
        raise RuntimeError(f"{label}: sample-count or array-length mismatch")
    if not all(np.isfinite(a).all() for a in (m1, m2, l1, l2)):
        raise RuntimeError(f"{label}: non-finite sample")
    if not np.all(m1 >= m2):
        raise RuntimeError(f"{label}: component ordering assumption failed")

    q = m2 / m1
    mt = effective_tidal_lambda(m1, m2, l1, l2)
    mt_scaled = effective_tidal_lambda(
        m1 * (1.0 + HOST_REDSHIFT),
        m2 * (1.0 + HOST_REDSHIFT),
        l1,
        l2,
    )

    return {
        "dataset": label,
        "source_file": spec["file"],
        "git_blob_sha1": blob,
        "sha256": sha256,
        "n_posterior_samples_not_independent_observations": n,
        "q_10": float(np.quantile(q, 0.10, method="linear")),
        "q_50": float(np.quantile(q, 0.50, method="linear")),
        "q_90": float(np.quantile(q, 0.90, method="linear")),
        "tilde_lambda_median_unreweighted": float(np.quantile(mt, 0.50, method="linear")),
        "tilde_lambda_hpd90_shortest_unreweighted": hpd_shortest(mt),
        "corr_q_tilde_lambda_unreweighted": float(np.corrcoef(q, mt)[0, 1]),
        "lambda1_mean": float(np.mean(l1)),
        "lambda1_sd": float(np.std(l1, ddof=1)),
        "lambda2_mean": float(np.mean(l2)),
        "lambda2_sd": float(np.std(l2, ddof=1)),
        "max_abs_tilde_lambda_change_under_common_redshift_scale": float(
            np.max(np.abs(mt_scaled - mt))
        ),
        "prior_note": (
            "component-Lambda posterior samples extracted without the paper's "
            "flat-prior-in-tilde-Lambda reweighting"
        ),
    }


def main() -> None:
    results = [load_dataset(label, spec) for label, spec in DATASETS.items()]
    by_name = {r["dataset"]: r for r in results}

    p18_low = by_name["P1800061-low"]["tilde_lambda_median_unreweighted"]
    p18_high = by_name["P1800061-high"]["tilde_lambda_median_unreweighted"]
    gwtc_low = by_name["GWTC1-low"]["tilde_lambda_median_unreweighted"]
    gwtc_high = by_name["GWTC1-high"]["tilde_lambda_median_unreweighted"]

    summary = {
        "repository": REPO,
        "repository_commit": COMMIT,
        "host_redshift_for_scaling_check": HOST_REDSHIFT,
        "datasets": results,
        "high_spin_prior_median_reduction_fraction": {
            "P1800061": (p18_low - p18_high) / p18_low,
            "GWTC1": (gwtc_low - gwtc_high) / gwtc_low,
        },
        "important_limit": (
            "These are posterior products from one event under different waveform/"
            "prior analyses. They are not independent measurements. The computed "
            "tilde-Lambda samples are not the paper's reweighted flat-prior result."
        ),
    }
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
