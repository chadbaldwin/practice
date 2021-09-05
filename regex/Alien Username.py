# HackerRank Challenge
# Name: Alien Username
# Url: https://www.hackerrank.com/challenges/alien-username/problem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = fr'^[_\.]\d+[a-zA-Z]*_?$'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    if re.search(regex_pattern, line):
        print('VALID')
    else:
        print('INVALID')