@call %~dp0\util\util.cmd

docker exec -it %container% powershell "get-winevent -providername 'IIS AspNetCore Module V2' | format-list -property *"
