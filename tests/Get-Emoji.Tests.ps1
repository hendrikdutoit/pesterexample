BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe "Get-Emoji" {
    It "Returns <expected> (<name>)" -TestCases @(
        @{ Name = "cactus"; Expected = '🌵'}
        @{ Name = "giraffe"; Expected = '🦒'}
    ) {
        Get-Emoji -Name $name | Should -Be $expected
    }
}

Write-Host "Discovery done."