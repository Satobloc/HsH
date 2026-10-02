import numpy as np
import matplotlib.pyplot as plt


def poles(detuning, coupling, kappa_core, kappa_sheet, omega0=1.0):
    wc = omega0 + detuning / 2
    ws = omega0 - detuning / 2
    zbar = (wc + ws) / 2 - 0.25j * (kappa_core + kappa_sheet)
    root = np.sqrt(
        (detuning / 2 - 0.25j * (kappa_core - kappa_sheet)) ** 2
        + coupling**2
        + 0j
    )
    return zbar - root, zbar + root


def response(freq, detuning, coupling, kappa_core, kappa_sheet, omega0=1.0):
    wc = omega0 + detuning / 2
    ws = omega0 - detuning / 2
    dc = wc - freq - 0.5j * kappa_core
    ds = ws - freq - 0.5j * kappa_sheet
    return np.abs(ds / (dc * ds - coupling**2)) ** 2


def main():
    kappa_core = 0.08
    kappa_sheet = 0.04
    coupling = 0.08
    detuning = np.linspace(-0.35, 0.35, 900)
    low, high = poles(detuning, coupling, kappa_core, kappa_sheet)

    ep_gate = abs(kappa_core - kappa_sheet) / 4
    resolution_gate = np.sqrt((kappa_core**2 + kappa_sheet**2) / 8)

    plt.rcParams.update({
        "font.size": 10,
        "axes.spines.top": False,
        "axes.spines.right": False,
    })
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12.4, 4.6))

    ax1.plot(detuning, 1 + detuning / 2, "--", color="0.65", lw=1, label="uncoupled core")
    ax1.plot(detuning, 1 - detuning / 2, ":", color="0.65", lw=1, label="uncoupled medium")
    ax1.plot(detuning, low.real, color="#0057b8", lw=2.2, label="hybrid poles")
    ax1.plot(detuning, high.real, color="#b21f35", lw=2.2)
    ax1.fill_between(detuning, low.real + low.imag, low.real - low.imag,
                     color="#0057b8", alpha=0.12, lw=0)
    ax1.fill_between(detuning, high.real + high.imag, high.real - high.imag,
                     color="#b21f35", alpha=0.12, lw=0)
    ax1.axvline(0, color="0.2", lw=0.8)
    ax1.set(xlabel=r"bare detuning $\Delta=\omega_c-\omega_\Sigma$",
            ylabel=r"pole frequency $\mathrm{Re}\,\tilde\omega$",
            title="A. Physical coupling moves the poles")
    ax1.legend(frameon=False, loc="upper right", fontsize=8.5)
    gate_text = (
        rf"$g={coupling:.2f}$, $\kappa_c={kappa_core:.2f}$, $\kappa_\Sigma={kappa_sheet:.2f}$"
        + "\n"
        + rf"pole-repulsion gate: $g>{ep_gate:.3f}$"
        + "\n"
        + rf"conservative resolution gate: $g>{resolution_gate:.3f}$"
    )
    ax1.text(0.02, 0.04, gate_text,
             transform=ax1.transAxes, fontsize=9,
             bbox=dict(boxstyle="round,pad=0.35", fc="white", ec="0.8"))

    freq = np.linspace(0.82, 1.18, 1600)
    regimes = [
        (0.0, "passive/uncoupled", "0.35"),
        (0.02, "repelled poles, overlapping widths", "#d99000"),
        (0.08, "resolved hybrid modes", "#6a1b9a"),
    ]
    for g, label, color in regimes:
        y = response(freq, 0.0, g, kappa_core, kappa_sheet)
        y /= y.max()
        ax2.plot(freq, y, lw=2, color=color, label=rf"$g={g:.2f}$: {label}")
    ax2.axvline(1, color="0.75", lw=0.8)
    ax2.set(xlabel=r"probe frequency $\omega$",
            ylabel="normalized core response",
            title="B. Linewidths can hide real level repulsion")
    ax2.legend(frameon=False, fontsize=8.5, loc="upper center",
               bbox_to_anchor=(0.5, 0.72))
    ax2.set_ylim(0, 1.08)

    fig.suptitle("Damped finite-core / resolving-medium hybrid modes",
                 fontsize=14, weight="bold", y=0.995)
    fig.tight_layout(rect=(0, 0, 1, 0.94))
    fig.savefig("damped_hybrid_mode_regimes.svg", bbox_inches="tight")
    fig.savefig("damped_hybrid_mode_regimes.png", dpi=220, bbox_inches="tight")
    print(f"ep_gate={ep_gate:.12g}")
    print(f"resolution_gate={resolution_gate:.12g}")
    for g in (0.0, 0.02, 0.08):
        p0, p1 = poles(0.0, g, kappa_core, kappa_sheet)
        print(g, p0, p1, "real_split", abs(p1.real-p0.real))


if __name__ == "__main__":
    main()
