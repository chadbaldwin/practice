# HackerRank Challenge
# Name: Utopian Identification Number
# Url: https://www.hackerrank.com/challenges/utopian-identification-number/problem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = r'^[a-z]{0,3}\d{2,8}[A-Z]{3,}'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    if re.match(regex_pattern, line):
        print('VALID')
    else:
        print('INVALID')