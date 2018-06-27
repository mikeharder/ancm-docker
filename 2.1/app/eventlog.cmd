docker exec -it ancm-app-2.1 powershell "get-winevent -providername 'IIS AspNetCore Module' | format-list -property *"
