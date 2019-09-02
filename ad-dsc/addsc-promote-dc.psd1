$ConfigData = 
@{
    AllNodes =
    @(
        @{
            NodeName = "*"
            Domain = "cloudack.net"
            DomainData = "DomainData"
        }
    )
}
$DomainData = 
@{
    WindowsFeatures = 
        @(
            'AD-Domain-Services',
            'RSAT-AD-PowerShell'
        )
}