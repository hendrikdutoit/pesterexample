Describe "Test with Mocked Environment Variable" {
    BeforeAll {
        # Save the current value to restore later
        $originalValue = $env:MY_VARIABLE
        $env:MY_VARIABLE = "MockedValue"
    }

    It "Should use the mocked environment variable" {
        # Your test code here
        $env:MY_VARIABLE | Should -Be "MockedValue"
    }

    AfterAll {
        # Restore the original environment variable
        $env:MY_VARIABLE = $originalValue
    }
}

# Describe "Test with Mocked scrip call" {
#     Mock {}

#     # Mock for Join-Path to directly return the expected paths for simplicity in tracking
#     Mock Join-Path {
#         param($Path, $ChildPath)
#         return "$Path\$ChildPath"
#     }

#     # Example test to verify that the function constructs paths correctly and calls the script as expected
#     BeforeEach {
#         $tempDir = Join-Path -Path $env:TEMP -ChildPath ([Guid]::NewGuid().ToString())
#         New-Item -ItemType Directory -Path $tempDir | Out-Null
#     }
#     It "Calls the upgrade preparation script with correct parameters" {
#         # Setup
#         $upgradeScriptDir = "C:\FakeUpgrade"
#         $env:VENVIT_DIR = "C:\Venvit"
#         $expectedCurrentManifestPath = "C:\Venvit\Manifest.psd1"
#         $expectedUpgradeManifestPath = "C:\FakeUpgrade\Manifest.psd1"

#         # Act
#         Invoke-ConcludeUpgradePrep -UpgradeScriptDir $upgradeScriptDir

#         # Assert
#         # Ensure the script file is called with the correct parameters
#         Assert-MockCalled -CommandName -Exactly 1 -Scope It -ParameterFilter {
#             $args[0] -eq "$upgradeScriptDir\Conclude-UpgradePrep.ps1" -and
#             $args[1] -eq $expectedCurrentManifestPath -and
#             $args[2] -eq $expectedUpgradeManifestPath
#         }
#     }
# }
