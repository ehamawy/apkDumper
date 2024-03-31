#$fileContent = Get-Content -Path ".\packages.txt"

$fileContent = adb shell pm list packages

$ContentArray = $fileContent -split "`n"


foreach ($line in $ContentArray) {
    $line = $line -replace "package:", ""
    $line = adb shell pm path $line
    $line = $line -replace "package:", ""
    adb pull $line
    Write-Output DUMPED $line
}


Write-Output ""
Write-Output "DONE!!!!"