param (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$Var01,

    [Parameter(Mandatory = $false)]
    [Switch]$Help,

    [Parameter(Mandatory = $false)]
    [Switch]$Pester
)

function Show-Help {
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
    param (
        [String]$Var
    )
    Write-Host "Executing function: Invoke-MyScript with Var = $Var..."
}

# Script execution starts here
# Pester parameter is to ensure that the scrip does not exeucte when called from
# pester BeforeAll.  Any better ideas would be welcome.
if (-not $Pester) {
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
        # Invoke-MyScript
    }
    Write-Host '-[ END ]------------------------------------------------------------------------' -ForegroundColor Cyan
}
