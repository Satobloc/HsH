# Kestrel h956:s3 Amendment 01 — separate physical event times from virtual origins

This amendment clarifies the proposed clock-ledger field in the h956:s3 report.

The original table's shorthand `t_stop` (“physical forcing-stop / last-ring-arrival event time”) must not be read as identifying two events. Keep them separate:

- `t_force_off`: measured physical time at which forcing is switched off.
- `t_last_ring_arrival`: measured physical time at which the last vortex ring reaches the observation region.
- `t0_schedule`: virtual origin used by the trigger/sampling rule.
- `t0_fit`: virtual origin estimated in the scaling fit/cross-validation.

The PNAS source reports the last vortex-ring arrival at approximately 0.2 s for the large-blob setup and separately reports a fitted virtual origin near -0.15 s. This does not establish that the ring-arrival time equals forcing shutoff, nor that either event time equals the virtual origin. The per-run forcing trigger log was not acquired.

This is a terminology/field-separation correction only. No data were reanalyzed, no event time was newly measured, and no H(s)H map or physical prediction is added.
