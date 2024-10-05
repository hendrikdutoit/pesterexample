Describe "Temporary Directory Tests" {
    BeforeEach {
        # Variables accessible within the Describe scope
        $TempDir = Join-Path -Path $env:TEMP -ChildPath ([Guid]::NewGuid().ToString())
        # Create the temporary directory once before all tests
        New-Item -ItemType Directory -Path $TempDir | Out-Null
        Write-Host "Created $TempDir"
    }
    It "Creates a file in the temporary directory" {
        # Path for a new file
        $TempFile = Join-Path -Path $TempDir -ChildPath "testfile.txt"
        # Create a new file
        New-Item -ItemType File -Path $TempFile | Out-Null
        # Check if the file exists
        Test-Path $TempFile | Should -Be $true
        Write-Host "Created $TempFile"
    }

    It "Deletes a file in the temporary directory" {
        $TempFile = Join-Path -Path $TempDir -ChildPath "deletefile.txt"
        New-Item -ItemType File -Path $TempFile | Out-Null
        Remove-Item -Path $TempFile
        Test-Path $TempFile | Should -Be $false
        Write-Host "Removed $TempFile"
    }
    AfterEach {
        # Remove the temporary directory after all tests have run
        Remove-Item -Path $TempDir -Recurse -Force
        Write-Host "Removed $TempDir"
    }
}

Describe "Temporary Directory with Script Tests" {
    BeforeEach {
        # Create a temporary directory
        $TempDir = Join-Path -Path $env:TEMP -ChildPath ([Guid]::NewGuid().ToString())
        New-Item -ItemType Directory -Path $TempDir | Out-Null

        # Create a script inside the temporary directory
        $ScriptPath = Join-Path -Path $TempDir -ChildPath "myscript.ps1"
        $ScriptContent = 'Write-Output "Hello world!"'
        Set-Content -Path $ScriptPath -Value $ScriptContent
    }

    It "Runs `myscript.ps1` and Outputs 'Hello world!'" {
        # Run the script
        $Output = & $ScriptPath
        $Output | Should -BeExactly "Hello world!"
    }

    AfterEach {
        # Remove the temporary directory
        Remove-Item -Path $TempDir -Recurse -Force
    }
}
