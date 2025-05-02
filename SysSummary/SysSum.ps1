# Set output path to current user's desktop
$output = "$env:USERPROFILE\Desktop\SysSum-Full.txt"

$summary = @()

# Timestamp with local timezone
$now = Get-Date
$timezone = ([System.TimeZoneInfo]::Local).DisplayName
$summary += "Generated on: $($now.ToString('yyyy-MM-dd HH:mm:ss')) ($timezone)"
$summary += ""

$summary += "===== FULL SYSTEM SUMMARY ====="
$os = Get-CimInstance Win32_OperatingSystem
$summary += "OS:           $($os.Caption) - Build $($os.BuildNumber)"
$summary += "Architecture: $($os.OSArchitecture)"
$summary += "Install Date: $($os.InstallDate.ToLocalTime().ToString('yyyy-MM-dd'))"
$summary += "Computer Name: $($os.CSName)"
$summary += "Logged-in User: $env:USERNAME"

$cpu = Get-CimInstance Win32_Processor
$summary += "`n===== CPU ====="
$summary += "CPU:          $($cpu.Name.Trim())"
$summary += "Cores:        $($cpu.NumberOfCores)"
$summary += "Threads:      $($cpu.NumberOfLogicalProcessors)"

$ram = Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$totalRAM = [math]::Round($ram.Sum / 1GB, 1)
$summary += "`n===== MEMORY ====="
$summary += "Installed RAM: ${totalRAM} GB"

$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
$summary += "`n===== GPU ====="
$summary += "GPU:          $($gpu.Name)"

$driver = Get-CimInstance Win32_PnPSignedDriver | Where-Object { $_.DeviceClass -eq "DISPLAY" } | Sort-Object DriverDate -Descending | Select-Object -First 1
$driverDate = try {
    [DateTime]::ParseExact($driver.DriverDate.Split('.')[0], 'yyyyMMdd', $null).ToString('yyyy-MM-dd')
} catch {
    $driver.DriverDate
}
$summary += "`n===== GPU DRIVER ====="
$summary += "Driver Version: $($driver.DriverVersion)"
$summary += "Driver Date:    $driverDate"

$mb = Get-CimInstance Win32_BaseBoard
$bios = Get-CimInstance Win32_BIOS
$summary += "`n===== MOTHERBOARD / BIOS ====="
$summary += "Manufacturer: $($mb.Manufacturer)"
$summary += "Model:        $($mb.Product)"
$summary += "BIOS Version: $($bios.SMBIOSBIOSVersion)"
$summary += "BIOS Serial:  $($bios.SerialNumber)"

$summary += "`n===== STORAGE ====="
Get-CimInstance Win32_DiskDrive | ForEach-Object {
    $model = $_.Model
    $sizeGB = [math]::Round($_.Size / 1GB, 1)
    $serial = $_.SerialNumber
    $summary += "Drive: $model - $sizeGB GB - Serial: $serial"
}

$summary += "`n===== NETWORK ====="
Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.MACAddress -and $_.IPAddress } | ForEach-Object {
    $summary += "Adapter: $($_.Description)"
    $summary += "MAC:     $($_.MACAddress)"
    $summary += "IP:      $($_.IPAddress -join ', ')"
    $summary += ""
}

# Save to desktop
$summary | Out-File -FilePath $output -Encoding UTF8

# Open the file
Start-Process "notepad.exe" -ArgumentList "`"$output`""

Write-Host "`nFull summary saved and opened: $output" -ForegroundColor Green
