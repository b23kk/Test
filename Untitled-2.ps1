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
Write-Host '[3]' -ForegroundColor Cyan -NoNewline
Write-Host " Exit"
Write-Host "====================" -ForegroundColor DarkGray

$Chose = Read-Host "Choose an Option"

switch ($Choose) {
    "1" { 
        Write-Host "Disabling: " -NoNewline
        Write-Host "$DisableServices" -ForegroundColor blue
        foreach ($Service in $DisableServices) {
            $service = Get-Service -Name $Service -ErrorAction SilentlyContinue
        }
        "2" { 
            Write-Host "Showing Services"
            foreach ($Service in $DisableServices) {
                $service = Get-Service -Name $Service -ErrorAction SilentlyContinue
                if ($service) {
                    Write-Host "$($service.Name) - $($service.Status)" -ForegroundColor blue
                } else {
                    Write-Host "$Service - Not Found" -ForegroundColor red
                }
            }
        }
        "3" { 
            Write-Host "Exiting..."
            Start-Sleep -Seconds 2
            exit
        }
    }
}
