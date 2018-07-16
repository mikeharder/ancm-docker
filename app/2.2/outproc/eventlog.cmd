docker exec -it ancm-app-2.2-outproc powershell "get-winevent -providername 'IIS AspNetCore Module V2' | format-list -property *"
