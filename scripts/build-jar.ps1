$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$Resources = Join-Path $Root "src\main\resources"
$OutDir = Join-Path $Root "build\libs"
$JarName = "unofficial_triavixlandorigins_dagger_patch-1.0.0.jar"
$ZipPath = Join-Path $OutDir ($JarName + ".zip")
$JarPath = Join-Path $OutDir $JarName

if (!(Test-Path $Resources)) {
    throw "Could not find resources folder: $Resources"
}

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
Remove-Item $ZipPath, $JarPath -Force -ErrorAction SilentlyContinue

Push-Location $Resources
try {
    Compress-Archive -Path * -DestinationPath $ZipPath -Force
} finally {
    Pop-Location
}

Move-Item $ZipPath $JarPath -Force
Write-Host "Built jar:"
Write-Host $JarPath
