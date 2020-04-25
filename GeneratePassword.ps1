add-type -AssemblyName System.Web
<#Can Change the length of the password generated 
    GeneratePassword(LengthOfPassword, NumberOfNonAlphanumericCharacters)
    Generates a secure string that can be used to create a PSCredential Object
#>
$password = [System.Web.Security.Membership]::GeneratePassword(24, 0)
[securestring]$secStringPassword = ConvertTo-SecureString $password -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)