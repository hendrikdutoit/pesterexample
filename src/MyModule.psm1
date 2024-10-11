# MyModule.psm1
function Get-Hello {
    Write-Output "Hello from MyModule.psm1\Get-Hello"
    Invoke-CalledFunction
}

function Invoke-CalledFunction {
    Write-Output "Called by Get-Hello"
}
Export-ModuleMember -Function Get-Hello, Invoke-CalledFunction
