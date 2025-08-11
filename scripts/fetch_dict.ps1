$Dest = "assets/dictionaries"
if (Test-Path $Dest) { Write-Host "[dict] found: $Dest"; exit 0 }

Write-Host "[dict] downloading..."
New-Item -ItemType Directory -Force -Path assets | Out-Null
$Url = "<<<https://github.com/Kazu0525/hyp_JP/archive/refs/tags/app_v0.0.1.zip>>>"
$Zip = "assets/dictionaries.zip"
Invoke-WebRequest -Uri $Url -OutFile $Zip

Write-Host "[dict] extracting..."
Expand-Archive -Path $Zip -DestinationPath assets -Force

if (!(Test-Path $Dest)) { Write-Error "[dict] extract failed"; exit 1 }
Write-Host "[dict] ready at $Dest"
