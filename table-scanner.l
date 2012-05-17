%{
	/* code block */

	//yacc generated header
	#include "table-parser.h"
%}

/* Definitions Section */
%option noyywrap
blank		[ \t\n]
ws		 	{blank}+
letter		[A-Za-z]
digit		[0-9]
intconst	{digit}+
strconst	\"([^\"])*\”
boolconst	false|true
id			{letter}({letter}|{digit})*

%%

	/* Rules Section */
{ws}		;
int			{return(INTEGER);}
string 		{return(STRING);}
boolean	 	{return(BOOLEAN);}
{intconst}	{lexval.ival = atoi(yytext); return(INTCONST);}
{strconst} 	{lexval.sval = newstring(yytext); return(STRCONST);}
{boolconst} {lexval.ival = (yytext[0] == 'f' ? 0 : 1); return(BOOLCONST);}
{id} 		{lexval.sval = newstring(yytext); return(ID);}
=			{return(ASSIGN);}
,			{return(COMMA);}
;			{return(SEMICOLON);}
. 			{return(ERROR);}

%%

/* User Code Section */
