param(
    [Parameter(Mandatory = $true)]
    [string]$OriginalJar,

    [Parameter(Mandatory = $false)]
    [string]$OutputJar = ".\triavixlandorigins-1.0.3-unofficial-fix.jar"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$patchRoot = Join-Path $repoRoot "patch"

if (!(Test-Path -LiteralPath $OriginalJar)) {
    throw "Original jar not found: $OriginalJar"
}

if (!(Test-Path -LiteralPath $patchRoot)) {
    throw "Patch folder not found: $patchRoot"
}

$tempRoot = Join-Path $env:TEMP ("triavixland_patch_" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null

try {
    $originalFull = (Resolve-Path -LiteralPath $OriginalJar).Path
    $outputFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputJar)

    Write-Host "Original jar:"
    Write-Host $originalFull
    Write-Host ""
    Write-Host "Output jar:"
    Write-Host $outputFull
    Write-Host ""

    $tempZip = Join-Path $tempRoot "original.zip"
    Copy-Item -LiteralPath $originalFull -Destination $tempZip -Force

    $extractDir = Join-Path $tempRoot "extract"
    New-Item -ItemType Directory -Force -Path $extractDir | Out-Null

    Expand-Archive -LiteralPath $tempZip -DestinationPath $extractDir -Force

    Write-Host "Applying patch files..."
    Copy-Item -Path (Join-Path $patchRoot "*") -Destination $extractDir -Recurse -Force

    $badString = "epicfight:born_in_chaos_v1:intoxicating_dagger"
    $daggers = Join-Path $extractDir "data\triavixlandorigins\tags\items\daggers.json"

    if (!(Test-Path -LiteralPath $daggers)) {
        throw "Patched daggers.json was not found after applying patch."
    }

    $daggerText = Get-Content -Raw -LiteralPath $daggers
    if ($daggerText -match [regex]::Escape($badString)) {
        throw "Patch failed: invalid dagger entry is still present."
    }

    $outDir = Split-Path -Parent $outputFull
    if ($outDir -and !(Test-Path -LiteralPath $outDir)) {
        New-Item -ItemType Directory -Force -Path $outDir | Out-Null
    }

    $tempOutZip = Join-Path $tempRoot "patched.zip"
    Compress-Archive -Path (Join-Path $extractDir "*") -DestinationPath $tempOutZip -Force

    Copy-Item -LiteralPath $tempOutZip -Destination $outputFull -Force

    Write-Host ""
    Write-Host "SUCCESS: patched jar created."
    Write-Host $outputFull
}
finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}

