all: lex yacc main

lex:
	flex -o table-scanner.c --header-file=table-scanner.h table-scanner.l

yacc:
	bison -o table-parser.c table-parser.y

main:
	gcc main.c -o kjtablec table-scanner.c table-parser.c

clean:
	rm -rf table-scanner.c table-scanner.h table-parser.c kjtablec
