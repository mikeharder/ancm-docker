docker exec -it ancm-app-2.2-inproc-express powershell "get-winevent -providername 'IIS Express AspNetCore Module V2' | format-list -property *"
