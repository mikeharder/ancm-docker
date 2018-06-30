docker exec -it ancm-app-2.1-outproc-express powershell "get-winevent -providername 'IIS Express AspNetCore Module' | format-list -property *"
