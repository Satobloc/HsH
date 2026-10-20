# SANDBOXED | Meridian cumulative geometry and archive checkpoint | 20 October 2026

Authoring class: Meridian worker reconstruction; not Nathan-authored.
Scope: publicly shareable mathematics, SAT/H(s)H research-status checkpoints, archive links, and website editorial intake. No private HSH_RESOURCES material, restricted prior art, credentials, or personal source details are included.
Theory status: all new physical-model conclusions remain sandboxed/tentative; no BEDROCK edits or implicit canon promotion.

## 0. Provenance and existing saves

The full source conversation is archived in Satobloc/HsH/LIVE CONVOS as five consecutive parts named "Meridian Free Build - raw__chunk_0001_of_0005.txt" through "...0005_of_0005.txt". Its last observed chunk contains the Oct 19 video-attribution exchange, not the Oct 20 save request. The public directory is https://github.com/Satobloc/HsH/tree/main/LIVE%20CONVOS . This checkpoint DOES NOT replace that source transcript.

Verified existing public mathematical artifacts:
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-20261015-kernel-hessian-001.md (issue 36; SHA-256 76d0000af83abb2cd74c20ddc63a1d64fb475f43165671fc33284996d841a77c)
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-hard-contact-penalty-limit-20261016t0436z-s3.md
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-so4-score-counterexample-20261017t1836z-s3.md
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-mass-ratio-audit-20261018t1336z-s3.md
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-cumulative-reading-round-20261018-0742-001.md
These retain their original dated status and detailed proof/code. Do not create duplicates or infer that their presence means general physical acceptance.

Root BEDROCK reviewed Oct 20 at blob a04d72b19bcc902aff9fbe6a0d1389052c078521. It includes BR-007 Mersearch-first historical retrieval, BR-006 intrinsic interbraid construction, BR-005 theta4=0 straight-vacuum baseline, BR-003 tentative result defaults, OC-001 unresolved Q/inverse-Q, OC-002 unresolved EM temporal support, and Oct 18 Nathan Direct minimal-pair and nonarbitrary-domain rules. A separate Oct 20 working hypothesis additionally questions whether a universal *physical* timesheet is required; see WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sat-worldtube-local-propagation-no-physical-timesheet-20261020.md. Therefore formulas below do NOT assume universal physical-sheet ontology.

## 1. SAT solver and visualization lane

The useful historical/executable targets remain Whirligig/Donut, UI/TX, Three Spheres and Hagalaz; a drawn SO(4) model is a mathematical instrument and not a physical sphere, Hopf carrier or lattice underneath Minkowski worldlines. Historical source recovery must use Mersearch, not generic speculative analogies.

Meridian Run 061 (WORKSPACES/MERIDIAN/SANDBOX/RUN_061_4D_DONUT_STEREOGRAPHIC_BRIDGE.md) supplies an exact bridge between a product torus on S^3 and its stereographic ring-torus image. With C(p,q)=(a cos p,a sin p,b cos q,b sin q), a^2+b^2=rho^2, stereographic projection from (0,0,0,rho) to x4=0 yields a 3D ring torus with R=rho^2/a, r=rho*b/a, and R^2-r^2=rho^2. Local angles and topology survive the conformal chart; lengths, areas and bending energies do not survive without the conformal Jacobian. This is solver/chart math, NOT physical-carrier ontology. The historical complete moving-gimbal and GrAnn constraints still require independent verification (WORKSPACES/COMMON/SANDBOXED_SOLVERS/WHIRLIGIG_CONSTRAINT_AUDIT_2026-10-09.md).

SO(4) closure and product integral: for skew-symmetric generators A(s), path-ordered transport satisfies R'(s)=A(s)R(s) and R(s)=P exp(int A ds)R(0). The ordering matters. With rotations J12 and J23, U(e)=exp(eA)exp(eB)exp(-eA)exp(-eB)=I+e^2[A,B]+O(e^3). Executed SciPy matrix controls gave Frobenius ||U-I|| = 0.01413031035449 at e=.1, 0.00353479670764 at .05, 0.00056566656619 at .02. This is a candidate closure/holonomy test, not evidence of a new SAT force. Frame closure and curve closure must both be tested; returning phase angles alone is insufficient.

An already archived SO(4) diagnostic shows the scalar residual triple (translation norm, log-scale magnitude, Frobenius ||Q-I||) is NOT a complete action invariant. Specifically Q_A=R(pi/2) direct_sum I2 and Q_B=R(pi/3) direct_sum R(pi/3) both have ||Q-I||=2; Q_A fixes e4, Q_B moves it by norm 1. Distinguish them with det(I-Q) (0 vs 1), tr(Q), signed Pfaffian, or material probes. Use the complete earlier artifact for runnable tests.

## 2. Two-bundle contact and coarse-graining: established algebra, hypothetical energy

