
#Moves files from download folder to respective folders
$ErrorActionPreference = "Stop"
$downloadFolder = "C:\Users\Trappist\Downloads"


$dtsxPathList = New-Object System.Collections.ArrayList
$dtsxPathList.Add("Integration Services Project1\YesBank.dtsx")
$dtsxPathList.Add("Integration Services Project1\Icici.dtsx")
$dtsxPathList.Add("Integration Services Project1\IciciNro.dtsx")

$dtsxPathList |
ForEach-Object {
    Write-Output $_.
    Invoke-Expression "DTExec.exe /File '$_.'"
}

Get-ChildItem $downloadFolder -Recurse -Filter *.csv |
Foreach-Object {
    Move-Item -Path $_.FullName -Destination "C:\Data\Imported"
}