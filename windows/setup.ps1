Write-Host ">>> Preparing environment"

$base = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Resolve-Path "$base\.."
$data = "$root\data"

New-Item -ItemType Directory -Force -Path $data | Out-Null

Set-Location $data

Write-Host ">>> Downloading mprime (official binary)"

Invoke-WebRequest -Uri "https://www.mersenne.org/download/software/v30/30.19/p95v3019b20.win64.zip" -OutFile "mprime.zip"

Write-Host ">>> Extracting"

Expand-Archive mprime.zip -Force

Write-Host ""
Write-Host ">>> IMPORTANT STEP"
Write-Host "Run the file below to configure your account:"
Write-Host "prime95.exe"
Write-Host ""
Write-Host "After configuration, CLOSE the program and press ENTER"

Pause

Set-Location $root

Write-Host ">>> Starting container"

docker compose up -d

Write-Host ">>> Done!"
Write-Host ">>> mprime is now running inside Docker"
