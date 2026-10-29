import Mathlib

/-!
Source-grounded archival count arithmetic, NOT a proof that the external JSON was
parsed correctly. Counts originate from actual original Library raw conversation
exports and the independently executed Python active-parent-chain parser.
ARIADNE raw SHA256 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8
Science Made Stupid SHA256 a12ce6c6cb65a850d90740329825a37087004af2420ae9847dca3c692f3329e1
-/
namespace HsHVerification.AriadneArchive

structure RoleCounts where
  userCount : Nat
  assistantCount : Nat
  toolCount : Nat
  unknownCount : Nat
  deriving DecidableEq, Repr

def total (c : RoleCounts) : Nat :=
  c.userCount + c.assistantCount + c.toolCount + c.unknownCount

def ariadne : RoleCounts := ⟨10, 555, 798, 1⟩
def science : RoleCounts := ⟨209, 770, 680, 1⟩
def ariadneKirk : RoleCounts := ⟨0, 11, 106, 0⟩
def ariadneRiley : RoleCounts := ⟨0, 7, 51, 0⟩

theorem ariadne_active_partition : total ariadne = 1364 := by decide
theorem science_active_partition : total science = 1660 := by decide
theorem science_offpath_count : 1660 + 74 = 1734 := by decide
theorem kirk_direct_user_count_zero : ariadneKirk.userCount = 0 := by decide
theorem riley_direct_user_count_zero : ariadneRiley.userCount = 0 := by decide
theorem kirk_relay_count : ariadneKirk.assistantCount + ariadneKirk.toolCount = 117 := by decide

end HsHVerification.AriadneArchive
