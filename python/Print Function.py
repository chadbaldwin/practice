# HackerRank Challenge
# Name: Print Function
# Url: https://www.hackerrank.com/challenges/python-print/problem
'''
Notes:
  Things learned:
    Python
      * `sep` parameter on the print function for joining the provided strings
      * `range` type does not get auto squashed/joined by print, it needs to be enumerated/expanded
      * `*` operator to unpack enumerables - works sort of like powershell splatting, except that
        that it splats just the values. But `**` is truer to PS splatting, as it handles param names
'''
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
print(*range(1,int(input())+1), sep="")