#!/usr/bin/pwsh

    $HostName = "HOSTNAME"
     $LogFile = "c:\zabbix_agentd.log"
  $ListenPort = "10050"
      $Server = "alerts.domain.com"
$ServerActive = "alerts.domain.com"
    $ListenIP = "192.168.X.Y"

$ConfigName = "~/scripts/windows/zabbix/zabbix_agentd.conf"
  $ListenIP = "192.168.X.Y"

# Add ListenIP value to zabbix_agentd.conf
Add-Content -Path $fileName -Value "ListenIP=$HostIP"
