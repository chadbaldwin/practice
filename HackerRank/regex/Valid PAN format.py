# HackerRank Challenge
# Name: Valid PAN format
# Url: https://www.hackerrank.com/challenges/valid-pan-format/problem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = r'^[A-Z]{5}\d{4}[A-Z]$'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    if re.match(regex_pattern, line):
        print('YES')
    else:
        print('NO')