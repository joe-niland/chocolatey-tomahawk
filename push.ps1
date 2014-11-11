push-location tomahawk
$latestPkg = gci . | where-object { $_.Name -like "*.nupkg" } | sort-object LastAccessTime -Descending | Select-Object -First 1
nuget push $latestPkg -source http://chocolatey.org/
pop-location