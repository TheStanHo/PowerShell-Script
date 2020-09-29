
[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $path = "F:\",
    [Parameter()]
    [string]
    $fileType

)
 Start-Transcript -Path "$logPath\.log" -Append
 Write-host "transcript file created at " $logPath"\logs.log"
try{
    $startDate = Get-Date -Format "HH:MM:ss dd:MM:yyyy"
    Write-Host "Starting Script at: $startDate "  `n
    $timestamp = Get-Date -Format s | ForEach-Object { $_ -replace ":", "." }


    
        if((Test-path -Path "$path\*$fileType") -eq $true) {
            
    Get-ChildItem -Path "$path\*.$fileType" -Filter *.$fileType -Recurse -File -Name| ForEach-Object {
        $filename = [System.IO.Path]::GetFileNameWithoutExtension($_)  #Filename without extension
        Write-Host "Found Files $filename.$fileType. Removing..."
        Remove-Item "$path\$filename.$fileType"
        
        

        
        
    } 
} else { 
    Write-Host "No $fileType files to delete"
}

    } catch{
        Write-Host $_.Exception.Message
       
    } finally{
    Stop-Transcript
    }

