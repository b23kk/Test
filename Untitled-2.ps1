Clear-Host

# Admin check
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Run this script as Administrator!" -ForegroundColor Red
    Pause
    exit
}

Write-Host "┌────────────────────────────────────────────┐
│ BIOS CONFIGURATION EDITOR – PERFORMANCE    │
├────────────────────────────────────────────┤
│ [1] Windows Editor                         │
│     └─ Disable Unnecessary Services        │
│ [0] Exit                                   │
└────────────────────────────────────────────┘"

$Input = Read-Host "Select Option"

$Services = @(
    "diagnosticshub.standardcollector.service",
    "DiagTrack",
    "dmwappushservice",
    "lfsvc",
    "MapsBroker",
    "NetTcpPortSharing",
    "RemoteAccess",
    "RemoteRegistry",
    "TrkWks",
    "WbioSrvc",
    "ndu",
    "WerSvc",
    "Fax",
    "fhsvc",
    "gupdate",
    "gupdatem",
    "stisvc",
    "AJRouter",
    "MSDTC",
    "WpcMonSvc",
    "PhoneSvc",
    "PcaSvc",
    "WPDBusEnum",
    "seclogon",
    "lmhosts",
    "wisvc",
    "RetailDemo",
    "ALG",
    "SCardSvr",
    "SCPolicySvc",
    "ScDeviceEnum",
    "EntAppSvc",
    "Browser",
    "BDESVC",
    "edgeupdate",
    "MicrosoftEdgeElevationService",
    "edgeupdatem",
    "PerfHost",
    "SNMPTrap",
    "autotimesvc",
    "tzautoupdate",
    "tapisrv"
)

function Disable-Services {
    foreach ($s in $Services) {
        $svc = Get-Service -Name $s -ErrorAction SilentlyContinue
        if ($svc) {
            Write-Host "Disabling: $s" -ForegroundColor Yellow
            if ($svc.Status -ne "Stopped") {
                 #Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
            }
            #Set-Service -Name $s -StartupType Disabled
        }
    }
}

if ($Input -eq "1") {
    Disable-Services
    Write-Host "Done." -ForegroundColor Green
} elseif ($Input -eq "0") {
    exit
}
