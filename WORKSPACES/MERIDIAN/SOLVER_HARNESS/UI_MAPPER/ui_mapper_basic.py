#!/usr/bin/env python3
"""
Universal Indicatrix (UI) Mapper — basic interactive build.

Project sources / provenance:
- Satobloc/SAT_THEORY_ARCHIVE_2023-25:
  _AUTO_EXTRACTED_TEXT/UI CONFIGURATION (nolat).txt
- Satobloc/HsH:
  WORKSPACES/MERIDIAN/HANDOFF_NWTF_UI_UNIVERSAL_INDICATRIX_2026-09-21.md

Basic UI representation:
    y(lambda) = r(lambda) R(lambda) x0
with x0 on S^3, r(lambda) > 0, and R(lambda) in SO(4).

This build deliberately separates:
1. a standard Minkowski calibration map for a well-understood input system,
2. Euclidean R^4 / S^3 normalization used by the UI representation,
3. optional system-sector scaling presets.

Spin/color/flavor presets are normalization policies only. They do NOT assert that
SAT/H(s)H has already derived those physical quantities from the UI.

Status: SANDBOX / executable scaffold.
"""

from __future__ import annotations
import csv, json
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Tuple
import numpy as np
import sympy as sp

LAM = sp.symbols("lam", real=True)
SAFE_LOCALS = {
    "lam": LAM, "pi": sp.pi, "E": sp.E,
    "sin": sp.sin, "cos": sp.cos, "tan": sp.tan,
    "asin": sp.asin, "acos": sp.acos, "atan": sp.atan, "atan2": sp.atan2,
    "sinh": sp.sinh, "cosh": sp.cosh, "tanh": sp.tanh,
    "sqrt": sp.sqrt, "exp": sp.exp, "log": sp.log, "Abs": sp.Abs,
}

PRESETS: Dict[str, Tuple[str, str, str, str]] = {
    "Timelike inertial, v=0.3c": ("lam", "0.3*lam", "0", "0"),
    "Null inertial, +x": ("lam", "lam", "0", "0"),
    "Uniform circular spatial motion": ("lam", "cos(lam)", "sin(lam)", "0"),
    "Simple spacetime helix": ("lam", "cos(2*pi*lam)", "sin(2*pi*lam)", "0.2*lam"),
    "Double-rotation toy": (
        "1.2*cos(1.1*lam)", "1.2*sin(1.1*lam)",
        "0.65*cos(0.7*lam)", "0.65*sin(0.7*lam)"
    ),
    "Custom": ("lam", "0", "0", "0"),
}

SYSTEM_TYPES = [
    "Minkowski / spacetime kinematics",
    "Spin-like / orientation scale",
    "Color-like / internal-state scale",
    "Flavor-like / resonance scale",
    "Custom scale divisor",
]
SEED_OPTIONS = ["e0 = (1,0,0,0)", "first nonzero mapped direction"]

@dataclass
class MappingResult:
    lam: np.ndarray
    X_minkowski: np.ndarray
    X_scaled: np.ndarray
    tangent_interval_sq: np.ndarray
    causal_class: List[str]
    scale_divisor: float
    r: np.ndarray
    u: np.ndarray
    R: np.ndarray
    omega: np.ndarray
    reconstructed: np.ndarray
    reconstruction_error: np.ndarray
    seed: np.ndarray

def parse_equations(expr_strings: List[str]) -> List[sp.Expr]:
    return [sp.sympify(s, locals=SAFE_LOCALS) for s in expr_strings]

def evaluate_equations(exprs: List[sp.Expr], lam_vals: np.ndarray) -> np.ndarray:
    cols = []
    for expr in exprs:
        fn = sp.lambdify(LAM, expr, modules=["numpy"])
        value = np.asarray(fn(lam_vals), dtype=float)
        if value.ndim == 0:
            value = np.full_like(lam_vals, float(value))
        cols.append(np.broadcast_to(value, lam_vals.shape).astype(float))
    return np.column_stack(cols)

def minkowski_tangent_interval_sq(X: np.ndarray, lam: np.ndarray) -> np.ndarray:
    """Coordinate order (ct,x,y,z), eta=diag(-1,+1,+1,+1)."""
    dX = np.gradient(X, lam, axis=0, edge_order=2)
    return -dX[:, 0]**2 + np.sum(dX[:, 1:]**2, axis=1)

def causal_classes(ds2: np.ndarray, tol: float = 1e-8) -> List[str]:
    out = []
    for q in ds2:
        if q < -tol: out.append("timelike")
        elif q > tol: out.append("spacelike")
        else: out.append("null/near-null")
    return out

