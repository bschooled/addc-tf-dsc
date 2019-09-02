#Requires -module ActiveDirectoryDsc

<#
    .DESCRIPTION
        Create a new forest where one does not exist.
        Specify forest name 
#>
Configuration NewForest
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [pscredential]
        $Credential,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [pscredential]
        $SafeModePassword
    )

    Import-DscResource -ModuleName PSDscResources
    Import-DscResource -ModuleName ActiveDirectoryDsc

    Node $AllNodes
    {

        foreach ($Value in $AllNodes.WindowsFeature){
            WindowsFeature $Value
            {
                Name   = $Value
                Ensure = 'Present'
            }
        }

        ADDomain 'contoso.com'
        {
            DomainName                    = 'contoso.com'
            Credential                    = $Credential
            SafemodeAdministratorPassword = $SafeModePassword
            ForestMode                    = 'WinThreshold'
        }
    }
}