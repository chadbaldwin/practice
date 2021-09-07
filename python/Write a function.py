# HackerRank Challenge
# Name: Write a function
# Url: https://www.hackerrank.com/challenges/write-a-function/problem
'''
Notes:
  Things learned:
    Python
      * How to create and call a function
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
def is_leap(year):
    leap = False
    
    if year % 400 == 0:
        return True
    elif year % 100 == 0:
        return False
    elif year % 4 == 0:
        return True

    return leap

year = int(input())
print(is_leap(year))