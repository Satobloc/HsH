# Aster source-fidelity correction | D2/O1 provenance and parameter variants

**Run:** REVROT3-19-20261011:543:s4  
**Nominal slot:** 2026-11-02 15:48Z  
**Classification:** SOURCE-FIDELITY CROSS-READ / NO PAPER-A REVIEW REOPENED

## Executive result

The previous Aster crosswalk's statement that the D2 file date and path-to-commit association were unresolved is now superseded. GitHub path history verifies a first extant repository commit for the standalone D2 file and the combined D1-D8 file. A further source comparison shows that the O1 document family has conflicting canonical-momentum coefficients. The available sources do **not** establish that D2's \(m\) is linear mass density.

This is a source-provenance correction, not a physical validation or theory promotion.

## 1. D2 repository chronology

GitHub's path-history endpoint returns exactly one extant commit for each of:

- SAT O Derivations/SAT_D2_MODE_EXPANSION.txt
- SAT O Derivations/CODE-LOCKED DERIVS.txt

Both were added in verified commit d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc, authored by the repository account Satobloc, at **2025-10-27T01:15:21Z**. The commit diff shows both paths as additions.

This is the first extant GitHub repository commit for those paths. It is **not** proof of original composition date, direct Nathan authorship, or the originating conversation.

The later SAT 4D Theory Work/D2.tex copy was added in commit 9651a18ab461eb60e059e925cb4f7e1b882ec350 at **2026-09-04T21:48:30Z**. Its detailed D2 section is textually identical to the standalone D2 after normalizing one typographic hyphen (ordinary hyphen versus nonbreaking hyphen). The HsH 30SEP26 dump copy D2.txt has the same blob as that later D2.tex file.

The following are mirrors or derivative copies, not independent witnesses:

| Artifact | Blob SHA-1 |
|---|---|
| SAT standalone SAT_D2_MODE_EXPANSION.txt | 6844c72027e9569e4f8da3a85a24434e0ad080cf |
| SAT combined CODE-LOCKED DERIVS.txt | 783b05d39d59bf854b92090e15d205e6823b51c8 |
| Later SAT 4D Theory Work/D2.tex and HsH dump D2.txt | 29cbf1... |
| HsH dump standalone D2 mirror | 6844c72027e9569e4f8da3a85a24434e0ad080cf |
| HsH dump combined-file mirror | 783b05d39d59bf854b92090e15d205e6823b51c8 |

The generated [[[SAT_2025_DERIV]]].txt snapshot dated 2025-10-27 20:17:22Z is a later generated compilation/index artifact, not an originating raw conversation.

## 2. O1 source variants do not agree on the coefficient

The nearest O1 document-level sources show several different forms:

| First extant repository event or document metadata | Artifact | Relevant source statement |
|---|---|---|
| 2025-10-27 00:40:28Z, commit b543eb3fbf16e50500ceadad83dc9a7dc0759e5b | SATOBLOC/SAT O1 4D.txt, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc | Calls \(m\) the “filament tension mass-equivalent parameter”; no units or linear-density definition. Unbylined document-level source. |
| 2025-10-27 01:13:03Z, commit c2d7dfe845cb0255385c8c690bbc9d36bae46f31 | SAT O Core Modules/SAT_O1.pdf | The later text extraction reads \(\pi_\mu(\lambda)=T\,d\xi_\mu/d\lambda\) and \(H=(1/2T)\pi_\mu\pi^\mu\). It does not map \(T\) to D2's \(m\) or to \(\mu\). |
| 2025-10-27 01:15:21Z, commit d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc | D1/D2 detailed buildouts | D1 uses \(m\,d\xi/d\lambda\); D2 uses \(m\) in its eigenvalue equation and mode normalization. D2 itself does not define \(m\). |
| Document date June 2025; repository upload 2026-09-07 19:08:04Z, commit c14e64db91faa48dcdb9f2258ccba190703ff753 | EARLY LOGGED/2025-10-24_12→17_SAT_O1.tex | Byline “SATO.4D Coherence Project”; uses \(\pi_\mu(\lambda)=m\dot{\xi}_\mu(\lambda)\), without defining \(m\) as linear mass density. |

The PDF extraction is blob bd244e49c6b668a72131b4f195e32820d4540746, source PDF SHA-256 fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d, produced with PyMuPDF on 2026-09-10; OCR was not attempted. The extraction's coefficient difference is a document-variant observation, not a claim about which version is canonical.

The D1 file's turn2file10 locator is only recovered as an opaque file-citation marker in an assistant-authored message in the 2025-09-13 “Credulity meter placement” export. The referenced attachment bytes and identity are not recovered. It cannot serve as a verified raw O1 source locator.

## 3. What can be said about m and lambda

The standalone D2 text uses \(m\) in
\[
\int K(\lambda,\lambda')\phi_n(\lambda')\,d\lambda'
=m\omega_n^2\phi_n(\lambda)
\]
and in the resulting dispersion expression, but supplies no explicit unit or definition for \(m\).

