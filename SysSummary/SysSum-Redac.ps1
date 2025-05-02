# Set output path to current user's desktop
$output = "$env:USERPROFILE\Desktop\SysSum-Redac.txt"

# Gather basic info safely
$summary = @()

$summary += "===== SYSTEM SUMMARY ====="
$summary += "OS:           $((Get-CimInstance Win32_OperatingSystem).Caption) - Build $((Get-CimInstance Win32_OperatingSystem).BuildNumber)"
$summary += "Architecture: $((Get-CimInstance Win32_OperatingSystem).OSArchitecture)"
$summary += "Install Date: $((Get-CimInstance Win32_OperatingSystem).InstallDate.ToLocalTime().ToString('yyyy-MM-dd'))"

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

$mb = Get-CimInstance Win32_BaseBoard
$summary += "`n===== MOTHERBOARD ====="
$summary += "Manufacturer: $($mb.Manufacturer)"
$summary += "Model:        $($mb.Product)"

$summary += "`n===== STORAGE ====="
Get-CimInstance Win32_DiskDrive | ForEach-Object {
    $model = $_.Model
    $sizeGB = [math]::Round($_.Size / 1GB, 1)
    $summary += "Drive:        $model - $sizeGB GB"
}

$summary += "`n===== NETWORK (REDACTED) ====="
$summary += "MAC addresses and hostnames redacted for privacy."

# Save to desktop
$summary | Out-File -FilePath $output -Encoding UTF8

# Open the file
Start-Process "notepad.exe" -ArgumentList "`"$output`""

Write-Host "`nSummary saved and opened: $output" -ForegroundColor Green
