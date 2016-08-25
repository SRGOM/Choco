$ErrorActionPreference = 'Stop'; 


$packageName= 'SubInAcl' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/1/7/d/17d82b72-bc6a-4dc8-bfaa-98b37b22b367/subinacl.msi' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi' 
  url           = $url

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Windows Resource Kit Tools- SubInAcl' 
}

Install-ChocolateyPackage @packageArgs 
