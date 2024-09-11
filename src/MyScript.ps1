param (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$Var01,

    [Parameter(Mandatory = $false)]
    [Switch]$Help
)

function ShowHelp {
    Write-Host $separator -ForegroundColor Cyan

    # Usage
    @"
    Usage:
    ------
    MyScript.ps1 Var01
    MyScript.ps1 -Help

    Parameters:
      Var01   Non-mandatory variable 1.
      -Help   Display help.
"@ | Write-Host

    Write-Host $separator -ForegroundColor Cyan
}

function Invoke-MyScript {
    Write-Host "Executing function: Invoke-MyScript..."
}

# Script execution starts here
Write-Host ''
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "=[ START $dateTime ]===========================================[ MyScript.ps1 ]=" -ForegroundColor Blue
$separator = "-" * 80
Write-Host "Running" $MyInvocation.MyCommand.Name -ForegroundColor Blue
if ($Var01 -eq "" -or $Help) {
    Show-Help
}
else {
    Invoke-MyScript -Var01 $Var01
}
Write-Host '-[ END ]------------------------------------------------------------------------' -ForegroundColor Cyan
