docker exec -it ancm-app-2.2-inproc powershell "get-winevent -providername 'IIS AspNetCore Module V2' | format-list -property *"
