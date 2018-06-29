docker exec -it ancm-app-2.2-inproc powershell "$sm = Get-IISServerManager; $sm.ApplicationPools['DefaultAppPool'].Enable32BitAppOnWin64 = $false; $sm.CommitChanges()"
