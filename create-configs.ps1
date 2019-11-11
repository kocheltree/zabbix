#!/usr/bin/pwsh

    ####################################################################################################
    # Zabbix Installation Script: create-config.ps1
    # Batch generate configuration files for deployment to remote hosts.
    ####################################################################################################

                    $CurrentUser = $env:UserName
                 $ScriptPathName = "zabbix"
             $SscriptWorkingPath = "$Profile\$ScriptPathName"
                 $ImportFilename = "inventory.csv"
                    $WorkingFQDN = $env:UserDomain
                 $ZabbixHostName = "alerts"
                       $HostPort = "10050"
     $RemoteHostWorkingDirectory = "C:\Zabbix"
      $RemoteHostBinaryDirectory = "\bin"
           $RemoteHostConfigName = "zabbix_agentd.conf"
              $RemoteHostLogName = "zabbix_agentd.log"
    
    # Create directory and configuration file.
    New-Item -Path $Profile -Name $ScriptPathName -ItemType "directory"
    New-Item -Path $ScriptWorkingPath -Name $RemoteHostConfigName -ItemType "file" -Value "# This is file was generated by by $CurrentUser on (Get-Date -Format MM/dd/yyyy HH:mm)"

    # Import hostnames and IP addresses from csv.
    $HostName = @()
    $HostIP = @()

    Import-Csv $ScriptWorkingPath\$ImportFilename |`
        ForEach-Object {
            $HostName += $_.Host
            $HostIP += $_.IP
        }

    # Append the data to configuration file.
    $ConfigAppend = "
    LogFile = $RemoteHostWorkingDirectory\$RemoteHostLogname
    ListenIP = $HostIP
    ListenPort = $HostPort
    Server = "$ZabbixHostName.$WorkingFQDN"
    "
    
    foreach ($HostName in $Array ) { Add-Content -Path $ScriptWorkingPath\$RemoteHostConfigName -Value $ConfigAppend }
    
