# datadogExample
used to share data dog config script examples

This set of scripts should be able to 'bootstrap' a brand new 1809 ( Windows Server 2019 ) machine to run Docker, and have both apps instrumented with with datadog APM.


To reproduct this I do the following:

1. Create a VM with the October update of 1809 
2. Install updates and reboot until there are no more updates
3. Run the following command with your Data Dog API key:

cmd /c "powershell [Environment]::SetEnvironmentVariable('DD_API_KEY', 'Data Dog API Key HERE', 'Machine'); iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/tburnett80/datadogExample/main/bootstrap_1809.ps1'))"

This will install docker and Data Dog agent, then pull down the source to run the containers. 

4. After the VM restarts, wait a few minutes to allow post reboot scripts to run.
5. Run C:\src\TaskScripts\1809\build_run_containers.ps1  to build / start both example container apps ( Framework 4.8 and Core 5 ) 
