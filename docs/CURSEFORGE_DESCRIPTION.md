# Triavixland Fantasy Origins - Dagger Tag Fix
A small GPLv3 data-only fix add-on for Triavixland Fantasy Origins on Forge 1.20.1.

This add-on fixes a malformed dagger tag entry in Triavixland Fantasy Origins by filtering and replacing:
`data/triavixlandorigins/tags/items/daggers.json`

Removed malformed entry:
`epicfight:born_in_chaos_v1:intoxicating_dagger`

The value contains two namespace separators and can cause Forge/Minecraft tag loading errors.

## Requirements
- Minecraft 1.20.1
- Forge 47.1+
- Triavixland Fantasy Origins

## License
GPLv3

## Notes

This project does not redistribute the full original mod jar or compiled code. It only contains a tiny data override.

Original project: Triavixland Fantasy Origins by Trimi / Trimipz
Original project page: https://www.curseforge.com/minecraft/mc-mods/triavixland-fantasy-origins
Original GitHub repository: https://github.com/Trimipz/Triavixland-Fantasy-Origins-1.20.1-multiloader
Original upstream credit: Based on Medieval Origins Revival by MuonR
Source for this fix: https://github.com/jake2259/Unofficial-Fix-Triavixland-Fantasy-Origins-1.20.1

This project is not affiliated with or endorsed by Trimi / Trimipz / Triavixland, or MuonR / muon-rw. All original credit belongs to the original authors.
