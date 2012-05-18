/* The lexval variable, holds attributes relative to the current token scanned by the lexer. Its content must be handled timely by the parser or will be lost and replaced with the next tokens' one. */
typedef union {
	int ival; char *sval;
} Lexval;
