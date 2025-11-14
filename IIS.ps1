Import-Module servermanager
Add-windowsfeature web-server -includeallsubfeature
set-content -path "C:\inetpub\wwwroot\default.html" -Value "This is the server $($env:COMPUTERNAME)"