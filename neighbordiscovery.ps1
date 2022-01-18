# I think I was messing with how to find my raspberry pi on my home network with this one.
# Yep def. it basically does a port scan for all neighbors using Test-netconnection via port 22
# Probably need to add parameters etc.
# OUI lookups http://standards-oui.ieee.org/oui/oui.txt

$neighbors = Get-NetNeighbor -AddressFamily IPv4 | Where-Object {$_.IPAddress -like '192.168.1*'}

foreach ($neighbor in $neighbors) {

$ipv4_neighbor = $neighbor.IPAddress 

$result = Test-NetConnection -ComputerName $ipv4_neighbor -Port 22 -ErrorAction Stop

if ($result.tcptestsucceeded = 'False') { Write-Output "$ipv4_neighbor - Failed"}

else {Write-Output "$ipv4_neighbor - OK"}

}
