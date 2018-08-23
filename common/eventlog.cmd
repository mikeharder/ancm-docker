docker exec -it %container% powershell "Get-WinEvent -ProviderName %eventproviders% | Format-List -Property Message,Id,ProviderName,TimeCreated"
