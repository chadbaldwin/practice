# HackerRank Challenge
# Name: Detect the Email Addresses
# Url: https://www.hackerrank.com/challenges/detect-the-email-addresses/problem
'''
Notes:
  Things learned:
    Python
      * Converting a list to a set changes order
      * Inline sorting function `sorted()` vs inplace sorting `list.sort()`
      * Multi-line comments using an unassigned here string
      * Joining a list of strings using `'separator'.join(list_of_strings)`
      * Treating for loop as a classical forloop using range function
      * Dumping objects to JSON using json library and `json.dumps()`
      * Explicit type conversion using `int()`, `set()`
      * items of type `set` cannot be dumped via json because an equivalent datatype does not exist
    Regex
      * Non-capturing groups using (?:asdf)
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = r'\w+(?:\.\w+){0,}@\w+(?:\.\w+){1,}'

input = sys.stdin

linecount = int(next(input)) # advance the reader to skip first line

results = []

for x in range(0, linecount):
    results += re.findall(regex_pattern, next(input))

print(';'.join(sorted(set(results))))