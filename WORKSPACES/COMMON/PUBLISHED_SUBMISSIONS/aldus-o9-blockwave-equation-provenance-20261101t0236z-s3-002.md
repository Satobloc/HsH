# Aldus :36 | SAT-O / Blockwave source-to-equation provenance

**Disposition: SOURCE_LINEAGE_UPDATED / NO THEORY_PROMOTION / NO PHYSICAL PREDICTION.**

This is an additive source-provenance record following the completed Mersearch request `aldus-o9-blockwave-equation-genealogy-20261031-1124`. It does not replace the earlier Aldus O9 chronology report or the Nadir/Enheduanna Blockwave stratigraphy reports.

## 1. Mersearch completion

Actions run `41198219023` completed successfully. The request-scoped manifest and compact receipts were recovered and read back.

- Request: `aldus-o9-blockwave-equation-genealogy-20261031-1124`
- Manifest blob: `a21496b7ffc5852b3595c87193c942882609eb57`
- Compact Markdown receipt blob: `527105797e13425c0ac9b45c64b7386735da9894`
- Compact JSON receipt blob: `b1c7a101e2fc4c988e1c7a680cd111766f480356`
- Source-result SHA-256: `c1eaf2ea2df50fdb34aada4a90a9ef3206c9dbb2b104f256f3b58ccf12be62e8`

The bounded search scanned 15,945 files and 20,843,011 records, producing 37,290 hits across 294 distinct paths. Most hits were filename/path matches for `BLOCKWAVE`; counts and ranking are navigation metadata, not independent witnesses. The full raw result bundle remains withheld.

Recorded source snapshots:
- SAT archive: `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`
- HsH: `e327487a8b20a56fae5f4c93a6a94b3bbfc8dedb`
- HSH_RESOURCES: `87289c92068c134e84a70e6a2f18807247b4a36`

The bridge used a runtime-only manifest-writer hotfix; the stable search script and matching logic were unchanged. Four Mersearch lanes are occupied; no new request was opened.

## 2. Verbatim Blockwave source

The `BLOCKWAVE CLEAN ACTION` is a **user-supplied attachment** in the 2025-09-16 conversation `68c990dd-df28-832e-b766-c267190aaffa`.

