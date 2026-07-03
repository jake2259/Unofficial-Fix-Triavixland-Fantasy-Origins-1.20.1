# Applying the Patch

This repository does not include the original Triavixland Fantasy Origins jar.

To build a local unofficial fixed jar, provide your own original Triavixland Fantasy Origins 1.0.3 jar and run:

```powershell
.\scripts\apply-patch.ps1 `
  -OriginalJar "C:\Path\To\triavixlandorigins-1.0.3.jar" `
  -OutputJar ".\triavixlandorigins-1.0.3-unofficial-fix.jar"
```

The script:

- extracts the original jar into a temporary folder
- overlays the files from `patch/`
- verifies that the malformed `epicfight:born_in_chaos_v1:intoxicating_dagger` entry is gone
- creates a patched jar at the requested output path

Do not use this patched jar alongside the original Triavixland jar. Use only one jar with the `triavixlandorigins` mod ID at a time.
