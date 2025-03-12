#=======================================================
#NAME:exerciceAUDIT.ps1
#AUTHOR: Garnier Théo
#DATE:12/03/2025
#
#=======================================================

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '470,500'
$Form.Text = "Mon UI en PS"

$Bouton1 = New-Object System.Windows.Forms.Button
$Bouton1.Location = New-Object System.Drawing.Point(47,150)
$Bouton1.Width = 125
$Bouton1.Text = "Services"
$Bouton2 = New-Object System.Windows.Forms.Button
$Bouton2.Location = New-Object System.Drawing.Point(278,150)
$Bouton2.Width = 125
$Bouton2.Text = "DHCP"
$Bouton3 = New-Object System.Windows.Forms.Button
$Bouton3.Location = New-Object System.Drawing.Point(47,370)
$Bouton3.Width = 125
$Bouton3.Text = "DNS"
$Bouton4 = New-Object System.Windows.Forms.Button
$Bouton4.Location = New-Object System.Drawing.Point(278,370)
$Bouton4.Width = 125
$Bouton4.Text = "AD"
$GroupBox1 = New-Object System.Windows.Forms.GroupBox
$GroupBox1.Location = New-Object System.Drawing.Point(20,50)
$GroupBox1.Width = 180
$GroupBox1.Height = 220
$GroupBox1.Text = "Services"
$GroupBox2 = New-Object System.Windows.Forms.GroupBox
$GroupBox2.Location = New-Object System.Drawing.Point(250,50)
$GroupBox2.Width = 180
$GroupBox2.Height = 220
$GroupBox2.Text = "DHCP"
$GroupBox3 = New-Object System.Windows.Forms.GroupBox
$GroupBox3.Location = New-Object System.Drawing.Point(20,270)
$GroupBox3.Width = 180
$GroupBox3.Height = 220
$GroupBox3.Text = "DNS"
$GroupBox4 = New-Object System.Windows.Forms.GroupBox
$GroupBox4.Location = New-Object System.Drawing.Point(250,270)
$GroupBox4.Width = 180
$GroupBox4.Height = 220
$GroupBox4.Text = "AD"

$Form.controls.AddRange(@($Bouton1,$Bouton2,$Bouton3,$Bouton4,$GroupBox1,$GroupBox2,$GroupBox3,$GroupBox4))

$scriptFile1 = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\exerciceAUDIT1services.ps1"
$scriptFile2 = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\exerciceAUDIT2dhcp.ps1"
$scriptFile3 = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\exerciceAUDIT3dns.ps1"
$scriptFile4 = "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation10\exerciceAUDIT4ad.ps1"

$Bouton1.Add_Click({
    Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-File `"$scriptFile1`""
})
$Bouton2.Add_Click({
    Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-File `"$scriptFile2`""
})
$Bouton3.Add_Click({
    Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-File `"$scriptFile3`""
})
$Bouton4.Add_Click({
    Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-File `"$scriptFile4`""
})
$Form.ShowDialog()
