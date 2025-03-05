#=======================================================
#NAME:exerciceAUDIT3dns.ps1
#AUTHOR: Garnier Théo
#DATE:05/03/2025
#
#=======================================================

$outputFile = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\resultats\auditDNS.txt"
$Date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$contenu = "Audit des enregistrements DNS - Lancé le $Date`n"
$dnsZones = Get-DnsServerZone
foreach ($zone in $dnsZones) {
    $dnsRecords = Get-DnsServerResourceRecord -ZoneName $zone.ZoneName -RRType A
    if ($dnsRecords.Count -gt 0) {
        $contenu += "Zone : $($zone.ZoneName)`n"
        
        foreach ($record in $dnsRecords) {
            $contenu += "  Nom : $($record.HostName), Adresse IP : $($record.RecordData.IPv4Address)`n"
            Write-Host "Zone : $($zone.ZoneName), Nom : $($record.HostName), Adresse IP : $($record.RecordData.IPv4Address)" -ForegroundColor green
        }
        $contenu += "`n"
    }
}
Set-Content -Path $outputFile -Value $contenu
Write-Host "`nL'audit des enregistrements DNS a été enregistré dans $outputFile"