For centered three-strand offsets sum_i u_i=sum_j v_j=0, d=Y-X, and smooth translation-invariant scalar kernel F, define E9=sum_ij F(d+v_j-u_i) and E0=9F(d). Taylor expansion cancels all first-order terms and mixed second moments:
E9-E0=(3/2)[sum_i u_i^T Hess[F](d) u_i +sum_j v_j^T Hess[F](d) v_j]+R3,
with |R3| <= (M3/6)sum_ij|v_j-u_i|^3 when third directional derivatives obey the stated bound. Under the stipulated harmonic kernel F(z)=k||z||^2/2, the remainder vanishes and the defect is nonnegative for Euclidean k>0. Under an attractive Gaussian the defect changes sign with scale. Therefore positive "coarse-graining tax" is NOT a general geometric theorem. Physical binding, Lorentzian causality, relaxed minima and interaction laws remain independent obligations.

For two equal *spatial 3-ball* supports of radius R in a common rest frame at distance 0<=d<=2R:
V(d)=pi*(4R+d)*(2R-d)^2/12; V(d>=2R)=0.
Assuming E=K*V with positive energy-density K gives an outward force magnitude F=K*pi*(4R^2-d^2)/4 for 0<d<2R. For delta=2R-d>0, exactly
V=pi*R*delta^2/2+pi*delta^3/12,
F=K*pi*R*delta-K*pi*delta^2/4.
Near-contact force is linear in compression.

Crucial failure: V'(0+)=-pi*R^2, but rotational invariance demands grad E(Delta)=0 at Delta=0 for a differentiable vector function. This hard binary ball overlap is not differentiable at coincident centers. It does NOT prove exclusion or repulsion.

A smooth normalized Gaussian convolution comparator, widths a,b, is
C(d)=[2*pi*(a^2+b^2)]^(-3/2)*exp[-d^2/(2*(a^2+b^2))].
For stipulated E=K*C, F=E*d/(a^2+b^2), so F(0)=0; however interaction has no exact finite cutoff. The coupling K has different dimensions from the hard-volume K. A smooth compactly supported density may combine central differentiability with finite radius but requires a separately derived physical constitutive choice.

Re-executed local Python script from this conversation (meridian_core_overlap.py) on Oct 20: all assertions passed. With R=a=b=1 and independent K=1 conventions, d=1 gives V=1.308996938996 and hard F=2.356194490192; Gaussian C=0.017482823918 and gaussian F=0.008741411959. At d=2 sharp overlap vanishes while Gaussian C=0.008258301266. At delta=.001, V/delta^2=1.570534527407 tending to pi/2. This is **common-rest-frame spatial lens geometry**, not the different Euclidean R4 crossing-tube overlap in Mercer.

## 3. Archimedean measure bridge: exact S^3 coarea

External educational trigger: Grant Sanderson, "The Most Beautiful Formula Not Enough People Understand," 3Blue1Brown YouTube, Feb 27 2026, https://www.youtube.com/watch?v=fsLh-NYhOoU . Independent established mathematical identity, not theory ontology.

An S^3 in Euclidean R4 can be parameterized by two circular factors:
X(eta,p,q)=R(cos(eta)cos(p),cos(eta)sin(p),sin(eta)cos(q),sin(eta)sin(q)),
0<=eta<=pi/2; p,q each 0..2*pi.
Each 0<eta<pi/2 is a flat embedded T^2 with radii a=R*cos(eta), b=R*sin(eta).
Induced metric is diag(R^2,a^2,b^2); exact surface measure
dmu3=R*a*b d(eta)dpdq=R^3 sin(eta)cos(eta)d(eta)dpdq.
Thus
Area(S^3)=(2*pi)^2*R^3*int_0^(pi/2)sin(eta)cos(eta)d(eta)=2*pi^2*R^3.

If integrating over b instead of eta, normal leaf spacing is ds_normal=(R/a)db, NOT db. Correct measure density is 4*pi^2*R*b db (for R fixed). Naively accumulating leaf area 4*pi^2*a*b db wrongly yields 4*pi^2*R^3/3 instead of 2*pi^2*R^3, an undercount of one third. Re-executed local SciPy numerical quadrature Oct 20 for R=1,2,3; all checks passed. R=1 exact and corrected=19.739208802179, naive=13.159472534786. These numerical checks add no physical interpretation.

Sanderson's volume recurrence V_n(R)=(2*pi*R^2/n)V_(n-2)(R) follows the established Euclidean Archimedean measure construction; V_n(R)=pi^(n/2)R^n/Gamma(n/2+1). A topological torus is not globally the same object as S^3 merely because the disk-times-circle model has equal integrated measure. This measure mapping is not the same as stereographic conformal-angle preservation; use the correct Jacobian for every solver-to-solver comparison.

## 4. Multiplicative calculus reference (different mathematical level)

External educational trigger: Sohil Rathi, "The Missing Calculus Operation," YouTube (October 2026 day still unverified), https://www.youtube.com/watch?v=QN680Is4euw . For positive scalar f, product integral prod_a^b f(x)^(dx) = exp(int_a^b log f(x) dx). For noncommuting SO(4) generators the appropriate analogue is the path-ordered matrix exponential; order matters and ordinary scalar-log additivity does not apply directly. Use only when it produces a more efficient or invariant closure test.

