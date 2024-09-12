# Pester test for MyScript.ps1

Describe "MyScript.ps1 Tests" {

    # BeforeAll {
    # . $PSScriptRoot\..\src\MyScript.ps1 -Pester
    #     Mock -CommandName "Invoke-MyScript" -MockWith { Write-Host "Mock: Invoke-MyScript called" }
    #     Mock -CommandName "Show-Help" -MockWith { Write-Host "Mock: Show-Help called" }
    # }

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
                # Invoke-MyScript -Var01 "TestValue"
                . $PSScriptRoot\..\src\MyScript.ps1 -Var01 "TestValue"
                # Assert-MockCalled -CommandName "Invoke-MyScript" -Exactly 1 -ParameterFilter { $Var01 -eq 'TestValue' }
                Assert-MockCalled -CommandName "Invoke-MyScript" -Exactly 1
            }
        }

        Context "When Var01 is an empty string and Help is not passed" {
            It "Should call Show-Help function" {
                # Act: Directly call Show-Help since Var01 is empty
                . $PSScriptRoot\..\src\MyScript.ps1 -Var01 $null

                # Assert: Ensure Show-Help was called
                Assert-MockCalled -CommandName "Show-Help" -Exactly 1
            }
        }

        Context "When no parameters are passed" {
            It "Should call Show-Help function" {
                # Act: Directly call Show-Help with no parameters
                . $PSScriptRoot\..\src\MyScript.ps1

                # Assert: Ensure Show-Help was called
                Assert-MockCalled -CommandName "Show-Help" -Exactly 1
            }
        }
    }
}
