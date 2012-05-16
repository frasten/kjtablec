all: lex yacc main

lex:
	flex -o table-lexer.c table-lexer.l

yacc:
	bison -o table-parser.c table-parser.y

main:
	gcc main.c -o kjtablec table-lexer.c table-parser.c

clean:
	rm -rf table-lexer.c table-parser.c kjtablec
