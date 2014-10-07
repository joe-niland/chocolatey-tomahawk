$packageName = 'tomahawk'
$installerType = 'EXE'
$url = 'http://download.tomahawk-player.org/tomahawk-0.7.0.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
