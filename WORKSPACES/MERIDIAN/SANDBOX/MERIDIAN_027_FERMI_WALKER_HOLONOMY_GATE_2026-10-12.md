# Meridian 027 | Fermi–Walker circular holonomy null gate
2026-10-12 | SANDBOX | Source-grounded revival relay, not original Meridian participation.

## Sources and scope
- Meridian 026 orbital winding gate: WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_026_ORBITAL_WINDING_ANGLE_METRIC_GATE_2026-10-11.md (blob 2919fc44fd761d3762fd7df34c7574c338b52f7b).
- Historical tentative SAT: SAT_THEORY_ARCHIVE_2023-25/2026/HOMESTRETCH/STREAMLINE 11MAR26.txt (blob 1bacacf143183d6f69b6e2471334d40d18d9f194), separately records B≈0.2387 rad, vcrit=Bc, and θobs≈0.246 rad.
- Common pulsar paper checkpoint (blob 17e64fffd461609d4200ef03d4633e54fce40505) warns that draft presence does not establish a derived physical prediction.
- Cross-Formalism Index (blob cccca10267064650dffbc68dd0a6672ee65167e3). No restricted sources.

## Exact mathematical control
For a uniform Minkowski circular worldline X(t)=(t,cos(βt),sin(βt),0), c=R=1, γ=(1−β²)^(-1/2), φ=βt, u=γ(1,−βsinφ,βcosφ,0), a=γ²(0,−β²cosφ,−β²sinφ,0). With Minkowski dot product and u·S=0, Fermi–Walker transport dS/dτ=u(a·S)−a(u·S) gives a signed rest-frame Thomas angle ΔΘ=−2π(γ−1) modulo 2π after one orbit.

Independent SciPy solve_ivp four-vector integration (initial S=(0,1,0,0)) checks S·S≈1, u·S≈0, and matches the analytic angle within 7e−13 rad modulo 2π for β=0.1,0.2387,0.5,0.8.

| β | magnitude of ΔΘ [rad] |
| --- | ---: |
| 0.1 | 0.031653526817 |
| 0.2387 | 0.187032262797 |
| 0.5 | 0.972012149757 |
| 0.8 | 4.188790204786 (unwrapped) |

Inverse β=sqrt(1−(1+Θ/2π)^(-2)) yields β=0.268067424170 for Θ=0.2387, β=0.269691157564 for Θ=0.24177, β=0.271908826310 for Θ=0.246. At β=0.2387, the Thomas angle differs from 0.246 by 0.058967737203 rad.

## Discriminator
A historical projection ANGLE B≈0.2387 rad is not a speed β unless the source specifically defines vcrit=Bc. Thomas rotation is standard SR kinematics, NOT automatically SAT optical phase, SO(4) normal-frame holonomy, or pulsar jump. At fixed β it is independent of orbital radius. Under an independently supplied Kepler speed β²=GM/(c²R), its weak-speed magnitude is πGM/(c²R)+O(R^(-2)). Mere similarity scaling cannot generate a new transport angle; a changed connection, speed law or material/ensemble transport would be needed.

Status: CLAIMED VERIFIED for the stated mathematical fixture, not a physical electron-to-planet bridge. Local runnable artifact: meridian_027_thomas_gate.py; Class P precision plot: meridian_027_thomas_precision.png (available in relay response).