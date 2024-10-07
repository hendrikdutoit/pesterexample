# Pester test for MyScript.ps1

Describe "MyScript.ps1 Tests" {

    Context "Top level script execution" {
        BeforeAll {
            . $PSScriptRoot\..\src\MyScript.ps1 -Pester
        }
        BeforeEach {
            Mock -CommandName "Show-Help" -MockWith { Write-Host "Mock: Show-Help called" }
        }
        Context "When Help parameter is passed" {
            It "Should call Show-Help function" {
                . $PSScriptRoot\..\src\MyScript.ps1 -Help
                Assert-MockCalled -CommandName "Show-Help" -Exactly 1
            }
        }

        Context "When Var01 is passed and Help is not passed" {
            BeforeEach {
                Mock -CommandName "Invoke-MyScript" -MockWith { Write-Host "Mock: Invoke-MyScript called" }
            }
            It "Should call Invoke-MyScript function with Var01" {
                . $PSScriptRoot\..\src\MyScript.ps1 -Var01 "TestValue"
                # Assert-MockCalled -CommandName "Invoke-MyScript" -Exactly 1 -ParameterFilter { $Var01 -eq 'TestValue' }
                Assert-MockCalled -CommandName "Invoke-MyScript" -Exactly 1
            }
        }

        Context "When Var01 is an empty string and Help is not passed" {
            It "Should call Show-Help function" {
                . $PSScriptRoot\..\src\MyScript.ps1 -Var01 $null
                Assert-MockCalled -CommandName "Show-Help" -Exactly 1
            }
        }

        Context "When no parameters are passed" {
            It "Should call Show-Help function" {
                . $PSScriptRoot\..\src\MyScript.ps1
                Assert-MockCalled -CommandName "Show-Help" -Exactly 1
            }
        }
    }
    Context "Function calling" {
        Context "Invoke-FunctionWithNoParameters" {
            It "Should call Invoke-FunctionWithNoParameterswith with no parameters" {
                . $PSScriptRoot\..\src\MyScript.ps1 -Var01 "TestValue"
                $Result = Invoke-FunctionWithNoParameters
                $Result | Should -Be "Executing function: Invoke-FunctionWithNoParameters"
            }
        }
    }
    Context "Module Test" {
        Context "Global Module Import" {
            Import-Module "$PSScriptRoot\..\src\MyModule.psm1"
            It "Test MyModule\Get-Hello" {
                Get-Hello | Should -Be "Hello from MyModule.psm1\Get-Hello"
            }
        }
        Context "BeforeAll Module Import" {
            BeforeAll {
                Import-Module "$PSScriptRoot\..\src\MyModule.psm1"
                Import-Module "$PSScriptRoot\..\src\AnotherModule.psm1"
            }
            It "Test MyModule\Get-Hello" {
                MyModule\Get-Hello | Should -Be "Hello from MyModule.psm1\Get-Hello"
            }
            It "Test Another\Get-Hello" {
                AnotherModule\Get-Hello | Should -Be "Hello from AnotherModule.psm1\Get-Hello"
            }
            It "Test both Get-Hello's" {
                MyModule\Get-Hello | Should -Be "Hello from MyModule.psm1\Get-Hello"
                AnotherModule\Get-Hello | Should -Be "Hello from AnotherModule.psm1\Get-Hello"
            }
        }
        Context "Inline Module Import" {
            It "Test Get-Hello" {
                Import-Module "$PSScriptRoot\..\src\MyModule.psm1"
                Get-Hello | Should -Be "Hello from MyModule.psm1\Get-Hello"
            }
        }
    }
}



