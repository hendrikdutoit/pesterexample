# MyModule.psm1
function Get-Hello {
    Write-Output "Hello from AnotherModule.psm1\Get-Hello"
}

Export-ModuleMember -Function 'Get-Hello'
