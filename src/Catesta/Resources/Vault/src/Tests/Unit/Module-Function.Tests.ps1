#-------------------------------------------------------------------------
Set-Location -Path $PSScriptRoot
#-------------------------------------------------------------------------
$ModuleName = 'SecretManagement.<%=$PLASTER_PARAM_ModuleName%>'
$vaultName = 'SecretManagement.<%=$PLASTER_PARAM_ModuleName%>'
$PathToManifest = [System.IO.Path]::Combine('..', '..', $ModuleName, "$ModuleName.psd1")
#-------------------------------------------------------------------------
if (Get-Module -Name $ModuleName -ErrorAction 'SilentlyContinue') {
    #if the module is already in memory, remove it
    Remove-Module -Name $ModuleName -Force
}
Import-Module $PathToManifest -Force
#-------------------------------------------------------------------------
$WarningPreference = "SilentlyContinue"
#-------------------------------------------------------------------------

Describe 'SecretManagement.<%=$PLASTER_PARAM_ModuleName%> Vault Extension Tests' -Tag Unit {
    BeforeAll {
        Import-Module -Name Microsoft.PowerShell.SecretManagement
        Get-SecretVault $vaultName | Unregister-SecretVault
        Register-SecretVault -Name $vaultName -ModuleName $PathToManifest
    }#beforeAll

    AfterAll {
        Unregister-SecretVault -Name $vaultName -ErrorAction Ignore
    }#afterAll

    Context 'Your First Vault Test' {
        <#
            It 'should ...' {

            }#it
        #>
    }#context_FunctionName
}#describe_vaultExtension