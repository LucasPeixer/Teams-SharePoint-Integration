$folders = @("pasta1", "pasta2", "pasta3")
$site = "https://seu-dominio.sharepoint.com"
$sites = ""
$projeto = ""
$desc = ""
$grupos = ""

function Remove-CaracterEspecial {
  param (
    [string]$Entrada
  )
  # Substitui todos os caracteres que não são letras, números ou espaços por uma string vazia
  $Refatorado = $Entrada -replace '[^a-zA-Z0-9\s]', ''
  return $Refatorado -replace '\s+', ''
}

#Importando Teams
try {
  Write-Host "Importando o modulo Teams"
  Import-Module MicrosoftTeams
  Write-Host "OK!"
}
catch {
  Write-Host "Erro ao importar, instalando o Modulo"
  Install-Module MicrosoftTeams
  Write-Host "OK!"
}
finally {
  Write-Host "Conectando ao Teams!"
  Connect-MicrosoftTeams
  Write-Host "OK!"
}

while ($projeto -eq "") {
  $projeto = Read-Host -Prompt "Digite o nome do projeto"
  $projeto = Remove-CaracterEspecial -Entrada $projeto
  Write-Host "Ok!"
}

# Verificando se o time já existe
$grupos = Get-Team -DisplayName $projeto -ErrorAction SilentlyContinue

if ($null -ne $grupos) {
  Write-Host "O time '$projeto' já existe."
}
else {
  Write-Host "Criando novo time '$projeto'."
  New-Team -DisplayName $projeto -MailNickName $projeto -Description $desc -Visibility Public
}

#Importando PNP
try {
  Write-Host "Importando o modulo PnP.PowerShell"
  Import-Module PnP.PowerShell
  Write-Host "OK!"
}
catch {
  Write-Host "Erro ao importar, instalando o Modulo"
  Install-Module PnP.PowerShell -Force -AllowClobber
  Write-Host "OK!"
}
finally {
  Write-Host "Conectando ao PnP"
  Connect-PnPOnline -Url $site -Interactive
  Write-Host "OK!"
}

$urlProjeto = "https://seu-dominio.sharepoint.com/sites/" + $projeto
$sites = Get-PnPTenantSite
$site = ($sites | Where-Object { $_.Url -eq $urlProjeto }).Url

try {
  Write-Host "Tentando conectar no site do Grupo"
  Connect-PnPOnline -Url $site -Interactive
  Write-Host "Ok!"
}
catch {
  Write-Host "Falhou a conexão!"
}

foreach ($folder in $folders) {
  try {
    Add-PnPFolder -Name $folder -Folder "Documentos Compartilhados/General"
    Write-Host "Pasta '$folder' criada com sucesso"
  }
  catch { Write-Host "Erro ao criar pasta '$folder'" }
}
