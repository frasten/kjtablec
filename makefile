all: clean yacc lex main

clean:
	rm -rf table-scanner.c table-parser.c table-parser.h kjtablec
#	rm -rf table-scanner.c table-scanner.h table-parser.c table-parser.h kjtablec

#gnu bison section: -d option is to generate table-parser.h header file
yacc:
	bison -d -o table-parser.c table-parser.y

#gnu flex section: --header-file=table-scanner.h is not needed since there are no calls to flex form main.c
lex:
	flex -o table-scanner.c table-scanner.l
#	flex -o table-scanner.c --header-file=table-scanner.h table-scanner.l

main:
	gcc main.c -o kjtablec table-scanner.c table-parser.c
