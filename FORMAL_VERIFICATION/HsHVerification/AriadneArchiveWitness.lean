import Mathlib

/-
Source-grounded archival count arithmetic, NOT a proof that the external JSON was
parsed correctly. Counts originate from actual original Library raw conversation
exports and an independently executed Python current-node parent-chain parser.

ARIADNE raw SHA256 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8
Science Made Stupid SHA256 a12ce6c6cb65a850d90740329825a37087004af2420ae9847dca3c692f3329e1

Both exports contain one empty client-created root mapping node. That node is not
a message and does not have an unknown message role. The definitions below keep
message-role counts separate from empty mapping-node counts. Lean checks only
these supplied tuples and arithmetic; it does not validate JSON extraction,
source identity, chronology, or authorship.
-/
namespace HsHVerification.AriadneArchive

structure RoleCounts where
  userCount : Nat
  assistantCount : Nat
  toolCount : Nat
  unknownRoleCount : Nat
  deriving DecidableEq, Repr

def messageTotal (c : RoleCounts) : Nat :=
  c.userCount + c.assistantCount + c.toolCount + c.unknownRoleCount

structure MappingCounts where
  messageRoles : RoleCounts
  emptyNodeCount : Nat
  deriving DecidableEq, Repr

def mappingNodeTotal (c : MappingCounts) : Nat :=
  messageTotal c.messageRoles + c.emptyNodeCount

/-- Ariadne current-node chain: 1,363 messages plus one empty root node. -/
def ariadne : MappingCounts := ⟨⟨10, 555, 798, 0⟩, 1⟩

/-- Science Made Stupid current-node chain: 1,659 messages plus one empty root. -/
def science : MappingCounts := ⟨⟨209, 770, 680, 0⟩, 1⟩

/-- Full Science Made Stupid DAG message roles, excluding the empty root node. -/
def scienceDagMessages : RoleCounts := ⟨222, 811, 700, 0⟩

/-- Science Made Stupid off-path messages, all with message objects. -/
def scienceOffPathMessages : RoleCounts := ⟨13, 41, 20, 0⟩

def ariadneKirk : RoleCounts := ⟨0, 11, 106, 0⟩
def ariadneRiley : RoleCounts := ⟨0, 7, 51, 0⟩

theorem ariadne_active_message_partition :
    messageTotal ariadne.messageRoles = 1363 := by decide

theorem ariadne_active_mapping_node_count :
    mappingNodeTotal ariadne = 1364 := by decide

theorem ariadne_unknown_role_count_zero :
    ariadne.messageRoles.unknownRoleCount = 0 := by rfl

theorem ariadne_empty_root_count_one :
    ariadne.emptyNodeCount = 1 := by rfl

theorem science_active_message_partition :
    messageTotal science.messageRoles = 1659 := by decide

theorem science_active_mapping_node_count :
    mappingNodeTotal science = 1660 := by decide

theorem science_unknown_role_count_zero :
    science.messageRoles.unknownRoleCount = 0 := by rfl

theorem science_empty_root_count_one :
    science.emptyNodeCount = 1 := by rfl

theorem science_full_dag_message_partition :
    messageTotal scienceDagMessages = 1733 := by decide

theorem science_off_path_message_count :
    messageTotal scienceOffPathMessages = 74 := by decide

theorem science_active_plus_off_path_messages :
    1659 + 74 = 1733 := by decide

theorem science_active_plus_off_path_mapping_nodes :
    1660 + 74 = 1734 := by decide

theorem kirk_direct_user_count_zero :
    ariadneKirk.userCount = 0 := by decide

theorem riley_direct_user_count_zero :
    ariadneRiley.userCount = 0 := by decide

theorem kirk_relay_count :
    ariadneKirk.assistantCount + ariadneKirk.toolCount = 117 := by decide

theorem riley_relay_count :
    ariadneRiley.assistantCount + ariadneRiley.toolCount = 58 := by decide

#print axioms ariadne_active_message_partition
#print axioms ariadne_active_mapping_node_count
#print axioms science_active_message_partition
#print axioms science_active_mapping_node_count
#print axioms science_full_dag_message_partition
#print axioms science_off_path_message_count
#print axioms science_active_plus_off_path_messages
#print axioms science_active_plus_off_path_mapping_nodes
#print axioms kirk_relay_count
#print axioms riley_relay_count

end HsHVerification.AriadneArchive