def characteristic_scale(X: np.ndarray, system_type: str, custom_scale: float) -> float:
    """
    One global divisor preserves relative scale history.
    Spin/color/flavor currently mean relative normalization only.
    """
    if system_type == "Minkowski / spacetime kinematics":
        return 1.0
    if system_type == "Custom scale divisor":
        if not np.isfinite(custom_scale) or custom_scale <= 0:
            raise ValueError("Custom scale divisor must be positive and finite.")
        return float(custom_scale)
    norms = np.linalg.norm(X, axis=1)
    finite = norms[np.isfinite(norms) & (norms > 1e-12)]
    return float(np.median(finite)) if finite.size else 1.0

def minimal_so_rotation(a: np.ndarray, b: np.ndarray, eps: float = 1e-12) -> np.ndarray:
    """
    Deterministic minimal-plane proper rotation R with R@a=b.
    The SO(3) stabilizer of the target direction remains free.
    """
    a = np.asarray(a, dtype=float); a /= np.linalg.norm(a)
    b = np.asarray(b, dtype=float); b /= np.linalg.norm(b)
    c = float(np.clip(np.dot(a, b), -1.0, 1.0))
    I = np.eye(4)
    if c > 1.0 - eps:
        return I.copy()
    if c < -1.0 + eps:
        basis = np.eye(4)
        helper = basis[np.argmin(np.abs(basis @ a))]
        n = helper - np.dot(helper, a) * a
        n /= np.linalg.norm(n)
        return I - 2.0 * (np.outer(a, a) + np.outer(n, n))
    v = b - c*a
    s = float(np.linalg.norm(v))
    n = v/s
    return I + (c-1.0)*(np.outer(a,a)+np.outer(n,n)) + s*(np.outer(n,a)-np.outer(a,n))

def choose_seed(u: np.ndarray, valid: np.ndarray, seed_option: str) -> np.ndarray:
    if seed_option.startswith("first nonzero"):
        idx = np.flatnonzero(valid)
        if idx.size:
            return u[idx[0]].copy()
    return np.array([1.0,0.0,0.0,0.0], dtype=float)

def build_ui_controls(X_scaled: np.ndarray, lam: np.ndarray, seed_option: str):
    # UI S^3 normalization uses ordinary Euclidean norm in R^4.
    r = np.linalg.norm(X_scaled, axis=1)
    valid = r > 1e-12
    u = np.zeros_like(X_scaled)
    u[valid] = X_scaled[valid] / r[valid,None]
    seed = choose_seed(u, valid, seed_option)
    R = np.repeat(np.eye(4)[None,:,:], len(lam), axis=0)
    last_R = np.eye(4)
    for i in range(len(lam)):
        if valid[i]:
            last_R = minimal_so_rotation(seed, u[i])
        R[i] = last_R
    reconstructed = r[:,None] * np.einsum("nij,j->ni", R, seed)
    dR = np.gradient(R, lam, axis=0, edge_order=2)
    omega = np.einsum("nij,nkj->nik", dR, R)
    omega = 0.5*(omega - np.transpose(omega,(0,2,1)))
    return r,u,R,omega,reconstructed,seed

def map_system(expr_strings, lam_min, lam_max, samples, system_type, custom_scale, seed_option):
    if samples < 8:
        raise ValueError("Use at least 8 samples.")
    if lam_max <= lam_min:
        raise ValueError("lambda max must exceed lambda min.")
    lam = np.linspace(lam_min, lam_max, samples)
    X = evaluate_equations(parse_equations(expr_strings), lam)
    if not np.all(np.isfinite(X)):
        raise ValueError("Input equation produced NaN or infinite coordinates.")
    ds2 = minkowski_tangent_interval_sq(X, lam)
    classes = causal_classes(ds2)
    divisor = characteristic_scale(X, system_type, custom_scale)
    Xs = X/divisor
    r,u,R,omega,reconstructed,seed = build_ui_controls(Xs, lam, seed_option)
    err = np.linalg.norm(reconstructed-Xs, axis=1)
    return MappingResult(lam,X,Xs,ds2,classes,divisor,r,u,R,omega,reconstructed,err,seed)

