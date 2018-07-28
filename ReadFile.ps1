
#Moves files from download folder to respective folders

$downloadFolder = "C:\Users\Trappist\Downloads"

Get-ChildItem $downloadFolder -Filter *.csv |
Foreach-Object {
    Write-Output $_.FullName
    if($_.FullName -match "7510019284_PortFolioMF"){
        Move-Item -Path $_.FullName -Destination "C:\Data\icicinro"
    }
    if($_.FullName -match "6500034718_PortFolioEqt"){
        Move-Item -Path $_.FullName -Destination "C:\Data\icicinre"
    }
    if($_.FullName -match "5499954"){
        Move-Item -Path $_.FullName -Destination "C:\Data\yesbankwm"
    }
}


#YES BANK TRANSACTIONS
# $filenameMatchList = New-Object System.Collections.ArrayList
# $filenameMatchList.Add("_5499954")
# $filenameMatchList.Add("6500034718_PortFolioEqt")
# $filenameMatchList.Add("7510019284_PortFolioMF")
# $inputFolderPathList = New-Object System.Collections.ArrayList
# $inputFolderPathList.Add("C:\Data\yesbankwm")
# $inputFolderPathList.Add("C:\Data\icicinre")
# $inputFolderPathList.Add("C:\Data\icicinro")
$dtsxPathList = New-Object System.Collections.ArrayList
$dtsxPathList.Add("Integration Services Project1\YesBank.dtsx")
$dtsxPathList.Add("Integration Services Project1\Icici.dtsx")
$dtsxPathList.Add("Integration Services Project1\IciciNro.dtsx")
# $seedFileNameList = New-Object System.Collections.ArrayList
# $seedFileNameList.Add("TransactionDetails_26072018041116_5499954.csv")
# $seedFileNameList.Add("6500034718_PortFolioEqt.csv")
# $seedFileNameList.Add("7510019284_PortFolioMF.csv")

for ($i=0; $i -lt $dtsxPathList.Count; $i++) {
    $dtsxPath = $dtsxPathList[$i]
    Invoke-Expression 'DTExec.exe /File $($dtsxPath)'
    # $dtsxPathCopy = $dtsxPath + "Copy"
    # $inputFolderPath = $inputFolderPathList[$i]
    # $seedFileName = $seedFileNameList[$i]
    # $fileNameMatch = $filenameMatchList[$i]

    # $dtsxContent = Get-Content $dtsxPath
    # ($dtsxContent) | Out-File $dtsxPathCopy

    # Get-ChildItem $downloadFolder -Filter $fileNameMatch |
    # Foreach-Object {
    #     Write-Output $_.FullName
    #     Move-Item -Path $_.FullName -Destination $inputFolderPath
    # }


    # Get-ChildItem $inputFolderPath -Filter *.csv |
    # Foreach-Object {
    #     $dtsxContent = Get-Content $dtsxPathCopy
    #     #Write-Output $dtsxContent
    #     ($dtsxContent).replace("$($inputFolderPath)\$($seedFileName)", $_.FullName) | Set-Content $dtsxPathCopy
    #    Invoke-Expression 'DTExec.exe /File $($dtsxPathCopy)'
    # }
}