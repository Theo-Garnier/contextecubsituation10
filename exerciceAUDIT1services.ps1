#=======================================================
#NAME:exerciceAUDIT1services.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#=======================================================

$outputFile = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\resultats\auditServices.txt"
$Date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$contenu = "Audit des services - Lancé le $Date`n"
$services = @("DHCP", "DNS", "ADWS")
foreach ($service in $services) {
    $serviceStatus = Get-Service -Name $service -ErrorAction SilentlyContinue
    $status = if ($serviceStatus.Status -eq "Running") {
     "En cours d'exécution" 
     } else {
      "Stoppé ou introuvable" 
     }
    $contenu += "Service $service : $status`n"

    if ($status -eq "En cours d'exécution") {
        Write-Host "Service $service : $status" -ForegroundColor Green
    } else {
        Write-Host "Service $service : $status" -ForegroundColor Red
    }
}

Set-Content -Path $outputFile -Value $contenu
Write-Host "L'audit des services a été enregistré dans $outputFile"