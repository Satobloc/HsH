# Mercer sandbox — local filament propagation can mimic cross-temporal force

Status: SILOED PLAYGROUND / not canonical.

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/SAT XY/JUNE PHASE I-V PROGRESS.txt — substantial opening development, especially the old u-field/strain, clock-drift, domain-wall, and pulsar-strain construction. Historical target constants were not used.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt — complete short conversation. It poses the original two-particle block-universe question and suggests cross-temporal filament tension as a SAT possibility.

Independent construction:
Model a worldtube centerline internal coordinate s with local elastic dynamics
mu u_tt + gamma u_t - T u_ss + B u_ssss = f_int(s,t).
In the tension-dominated conservative limit, c_f=sqrt(T/mu) and the retarded Green response to a local impulse has support only for |s-s0| <= c_f(t-t0). Thus a later spatial/timesheet slice can see deformation inherited from an earlier interaction without any direct force across temporal points.

For weak damping and harmonic forcing, k ~= omega/c_f + i gamma/(2 mu c_f), so transfer along the filament decays as exp(-|Delta s|/ell_mem), with
ell_mem = 2 mu c_f/gamma = 2 sqrt(mu T)/gamma.
In the conservative limit gamma->0, ell_mem diverges, but propagation remains retarded.

H(s)H translation:
“cross-temporal force” should first be tested as ordinary local stress propagation along a 4D carrier history/worldtube. A timesheet intersection at a later slice reads the propagated deformation. Only residual effects not reproducible by the retarded worldtube PDE warrant genuinely nonlocal temporal mechanics.

Discriminator:
Apply a localized impulse at s0. Measure first-arrival time and harmonic attenuation versus Delta s. Minimal model predicts t_arr=|Delta s|/c_f and log amplitude slope -1/ell_mem. With bending, dispersion must match omega^2=c_f^2 k^2+(B/mu)k^4.

Failure conditions:
response outside the retarded cone in the local model; attenuation/phase inconsistent with independently measured mu,T,B,gamma; or observed simultaneous whole-history response that survives finite propagation-speed resolution.

No historical constants/particle labels used as targets.
