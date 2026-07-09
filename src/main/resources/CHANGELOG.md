# Changelog

## 1.0.0 - 2026-07-08

Initial data-only add-on release.

### Changed

- Rebuilt the fix as a separate add-on .jar with dependency on Triavixland's Fantasy Origins instead of a full replacement jar.
- Added a `pack.mcmeta` filter for `triavixlandorigins:tags/items/daggers.json` so the original malformed tag is not parsed.
- Added a corrected replacement `data/triavixlandorigins/tags/items/daggers.json` to remove tag-loading warnings/errors caused by the malformed resource location.

### Fixed

- Removed malformed optional dagger tag entry: `epicfight:born_in_chaos_v1:intoxicating_dagger`.

### Notes

- Does not redistribute the original Triavixland Fantasy Origins jar or compiled code.
- Depends on the original `triavixlandorigins` mod.
