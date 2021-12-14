<#
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
#>
##########################################################################
# First attempt
    $target = 1000; $f1 = 3; $f2 = 5;
    1..($target-1) |
        ? {
            ($_ % $f1 -eq 0) -or ($_ % $f2 -eq 0)
        } | measure -Sum

# Something more scalable, works from a list of factors to check
    $target = 1000; $f1 = 3; $f2 = 5;
    1..($target-1) |
        ? {
            $x = $_;
            $f1,$f2 | ? { $x % $_ -eq 0 }
        } | measure -Sum
##########################################################################

##########################################################################
# Third attempt after learning the formula

# Explanation: Using a formula, calculate the sum of all factors of 3, and then of 5.
# But then you are double counting all factors of (3 * 5), so you need to separately
# find the sum of all factors of (3 * 5), and subtract it.

    function Get-SumOfNumbersWithFactor {
        param (
            [double]$MaxValue,
            [double]$Factor
        )
        $p = [math]::Floor(($MaxValue-1)/$Factor);
        $Factor * ($p * ($p + 1)) / 2
    }

    $f1 = Get-SumOfNumbersWithFactor -MaxValue 1000 -Factor 3;
    $f2 = Get-SumOfNumbersWithFactor -MaxValue 1000 -Factor 5;
    $f3 = Get-SumOfNumbersWithFactor -MaxValue 1000 -Factor 15;

    ($f1 + $f2) - $f3;
##########################################################################
# Trying to figure out how it would work for 3 numbers instead of just 2 #
##########################################################################
$target = 130;
$f1 = 3; $f2 = 5; $f3 = 8;

$answer = (1..($target-1) | ? { $x = $_; $f1,$f2,$f3 | ? { $x % $_ -eq 0 } } | measure -Sum).Sum;
$answer # 4531

1..($target-1) | ? { $x = $_; $f1,$f2,$f3 | ? { $x % $_ -eq 0 } } |
    % { Write-Host "$_|$($_ % $f1 -eq 0)|$($_ % $f2 -eq 0)|$($_ % $f3 -eq 0)" }
##########################################################################
# Calculate factor sums
$s1 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor $f1;
$s2 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor $f2;
$s3 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor $f3;
# Add them together
$sum = $s1 + $s2 + $s3;
# Output the sum
$sum;
##########################################################################
# Calculate product of sums
$r1 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor ($f1*$f2);
$r2 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor ($f1*$f3);

$r3 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor ($f2*$f3);

$r4 = Get-SumOfNumbersWithFactor -MaxValue $target -Factor ($f1*$f2*$f3);
##########################################################################
$rlist = 0,$r1,$r2,$r3,$r4
ForEach ($w in $rlist) {
    ForEach ($x in $rlist) {
        ForEach ($y in $rlist) {
            ForEach ($z in $rlist) {
                if ($sum - ($w+$x+$y+$z) -eq $answer) {
                    Write-Host "$sum - ($w+$x+$y+$z) -eq $answer"
                }
            }
        }
    }
}

# In order to count 3 numbers, you need to find the sum for factors x, y, z
# Add the sums together
# Then subtract the sum of the factors x*y, y*z, x*z
# However, this will also remove all instances of z*y*z, so that needs to be re-added
# So the answer is { sum - (x*y + y*z + x*z) + x*y*z }

# To go beyond 3 numbers, it gets exponentially harder, as there are more combinations
# of sums that double count, but also double remove when you do the subtraction.
# So to continue going higher with more factors, some sort of algorithm or formula would
# need to be used.
##########################################################################