Describe "Temporary Directory Tests" {
    BeforeEach {
        # Variables accessible within the Describe scope
        $tempDir = Join-Path -Path $env:TEMP -ChildPath ([Guid]::NewGuid().ToString())
        # Create the temporary directory once before all tests
        New-Item -ItemType Directory -Path $tempDir | Out-Null
        Write-Host "Created $tempDir"
    }
    It "Creates a file in the temporary directory" {
        # Path for a new file
        $tempFile = Join-Path -Path $tempDir -ChildPath "testfile.txt"
        # Create a new file
        New-Item -ItemType File -Path $tempFile | Out-Null
        # Check if the file exists
        Test-Path $tempFile | Should -Be $true
        Write-Host "Created $tempFile"
    }

    It "Deletes a file in the temporary directory" {
        $tempFile = Join-Path -Path $tempDir -ChildPath "deletefile.txt"
        New-Item -ItemType File -Path $tempFile | Out-Null
        Remove-Item -Path $tempFile
        Test-Path $tempFile | Should -Be $false
        Write-Host "Removed $tempFile"
    }
    AfterEach {
        # Remove the temporary directory after all tests have run
        Remove-Item -Path $tempDir -Recurse -Force
        Write-Host "Removed $tempDir"
    }
}
