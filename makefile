all: clean yacc lex main

clean:
	rm -rf table-scanner.c table-parser.c table-parser.h kjtablec

#gnu bison section: -d option is to generate table-parser.h header file
yacc:
	bison -d -o table-parser.c table-parser.y

lex:
	flex -o table-scanner.c table-scanner.l

main:
	gcc main.c -o kjtablec table-scanner.c table-parser.c
