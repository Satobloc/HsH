# Equation Check Report

- Tool: `equation-pipeline/0.1.0`
- Registry SHA-256: `8d1fd7fd66b6c6490bf2363bf835c2f5c052dd8b77a824ffb0b208c9280204dd`
- Results: 6 PASS, 0 FAIL, 5 NOT_RUN

| Equation | Check | Kind | Status | Detail |
|---|---|---|---|---|
| EQ-0001 | collapse-boundary | numeric_close | PASS | actual=1.1102230246251565e-16; expected=0; abs_tol=1e-12 |
| EQ-0001 | lean-compile | lean_compile | NOT_RUN | no --lean-command supplied |
| EQ-0001 | radius-dimensions | dimensions | PASS | dimensions agree: {'L': Fraction(2, 1)} |
| EQ-0001 | radius-rearrangement | sympy_zero | NOT_RUN | SymPy is not installed |
| EQ-0002 | determinant-dimensions | dimensions | PASS | dimensions agree: {} |
| EQ-0002 | determinant-numeric | numeric_close | PASS | actual=1; expected=1; abs_tol=1e-14 |
| EQ-0002 | determinant-symbolic | sympy_zero | NOT_RUN | SymPy is not installed |
| EQ-0002 | lean-compile | lean_compile | NOT_RUN | no --lean-command supplied |
| EQ-0003 | dispersion-dimensions | dimensions | PASS | dimensions agree: {'Tau': Fraction(-2, 1)} |
| EQ-0003 | dispersion-numeric | numeric_close | PASS | actual=8; expected=8; abs_tol=1e-12 |
| EQ-0003 | lean-compile | lean_compile | NOT_RUN | no --lean-command supplied |

`PASS` applies only to the named check. It does not promote the equation's model status.
