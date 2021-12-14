# HackerRank Challenge
# Name: IP Address Validation
# Url: https://www.hackerrank.com/challenges/ip-address-validation/problem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

ipv4_part = '[0-2]?\d?\d' # 0-299 range for brevity
ipv6_part = '[\da-fA-F]{1,4}' # 0-FFFF range

regex_ipv4 = fr'^({ipv4_part}\.){{3}}{ipv4_part}$'
regex_ipv6 = fr'^({ipv6_part}:){{7}}{ipv6_part}$'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    if re.search(regex_ipv4, line):
        print('IPv4')
    elif re.search(regex_ipv6, line):
        print('IPv6')
    else:
        print('Neither')