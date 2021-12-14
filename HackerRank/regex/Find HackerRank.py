# HackerRank Challenge
# Name: Find HackerRank
# Url: https://www.hackerrank.com/challenges/find-hackerrank/problem
# Notes:
#   This proved to be tougher than expected due to the solution counting
#   a string of 'hackerrank' to be starting with and ending with. This made
#   it hard to find a solution using only a single regex string.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Print  1 if the conversation starts with hackerrank
# Print  2 if the conversation ends with hackerrank
# Print  0 if the conversation starts and ends with hackerrank
# Print -1 if none of the above.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

# make .* lazy using ? so the second capture group works
regex_pattern = r'^(hackerrank)?.*?(hackerrank)?$'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    results = re.match(regex_pattern, line)
    if (results[1] and results[2]) or re.match(r'^hackerrank$', line): # starts with, ends with, equal to
        print(0)
    elif results[1]: # starts with
        print(1)
    elif results[2]: # ends with
        print(2)
    else:
        print(-1)