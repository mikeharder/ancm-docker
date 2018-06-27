docker exec -it ancm-app-2.2-outproc powershell "get-winevent -providername 'IIS AspNetCore Module' | format-list -property *"
