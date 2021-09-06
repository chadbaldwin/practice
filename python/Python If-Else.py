# HackerRank Challenge
# Name: Python If-Else
# Url: https://www.hackerrank.com/challenges/py-if-else/problem
'''
Notes:
  Things learned:
    Python
      * Between logic using multiple comparison operators
      * Else statement is not required for if-else statements
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
n = int(input().strip())

if n % 2 == 0:  # is even
    if 2 <= n <= 5:
        print('Not Weird')
    elif 6 <= n <= 20:
        print('Weird')
    elif n > 20:
        print('Not Weird')
else: # is odd
    print('Weird')