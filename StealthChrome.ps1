Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}
[System.Console]::SetWindowSize(100, 40)
[System.Console]::BufferWidth = 100
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.BackgroundColor = "Black"
cls

$chromePolicies = "HKLM:\SOFTWARE\Policies\Google\Chrome"
if (!(Test-Path $chromePolicies)) { New-Item -Path $chromePolicies -Force | Out-Null }
$dnsProvider = "https://cloudflare-dns.com/dns-query"

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "                                          Stealth Chrome"
$form.Size = New-Object System.Drawing.Size(370,200)
$form.ForeColor = [System.Drawing.Color]::White
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 25, 25, 25)
$form.StartPosition = "CenterScreen"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

# Create the Optimize button
$optimizeButton = New-Object System.Windows.Forms.Button
$optimizeButton.Text = "Optimize Chrome"
$optimizeButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$optimizeButton.Size = New-Object System.Drawing.Size(100, 40)
$optimizeButton.Location = New-Object System.Drawing.Point(50, 60)
$optimizeButton.Add_Click({ Optimize-Chrome })
$form.Controls.Add($optimizeButton)
$optimizeButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$optimizeButton.FlatAppearance.BorderSize = 0
$optimizeButton.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$optimizeButton.BackColor = [System.Drawing.Color]::FromArgb(150, 102, 102, 102)
$optimizeButton.ForeColor = [System.Drawing.Color]::Black
$toolTip = New-Object System.Windows.Forms.ToolTip
$toolTip.SetToolTip($optimizeButton, "Apply recommended Chrome privacy settings.")

# Create the Revert button
$revertButton = New-Object System.Windows.Forms.Button
$revertButton.Text = "Revert Changes"
$revertButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$revertButton.Size = New-Object System.Drawing.Size(100, 40)
$revertButton.Location = New-Object System.Drawing.Point(200, 60)
$revertButton.Add_Click({ Revert-Chrome })
$form.Controls.Add($revertButton)
$revertButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$revertButton.FlatAppearance.BorderSize = 0
$revertButton.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
$revertButton.BackColor = [System.Drawing.Color]::FromArgb(150, 102, 102, 102)
$revertButton.ForeColor = [System.Drawing.Color]::Black
$toolTip = New-Object System.Windows.Forms.ToolTip
$toolTip.SetToolTip($revertButton, "Revert Chrome settings back to default.")


function Optimize-Chrome {
    $settings = @{
        "HardwareAccelerationModeEnabled" = 1
        "NetworkPredictionOptions" = 0
        "TabFreezingEnabled" = 0
        "MemorySaverModeSavings" = 0
        "ChromeCleanupEnabled" = 0
        "SafeBrowsingEnabled" = 0
        "NTPContentSuggestionsEnabled" = 0
        "MetricsReportingEnabled" = 0
        "UrlKeyedAnonymizedDataCollectionEnabled" = 0
        "PasswordLeakDetectionEnabled" = 0
        "CloudReportingEnabled" = 0
        "ReportDeviceNetworkEvents" = 0
        "SafeBrowsingExtendedReportingEnabled" = 0
        "BlockThirdPartyCookies" = 1
        "PerformanceTracingManagerEnabled" = 0
        "EnableDoNotTrack" = 1
        "DeviceActivityHeartbeatEnabled" = 0
        "DeviceExtensionsSystemLogEnabled" = 0
        "DeviceFlexHwDataForProductImprovementEnabled" = 0
        "DeviceMetricsReportingEnabled" = 0
        "DeviceReportNetworkEvents" = 0
        "DeviceReportRuntimeCounters" = 0
        "DeviceReportXDREvents" = 0
        "EnableDeviceGranularReporting" = 0
        "HeartbeatEnabled" = 0
        "HeartbeatFrequency" = 0
        "LogUploadEnabled" = 0
        "ReportAppInventory" = 0
        "ReportAppUsage" = 0
        "ReportArcStatusEnabled" = 0
        "ReportCRDSessions" = 0
        "ReportDeviceActivityTimes" = 0
        "ReportDeviceAppInfo" = 0
        "ReportDeviceAudioStatus" = 0
        "ReportDeviceBacklightInfo" = 0
        "ReportDeviceBluetoothInfo" = 0
        "ReportDeviceBoardStatus" = 0
        "ReportDeviceBootMode" = 0
        "ReportDeviceCpuInfo" = 0
        "ReportDeviceCrashReportInfo" = 0
        "ReportDeviceFanInfo" = 0
        "ReportDeviceGraphicsStatus" = 0
        "ReportDeviceHardwareStatus" = 0
        "ReportDeviceLoginLogout" = 0
        "ReportDeviceMemoryInfo" = 0
        "ReportDeviceNetworkConfiguration" = 0
        "ReportDeviceNetworkInterfaces" = 0
        "ReportDeviceNetworkStatus" = 0
        "ReportDeviceOsUpdateStatus" = 0
        "ReportDevicePeripherals" = 0
        "ReportDevicePowerStatus" = 0
        "ReportDevicePrintJobs" = 0
        "ReportDeviceSecurityStatus" = 0
        "ReportDeviceSessionStatus" = 0
        "ReportDeviceStorageStatus" = 0
        "ReportDeviceSystemInfo" = 0
        "ReportDeviceTimezoneInfo" = 0
        "ReportDeviceUsers" = 0
        "ReportDeviceVersionInfo" = 0
        "ReportDeviceVpdInfo" = 0
        "ReportUploadFrequency" = 0
        "ReportWebsiteActivityAllowlist" = 0
        "ReportWebsiteTelemetry" = 0
        "ReportWebsiteTelemetryAllowlist" = 0
    }
    foreach ($key in $settings.Keys) {
        if (!(Get-ItemProperty -Path $chromePolicies -Name $key -ErrorAction SilentlyContinue)) {
            New-ItemProperty -Path $chromePolicies -Name $key -Value $settings[$key] -PropertyType DWord -Force | Out-Null
        } else {
            Set-ItemProperty -Path $chromePolicies -Name $key -Value $settings[$key] -Type DWord
        }
    }
cls
$colors = @("Red", "Yellow", "Green", "Blue", "White")
$text = "Done!"
for ($i = 0; $i -lt $text.Length; $i++) {
    Write-Host $text[$i] -ForegroundColor $colors[$i % $colors.Length] -NoNewline
}
Set-ItemProperty -Path $chromePolicies -Name "DnsOverHttpsMode" -Value "secure" -Type String
Set-ItemProperty -Path $chromePolicies -Name "DnsOverHttpsTemplates" -Value $dnsProvider -Type String
}

