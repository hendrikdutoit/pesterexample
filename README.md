# PesterExample

Sandbox environment for experimenting with PowerShell and Pester.

| **Category** | **Status' and Links**                                                                                                     |
| ------------ | ------------------------------------------------------------------------------------------------------------------------- |
| General      | [![][release_img]][release_lnk] [![][maintenance_y_img]][maintenance_y_lnk] [![][semver_pic]][semver_link]                |
| CI           | [![][pre_commit_img]][pre_commit_lnk] [![][ci_img]][ci_lnk]                                                               |
| Github       | [![][gh_issues_img]][gh_issues_lnk] [![][gh_language_img]][gh_language_lnk] [![][gh_last_commit_img]][gh_last_commit_lnk] |

# Dot-Sourcing BeforeAll Tests

1. Dot-Sourcing one-level-up Tests

# Mocking

1. Test with Mocked Environment Variables

1. Mock Examples from Pester Docs

   1. Get-ChildItem Example
   1. ParameterFilter examples
   1. Multi Mock Setup

1. Mock Module Tests

1. Mock Parametrised

   1. Handle console input
      - Local Call
      - Function Call

1. Mock Scripts

   To mock the execution of an external PowerShell script called from within your function (Invoke-AnotherFunction), you need to employ strategy that allows you to replace the behavior of the script invocation with something controllable in your tests. Because the script invocation itself (& $PSScriptRoot..\\src\\AnotherScript.ps1) is not a function or cmdlet, but a direct script execution, you can't directly mock it using Pester's built-in Mock function.

   Instead, you'll have to refactor the original PowerShell script for better testability or use a technique to intercept the script all. Here are two common strategies:

   - Refactoring the Function for Testability

     Refactoring the Invoke-AnotherFunction to call a PowerShell function instead of directly executing a script file can make your code more testable. For instance, you could wrap the script's functionality into a function within that script or a module,  which you can then call from Invoke-AnotherFunction.

   - Abstracting Script Execution to a Wrapper Function

     If refactoring the called script isn't an option, another approach is to abstract the execution of external scripts into a separate wrapper function that you can then mock.

   1. Refactoring the Function for Testability
   1. Abstracting Script Execution to a Wrapper Function

# MyScript.ps1 Tests

1. Top level script execution
   1. When Help parameter is passed
   1. When Var01 is passed and Help is not passed
   1. When Var01 is an empty string and Help is not passed
   1. When no parameters are passed
1. Function calling
   1. Invoke-FunctionWithNoParameters
1. Module Test
   1. Global Module Import
   1. BeforeAll Module Import
   1. Inline Module Import

# Temporary Directory Tests

# Temporary Directory with Script Tests

[ci_img]: https://github.com/hendrikdutoit/PesterExample/actions/workflows/03-ci.yaml/badge.svg "CI"
[ci_lnk]: https://github.com/hendrikdutoit/PesterExample/blob/master/.github/workflows/03-ci.yaml "CI"
[gh_issues_img]: https://img.shields.io/github/issues-raw/hendrikdutoit/PesterExample "GitHub - Issue Counter"
[gh_issues_lnk]: https://github.com/hendrikdutoit/PesterExample/issues "GitHub - Issue Counter"
[gh_language_img]: https://img.shields.io/github/languages/top/hendrikdutoit/PesterExample "GitHub - Top Language"
[gh_language_lnk]: https://github.com/hendrikdutoit/PesterExample "GitHub - Top Language"
[gh_last_commit_img]: https://img.shields.io/github/last-commit/hendrikdutoit/PesterExample/master "GitHub - Last Commit"
[gh_last_commit_lnk]: https://github.com/hendrikdutoit/PesterExample/commit/master "GitHub - Last Commit"
[maintenance_y_img]: https://img.shields.io/badge/Maintenance%20Intended-%E2%9C%94-green.svg?style=flat "Maintenance - intended"
[maintenance_y_lnk]: http://unmaintained.tech/ "Maintenance - intended"
[pre_commit_img]: https://github.com/hendrikdutoit/PesterExample/actions/workflows/01-pre-commit-and-document-check.yaml/badge.svg "Pre-Commit"
[pre_commit_lnk]: https://github.com/hendrikdutoit/PesterExample/blob/master/.github/workflows/01-pre-commit-and-document-check.yaml "Pre-Commit"
[release_img]: https://img.shields.io/github/v/release/hendrikdutoit/PesterExample "GitHub release (latest by date)"
[release_lnk]: https://github.com/hendrikdutoit/PesterExample/releases/latest "GitHub release (latest by date)"
[semver_link]: https://semver.org/ "Sentic Versioning - 2.0.0"
[semver_pic]: https://img.shields.io/badge/Semantic%20Versioning-2.0.0-brightgreen.svg?style=flat "Sentic Versioning - 2.0.0"
