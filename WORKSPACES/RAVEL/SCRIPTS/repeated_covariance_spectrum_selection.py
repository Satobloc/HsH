import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import least_squares
from sklearn.covariance import LedoitWolf

TRUE = dict(q=2.4, t1=.25, t2=2.0, A1=.012, A2=.008)


def roots_two(a, p=TRUE):
    out = []
    for x in a:
        w = 1/x
        z = np.poly1d([1, 0])
        d1 = np.poly1d([-1j*p["t1"], 1])
        d2 = np.poly1d([-1j*p["t2"], 1])
        poly = (np.poly1d([-1, 0, w*w])*d1*d2
                - 1j*p["A1"]*x**p["q"]*z*d2
                - 1j*p["A2"]*x**p["q"]*z*d1)
        rr = np.roots(poly)
        cc = [u for u in rr if u.real > 0 and u.imag < 0]
        out.append(min(cc, key=lambda u: abs(u-w)))
    return np.asarray(out)


def pole_cov(z, sigma=3e-4, rho=.75, eta=.35):
    n = len(z)
    ii = np.arange(n)
    R = rho**np.abs(ii[:, None]-ii[None, :])
    D = np.diag(np.abs(z))
    B = sigma*sigma*D@R@D
    return np.block([[B, eta*B], [eta*B, B]])


def sample_repeats(z, C, repeats, rng):
    dy = rng.multivariate_normal(np.zeros(2*len(z)), C, size=repeats)
    return z[None, :] + dy[:, :len(z)] + 1j*dy[:, len(z):]


def estimate_cov(reps):
    Y = np.c_[reps.real, reps.imag]
    sd = Y.std(axis=0, ddof=1)
    Z = (Y-Y.mean(axis=0))/sd
    Rhat = LedoitWolf(assume_centered=True).fit(Z).covariance_
    Chat = np.diag(sd)@Rhat@np.diag(sd)
    return Chat, LedoitWolf(assume_centered=True).fit(Z).shrinkage_


def unpack(x, kind):
    if kind == "one":
        return dict(q=x[1], taus=[np.exp(x[0])], amps=[np.exp(x[2])])
    if kind == "two":
        t1 = np.exp(x[0])
        return dict(q=x[2], taus=[t1, t1+np.exp(x[1])],
                    amps=[np.exp(x[3]), np.exp(x[4])])
    return dict(q=x[2], A=np.exp(x[3]), tau0=np.exp(x[0]),
                sigma=np.exp(x[1]))


def components(x, kind):
    p = unpack(x, kind)
    if kind != "band":
        return np.asarray(p["taus"]), np.asarray(p["amps"]), p["q"]
    # Positive, continuous log-normal relaxation spectrum.  Fixed quadrature
    # makes the model deterministic; weights integrate to total amplitude A.
    u = np.linspace(-3.5, 3.5, 101)
    lnt = np.log(p["tau0"]) + p["sigma"]*u
    tau = np.exp(lnt)
    w = np.exp(-u*u/2)
    w /= w.sum()
    return tau, p["A"]*w, p["q"]


def F_dF(a, z, x, kind):
    tau, amp, q = components(x, kind)
    F = z*z
    dF = 2*z
    for t, A0 in zip(tau, amp):
        A = A0*a**q
        den = 1-1j*z*t
        F += 1j*z*A/den
        dF += 1j*A/den-z*A*t/(den*den)
    return F, dF


def g_J(a, z, x, kind):
    F, dF = F_dF(a, z, x, kind)
    n = len(z)
    J = np.zeros((n, 2*n))
    J[np.arange(n), np.arange(n)] = dF.imag
    J[np.arange(n), n+np.arange(n)] = dF.real
    return F.imag, J


def starts_bounds(kind):
    if kind == "one":
        starts = [[np.log(t), q, np.log(A)]
                  for t in (.3, 1., 2.) for q in (2., 2.5)
                  for A in (.015, .025)]
        return starts, [-5, -2, -12], [4, 7, 1]
    if kind == "two":
        starts = []
        for t1, dt in ((.12, .9), (.35, 1.3), (.7, 2.8)):
            for q in (1.8, 2.8):
                for A1, A2 in ((.008, .014), (.01, .01), (.018, .004)):
                    starts.append([np.log(t1), np.log(dt), q,
                                   np.log(A1), np.log(A2)])
        return starts, [-5, -5, -2, -12, -12], [3, 4, 7, 1, 1]
    starts = [[np.log(t), np.log(s), q, np.log(.02)]
              for t in (.5, 1.) for s in (.35, .8, 1.4)
              for q in (2.2, 2.6)]
    return starts, [-5, np.log(.08), -2, -12], [4, np.log(3.), 7, 1]


def fit(a, z, Cmean, train, kind):
    starts, lo, hi = starts_bounds(kind)
    best = None
    for x0 in starts:
        x = np.asarray(x0, float)
        for _ in range(3):
            g, J = g_J(a, z, x, kind)
            Cr = J@Cmean@J.T
            Ct = Cr[np.ix_(train, train)] + np.eye(len(train))*1e-18
            L = np.linalg.cholesky(Ct)
            fun = lambda y: np.linalg.solve(
                L, g_J(a, z, y, kind)[0][train])
            sol = least_squares(fun, x, bounds=(lo, hi), max_nfev=1500)
            x = sol.x
        score = np.sum(fun(x)**2)
        if best is None or score < best[0]:
            best = score, x
    return best[1]


