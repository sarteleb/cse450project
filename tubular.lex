%{
#include <string.h>
#include <cstdlib>
#include "tubular.tab.hh"


%}

TYPE            int
COMMAND         print
ID              [a-zA-Z_]+[a-zA-Z0-9_]*
STATIC_INT      [0-9]+
OPERATOR        "+"|"-"|"*"|"/"|"%"|"("|")"|"="|"+="|"-="|"*="|"/="|"%="
SEPARATOR       ","
ENDLINE         ";"
WHITESPACE      [ \t]
COMMENT         #[^\n]*
CCOMMENT        "/*"[.|\n]+"*/"
UNKNOWN         .

%%

{TYPE}          {return TYPE_NUM;}
{STATIC_INT}    {yylval.number = atoi(yytext); return NUMBER;}
{ID}            {yylval.lexeme = strdup(yytext); return ID;}
\n              return ENDLINE;
{WHITESPACE}    { }
{UNKNOWN}       {return yytext[0];}

%%

 
