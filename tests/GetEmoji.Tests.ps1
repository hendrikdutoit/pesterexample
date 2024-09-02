BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1').replace('tests','src')
}

Describe "GetEmoji" {
    Context "Lookup by whole name" {
        It "Returns (cactus)" {
            Get-Emoji -Name cactus | Should -Be '🌵'
        }

        It "Returns  (pencil)" {
            Get-Emoji -Name pencil | Should -Be '✏️'
        }
    }
}