The closest preceding O1 text calls \(m\) a filament tension mass-equivalent parameter. It does **not** call it mass per unit length. The O1 PDF variant instead uses \(T\) in its canonical momentum. No located source supplies a map among \(m\), \(T\), and standard string linear density \(\mu\).

The June 2025 .tex variant defines \(\gamma^\mu(\lambda)\) as a 4D worldline with \(\lambda\) as its affine parameter. D2 uses \(\lambda\) on a periodic interval of length \(L\), with \(k_n=2\pi n/L\). Neither D2 nor the O1 variants provide an explicit map from that affine parameter to spatial arclength \(s\), or a separately typed evolution coordinate \(t\). This is a typing/provenance gap, not proof of a physical contradiction.

Therefore:
- \(m\to\mu\) is **not** an established Nathan Direct correction.
- The standard uniform-string model with \(\xi(s,t)\), arclength \(s\), evolution time \(t\), tension \(T\), and linear density \(\mu\) is a conditional standard reconstruction.
- Applying that reconstruction changes parameter semantics and introduces a coordinate separation that the D2 source does not state.

## 4. Relationship to the 2024 DIMENSIONAL GRAVITY source

The 2024 raw conversation 252d05c0-22ed-4ea2-a474-7966ab13145a, blob 2cea1924266418e19b825b95ae51e6b7cbace7e1, remains a distinct source. Its physical-string toy is a branched central-knot/spherical-boundary construction. D2 is a single uniform-tension periodic 1D filament. The 2024 source does not supply the D2 equation or a direct \(m\)-to-linear-density definition in the focal string discussion.

Do not identify these systems without explicit maps and conditions.

## 5. Existing HsH reconstruction and Lean status

HsH formalization/equations.json records EQ-0003 as STD/DERIVED, with assumptions \(\xi=\xi(s,t)\), \(s\) arclength, \(t\) evolution parameter, uniform positive tension, uniform positive linear density \(\mu\), and periodic boundary conditions. Its source pointer is the combined D2 artifact. This is a standard-model reconstruction, not a Nathan Direct source equation.

The current generated/equations/CHECK_REPORT.md records:
- EQ-0003 dimensions check: PASS.
- EQ-0003 numeric-close check: PASS for the registry's synthetic bindings \(T=12,\mu=3,k=4\).
- EQ-0003 Lean compile: **NOT_RUN**, because no Lean command was supplied.

The previous Aster report cited generated/lean/EQ_0003_Dispersion.lean, blob 5153cc39f2e743414948d95c3fb2eede00e25347. That file is not retrievable at the reported path in the current HsH default branch, and bounded code search across the accessible repositories finds only references to the blob, not the file. Treat the module as **NOT CURRENTLY RETRIEVABLE / NOT COMPILED**, not as a verified Lean artifact. The CHECK_REPORT's synthetic numeric check is not a physical measurement or validation.

No new Lean module, compile, numerical fixture, physical calculation, or model fit was performed. A source-faithful formalization remains blocked until the parameter and coordinate types are specified. Any new data-free proof or mathematical fixture would require Nathan's specific prior permission.

## 6. Corrected epistemic ledger

| Layer | Status |
|---|---|
| Nathan Direct definition of D2 \(m\) as linear mass density | NOT RECOVERED |
| Historical O1 document-level definition | One unbylined text variant calls \(m\) a mass-equivalent parameter |
| Historical O1 PDF variant | Uses \(T\) in canonical momentum; mapping unresolved |
| D1/D2 repository provenance | First extant commit verified, 2025-10-27T01:15:21Z |
| D2 original composition date and originating raw conversation | UNRESOLVED |
| Standard-string \(\mu,s,t\) model | STD/DERIVED conditional reconstruction |
| Independent physical measurement validating D2 | NONE IDENTIFIED |
| EQ-0003 Lean compilation | NOT_RUN / module not currently retrievable |

## 7. Next source cursor

Recover the originating raw O1/D1/D2 conversation or the exact attachment behind the opaque turn2file10 citation. Then determine which O1 variant, if any, is intended to govern D1/D2. Do not silently choose between \(m\), \(T\), and \(\mu\), or between affine \(\lambda\), arclength \(s\), and evolution time \(t\).

No new Mersearch request was opened because all four shared lanes remain occupied. Bounded GitHub code search and exact path-history queries were used as a fallback, not represented as Mersearch. No physical calculation, data-free proof, new tooling, branch, PR, issue, or theory promotion was performed.


## 8. Publication and write status

The existing HSH-PUBLISH-V1 issue #946 is the correct public thread for this additive correction. The publisher workflow listens to issue-opened events and has no append mode; creating a new issue would duplicate the existing source-fidelity report.

An additive comment append to issue #946 was attempted through the available GitHub comment connector. The connector failed internally. An immediate issue-comment readback found no matching new comment. No retry loop and no duplicate issue were created.

Status: **CONNECTOR_WRITE_REJECTED / PUBLISHER_APPEND_UNAVAILABLE / PUBLIC_COMMENT_PENDING**.

This report is a durable repository workspace artifact with exact independent file readback. It is **not** claimed as a verified HSH-PUBLISH-V1 published submission.
