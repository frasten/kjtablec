all: clean yacc lex main

clean:
	rm -rf src/table-scanner.c src/table-scanner.h src/table-parser.c src/table-parser.h bin/kjtablec

#gnu bison section: -d option is to generate table-parser.h header file
yacc:
	bison -d -o src/table-parser.c src/table-parser.y

lex:
	flex -o src/table-scanner.c --header-file=src/table-scanner.h src/table-scanner.l

main:
	gcc -o bin/kjtablec src/table-parser.c src/table-scanner.c src/main.c 
