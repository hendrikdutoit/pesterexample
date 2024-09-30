# Pester test for MyScript.ps1
BeforeAll {
    . $PSScriptRoot\..\src\MyScript.ps1 -Pester
}

Describe "Dot-Sourcing BeforeAll Tests" {
    It "Should call DotSourceTest01" {
        $Result = DotSourceTest01
        $Result | Should -Be "DotSourceTest01"
    }
    It "Should call DotSourceTest02" {
        $Result = DotSourceTest02
        $Result | Should -Be "DotSourceTest02"
    }

    Context "Dot-Sourcing one-level-up Tests" {
        It "Should call DotSourceTest03" {
            $Result = DotSourceTest03
            $Result | Should -Be "DotSourceTest03"
        }
    }
}