def export_result(result: MappingResult, output_dir: Path, metadata: dict) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    pairs = [(0,1),(0,2),(0,3),(1,2),(1,3),(2,3)]
    labels = ["01","02","03","12","13","23"]
    with (output_dir/"ui_mapping.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow([
            "lambda","ct_raw","x_raw","y_raw","z_raw",
            "ct_scaled","x_scaled","y_scaled","z_scaled",
            "minkowski_tangent_interval_sq","causal_class","ui_r",
            "ui_u0","ui_u1","ui_u2","ui_u3",
            *[f"omega_{s}" for s in labels],"reconstruction_error"
        ])
        for n in range(len(result.lam)):
            row = [result.lam[n],*result.X_minkowski[n],*result.X_scaled[n],
                   result.tangent_interval_sq[n],result.causal_class[n],
                   result.r[n],*result.u[n]]
            row += [result.omega[n,i,j] for i,j in pairs]
            row += [result.reconstruction_error[n]]
            w.writerow(row)
    counts = {}
    for c in result.causal_class:
        counts[c] = counts.get(c,0)+1
    summary = {
        **metadata,
        "status":"SANDBOX / basic UI mapper",
        "ui_equation":"y(lambda) = r(lambda) R(lambda) x0",
        "minkowski_metric":"diag(-1,+1,+1,+1)",
        "ui_normalization":"Euclidean norm in R^4 / S^3",
        "seed":result.seed.tolist(),
        "scale_divisor":result.scale_divisor,
        "causal_class_counts":counts,
        "max_reconstruction_error":float(np.max(result.reconstruction_error)),
        "median_reconstruction_error":float(np.median(result.reconstruction_error)),
        "scope_note":"Spin/color/flavor choices are relative normalization policies only.",
        "rotation_note":"R(lambda) is one deterministic minimal-plane representative; full frame history is not unique."
    }
    (output_dir/"ui_summary.json").write_text(json.dumps(summary,indent=2),encoding="utf-8")
    try:
        import matplotlib.pyplot as plt
    except Exception:
        return
    fig = plt.figure(figsize=(7.2,5.8))
    ax = fig.add_subplot(111,projection="3d")
    ax.plot(result.X_minkowski[:,1],result.X_minkowski[:,2],result.X_minkowski[:,3])
    ax.set_xlabel("x"); ax.set_ylabel("y"); ax.set_zlabel("z")
    ax.set_title("Minkowski input: spatial path")
    fig.tight_layout(); fig.savefig(output_dir/"ui_minkowski_spatial_path.png",dpi=180); plt.close(fig)
    fig,ax = plt.subplots(figsize=(7.2,4.5))
    ax.plot(result.lam,result.r); ax.set_xlabel("lambda"); ax.set_ylabel("r(lambda)")
    ax.set_title("UI scale history")
    fig.tight_layout(); fig.savefig(output_dir/"ui_scale_history.png",dpi=180); plt.close(fig)
    fig,ax = plt.subplots(figsize=(8.2,5.0))
    for (i,j),lab in zip(pairs,labels):
        ax.plot(result.lam,result.omega[:,i,j],label=lab)
    ax.set_xlabel("lambda"); ax.set_ylabel("Omega_ij")
    ax.set_title("UI SO(4) angular-velocity components"); ax.legend(ncol=3)
    fig.tight_layout(); fig.savefig(output_dir/"ui_angular_velocity.png",dpi=180); plt.close(fig)
    fig,ax = plt.subplots(figsize=(7.2,4.5))
    ax.plot(result.lam,result.reconstruction_error)
    ax.set_xlabel("lambda"); ax.set_ylabel("||r R x0 - X_scaled||")
    ax.set_yscale("symlog",linthresh=1e-15); ax.set_title("UI reconstruction error")
    fig.tight_layout(); fig.savefig(output_dir/"ui_reconstruction_error.png",dpi=180); plt.close(fig)

