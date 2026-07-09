# Triavixland Fantasy Origins - Dagger Tag Fix

A small data-only Forge 1.20.1 add-on for Triavixland Fantasy Origins.

This project is intended to replace the previous python script re-write method. It does **not** redistribute the full original Triavixland Fantasy Origins mod jar, compiled classes, textures, or assets. It only provides a tiny data override for one malformed item tag.

## What this fixes

This add-on filters and replaces:

`data/triavixlandorigins/tags/items/daggers.json`

It accomplishes this by removing the malformed optional entry:

`epicfight:born_in_chaos_v1:intoxicating_dagger`

That value contains two namespace separators and can cause Minecraft/Forge tag loading errors.

## Why this uses a pack filter

A normal replacement tag alone may not be enough, because Minecraft still has to read tag JSON files from lower-priority packs before merging. This add-on includes a `pack.mcmeta` filter to block the original malformed `triavixlandorigins:tags/items/daggers.json` resource from lower-priority packs, then supplies a corrected replacement tag.

## Requirements

- Minecraft 1.20.1
- Forge 47.1+
- Triavixland Fantasy Origins

## Credits and upstream references

- Original project: Triavixland Fantasy Origins by Triavixland / Trimi / Trimipz
- Original CurseForge page: https://www.curseforge.com/minecraft/mc-mods/triavixland-fantasy-origins
- Original GitHub repository: https://github.com/Trimipz/Triavixland-Fantasy-Origins-1.20.1-multiloader
- Original project credit: based on Medieval Origins Revival by MuonR
- Medieval Origins Revival on Modrinth: https://modrinth.com/mod/medieval-origins-revival
- Medieval Origins Revival on CurseForge: https://www.curseforge.com/minecraft/mc-mods/medieval-origins-revival

At the time this fix was prepared, the original Trimipz GitHub repository listed above had only a README visible and did not include a buildable source tree for the released jar.

## License

GPL-3.0-only. See `LICENSE`.

This project is not affiliated with or endorsed by Trimi / Trimipz / Triavixland, or MuonR / muon-rw. All original credit belongs to the original authors.

## Build from source

From the repository root on Windows PowerShell:

```powershell
.\scripts\build-jar.ps1
```

The built jar will be written to:

`build/libs/unofficial_triavixlandorigins_dagger_patch-1.0.0.jar`
