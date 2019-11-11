  # Determine Operating System
  Test-WSMan -ComputerName $HostName -Authentication default | Select-String -Pattern "ProductVersion"