def launch_gui() -> None:
    import tkinter as tk
    from tkinter import ttk, filedialog, messagebox

    class UIMapperApp(tk.Tk):
        def __init__(self):
            super().__init__()
            self.title("Universal Indicatrix — Basic Mapper")
            self.geometry("930x720")
            self.minsize(830,640)
            self._build()

        def _build(self):
            pad={"padx":8,"pady":5}
            ttk.Label(
                self,
                text=("Map a known four-coordinate system into y(lambda)=r(lambda)R(lambda)x0. "
                      "Start from a standard Minkowski calibration; internal-sector presets change normalization only."),
                wraplength=870
            ).pack(fill="x",padx=12,pady=(12,6))
            main=ttk.Frame(self); main.pack(fill="both",expand=True,padx=10,pady=4)

            top=ttk.LabelFrame(main,text="1. Equation and scale policy"); top.pack(fill="x",pady=5)
            ttk.Label(top,text="Equation preset").grid(row=0,column=0,sticky="w",**pad)
            self.preset_var=tk.StringVar(value="Timelike inertial, v=0.3c")
            pb=ttk.Combobox(top,textvariable=self.preset_var,values=list(PRESETS.keys()),state="readonly",width=42)
            pb.grid(row=0,column=1,sticky="ew",**pad); pb.bind("<<ComboboxSelected>>",self._load_preset)
            ttk.Label(top,text="System type / scale").grid(row=1,column=0,sticky="w",**pad)
            self.system_var=tk.StringVar(value=SYSTEM_TYPES[0])
            ttk.Combobox(top,textvariable=self.system_var,values=SYSTEM_TYPES,state="readonly",width=52).grid(row=1,column=1,sticky="ew",**pad)
            ttk.Label(top,text="Custom divisor").grid(row=2,column=0,sticky="w",**pad)
            self.custom_scale_var=tk.StringVar(value="1.0")
            ttk.Entry(top,textvariable=self.custom_scale_var).grid(row=2,column=1,sticky="ew",**pad)
            top.columnconfigure(1,weight=1)

            eq=ttk.LabelFrame(main,text="2. Standard Minkowski-coordinate map"); eq.pack(fill="x",pady=5)
            self.expr_vars=[tk.StringVar() for _ in range(4)]
            for i,label in enumerate(["ct(lambda)","x(lambda)","y(lambda)","z(lambda)"]):
                ttk.Label(eq,text=label).grid(row=i,column=0,sticky="w",**pad)
                ttk.Entry(eq,textvariable=self.expr_vars[i],width=80).grid(row=i,column=1,sticky="ew",**pad)
            eq.columnconfigure(1,weight=1)

            dom=ttk.LabelFrame(main,text="3. Parameter domain and UI seed"); dom.pack(fill="x",pady=5)
            self.lmin_var=tk.StringVar(value="0.0")
            self.lmax_var=tk.StringVar(value="6.283185307179586")
            self.samples_var=tk.StringVar(value="600")
            self.seed_var=tk.StringVar(value=SEED_OPTIONS[0])
            ttk.Label(dom,text="lambda min").grid(row=0,column=0,sticky="w",**pad)
            ttk.Entry(dom,textvariable=self.lmin_var,width=15).grid(row=0,column=1,**pad)
            ttk.Label(dom,text="lambda max").grid(row=0,column=2,sticky="w",**pad)
            ttk.Entry(dom,textvariable=self.lmax_var,width=15).grid(row=0,column=3,**pad)
            ttk.Label(dom,text="samples").grid(row=0,column=4,sticky="w",**pad)
            ttk.Entry(dom,textvariable=self.samples_var,width=12).grid(row=0,column=5,**pad)
            ttk.Label(dom,text="UI seed x0").grid(row=1,column=0,sticky="w",**pad)
            ttk.Combobox(dom,textvariable=self.seed_var,values=SEED_OPTIONS,state="readonly",width=38).grid(row=1,column=1,columnspan=3,sticky="w",**pad)

            ttk.Label(
                main,
                text=("Minkowski diagnostics use eta=diag(-1,+1,+1,+1). "
                      "UI S^3 normalization uses the Euclidean R^4 norm. "
                      "The basic build chooses one deterministic SO(4) representative; "
                      "the full frame history is not fixed by a direction curve alone."),
                wraplength=870
            ).pack(fill="x",padx=6,pady=8)

            row=ttk.Frame(main); row.pack(fill="x",pady=8)
            ttk.Button(row,text="Map to UI and export",command=self._run).pack(side="left",padx=5)
            self.status_var=tk.StringVar(value="Ready.")
            ttk.Label(row,textvariable=self.status_var).pack(side="left",padx=12)
            self._load_preset()

        def _load_preset(self,_event=None):
            for var,val in zip(self.expr_vars,PRESETS[self.preset_var.get()]): var.set(val)

        def _run(self):
            try:
                exprs=[v.get().strip() for v in self.expr_vars]
                result=map_system(
                    exprs,float(self.lmin_var.get()),float(self.lmax_var.get()),
                    int(self.samples_var.get()),self.system_var.get(),
                    float(self.custom_scale_var.get()),self.seed_var.get()
                )
                target=filedialog.askdirectory(title="Choose output directory")
                if not target:
                    self.status_var.set("Cancelled."); return
                export_result(result,Path(target),{
                    "equations":dict(zip(["ct","x","y","z"],exprs)),
                    "system_type":self.system_var.get(),
                    "seed_option":self.seed_var.get()
                })
                self.status_var.set(f"Done. divisor={result.scale_divisor:.6g}; max error={np.max(result.reconstruction_error):.3e}")
                messagebox.showinfo("UI mapping complete","Mapping exported. Internal-sector presets are normalization-only in this build.")
            except Exception as exc:
                self.status_var.set("Error.")
                messagebox.showerror("UI Mapper error",str(exc))

    UIMapperApp().mainloop()

if __name__ == "__main__":
    launch_gui()
