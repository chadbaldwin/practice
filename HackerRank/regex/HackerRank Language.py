# HackerRank Challenge
# Name: HackerRank Language
# Url: https://www.hackerrank.com/challenges/hackerrank-language/problem
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
import re
import sys

regex_pattern = r'^\d+ (C|CPP|JAVA|PYTHON|PERL|PHP|RUBY|CSHARP|HASKELL|CLOJURE|BASH|SCALA|ERLANG|CLISP|LUA|BRAINFUCK|JAVASCRIPT|GO|D|OCAML|R|PASCAL|SBCL|DART|GROOVY|OBJECTIVEC)$'

input = sys.stdin

next(input) # advance the reader to skip first line

for line in input:
    if re.match(regex_pattern, line):
        print('VALID')
    else:
        print('INVALID')