def conditional_nll(a, z, Cmean, x, kind, train, test):
    g, J = g_J(a, z, x, kind)
    Cg = J@Cmean@J.T
    CTT = Cg[np.ix_(train, train)] + np.eye(len(train))*1e-18
    Css = Cg[np.ix_(test, test)] + np.eye(len(test))*1e-18
    CsT = Cg[np.ix_(test, train)]
    mu = CsT@np.linalg.solve(CTT, g[train])
    S = Css-CsT@np.linalg.solve(CTT, CsT.T)+np.eye(len(test))*1e-18
    e = g[test]-mu
    return e@np.linalg.solve(S, e)+np.linalg.slogdet(S)[1]+len(test)*np.log(2*np.pi)


def main():
    rng = np.random.default_rng(4217)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = roots_two(a)
    Ctrue = pole_cov(z0)
    repeats = sample_repeats(z0, Ctrue, 96, rng)
    z = repeats.mean(axis=0)
    Chat, shrink = estimate_cov(repeats)
    Cmean = Chat/len(repeats)

    n = len(a)
    interior = np.arange(1, n-1)
    folds = [interior[k::5] for k in range(5)]
    kinds = ["one", "two", "band"]
    scores = {k: [] for k in kinds}
    params = {k: [] for k in kinds}
    for test in folds:
        train = np.setdiff1d(np.arange(n), test)
        for kind in kinds:
            x = fit(a, z, Cmean, train, kind)
            scores[kind].append(conditional_nll(a, z, Cmean, x, kind, train, test))
            params[kind].append(unpack(x, kind))

    d12 = np.array(scores["one"])-np.array(scores["two"])
    db2 = np.array(scores["band"])-np.array(scores["two"])
    relcov = np.linalg.norm(Chat-Ctrue)/np.linalg.norm(Ctrue)
    s = np.sqrt(np.diag(Chat))
    Rhat = Chat/np.outer(s, s)
    adj = np.median(np.diag(Rhat[:n, :n], 1))
    cross = np.median(np.diag(Rhat[:n, n:]))
    print("shrinkage", shrink, "relative covariance error", relcov)
    print("estimated adjacent rho", adj, "estimated Re/Im eta", cross)
    print("scores", scores)
    print("delta one-two", d12, "sum", d12.sum())
    print("delta band-two", db2, "sum", db2.sum())
    print("two params", params["two"])
    print("band params", params["band"])

    # Full-data closures for a visual diagnostic.
    allidx = np.arange(n)
    fits = {k: fit(a, z, Cmean, allidx, k) for k in kinds}
    gres = {k: g_J(a, z, fits[k], k)[0]/np.abs(z)**2 for k in kinds}

    fig, ax = plt.subplots(2, 2, figsize=(12, 9), constrained_layout=True)
    xfold = np.arange(5)
    w = .34
    ax[0, 0].bar(xfold-w/2, d12, w, label="one pole − two poles")
    ax[0, 0].bar(xfold+w/2, db2, w, label="continuous band − two poles")
    ax[0, 0].axhline(0, color="k", lw=1)
    ax[0, 0].set(xlabel="held-out fold", ylabel="Δ predictive NLL",
                 title="Positive values favor discrete two-pole model")
    ax[0, 0].legend()

    for k, label in zip(kinds, ["one pole", "two poles", "positive band"]):
        ax[0, 1].semilogx(a, gres[k], "o-", ms=3, label=label)
    ax[0, 1].axhline(0, color="k", lw=1)
    ax[0, 1].set(xlabel="radius a", ylabel="normalized reality closure",
                 title="Full-data closure after covariance estimation")
    ax[0, 1].legend()

    Rt = Ctrue/np.sqrt(np.outer(np.diag(Ctrue), np.diag(Ctrue)))
    im = ax[1, 0].imshow(Rt[:n, :n], origin="lower", vmin=-1, vmax=1,
                         cmap="coolwarm", aspect="auto")
    ax[1, 0].set(title="Injected radius correlation", xlabel="radius index",
                 ylabel="radius index")
    fig.colorbar(im, ax=ax[1, 0], label="correlation")

    im = ax[1, 1].imshow(Rhat[:n, :n], origin="lower", vmin=-1, vmax=1,
                         cmap="coolwarm", aspect="auto")
    ax[1, 1].set(title=f"Estimated from 96 repeats (shrinkage={shrink:.2f})",
                 xlabel="radius index", ylabel="radius index")
    fig.colorbar(im, ax=ax[1, 1], label="correlation")
    fig.suptitle("Repeated-pole covariance and relaxation-spectrum selection",
                 fontsize=15)
    fig.savefig("repeated_covariance_spectrum_selection.png", dpi=180)
    fig.savefig("repeated_covariance_spectrum_selection.svg")


if __name__ == "__main__":
    main()
