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
