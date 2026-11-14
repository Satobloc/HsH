# H822:S2 Hale receipt amendment 01 - exact blob and commit readback

This amendment clarifies commit SHA versus file blob SHA. The canonical receipt remains preserved.

| Artifact | Commit SHA | File blob SHA |
|---|---|---|
| Research report | 4ae325b8f8b647e003557d4f7196bc18ddfd5c2f | 4513927f1c66f89ef3d7ba81fb458363cc1e8b8c |
| Canonical receipt before this amendment | f98f78f4b2fe1cb1b9b7cba85aca6dd5ddab2ed1 | 8f9d609489863f5346b68818f0015d2e0862dbec |
| Hale CONTINUITY update | 81c830c38567598dbeeee594c2208899efdcf4d1 | 650646c60e40b4e09a3d2cdb0d592c9986135252 |
| Public submission artifact | 6c9099423fac2d5511033b40895103c562e63bfd | 7c9497d33f1c7028ef247da6340d52ba8363bbbe |

The public issue #1726 body envelope was parsed and its `content` field compared byte-for-byte with the published artifact. Exact equality: TRUE. Both content strings are 10,059 characters. The publisher SHA-256 is `00ed55f9d71fb9fe6d91f1c2b1c38cd964c1e9cef040b1baf5301920cfa975e0`.

This is metadata clarification only. No research content, task, schedule, phase, enabled state, branch ownership or public submission was changed.
