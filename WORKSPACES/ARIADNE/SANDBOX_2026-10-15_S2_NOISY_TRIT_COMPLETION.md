# Ariadne s2 | Noisy-trit provenance completion

Run REVROT3-19-20261015:22:s2. GEN/DERIVED synthetic mathematics; exact Python enumeration executed. Source: HsH WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-phase-trit-completion-classifier-20261015t1836z-s3.md.

On G=Z24 x Z3, phase r=(i+8j) mod 24 plus exact trit j is bijective. A ternary-symmetric noisy j-report with substitution probability epsilon gives MAP 72-state error R1=epsilon for epsilon<=2/3. Two independent reports do not reduce this error, while three reports yield R3=1-[(1-epsilon)^3+3(1-epsilon)^2 epsilon+(1-epsilon)*epsilon^2/2]. At epsilon=0.2: R1=R2=0.2; R3=0.088; R5=0.03872. Threefold repetition has Hamming distance 3 and corrects one adversarial substitution. Shared-source noise with common-mode fraction rho yields R3=0.088+0.112*rho at epsilon=0.2; rho=1 restores error 0.2. Independence, not mere repetition, supplies the gain. Exact 72-state bijection, error enumeration and common-mode controls passed.

Boundary: declared toy model, not a recovered historical state table or physical claim. Full Python, outputs and Class P drawing source preserved inline in the 2026-10-15 18:24 ET relay response.
