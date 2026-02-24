Clear-Host

$DisableServices = @( 
    "AMD Crash Defender Service"
    "AMD External Events Utility"
    "DiagTrack"
    "dmwappushservice"
    "lfsvc"
    "MapsBroker"
    "NetTcpPortSharing"
    "RemoteAccess"
    "RemoteRegistry"
    "SharedAccess"
    "TrkWks"
    "WbioSrvc"
    "ndu"
    "WerSvc"
    "Spooler"
    "Fax"
    "fhsvc"
    "gupdate"
    "gupdatem"
    "stisvc"
    "AJRouter"
    "MSDTC"
    "WpcMonSvc"
    "PhoneSvc"
    "PcaSvc"
    "WPDBusEnum"
    "seclogon"
    "lmhosts"
    "wisvc"
    "FontCache"
    "RetailDemo"
    "ALG"
    "SCardSvr"
    "SCPolicySvc"
    "ScDeviceEnum"
    "MessagingService_34048"
    "EntAppSvc"
    "Browser"
    "BDESVC"
    "iphlpsvc"
    "edgeupdate"
    "MicrosoftEdgeElevationService"
    "edgeupdatem"
    "SEMgrSvc"
    "PerfHost"
    "BcastDVRUserService_48486de"
    "WpnService"
    "DoSvc"
    "SNMPTrap"
    "SECOMNService"
    "autotimesvc"
    "tzautoupdate"
    "BcastDVRUserService_34048"
    "PenService_34048"
    "tapisrv"
    "HvHost"
    "vmickvpexchange"
    "vmicguestinterface"
    "vmicshutdown"
    "vmicheartbeat"
    "vmicvmsession"
    "vmicrdv"
    "vmictimesync"
)

Write-Host "====================" -ForegroundColor DarkGray
Write-Host "[1]" -ForegroundColor Cyan -NoNewline
Write-Host " Disable Services"
Write-Host "[2]" -ForegroundColor Cyan -NoNewline
Write-Host " Show Services"
Write-Host "[3]" -ForegroundColor Cyan -NoNewline
Write-Host " Exit"
Write-Host "====================" -ForegroundColor DarkGray

$Choose = Read-Host "Choose an Option"

switch ($Choose) {

    "1" {
        foreach ($Service in $DisableServices) {
            $svc = Get-Service -Name $Service -ErrorAction SilentlyContinue
            if ($svc) {
                if ($svc.Status -ne "Stopped") {
                    Stop-Service -Name $svc.Name -Force
                }
                Set-Service -Name $svc.Name -StartupType Disabled
                Write-Host "$($svc.Name) - Disabled" -ForegroundColor Blue
            }
        }
    }

    "2" {
        Write-Host "Showing Services"
        foreach ($Service in $DisableServices) {
            $svc = Get-Service -Name $Service -ErrorAction SilentlyContinue
            if ($svc) {
                Write-Host "$($svc.Name) - $($svc.Status)" -ForegroundColor Blue
            } else {
                Write-Host "$Service - Not Found" -ForegroundColor Red
            }
        }
    }

    "3" {
        Write-Host "Exiting..."
        Start-Sleep 2
        exit
    }

    Default {
        Write-Host "Invalid Option" -ForegroundColor Red
    }
}
