THIS PROGRAM IS LICENSED UNDER GNU GPLv3 LICENSE.

AUTHOR: Marco Romano (https://github.com/julioromano/kjtablec)

"Building a compiler for the Table language"

First we look at the grammar BNF for the langauge's terminals (those in bold) and we add them in the parser's %token variable to be fed to the scanner.

As a general rule, single character terminals (e.g. ';') are not tokenized but are turned as is. As long as they're in the ASCII table there won't be any clashes in the coding.

Then we specify the scanner: we need to generate the lex header file and include it in the parser in order for it to access the scanner's shared variables and interfaces.

The binary or unary of operator '- is decided by the parser, the token returned by the scanner is always the same.
