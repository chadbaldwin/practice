[CmdletBinding()]
param (
    [Parameter()][int]$ThrottleLimit = 7,
    [Parameter(Mandatory)][int]$Operators # 2 includes + and *, 3 also includes concatenation
)

$sw = [diagnostics.stopwatch]::StartNew()

$data = gc ..\..\Input\2024-12-07.txt

function Decode-InputData {
    param (
        [Parameter(Mandatory,ValueFromPipeline)][string[]]$Line
    )

    process {
        [PSCustomObject]@{
            Result = $Line.Split(': ')[0]
            Numbers = $Line.Split(': ')[1].Split(' ')
            OriginalLine = $Line
        }
    }
}

<#
    This is still technically a brute force method with some bad branch elimination.
    Unfortunately, there's still a lot of steps and work done before it figures out
    that it's on a bad branch.

    Ideally, instead of restarting every time, it would be better to build this to work
    recursively so that when a bad path is reached, we can just break that branch and
    and continue onto the next branch at that same level without having to redo all that
    work.

    This way each level of the recursion, we can store a separate total, and when we
    reach a bad path, we just go back to that previous total and move onto the next
    operator.
#>

$result = $data | Decode-InputData | % -Parallel {
    $line = $_
    $operators = $using:Operators
    $numCount = $line.Numbers.Count
    $iterations = [Math]::Pow($operators,$numCount-1)-1

    #Write-Host "Working on: $($line.OriginalLine)"

    $badBranches = [ordered]@{}

    foreach ($iteration in 0..$iterations) {
        [double]$result = $null
        #[string]$equation = $null
        [string]$path = ''

        for ($i = 0; $i -lt $numCount; $i++) {
            $num = [int]$line.Numbers[$i]
            $oldPath = $path

            # init
            if ($i -eq 0) {
                $result = $num
                #$equation = "${num}"
                continue
            }

            $check = [Math]::Truncate(($iteration / [Math]::Pow($operators,$numCount-$i-1)) % $operators)
            switch ($check) {
                0 {
                    $result += $num
                    #$equation = "(${equation}) + ${num}"
                    $path += '+'
                }
                1 {
                    $result *= $num
                    #$equation = "(${equation}) * ${num}"
                    $path += '*'
                }
                2 {
                    $result = [double]"${result}${num}"
                    #$equation = "${equation}${num}"
                    $path += '|'
                }
            }

            if ($badBranches.Contains($path)) {
                #Write-Host "Skipping bad branch: $path"
                break
            }

            if ($result -gt $line.Result) {
                #Write-Host "Adding bad branch: ${path}"
                $badBranches.Add($path,$true)

                # If the next number is greater than 1, then we can assume that using multiplication would break as well
                if(($check -eq 0) -and ($num -gt 1) -and (!$badBranches.Contains("${oldPath}*"))) {
                    #Write-Host "Adding bad branch: ${oldPath}*"
                    $badBranches.Add("${oldPath}*", $true)
                }

                break
            }
        }

        if ($result -eq $line.Result) {
            [PSCustomObject]@{
                Result = $result
                #Equation = $equation
                Path = $path
            }
            break
        }
    }
} -ThrottleLimit $ThrottleLimit

$finalSum = $result.Result | Measure-Object -Sum

Write-Host "Sum of all results: $($finalSum.Sum)"

Write-Host "Time taken: $($sw.Elapsed)"