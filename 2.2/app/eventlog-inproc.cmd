docker exec -it ancm-app-2.2-inproc powershell "get-winevent -providername 'IIS AspNetCore Module' | format-list -property *"
