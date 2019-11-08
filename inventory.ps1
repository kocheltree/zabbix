$HostName = @()
  $HostIP = @()

Import-Csv ~/scripts/zabbix/inventory.csv |`
    ForEach-Object {
        $HostName += $_.Host
        $HostIP += $_.IP
    }
