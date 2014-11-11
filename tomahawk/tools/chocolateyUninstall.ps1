try {

  $packageName = 'tomahawk'
  $fileType = "exe"
  $silentArgs = "/S"
  $validExitCodes = @(0)

  $unfile = "${Env:ProgramFiles}\Tomahawk\uninstall.exe"
  $unfilex86 = "${Env:ProgramFiles(x86)}\Tomahawk\uninstall.exe"
  
  if (Test-Path "$unfile") { $file = "$unfile" }
  if (Test-Path "$unfilex86") { $file = "$unfilex86" }
  
  if (Test-Path "$file") {
      Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $file -validExitCodes $validExitCodes
  }

  Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}