function Install-SQLServerExpress2019AndManagementStudio() {
    if (-not (Test-Path "C:\Program Files\Microsoft SQL Server\sql-server-2019")) {
        if (-not (Test-Path "C:\tempsql1\SQLServer2019-x64-ENU-Dev.iso")) {
            Write-Output "Downloading SQL Server 2019 Express: this may take a while`r`n"
            mkdir c:\tempsql1 -Force
            # (New-Object Net.WebClient).DownloadFile('http://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/ExpressAndTools%2064BIT/SQLEXPRWT_x64_ENU.exe','C:\tempsql\SQLEXPRWT_x64_ENU.exe')
            # (New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/8/4/c/84c6c430-e0f5-476d-bf43-eaaa222a72e0/SQLEXPR_x64_ENU.exe','C:\tempsql1\SQLEXPR.exe')
              (New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso','C:\tempsql1\SQLServer2019-x64-ENU-Dev.iso')
        }
        Write-Output "Unpacking SQL Server 2019 Express`r`n"
        C:\tempsql1\SQLEXPR.exe /x:"c:\tempsql1\SQLEXPR" /u | Out-Null
        Write-Output "Adding .NET 3.5`r`n"
        Import-Module Servermanager
        Add-WindowsFeature NET-Framework-Core
        Write-Output "Installing SQL Server 2019 Express: this may take a while`r`n"
        C:\tempsql1\SQLEXPR\setup.exe /QUIETSIMPLE /ACTION=install /FEATURES=SQL,Tools /IAcceptSQLServerLicenseTerms /INSTANCENAME="SQLExpress"
        #C:\tempsql\SQLEXPRWT_x64_ENU\setup.exe "/ConfigurationFile=C:\ConfigurationFile.ini" 
        $env:PATH = [System.Environment]::GetEnvironmentVariable("Path","Machine")
        #Remove-Item -Recurse -Force c:\tempsql
    } else {
        Write-Output "SQL Server 2019 Express already installed`r`n"
    }
}
