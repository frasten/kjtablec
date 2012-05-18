THIS PROGRAM IS LICENSED UNDER GNU GPLv3 LICENSE.

AUTHOR: Marco Romano (https://github.com/julioromano/kjtablec)

"Building a compiler for the Table language"

First we look at the grammar EBNF for the langauge's terminals (those in bold) to be first defined as integer constants in table-def.h to be fed to the scanner.

As a general rule, single character terminals (e.g. ';') are not tokenized but are turned as is. As long as they're in the ASCII table there won't be any clashes in the coding.

Then we specify the scanner: we need to generate the lex header file in order for main.c to access the scanner's shared variables.

The binary or unary of operator - is decided by the parser, the token returned by the scanner is always the same.
