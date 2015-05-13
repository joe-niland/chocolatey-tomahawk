push-location tomahawk

# $nuSpecFile = Resolve-Path ".\tomahawk.nuspec"

del tomahawk*.nupkg

cpack

$latestPkg = gci . | where-object { $_.Name -like "*.nupkg" } | sort-object LastAccessTime -Descending | Select-Object -First 1

Write-Host installing $latestPkg

# [xml]$nuSpec = Get-Content $nuSpecFile
cinst -y tomahawk -source "$latestPkg" -force # -version $nuSpec.package.metadata.version
pop-location