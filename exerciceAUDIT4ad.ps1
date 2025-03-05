#=======================================================
#NAME:exerciceAUDIT4ad.ps1
#AUTHOR: Garnier Théo
#DATE:05/03/2025
#
#=======================================================

$outputFile = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\resultats\auditAD.txt"
$Date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
$contenu = "Audit des enregistrements DNS - Lancé le $Date`n`n"
$users = Get-ADUser -Filter * -Properties *
foreach ($user in $users) {
    $contenu += "Utilisateur : $($user.SamAccountName)`n"
    $contenu += "Nom complet : $($user.Name)`n"
    $contenu += "Activé : $($user.Enabled)`n"
    $contenu += "Dernière connexion : $($user.LastLogonDate)`n"
    $contenu += "Date de création : $($user.Created)`n"
    $contenu += "Groupes : $((Get-ADPrincipalGroupMembership $user.SamAccountName).Name -join ', ')`n"
    $contenu += "`n`n"
    Write-Host "Audit de l'utilisateur : $($user.SamAccountName)" -ForegroundColor Cyan
}
Set-Content -Path $outputFile -Value $contenu
Write-Host "`nL'audit de l'AD a été enregistrer dans $outputFile"
