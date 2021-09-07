# HackerRank Challenge
# Name: Write a function
# Url: https://www.hackerrank.com/challenges/write-a-function/problem
'''
Notes:
  Things learned:
    Python
      * `map()` function - similar to `list()` and `set()` but it allows for running a function for
        each item. Not sure what use a `map` type is once the function has been run.
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
n = int(input())
r = map(int, input().split())
print(sorted(set(r), reverse=True)[1])