# Unequal-radius 4-ball intersection geometry | 2026-10-22

SANDBOXED Euclidean geometric control, not new physics, BEDROCK or CODATA prediction.

Historical target: HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UNIT CELL LAGRANGIANS.txt, blob 8adfdc9e5fcd8474c69f1dded679eda5d4434608. Control: HsH/BEDROCK.md, 2026-10-22 blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8. Prior equal-ball result: issue #222, independently verified published file.

Two S3 boundaries in Euclidean R4 of radii R and r and center separation d intersect in the plane x=(d^2+R^2-r^2)/(2d), with S2 cross-section rho^2=R^2-x^2 for |R-r|<d<R+r. At tangency d=R+r or d=|R-r|>0, the common boundary is a point. For d<|R-r|, one ball is enclosed and the surfaces are disjoint, although the solids overlap. Coincident equal-radius spheres share a full S3 boundary.

Partially overlapping filled four-balls have four-volume V=(4pi/3)[int_(d-r)^x (r^2-(u-d)^2)^(3/2) du + int_x^R (R^2-u^2)^(3/2) du]. At external tangency h=R+r-d->0+, V~(8pi/15)(2Rr/(R+r))^(3/2) h^(5/2). Numerical quadrature and symbolic radius checks passed; for R=2,r=1, ratio exact/asymptotic is 0.9973204107 at h=.01 and 0.9997321256 at h=.001.

Gate: PASS for Euclidean boundary classification and overlap asymptotic; UNRESOLVED for current native Minkowski worldtube readout, finite-core material law, and contact forces. A four-volume exponent alone is not a force law. CODATA quantity N/A. No historical claims silently repaired.
