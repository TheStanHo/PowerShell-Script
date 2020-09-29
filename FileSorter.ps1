
[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $path, #
    [Parameter()]
    [string]
    $logPath,
    [Parameter()]
    [string]
    $filedropPath #Path of Fileshare mount
)
 Start-Transcript -Path "$logPath\logs.log" -Append
 Write-host "transcript file created at " $logPath"\-logs.log"
try{
    $startDate = Get-Date -Format "HH:MM:ss dd:MM:yyyy"
    Write-Host "Starting Script at: $startDate "  `n
    $timestamp = Get-Date -Format s | ForEach-Object { $_ -replace ":", "." }


    
        if((Test-path -Path "$path\*txt") -eq $true) {
    Get-ChildItem -Path "$path\*.txt" -Filter *.txt -Recurse -File -Name| ForEach-Object {
        $filename = [System.IO.Path]::GetFileNameWithoutExtension($_)  #Filename without extension
        
        #Do something here
        
        
    } 
} else { ##If it cant find a .txt file will return this
    Write-Host "No new Files found in $path at $timestamp"
}

    } catch{
        Write-Host $_.Exception.Message
       
    } finally{
    Stop-Transcript
    }

