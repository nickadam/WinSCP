#requires -Modules Pester, PSScriptAnalyzer, WinSCP

Describe "Copy-WinSCPItem" {
    BeforeAll {
        Get-Process -Name WinSCP -ErrorAction SilentlyContinue |
            Stop-Process -Force
    }
    
    Context "Invoke-ScriptAnalyzer -Path `"$((Get-Module -Name WinSCP).ModuleBase)\Public\Copy-WinSCPItem.ps1`"" {
        BeforeAll {
            $results = Invoke-ScriptAnalyzer -Path "$((Get-Module -Name WinSCP).ModuleBase)\Public\Copy-WinSCPItem.ps1"
        }

        It "Invoke-ScriptAnalyzer of Copy-WinSCPItem results count should be 0." {
            $results.Count |
                Should -Be 0
        }
    }
}
