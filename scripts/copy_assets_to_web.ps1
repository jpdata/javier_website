# Script to copy assets to web folder for production builds
# This ensures that Flutter web can serve the assets correctly
# Run this BEFORE firebase deploy or flutter build web

$projectRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$assetsDir = Join-Path -Path $projectRoot -ChildPath "assets"
$webAssetsDir = Join-Path -Path $projectRoot -ChildPath "web\assets"
$buildWebAssetsDir = Join-Path -Path $projectRoot -ChildPath "build\web\assets"

Write-Host "Copying assets to both web/ and build/web/ folders..."
Write-Host "From: $assetsDir"

# Copy to web/assets (used by flutter build)
Write-Host "To: $webAssetsDir"
New-Item -ItemType Directory -Path $webAssetsDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path -Path $webAssetsDir -ChildPath "images") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path -Path $webAssetsDir -ChildPath "fonts") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path -Path $webAssetsDir -ChildPath "animations") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path -Path $webAssetsDir -ChildPath "l10n") -Force | Out-Null

Copy-Item (Join-Path -Path $assetsDir -ChildPath "images\*") (Join-Path -Path $webAssetsDir -ChildPath "images\") -Force -Recurse
Copy-Item (Join-Path -Path $assetsDir -ChildPath "fonts\*") (Join-Path -Path $webAssetsDir -ChildPath "fonts\") -Force -Recurse
Copy-Item (Join-Path -Path $assetsDir -ChildPath "animations\*") (Join-Path -Path $webAssetsDir -ChildPath "animations\") -Force -Recurse
Copy-Item (Join-Path -Path $assetsDir -ChildPath "l10n\*") (Join-Path -Path $webAssetsDir -ChildPath "l10n\") -Force -Recurse

# Copy to build/web/assets (used for deployment)
Write-Host "To: $buildWebAssetsDir"
if (Test-Path $buildWebAssetsDir) {
    New-Item -ItemType Directory -Path (Join-Path -Path $buildWebAssetsDir -ChildPath "images") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path -Path $buildWebAssetsDir -ChildPath "fonts") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path -Path $buildWebAssetsDir -ChildPath "animations") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path -Path $buildWebAssetsDir -ChildPath "l10n") -Force | Out-Null

    Copy-Item (Join-Path -Path $assetsDir -ChildPath "images\*") (Join-Path -Path $buildWebAssetsDir -ChildPath "images\") -Force -Recurse
    Copy-Item (Join-Path -Path $assetsDir -ChildPath "fonts\*") (Join-Path -Path $buildWebAssetsDir -ChildPath "fonts\") -Force -Recurse
    Copy-Item (Join-Path -Path $assetsDir -ChildPath "animations\*") (Join-Path -Path $buildWebAssetsDir -ChildPath "animations\") -Force -Recurse
    Copy-Item (Join-Path -Path $assetsDir -ChildPath "l10n\*") (Join-Path -Path $buildWebAssetsDir -ChildPath "l10n\") -Force -Recurse
    Write-Host "Copied to build/web/assets" -ForegroundColor Green
}

Write-Host "Assets copied successfully!" -ForegroundColor Green