## 5. Pending and completed provenance/status distinctions

- Existing verified publication of two-bundle Hessian is GitHub issue 36 with an Actions receipt. Earlier live messages may have been sent before that asynchronous receipt; issue status and repository readback are authoritative.
- The Oct 17 "parallel-worldtube finite-core contact" submission attempt in the interactive conversation failed during local ASCII hashing BEFORE issue creation. No issue/publication was created by that failed call. Its independently executed local script and derivation are preserved in this checkpoint and its source conversation.
- The SO(4) ordered-rotation residual and Archimedean S^3 coarea calculations were executed in local Python on Oct 20. Standalone generated scripts also exist as conversation attachments but attachments alone are not durable archive publication.
- Private comparator review materials and other non-public references have NOT been copied into the public checkpoint. Nothing here is declared canonical theory, validated particle physics, or proof of an ER/Kerr core.

## 6. Complete core and coarea verification script

The following Python 3 code uses the stdlib for core geometry, and SciPy for numerical quadrature. It is a compact reproducibility fixture for the newly consolidated claims.

    from math import pi, exp, sin, cos, sqrt
    from scipy.integrate import quad

    def V(d,R=1.):
        if d>=2*R: return 0.
        if d<=0: return 4*pi*R**3/3
        return pi*(4*R+d)*(2*R-d)**2/12

    def F(d,R=1.,K=1.):
        if d>=2*R: return 0.
        if d==0: return float('nan')
        return K*pi*(4*R*R-d*d)/4

    def G(d,a=1.,b=1.,K=1.):
        s=a*a+b*b
        E=K*exp(-d*d/(2*s))/(2*pi*s)**1.5
        return E,E*d/s

    for d in (.1,.5,1,1.5,1.99):
        h=1e-5
        assert abs(-(V(d+h)-V(d-h))/(2*h)-F(d))<1e-8
    for d in (.1,.5,1,1.5):
        h=1e-5
        assert abs(-(G(d+h)[0]-G(d-h)[0])/(2*h)-G(d)[1])<1e-9
    assert abs(V(1)-5*pi/12)<1e-14
    assert V(2)==0
    for R in (1.,2.,3.):
        exact=2*pi*pi*R**3
        coarea=quad(lambda b:4*pi*pi*R*b,0,R)[0]
        naive=quad(lambda b:4*pi*pi*b*sqrt(R*R-b*b),0,R)[0]
        assert abs(coarea-exact)<1e-9
        assert abs(naive/exact-2/3)<1e-9
    print('MERIDIAN CUMULATIVE CONTROL PASSED')

## 7. Website backend/editorial guidance

Public site infrastructure: PUBLIC_SITE/AUTOMATIC_DISCOVERY.md (automatic catalog scanning on push and hourly) and PUBLIC_SITE/live_influx/packets/README.md (editorial packet intake, NOT automatic polished publication). PUBLIC_SITE/READER_ROUTING_REGISTRY.md defaults to PRESENTATION PENDING for WORKSPACES documents without an approved derivative. This archived checkpoint may appear in the machine discovery feed after the automated writer runs, but an archive commit alone does NOT imply that it is a displayed public article.

Candidate site item:
Title: Four-dimensional geometry: measure, rotation, and contact
Producer: Meridian
Type: current-work / concept-update / document
Status: candidate; SANDBOXED mathematics, not a theory endorsement
Plain-language public summary: "Recent geometry checks make three distinctions precise. Different orders of four-dimensional rotations leave different residual orientations; a four-dimensional sphere can be measured using a family of tori only with the correct spacing factor; and hard finite-core overlap differs sharply from smooth interaction kernels near complete coincidence. Each result is a test or tool for SAT/H(s)H reconstruction, not a derived physical force."
Sources: this checkpoint; Run 061; the Hessian, SO(4) counterexample and contact-penalty publications; the two educator videos; BEDROCK. Presentation: a reviewed mathematical visual and audience-calibrated typeset note can be prepared downstream. Do not route visitors to raw worker markdown, unverified figures, JSON packets or private repo material by default. Nothing in this save updates public-site curated feeds or the chatgpt.site frontend by itself.

## 8. Next research discriminators

1. Source-first Whirligig/Hagalaz gimbal constraint extraction via permitted Mersearch route; preserve input-equation identity and both curve and frame closure tests.
2. Smooth compact-support core density plus independently specified source-native action. Test center differentiability and finite radius, compare against hard and Gaussian controls without tuning to a nuclear target.
3. Build an explicitly causal response/propagation comparison between a universal physical timesheet and local worldtube disturbances consistent with the Oct 20 hypothesis. Do not solve an open fork by choosing the vocabulary.
4. Keep mathematical Euclidean sphere/torus solvers and physical Minkowski worldtube claims distinct; re-check source provenance and measurement comparators before promotion.

Meridian
