docker exec -it ancm-app-2.1-outproc powershell "$sm = Get-IISServerManager; $sm.ApplicationPools['DefaultAppPool'].Enable32BitAppOnWin64 = $true; $sm.CommitChanges()"
