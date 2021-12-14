<#
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
#>
##########################################################################
$target = 600851475143;
$t = $target;
$factor = 0;

while ($true) {
    for ($i = 2; $i -lt $t; $i++) {
        if ($t % $i -eq 0) {
            $factor = $i;
            break;
        }
    }
    if ($t % $factor -eq 0) {
        $t /= $factor
    } else {
        Write-Host "Prime Factor: $t"
        break;
    };
}