function Revert-Chrome {
    $keysToRemove = @("HardwareAccelerationModeEnabled",
"NetworkPredictionOptions","TabFreezingEnabled","MemorySaverModeSavings","ChromeCleanupEnabled","SafeBrowsingEnabled","NTPContentSuggestionsEnabled","MetricsReportingEnabled",
"UrlKeyedAnonymizedDataCollectionEnabled","PasswordLeakDetectionEnabled","CloudReportingEnabled","ReportDeviceNetworkEvents","SafeBrowsingExtendedReportingEnabled",
"BlockThirdPartyCookies","PerformanceTracingManagerEnabled","EnableDoNotTrack","DeviceActivityHeartbeatEnabled","DeviceExtensionsSystemLogEnabled",
"DeviceFlexHwDataForProductImprovementEnabled","DeviceMetricsReportingEnabled","DeviceReportNetworkEvents","DeviceReportRuntimeCounters","DeviceReportXDREvents",
"EnableDeviceGranularReporting","HeartbeatEnabled","HeartbeatFrequency","LogUploadEnabled","ReportAppInventory","ReportAppUsage",
"ReportArcStatusEnabled","ReportCRDSessions","ReportDeviceActivityTimes","ReportDeviceAppInfo","ReportDeviceAudioStatus","ReportDeviceBacklightInfo",
"ReportDeviceBluetoothInfo","ReportDeviceBoardStatus","ReportDeviceBootMode","ReportDeviceCpuInfo","ReportDeviceCrashReportInfo","ReportDeviceFanInfo",
"ReportDeviceGraphicsStatus","ReportDeviceHardwareStatus","ReportDeviceLoginLogout","ReportDeviceMemoryInfo","ReportDeviceNetworkConfiguration",
"ReportDeviceNetworkInterfaces","ReportDeviceNetworkStatus","ReportDeviceOsUpdateStatus","ReportDevicePeripherals","ReportDevicePowerStatus","ReportDevicePrintJobs",
"ReportDeviceSecurityStatus","ReportDeviceSessionStatus","ReportDeviceStorageStatus","ReportDeviceSystemInfo","ReportDeviceTimezoneInfo","ReportDeviceUsers",
"ReportDeviceVersionInfo","ReportDeviceVpdInfo","ReportUploadFrequency","ReportWebsiteActivityAllowlist","ReportWebsiteTelemetry","ReportWebsiteTelemetryAllowlist","DnsOverHttpsMode")
    foreach ($key in $keysToRemove) {
        if (Get-ItemProperty -Path $chromePolicies -Name $key -ErrorAction SilentlyContinue) {
            Remove-ItemProperty -Path $chromePolicies -Name $key -Force | Out-Null
        }
    }
 cls
$colors = @("Red", "Yellow", "Green", "Blue", "White")
$text = "Done!"
for ($i = 0; $i -lt $text.Length; $i++) {
    Write-Host $text[$i] -ForegroundColor $colors[$i % $colors.Length] -NoNewline
}
}

# Show the form
$form.ShowDialog()
