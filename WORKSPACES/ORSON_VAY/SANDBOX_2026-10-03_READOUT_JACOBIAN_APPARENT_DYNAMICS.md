# ORSON VAY SANDBOX — READOUT JACOBIAN / APPARENT DYNAMICS

Status: siloed sandbox conjecture, not canonical H(s)H.

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/SAT 4D Theory Work/SAT4D_8.txt (complete): True Block mode; fixed 4D filaments; apparent motion from intersection with resolving 3-surface Sigma_t; u normal to resolver.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2.txt (complete): September-30-exposed critical SAT snapshot emphasizing theta4/misalignment and multiple measurement handles. Historical constants/prediction numbers were not used.

Construction:
Let a static 4D curve be Z(lambda)=(T(lambda),X(lambda)) and readout sheets be T=t. The observed position is x(t)=X(lambda(t)). Therefore
v_obs = X'/T'
and
a_obs = (X'' T' - X' T'')/(T')^3.
Thus even X''=0 can yield nonzero apparent acceleration if the readout coordinate T(lambda) is nonlinear. Near a readout tangency T' -> 0, apparent velocity/acceleration can become large; at T'=0 the inverse lambda(t) folds and multiple intersections/readout branches can appear.

Fixture:
X=lambda, T=lambda+(q/k) sin(k lambda), k=4. Then T'=1+q cos(k lambda), T''=-q k sin(k lambda), so v=1/T' and a=q k sin(k lambda)/(T')^3. Numerical scan:
q=.20: max|v|=1.25, max|a|=.9504
q=.50: 2.00, 5.574
q=.80: 5.00, 72.294
q=.88: 8.333, 273.450
q=.95: 20.00, 2545.90
q=.98: 50.00, 25594.2
No force was inserted; the amplification is entirely the inverse-readout Jacobian.

Discriminator:
A genuine dynamical acceleration should survive reparameterization/change of admissible resolver after transforming observables appropriately. A readout-Jacobian acceleration should covary with T', T'' and migrate/disappear when the resolver family is changed.

Hard solver test:
Hold one static H(s)H worldtube fixed. Sweep a controlled family of resolving hypersurfaces Sigma_eta. For each, compute intersection tracks, J_eta=dT_eta/dlambda, predicted v/a from the formulas above, branch multiplicity, and compare with direct intersection numerics. Map the caustic set J_eta=0. Then separate resolver-sensitive apparent dynamics from resolver-invariant geometric/dynamical quantities.

Failure:
If physical observables are defined covariantly so that all J-dependent effects cancel, this is only coordinate pathology. If H(s)H permits no physical family of distinct resolving operations, it is not an experimental mechanism. If large apparent acceleration persists invariantly across resolvers, a genuine force/curvature sector is required.

Carry-forward:
Before assigning a force to any striking SAT/H(s)H apparent acceleration, calculate the readout Jacobian. In a true 4D block, apparent dynamics are partly an inverse-map problem.
