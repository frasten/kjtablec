#define INT 257
#define STR 258
#define BOOL 259
#define INTCONST 260
#define STRCONST 261
#define BOOLCONST 262
#define ID 263
#define ASSIGN 264
#define COMMA 265
#define SEMICOLON 266
#define ERROR 267

typedef union {
	int ival; char *sval;
} Lexval;
