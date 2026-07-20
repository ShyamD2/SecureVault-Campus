<#
    SecureVault Campus
    Windows LAPS Audit Report

    Author : Shyam Kumar D
#>

Import-Module ActiveDirectory
Import-Module LAPS

$OU = "OU=Workstations,DC=securevault,DC=local"

$Computers = Get-ADComputer `
    -Filter * `
    -SearchBase $OU

$Report = foreach ($Computer in $Computers)
{
    $PasswordInfo = Get-LapsADPassword `
        -Identity $Computer.Name

    [PSCustomObject]@{

        ComputerName = $Computer.Name

        PasswordExpiration =
            $PasswordInfo.ExpirationTimestamp

        AuthorizedDecryptor =
            $PasswordInfo.DecryptionCredential

    }
}

$Report | Format-Table -AutoSize

$Report |
Export-Csv `
"C:\SecureVault-LAPSReport.csv" `
-NoTypeInformation

Write-Host ""
Write-Host "================================="
Write-Host " SecureVault Report Generated"
Write-Host "================================="
Write-Host ""
Write-Host "Output:"
Write-Host "C:\SecureVault-LAPSReport.csv"