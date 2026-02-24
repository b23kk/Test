# ===============================
# Simple Service Manager
# Run PowerShell as Administrator
# ===============================

Clear-Host

# Services to disable
$DisableServices = @(
    "edgeupdate"
    "edgeupdatem"
    "Rockstar Service"
    "XblAuthManager"
    "XboxGipSvc"
    "XblGameSave"
    "brave"
    "bravem"
)

# Menu
Write-Host "==============================" -ForegroundColor DarkGray
Write-Host "[1]" -ForegroundColor Blue -NoNewline
Write-Host " Stop listed services"
Write-Host "[2]" -ForegroundColor Blue -NoNewline
Write-Host " Show services list"
Write-Host "[0]" -ForegroundColor Blue -NoNewline
Write-Host " Exit"
Write-Host "==============================" -ForegroundColor DarkGray

$choice = Read-Host "Choose an option"

switch ($choice) {

    "1" {
        Write-Host "`nStopping services..." -ForegroundColor Cyan

        foreach ($svc in $DisableServices) {

            $service = Get-Service -Name $svc -ErrorAction SilentlyContinue

            if ($service) {
                if ($service.Status -ne "Stopped") {
                    #Stop-Service -Name $svc -Force
                    Write-Host "Stopped: $svc" -ForegroundColor Green
                } else {
                    Write-Host "Already stopped: $svc" -ForegroundColor Yellow
                }
            } else {
                Write-Host "Not found: $svc" -ForegroundColor Red
            }
        }

        Pause
    }

    "2" {
        Write-Host "`nServices list:" -ForegroundColor Cyan
        foreach ($svc in $DisableServices) {
            Write-Host "- $svc"
        }
        Pause
    }

    "0" {
        Write-Host "Exiting..." -ForegroundColor Gray
        exit
    }

    default {
        Write-Host "Invalid option!" -ForegroundColor Red
        Pause
    }
}
