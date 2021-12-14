# HackerRank Challenge
# Name: Split the Phone Numbers
# Url: https://www.hackerrank.com/challenges/split-number/problem
'''
Notes:
  Things learned:
    Python
      * `re.match()` returns a list of matches
      * `re.findall()` returns a list of tuples
    Regex
      * Using backreferences to enforce a common delimiter
      * Non-capturing groups cannot be referenced by a backreference
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = r'(\d{1,3})([\- ])(\d{1,3})\2(\d{4,10})'

input = sys.stdin

linecount = int(next(input)) # advance the reader to skip first line

for x in range(0, linecount):
    matches = re.match(regex_pattern, next(input))
    if matches:
        print(f'CountryCode={matches[1]},LocalAreaCode={matches[3]},Number={matches[4]}')
