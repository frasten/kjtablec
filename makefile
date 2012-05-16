all: lex yacc source

source:
	gcc main.c -o kjtablec table-lexer.c table-parser.c

yacc:
	bison -o table-parser.c table.yacc

lex:
	flex -o table-lexer.c table.lex

clean:
	rm -rf table-lexer.c table-parser.c kjtablec
	