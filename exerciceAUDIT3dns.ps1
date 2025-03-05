#=======================================================
#NAME:exerciceAUDIT3dns.ps1
#AUTHOR: Garnier Théo
#DATE:05/03/2025
#
#=======================================================

$outputFile = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\resultats\auditDHCP.txt"
$Date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$contenu = "Audit des plages DHCP - Lancé le $Date`n"
$scopes = Get-DhcpServerv4Scope
foreach ($scope in $scopes) {
    $contenu += "Plage $($scope.Name) : $($scope.State)`n" 
    
    if ($scope.State -eq "Active") {
        Write-Host "Plage $($scope.Name) :" $scope.State -ForegroundColor Green
    } else {
        Write-Host "Plage $($scope.Name) :" $scope.State -ForegroundColor Red
    }
}

Set-Content -Path $outputFile -Value $contenu
Write-Host "`nL'audit des plages DHCP a été enregistré dans $outputFile"