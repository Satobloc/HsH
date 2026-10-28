import HsHVerification.ArchiveEQ0001
import HsHVerification.ArchiveEQ0002
import HsHVerification.ArchiveEQ0003
import HsHVerification.ArchiveEQ0004
import HsHVerification.ArchiveEQ0005
import HsHVerification.ArchiveEQ0006
import HsHVerification.ArchiveEQ0007
import HsHVerification.ArchiveEQ0008
import HsHVerification.ArchiveEQ0009
import HsHVerification.ArchiveEQ0010
import HsHVerification.ArchiveEQ0011
import HsHVerification.ArchiveEQ0012
import HsHVerification.ArchiveEQ0013
import HsHVerification.ArchiveEQ0014
import HsHVerification.ArchiveEQ0015
import HsHVerification.ArchiveEQ0016
import HsHVerification.ArchiveEQ0017
import HsHVerification.ArchiveEQ0026
import HsHVerification.ArchiveEQ0027
import HsHVerification.ArchiveEQ0028
import HsHVerification.ArchiveEQ0029
import HsHVerification.ArchiveEQ0030
import HsHVerification.ArchiveEQ0031
import HsHVerification.ArchiveEQ0032
import HsHVerification.ArchiveEQ0033
import HsHVerification.ArchiveEQ0034
import HsHVerification.ArchiveEQ0035
import HsHVerification.ArchiveEQ0036
import HsHVerification.ArchiveEQ0037
import HsHVerification.ArchiveEQ0038
import HsHVerification.ArchiveEQ0039
import HsHVerification.ArchiveEQ0040
import HsHVerification.ArchiveEQ0041
import HsHVerification.ArchiveEQ0042
import HsHVerification.ArchiveEQ0043
import HsHVerification.ArchiveEQ0044
import HsHVerification.ArchiveEQ0045
import HsHVerification.ArchiveEQ0046
import HsHVerification.SourceSpanAttributionGate
import Mathlib

/-! Smoke test for the HsH formal-verification pipeline.
    Compilation proves only the stated mathematics, not a physical model. -/

namespace HsHVerification

theorem relative_map_triangle_closure {G : Type*} [Group G]
    (g₀ g₁ g₂ : G) :
    (g₀ * g₂⁻¹) * (g₂ * g₁⁻¹) * (g₁ * g₀⁻¹) = 1 := by
  group

end HsHVerification
