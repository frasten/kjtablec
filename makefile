all: lex yacc main

lex:
	flex -o table-lexer.c --header-file=table-lexer.h table-lexer.l

yacc:
	bison -o table-parser.c table-parser.y

main:
	gcc main.c -o kjtablec table-lexer.c table-parser.c

clean:
	rm -rf table-lexer.c table-lexer.h table-parser.c kjtablec
