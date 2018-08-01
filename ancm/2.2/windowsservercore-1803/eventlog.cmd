@call %~dp0\util\util.cmd

docker exec -it %container% powershell "Get-WinEvent -ProviderName 'Microsoft-Windows-IIS*','IIS AspNetCore Module*'  | Format-List -Property Message,ProviderName,TimeCreated"
