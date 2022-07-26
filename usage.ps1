Import-Module (Join-Path $PSScriptRoot sqlexpress.psm1) -Force
Install-SQLServerExpress2016AndManagementStudio
#& sqlcmd -S ".\SQLEXPRESS" -E -i "$PsScriptRoot\setup.sql"
