import Mathlib

/-!
# Ariadne: timezone-robust chronological ordering for Kirk-source genealogy

Observed archival anchors (not physics observations):
* HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/
  The New Physics - Making _Interesting_ LLM Characters.srt
  Git blob ace1b413a5574a1354cc85c51364b12d685577ae,
  publisher UI header: "Published: January 21, 2026 at 11:12 PM";
  "All times are local". Local UTC offset is not documented.
* HsH/WORKSPACES/COMMON/CONTINUITY_2026-09-23_ARIADNE_KIRK_REVIVAL_RETRIEVAL.md
  Git blob a50207aa31c8b8e0900d2e80a74cdf301636255c,
  derivative continuity: Nathan's January 22 Kirk request at about 17:55 UTC.
  Original raw message timestamp not yet independently recovered.

Reference epoch: 2026-01-21 00:00 UTC. Times measured in integer minutes.
All civil timezones are assumed to lie within UTC-12 through UTC+14.
This proves a conditional chronology statement about *the specified Jan 22
request* versus *the Jan 21 release timestamp*, not authorship, content
ancestry, publication immutability, or human cognition.
-/

namespace HsHVerification.AriadneChronology

def podcastLocalMinute : ℤ := 23 * 60 + 12
def kirkRequestUtcMinute : ℤ := 24 * 60 + 17 * 60 + 55
def publicationUtcMinute (offsetHours : ℤ) : ℤ :=
  podcastLocalMinute - 60 * offsetHours

/-- Even at the latest possible UTC release time (UTC-12),
the January 22 request is at least 403 minutes later. -/
theorem minimum_gap_minutes (offsetHours : ℤ)
    (lo : -12 ≤ offsetHours) (hi : offsetHours ≤ 14) :
    publicationUtcMinute offsetHours + 403 ≤ kirkRequestUtcMinute := by
  dsimp [publicationUtcMinute, podcastLocalMinute, kirkRequestUtcMinute]
  omega

/-- The specified later request cannot precede the published timestamp
for any permitted timezone. -/
theorem publication_before_later_request (offsetHours : ℤ)
    (lo : -12 ≤ offsetHours) (hi : offsetHours ≤ 14) :
    publicationUtcMinute offsetHours < kirkRequestUtcMinute := by
  have h := minimum_gap_minutes offsetHours lo hi
  omega

#print axioms minimum_gap_minutes
#print axioms publication_before_later_request

end HsHVerification.AriadneChronology
