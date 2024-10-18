# MyModule.psm1
function Get-Hello {
    Write-Output "Hello from MyModule.psm1\Get-Hello"
    Invoke-CalledFunction
}

function Invoke-CalledFunction {
    Write-Output "Called by Get-Hello"
}

function Get-ConsoleInput {
    param (
        [Object]$textPrompt
    )
    $result = Read-Host $textPrompt
    return $result
}

Export-ModuleMember -Function Get-ConsoleInput, Get-Hello, Invoke-CalledFunction
