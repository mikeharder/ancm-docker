docker exec -it %container% powershell "$sm = Get-IISServerManager; $sm.ApplicationPools['DefaultAppPool'].Enable32BitAppOnWin64 = $false; $sm.CommitChanges()"
