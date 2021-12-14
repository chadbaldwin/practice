<#
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
#>
##########################################################################

$list = 999..100;

function Compare-Palindrome {
    param (
        [string]$String
    )

    # Convert to string and split to array
    $RevString = $String -split '';

    # Reverse char array
    [array]::Reverse($RevString);

    # Convert array back into string
    $RevString = $RevString -join '';

    return $String -eq $RevString
}

$answer = 0;
ForEach ($i in $list) {
    ForEach ($j in $list) {
        # Find the product
        $product = $i * $j;

        # Skip if too small
        if ($product -lt $answer) { break; }

        # Check if palindrome
        if (Compare-Palindrome -String $product) {
            if ($product -gt $answer) {
                $answer = $product 
                Write-Host "Palindrome: $i x $j = $product"
            }
        }
    }
}