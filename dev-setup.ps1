Set-Variable -Name ChocolateyTemplateDir -Value c:\code\_templates\chocolatey -Option Constant
Set-Variable -Name PackageName -Value tomahawk -Option Constant

cinst warmup ketarin ussf

warmup addTextReplacement __CHOCO_PKG_MAINTAINER_NAME__ "Joe Niland"
warmup addTextReplacement __CHOCO_PKG_MAINTAINER_REPO__  "https://github.com/joe-niland/chocolatey-tomahawk"

push-location $env:ChocolateyInstall
if ( !(Test-Path chocolateytemplates) ) {
   git clone https://github.com/chocolatey/chocolateytemplates.git
}

push-location chocolateytemplates\_templates
if ( !(Test-Path $ChocolateyTemplateDir) ) {
   warmup addTemplateFolder chocolatey (Resolve-Path chocolatey)
}

pop-location
pop-location

if ( !(Test-Path (Resolve-Path package) ) ) {
   warmup chocolatey $PackageName 
}

Write-Host "Edit package files and commit!"