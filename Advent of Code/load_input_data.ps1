[CmdletBinding()]
param (
    [Parameter()][switch]$LoadAll = $false
)

$cred = [pscredential]::new('sa', (ConvertTo-SecureString -String 'yourStrong(!)Password' -AsPlainText))

gci -Path .\Input -Filter *.txt |
    ? { $LoadAll -or $_.Name -Match "$(Get-Date -Format 'yyyy-MM-dd')(\.sample)?\.txt" } | % {
    Invoke-DbaQuery -SqlInstance localhost -SqlCredential $cred -Database SandBox -Query 'dbo.usp_Import_AoC_Input' -CommandType StoredProcedure -SqlParameter @{
            'PuzzleDay'   = [datetime]($_.Name -Replace '\..*','')
            'IsSample'    = $_.Name -Match '\.sample.txt$'
            'PuzzleInput' = (gc -Raw -LiteralPath $_)
        }
}