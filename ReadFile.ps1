$inputFolderPath = "C:\Data"
$dtsxPath = "Integration Services Project1\Package.dtsx"

Get-ChildItem $inputFolderPath -Filter *.csv | 
Foreach-Object {
    $dtsxContent = Get-Content $dtsxPath
    Write-Output $dtsxContent
    ($dtsxContent).replace('C:\Data\Book1.csv', $_.FullName) | Set-Content $dtsxPath
    Invoke-Expression 'DTExec.exe /File $($dtsxPath)'
    ($dtsxContent).replace($_.FullName,'C:\Data\Book1.csv') | Set-Content $dtsxPath
}
