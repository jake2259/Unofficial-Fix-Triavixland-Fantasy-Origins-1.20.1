# Source Status

This repository is an unofficial fork/patch workspace for Triavixland Fantasy Origins.

The upstream GitHub fork source currently does not contain a complete Forge source tree. Because of that, this repository currently publishes the fixed resource/metadata files and documentation for the unofficial compatibility fix.

This repository does not include:
- the original mod jar
- a rebuilt mod jar
- private server files
- the full extracted jar contents

Current patch files:
- patch/data/triavixlandorigins/tags/items/daggers.json
- patch/META-INF/mods.toml

Current fix:
- removes the malformed optional dagger tag value:
  epicfight:born_in_chaos_v1:intoxicating_dagger

Reason:
- that value is not a valid Minecraft resource location because it contains two namespace colons.
