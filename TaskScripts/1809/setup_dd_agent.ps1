
Write-Host "#####################################################"
Write-Host "### Installing Data Dog Agent"
Write-Host "#####################################################"
Write-Host " "

$DD_API_KEY=[System.Environment]::GetEnvironmentVariable('DD_API_KEY', 'Machine'); `
    Write-Host "## Setting Environment Variables..."; `
    [Environment]::SetEnvironmentVariable('DD_ENV', 'eval', 'Machine'); `
    [Environment]::SetEnvironmentVariable('DD_LOGS_ENABLED', 'true', 'Machine'); `
    [Environment]::SetEnvironmentVariable('DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL', 'true', 'Machine'); `
    [Environment]::SetEnvironmentVariable('DD_APM_CONFIG_ENABLED', 'true', 'Machine'); `
    [Environment]::SetEnvironmentVariable('DD_APM_CONFIG_APM_NON_LOCAL_TRAFFIC', 'true', 'Machine'); `
    Update-SessionEnvironment; `
    $agentUri = 'https://s3.amazonaws.com/ddagent-windows-stable/datadog-agent-7-latest.amd64.msi'; `
    $fileName = 'datadog-agent-7-latest.amd64.msi'
    Write-Host "## Downloading Datadog Agent"; `
    (New-Object System.Net.WebClient).DownloadFile($agentUri, $fileName); `
    Write-Host '## Installing Datadog Agent'; `
    Start-Process -Wait msiexec -ArgumentList "/qn /i $fileName APIKEY=`"$DD_API_KEY`""; `
    Write-Host '## Datadog Agent installed, removing installer file'; `
    Remove-Item $fileName;

 Write-Host " "

#Write-Host "#TODO: copy over the config files. " 

Write-Host " "
Write-Host "## Data Dog Agent Setup Complete!!!"
Write-Host " "
