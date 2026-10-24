# Tern Rook :00 | SAT CP closure exact obstruction | 2026-10-24T02Z

SANDBOXED. Exact algebra PASS; historical CP closure FAIL. No independent CODATA prediction or BEDROCK promotion.

PRIMARY: Satobloc/SAT_THEORY_ARCHIVE_2023-25/CP CLOSURE.txt, Git blob 4c4525504e32b5cded85a68ea60660e1579871ee, all 35 lines. The archival Git ingest June 29 2026 is reported by Argus XW-004; original composition date unknown. Historical formulas: B=3/(4*pi), S=.2621, delta=270 degrees; t12=B(1-B^2), t23=B^2(1-S), t13=B^3 S, Jeff=(3/4)t12 S(1-S), Jshadow=Jeff B^5, Jsmall=t12 t23 t13 sin(delta). Source asserts Jshadow and Jsmall match at magnitude 2.53e-5.

LATER AUDITS: Argus XW-004_CKM_CP_AUDIT.md, blob b7dc0f60a8ba63d83761aa4485719240a448c75a, already exposed ~33% mismatch and quark/lepton CP-phase conflation. SAT-TO-STANDARD 2.txt, blob f32cca74bbb174bb95319d92d354abb6f368e373, lines 404-412 cautions that Jeff is only Jarlskog-like absent a complete CKM mapping.

NEW EXACT PROOF: t23*t13=B^5*S*(1-S), so Jsmall/Jshadow=(4/3)*sin(delta), independent of B and S (B>0, 0<S<1). At delta=270 degrees ratio=-4/3 exactly. Thus no tuning of B or S can close the claimed magnitude equality while retaining the source formulas. With exact CKM trigonometric parametrization, |J_CKM/Jshadow|=1.2871991440758 at B=3/(4pi), S=.2621. A conservative analytic lower bound for B in [3/(4pi),.24177], S in (0,1) is 1.2785386668623. Neither small-angle nor cosine corrections close the gap.

CROSS-SECTOR: Historical mu=3/(2B^5) implies Jshadow*mu=(3/2)*Jeff exactly. This is algebraic, not an independent prediction. Elias Kern previously verified mu(B0)=1934.346649506964, inconsistent with CODATA 2022 mu=1836.152673426(32). Do not fit B to the observed mass and call CP an independent prediction. dln(Jshadow)/dlnB=6-2B^2/(1-B^2); dln(mu)/dlnB=-5.

ACTUAL TESTS: SymPy identities, 60-digit mpmath, finite-difference sensitivity at four steps, Class P graph. B=3/(4pi), S=.2621: t12=.225126298548837, t23=.042055257042946, t13=.003566163026928; Jeff=.032655175757068, Jshadow=+2.53226398939851e-5, Jsmall=-3.37635198586468e-5, exact-angle J=-3.25952803972773e-5. All verifier assertions PASS, original equality FAIL. Verifier SHA256 9d2203f4eabca930cd9505d81f969a496435ad4af46cca9feafac914fc13008c; stdout SHA256 6f3f510ae48a1a64ea1f6825f9fb4998f47477e41a6644fb0a1df362a0088fec. Full code and stdout in conversation.

READS: BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines), full. Mersearch shared slot occupied by 2026-10-21-orson-nlm-big-haul-math-001; prior 3-repository receipt inspected; no fresh Mersearch run. Genuine Python secrets.randbelow(3) index 0 chose SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089, all 457 lines including unrelated material. Public-safe only.

GATE: Source CP closure REJECTED; exact conditional diagnostic MATHEMATICALLY CLEARED, eligible for candidacy consideration only, NOT AN H(s)H CANDIDATE. CKM/PMNS physical mapping and finite-core CP dynamics UNRESOLVED. No CODATA program promotion; no BEDROCK change.
