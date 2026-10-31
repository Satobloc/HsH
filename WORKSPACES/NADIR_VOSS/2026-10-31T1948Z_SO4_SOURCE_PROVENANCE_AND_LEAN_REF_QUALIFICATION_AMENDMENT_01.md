# Amendment 01 — Full equation hashes and exact merge-commit identities
**2026-10-31T1948Z report amendment**

This amendment is authoritative where the primary report displayed abbreviated or transcription-incorrect hash prefixes. The primary report is preserved unchanged.

## A. Full source identities

| Artifact | Full Git blob SHA-1 |
|---|---|
| PLAYGROUND_003_CARTAN_SIM4_BACKBONE.md | e56? |
| PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md | e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f |
| FINDING THE DONUT extracted text | a788b5cc415f90de2d0382d3596ef07d68604687 |
| HOLONOMY DRAFT.txt | 2b35f0f98d307d518d387855818e973d251e22b4 |
| module8H.tex | 6748806846b4fa72a5271a6ad856dad14963691c |
| Donut canon root body | be985c292bfcae7352983d596c38e7f172f6029d |
| Annotated Donut canon derivative | 8f95b9174657617c9976ff76e17fd8ef36ad660c |
| NadirFrameTelescoping.lean | e15d6d6a34f62121af9ec77dbb907342ef1a7e5c |

Correct PLAYGROUND_003 blob SHA-1: 4d812ac3b7aa59071614717bfd884b65becc2ee0.

FINDING THE DONUT PDF source SHA-256:
63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae.

## B. Full SHA-256 values for verbatim PLAYGROUND_004 equation lines

Hashes are SHA-256 of the exact UTF-8 line text, excluding the line-ending newline. These are assistant-authored sandbox strings, not Nathan Direct and not SAT-O/Blockwave originals.

| Label | Exact source line | SHA-256 |
|---|---|---|
| D_lin_R | "D_lin(R)=(logσ)^2+||Q−I||_F^2." | fe832147578bd885e3923fb6916577a48e7aec7a9d01e6cbb9d6d045e71a999f |
| D_lin_exact | "D_lin = φ^2 + 8[sin^2(θ1/2)+sin^2(θ2/2)],   φ=logσ." | 5e90bafae3d2e2a7207e65008af8412a6e8f433de1ee086c8fd8c0728510470a |
| D_lin_small_angle | "D_lin = φ^2 + 2(θ1^2+θ2^2) + O(θ^4)." | 3028b84e836a583ad32cbd23c9c2ef540453dc404b8523d8d82e962ad1536ca5 |
| translation_integral | "t(L)=∫_0^L exp(sΩ)v ds = Ω^−1[Q(L)−I]v." | b8034d28023715fb9b1b7e1afbd095bbb16c8b45ebbdc9856b00dea94cb9493a |
| rotational_closure | "Q(L)=I ⇒ t(L)=0." | 1c9ab8631880dae1cf7739d50e5ccdb6993562ad02c9ac0662e9c78346f91fbd |
| affine_closure | "D_lin(L)=0 ⇒ t(L)=0 ⇒ H(L)=e." | 1a7dc88e44e67f9c7934766e2092eb408c2e608c68531ae19a61a1298884d3ad |

## C. Corrected conditional statement, separate from verbatim source

The verbatim line "Q(L)=I ⇒ t(L)=0" is valid only with the preceding invertible-generator formula's assumptions made explicit.

For constant Ω in so(4), constant v, Q(s)=exp(sΩ), and t(L)=integral from 0 to L of Q(s)v ds, if det(Ω) is nonzero, then
t(L)=Ω^(-1)(Q(L)-I)v,
so Q(L)=I implies t(L)=0.

For the singular block control Ω=diag(0·J,ω2J), with ω2L=2πn, Q(L)=I but
t(L)=L P_ker(Ω) v.
In the explicit ω1=0, ω2=2π/L case, this is (La,Lb,0,0)^T. Thus the kernel component is the affine-translation obstruction. This is a mathematical sandbox result, not a physical law or measurement, and has not been Lean-formalized.

## D. Full PR head and merge-ref commit identities

Every listed successful run checked out the synthetic PR merge ref, not the exact PR head. Full identities:

| PR | PR head SHA | Merge commit SHA | Run / job |
|---|---|---|---|
| #262 | 61cc8b65ffed70296e0121dbae067892a79c81d4 | 44df186f012dbb3280790d2317498de8d1266b8b | #40463470348 / #122053714715 |
| #715 | 4467282fd4276d40089ff2743d33316d354cf5f6 | 184736b34227b14fa2dfb0b4a48be41844e06646 | #40480990700 / #122110951029 |
| #773 | e7e2f7a0e03865f784e917ff8728c87ffc2cc3c2 | d78c5948b27108a655cbc984419f5ccd5327c1b7 | #40547227487 / #122340968909 |
| #868 | 59e2a398680655724845a33428a342bd096161f5 | 0d7b2220961790626d4bc63a698dfb3c0b2cc6eb | #40964376757 / #123764987528 |
| #744 | 7a3add552cebd8a9fa7f2b758f729b3d72d58bcc | 4063694d59d0b96f70fd7f3ec19b3df38b2f55cf | #41185475361 / #124491418084 |
| #1064 | 08a7cc355137b55159e2a1848681dfe1c291768b | a37cbb15a43746b85ed788ddcdee6f8739ad2a47 | #40990019212 / #123849889813 |
| #1066 | d2a792ef642a4ee9c7a908e32243fac0233986b4 | 2b08fb0b1523b0e3a4e1089ce65bb67aed276cdc | #40992150303 / #123857058479 |
| #1098 | 7666f2cb5b408be77e0c87f3b8ec18cc1950f55a | 89f6a022d14b910e291baab2dde594f7315bb78f | #41176686005 / #124465590995 |
| #951 | 7a79cb86fc1e41f90a32e109a61b9d08001d7187 | c27f4f0 (log-short SHA only; full commit object not resolved) | #41217344093 / #124584842355 |

PR #262 also appears as the base of PR #1163 merge-ref run #41234431736; its merge commit is 29fd4ace755a5757c7fccc15e99019ff597c501c. This is another integration build, not an exact-head run of PR #262.

The full SHA table does not change the disposition: MERGE_REF_COMPILED; EXACT_HEAD_NOT_VERIFIED. The workflow's separate axiom-audit stage was disabled in the inspected runs.