- Raw conversation export blob: `c0a26b8375c88c845ebd8cfe9b14516992ccc99d`
- Attachment ID: `file-LwaFTKkMemPPrLU4qCLpYB`
- Size: 25,255 bytes
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- HsH archive Git blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`

The raw export records the attachment in a system-role attachment record and its text as a file-search tool quote. The outer upload is user-supplied; the attachment's internal author is unresolved. It is **not authenticated Nathan Direct mathematics**.

The following equation block is preserved verbatim, including malformed index spellings:

```text
\boxed{
\begin{aligned}
S \;=\; \int d^4x\,\sqrt{-g}\;\Big[
&\; \frac{M_{\rm P}^2}{2}\,R
\;+ \; \underbrace{\frac{f_\theta}{2}\,\nabla_\mu\theta\,\nabla^\mu\theta - \Lambda_\theta^4(1-\cos\theta)}_{\text{compact phase (elastic + compactness)}}
\\[2pt]
&\;+ \underbrace{\tfrac{c_1}{2}\,P^{\alpha\beta}P^{\mu\nu}(\nabla\alpha u_\mu)(\nabla_\beta u_\nu)
\;+ \tfrac{c_2}{2}\,(\nabla_\mu u^\mu)^2}_{\text{time-flow elasticity (Lorentz-safe sector)}}
\;+ \lambda\,(u^\mu u\mu+1)
\\[2pt]
&\;+ \underbrace{\tfrac{\kappa_0}{4}\,J_{\mu\nu}\,P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,J^{\rho\sigma}
\;+ \tfrac{\kappa_2\,\ell^2}{4}\,(\nabla_\alpha J_{\mu\nu})\,P^{\alpha}{}{\beta}P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,(\nabla^\beta J^{\rho\sigma})}_{\text{filament spectrum: flex/twist/coil}}
\\[2pt]
&\;+ \underbrace{\frac{g_h}{2}\,F_{\mu\nu}(\theta)\,J^{\mu\nu}}_{\text{holonomy-trace coupling}}
\;+ \underbrace{\frac{1}{2}\,J{\mu\nu}\,\mathcal{M}^{\mu\nu}{}{\rho\sigma}(\theta,u)\,J^{\rho\sigma}}_{\text{mixing / medium response}}
\Big].
\end{aligned}
}
```

The attachment also defines a conserved rank-two current and gives
`J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma`.

**Status:** user-supplied attachment; embedded authorship unresolved; speculative action; no independent measurement or validation.

## 3. SAT-O mass-spectrum formula: separate provenance

The 2025-10-29 `SATO-BLOC FULL LEANCHECK` raw conversation is:
- Conversation ID: `6902429e-f6b8-8326-b681-3e74e3119378`
- Raw export blob: `ccfa7a4f589a1a513b596414a8db625364aed52b`

A user-role message `6d6553dc-9fcf-4428-b2be-bb13b22c9e5b` at `2025-10-29T16:36:50.062Z` pasted a draft containing the distinct relation

\[
m_\psi^{(\mathrm{eff})}=\frac{T\ell_f}{c^2}\frac{1}{Q}.
\]

The embedded document has no authenticated individual byline. The outer user role establishes who supplied the paste, not who authored the embedded equation.

A later **assistant-role** message `6565fed8-4525-4b11-851a-aaa2793dc2a7` at `2025-10-29T17:08:58.044Z` introduced the separate quadratic spectrum formula

\[
\boxed{m^2=k\,(N+\beta Q^2-a)}.
\]

That formula appears in:
- `SAT O Core Modules/O9.txt`, Git blob `676ce08c09226e4bde5a4d8efa3d7f4da228a1d8` (1,583 characters);
- `SAT 4D Theory Work/O9.tex` and `sat_o9_module.tex`, which are byte-identical to each other at blob `14240f3dd9d11eefa7e9154514a6737debcd5bfa`.
The raw `SATO-BLOC FULL LEANCHECK` export is 2025-10-29 source material; its message role and UUID are the evidence for the assistant-originated first recovery above, not the module's later archive presence.

The TeX byline is “SAT.4D Coherence Project” and its date is `\today`; neither establishes an individual author or a fixed creation date. The archive snapshot commit is not proof of first public appearance.

The module's example calibrates `k` and `beta` using electron, muon, and pion values with `Q = 1,2,3`, `N = 0`, and `a_fixed = 1.0`. It supplies no units, measurement uncertainties, covariance, or untouched holdout. This is **calibration/fit**, not an independent prediction.

Separate dimensional correction: if `N` and `Q` are dimensionless, then `beta` and `a` must be dimensionless and `k` carries mass-squared units. A prior assistant statement assigning mass-squared units to all three is inconsistent with the sum inside the parentheses. The archived module itself does not settle units.

## 4. The other O9: optical intake label

A separate 2025-06-23 conversation concerns a user-uploaded `refractive_index_modulation.pdf`:

- Conversation ID: `68430902-ada8-8003-981f-0bf779b8353f`
- Raw export blob: `d6faa4aef4c7549e233c7eb169b6362040a2911c`
- User upload: `13115169-09a8-4998-8d6e-3a8827c02c18`, 03:47:52.442Z
- Assistant proposes temporary “Module O9” label: `e893cb09-f28f-4aff-9c0f-05a8c6138861`, 03:47:53.461Z
- User replies `CONFIRM`: `e60d3c5b-49e6-456a-ad0f-0f7e37552960`, 03:48:29.080Z

The top Mersearch hit `edd53d7b-210f-4cae-922f-bc64d1de39bb` is a tool-role search result, not a user-authored equation. The raw conversation separately records the user upload, assistant label proposal, and user confirmation. The user confirms the temporary label and pipeline handling, not equation authorship, novelty, physical validity, or canonical status. The attachment is 382,611 bytes, but its content SHA and extraction mapping remain unavailable. Two same-name/same-size archive paths share one archive blob; that does not prove byte identity with the original upload. The archive extraction queue records no extraction mapping.

The assistant's tracker row gives an O9-AUDIT start date of June 6; the recovered upload and confirmation sequence is June 23. The June 6 date is unsupported by this source sequence.

This optical O9 is distinct from the October 2025 mass-spectrum O9.

## 5. Assistant-generated variants, kept separate

- The user request `e92efb17-2499-482e-b930-9ad11221bd7c` at `2025-09-18T15:19:27Z` asks for Chapters 1–5 to be rewritten “all in the 3-form.” This is a direct editorial/formulation preference, not a user-authored equation.
- The subsequent three-form current equation was generated by the assistant in conversation `68cad3d4-0ccc-8325-be36-94c5b5527997` (raw export blob `dd2b6141af86dea54e4ba2e782214128619ce78c`), message `ff0ef513-0f75-4e87-a719-378447788b32`, at `2025-09-18T15:43:01Z`. Its exact body was not re-extracted in this pass, so no paraphrase is presented as a verbatim equation. It is not a verified correction to the attachment's two-form current.
- In four dimensions, the Hodge star maps 2-forms to 2-forms and 3-forms to 1-forms. A J2 worldsheet current and J3 filament-support current are not direct Hodge duals. A boundary/sweep relation requires an explicit support map.
- The attachment's `A_mu = alpha_* nabla_mu theta` and `F_munu = nabla_[mu A_nu]` give `F = 0` locally for a smooth single-valued phase and constant `alpha_*`. Nonzero holonomy needs specified bundle/defect/global data; those are absent from the attachment. This is a conditional mathematical limitation, not an empirical disproof.
- The October 19 action in conversation `68f4d9b5-b908-832e-940e-6782db174a4a` (raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`) is assistant-generated, message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`. It is a J2 synthesis, not an independent user-authored source.
- The October 29 assistant-generated “SAT O 2.0” action (message `c003e913-df3e-416e-a2d4-b48fc70bfc4b`, 16:39:49.585Z) changes the field content to a nonrelativistic fluid-style model (`rho`, velocity, and potential). It is a separate assistant reconstruction, not a corrected version of the covariant Blockwave action.
- The February 25 “Page One” paste (conversation `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`, raw blob `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`; message `15338421-a5e7-4538-879a-d25d840d2bdd`) is user-role content with no verified embedded byline.
- The pasted Lean skeleton in the October 29 conversation contains placeholders/`sorry` and custom abstractions. No successful Lean compilation is established by that conversation.

No Nathan-authored corrected Blockwave action was recovered. Verbatim source, assistant reconstruction, and dimensional/editorial corrections remain separate.

## 6. Physical and formal status

No new physical calculation, fit, prediction, or observational validation was performed. The O9 example lacks units, uncertainties, covariance, and an untouched holdout; the Blockwave action lacks an identified measured system and calibrated parameters.

No new Lean module or proof was run. A future formalization would need a source-defined support/sweep map and a precisely stated proposition. Compilation would verify only that formalized proposition, not the physical premises.

## 7. Next source cursor

1. Recover the original optical PDF bytes and extraction mapping; do not infer them from filename/size.
2. Establish first repository/public commits for the O9 module and Blockwave attachment. This audit has recovered raw conversation dates, not a verified first-public T0.
3. Recover any Nathan-authored correction, if one exists. Until then, keep assistant variants quarantined.
4. Do not promote any equation to BEDROCK or treat the O9 calibration as a prediction.

This is an additive provenance record. It does not modify BEDROCK, SAT-O source equations, Blockwave theory, paper gates, branches, or automations.
