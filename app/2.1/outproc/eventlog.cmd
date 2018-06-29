docker exec -it ancm-app-2.1-outproc powershell "get-winevent -providername 'IIS AspNetCore Module' | format-list -property *"
