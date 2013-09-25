~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
"tubular.lex" 24L, 402C written                                                                                                                                             









































<187 adriatic:~/450files/proj02 >make -f tubular.makefile
flex -o tubular.yy.cc tubular.lex
g++ -c tubular.yy.cc -o tubular.yy.o
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<188 adriatic:~/450files/proj02 >./tubular
Start!
3
Line Result = 3
3+5
Line Result = 8
^[[A^[[A^[[A^C
<189 adriatic:~/450files/proj02 >vim tubular.lex
%{
#include <string.h>
#include <cstdlib>
#include "tubular.tab.hh"


%}


TYPE            int
ID              [a-zA-Z_]+[a-zA-Z0-9_]*
STATIC_INT      [0-9]+
WHITESPACE      [ \t]
UNKNOWN         .
%%

{TYPE}          {return TYPE_NUM;}
{STATIC_INT}    {yylval.number = atoi(yytext); return NUMBER;}
{ID}            {yylval.lexeme = strdup(yytext); return ID;}
\n              return ENDLINE;
{WHITESPACE}    { }
{UNKNOWN}       {return yytext[0];}

%%

~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
"tubular.lex" 25L, 420C written                                                                                                                                             









































<190 adriatic:~/450files/proj02 >make -f tubular.makefile
flex -o tubular.yy.cc tubular.lex
g++ -c tubular.yy.cc -o tubular.yy.o
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<191 adriatic:~/450files/proj02 >./tubular
Start!
3
Line Result = 3
3+5
Line Result = 8
^C
<192 adriatic:~/450files/proj02 >vim tubular.lex
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

~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
"tubular.lex" 31L, 610C written                                                                                                                                             









































<193 adriatic:~/450files/proj02 >make -f tubular.makefile
flex -o tubular.yy.cc tubular.lex
g++ -c tubular.yy.cc -o tubular.yy.o
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<194 adriatic:~/450files/proj02 >./tubular
Start!
3
Line Result = 3
3+5
Line Result = 8
int x = 3
x+5
Line Result = 8
int var1
var1 = 3
var1 - 3
Line Result = 0
^C
<195 adriatic:~/450files/proj02 >vim tubular.lex
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

~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
"tubular.lex" 31L, 610C written









































<196 adriatic:~/450files/proj02 >./tubular
Start!
3*3
Line Result = 9
3+2*5
Line Result = 13
3+2/1^H
Input match failed!
<197 adriatic:~/450files/proj02 >./tubular
Start!
3+10/5
Line Result = 5
3+(0+1)
Line Result = 4
3*(2+2)
Line Result = 12
-3+3
Line Result = 0
-5
Line Result = -5
3
Line Result = 3
-5+3
Line Result = -2
.
Input match failed!
<198 adriatic:~/450files/proj02 >vim tubular.lex
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

~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
~                                                                                                                                                                                             
"tubular.lex" 31L, 610C written









































<199 adriatic:~/450files/proj02 >vim tubular.y
%{
#include <iostream>
#include <map>
#include <string>
using namespace std;
void yyerror(char * err_string)
  { cerr << "Input match failed!" << endl; }
extern int yylex();

map<string, int> id_map;
%}

%union {
  char * lexeme;
  int number;
}

%left '+' '-'
%left '*' '/'

%token <lexeme> ID
%token <number> NUMBER
%token ENDLINE TYPE_NUM
%type <number> expr

%%

program:   program statement
           | { cout << "Start!" << endl; }

statement: expr ENDLINE { cout << "Line Result = " << $1 << endl; }
           | TYPE_NUM ID ENDLINE {
                if (id_map.find($2) != id_map.end()) {
                   cout << "ERROR: variable '" << $2 << "' already defined." << endl;
                   exit(1);
                }
                id_map[$2]=0; }
           | TYPE_NUM ID '=' expr ENDLINE {
                if (id_map.find($2) != id_map.end()) {
                   cout << "ERROR: variable '" << $2 << "' already defined." << endl;
                   exit(1);
                }
                 id_map[$2]=$4; }
           | ID '=' expr ENDLINE {
                if (id_map.find($1) == id_map.end()) {
                   cout << "ERROR: variable '" << $1 << "' not defined." << endl;
                   exit(1);
                }
                id_map[$1] = $3; }

expr:      expr '+' expr { $$ = $1 + $3; }
           | expr '-' expr { $$ = $1 - $3; }
           | expr '*' expr { $$ = $1 * $3; }
           | expr '/' expr { $$ = $1 / $3; }
           | '(' expr ')' { $$ = $2; }
           | '-' expr { $$ = -$2; }
           | ID {
                if (id_map.find($1) == id_map.end()) {
                   cout << "ERROR: variable '" << $1 << "' not defined." << endl;
                   exit(1);
                }
                $$ = id_map[$1]; }
           | NUMBER     { $$ = $1; };

%%
                                                                                                                                                     1,1           Top
