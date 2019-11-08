#!/usr/bin/pwsh

$HostName = @()
  $HostIP = @()

Import-Csv ~/zabbix/inventory.csv |`
    ForEach-Object {
        $HostName += $_.Host
        $HostIP += $_.IP
    }

$Config = '
LogFile = "c:\zabbix_agentd.log"
ListenPort = "10050"
Server = "alerts.domain.com"
ListenIP = $HostIP
'

$ConfigName = "~/zabbix/zabbix_agentd.conf"

# Add ListenIP value to zabbix_agentd.conf
Add-Content -Path $fileName -Value $Config
