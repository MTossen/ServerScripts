# Create a TXT-file that includes all the names or IP's you want to ping.

$Servers = Get-Content C:\Users\$env:username\desktop\Servers.txt
$collection = @()
foreach ($server in $servers)

{
    $status = @{ "ServerName" = $server}
    if (Test-Connection -Computername $Server -Count 2 -ea 0 -Quiet)

    {
        $status["Results"] = "Up"
    }
    else
    {
        $status["Results"] = "Down"
    }

    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection += $serverStatus

}
$collection | Export-Csv -LiteralPath c:\Users\$Env:username\desktop\Pingtest.csv -NoTypeInformation
