
%%

{TYPE}                  {return TYPE_NUM;}
{STATIC_INT}            {yylval.number = atoi(yytext); return NUMBER;}
{ID}                    {yylval.lexeme = strdup(yytext); return ID;}
{PLUS_EQUAL}            {return CASSIGN_ADD;}
{MINUS_EQUAL}           {return CASSIGN_SUB;}
{MULTIPLY_EQUAL}        {return CASSIGN_MUL;}
{DIVIDE_EQUAL}          {return CASSIGN_DIV;}
{MODULO_EQUAL}          {return CASSIGN_MOD;}
\n                      return ENDLINE;
{WHITESPACE}            { }
{UNKNOWN}               {return yytext[0];}

%%

"tubular.lex" 41L, 883C written                                                                                                                                             









































<352 adriatic:~/450files/proj02 >vim tubular.y
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
%token CASSIGN_ADD, CASSIGN_SUB, CASSIGN_MUL, CASSIGN_DIV, CASSIGN_MOD



%type <number> expr

%%

program:   program statement
           | { cout << "Start!" << endl; }

statement: expr ENDLINE { cout << "Line Result = " << $1 << endl; }
           | TYPE_NUM ID ENDLINE {
%token <number> NUMBER
%token ENDLINE TYPE_NUM
%token CASSIGN_ADD, CASSIGN_SUB, CASSIGN_MUL, CASSIGN_DIV, CASSIGN_MOD



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
           | expr '%' expr { $$ = $1 % $3; }
           | '(' expr ')' { $$ = $2; }
           | '-' expr { $$ = -$2; }
           | ID CASSIGN_ADD expr { $$ = id_map[$1] + $3; id_map[$1] = $$;}
           | ID CASSIGN_SUB expr { $$ = id_map[$1] - $3; id_map[$1] = $$;}
           | ID CASSIGN_MUL expr { $$ = id_map[$1] * $3; id_map[$1] = $$;}
           | ID CASSIGN_DIV expr { $$ = id_map[$1] / $3; id_map[$1] = $$;}
           | ID CASSIGN_MOD expr { $$ = id_map[$1] % $3; id_map[$1] = $$;}
           | ID {
                if (id_map.find($1) == id_map.end()) {
                   cout << "ERROR: variable '" << $1 << "' not defined." << endl;
                   exit(1);
                }

"tubular.y" 81L, 1964C written                                                                                                                                              









































<353 adriatic:~/450files/proj02 >make -f tubular.makefile
bison -o tubular.tab.cc -b tubular -d tubular.y
tubular.y:24.19: warning: stray `,' treated as white space
tubular.y:24.32: warning: stray `,' treated as white space
tubular.y:24.45: warning: stray `,' treated as white space
tubular.y:24.58: warning: stray `,' treated as white space
tubular.y: conflicts: 35 shift/reduce
g++ -c tubular.tab.cc -o tubular.tab.o
tubular.tab.cc: In function 'int yyparse()':
tubular.tab.cc:1609:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
tubular.tab.cc:1751:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
flex -o tubular.yy.cc tubular.lex
g++ -c tubular.yy.cc -o tubular.yy.o
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<354 adriatic:~/450files/proj02 >vim tubular.y
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
%token CASSIGN_ADD CASSIGN_SUB CASSIGN_MUL CASSIGN_DIV CASSIGN_MOD



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
"tubular.y" 81L, 1960C written









































<355 adriatic:~/450files/proj02 >make -f tubular.makefile
bison -o tubular.tab.cc -b tubular -d tubular.y
tubular.y: conflicts: 35 shift/reduce
g++ -c tubular.tab.cc -o tubular.tab.o
tubular.tab.cc: In function 'int yyparse()':
tubular.tab.cc:1609:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
tubular.tab.cc:1751:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<356 adriatic:~/450files/proj02 >./tubular
Start!
int x = 3
3*=3
Input match failed!
<357 adriatic:~/450files/proj02 >./tubular
Start!
int x = 3
3+=3
Input match failed!
<358 adriatic:~/450files/proj02 >vim tubular.y
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
%token CASSIGN_ADD, CASSIGN_SUB, CASSIGN_MUL, CASSIGN_DIV, CASSIGN_MOD



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
           | expr '%' expr { $$ = $1 % $3; }
           | '(' expr ')' { $$ = $2; }
           | '-' expr { $$ = -$2; }
           | ID CASSIGN_ADD expr { $$ = id_map[$1] + $3; id_map[$1] = $$;}
           | ID CASSIGN_SUB expr { $$ = id_map[$1] - $3; id_map[$1] = $$;}
           | ID CASSIGN_MUL expr { $$ = id_map[$1] * $3; id_map[$1] = $$;}
           | ID CASSIGN_DIV expr { $$ = id_map[$1] / $3; id_map[$1] = $$;}
           | ID CASSIGN_MOD expr { $$ = id_map[$1] % $3; id_map[$1] = $$;}
           | ID {
                if (id_map.find($1) == id_map.end()) {
                   cout << "ERROR: variable '" << $1 << "' not defined." << endl;
                   exit(1);
                }

                $$ = id_map[$1]; }
           | NUMBER     { $$ = $1; };


%%
"tubular.y" 81L, 1964C written                                                                                                                                              









































<359 adriatic:~/450files/proj02 >make -f tubular.makefile
bison -o tubular.tab.cc -b tubular -d tubular.y
tubular.y:24.19: warning: stray `,' treated as white space
tubular.y:24.32: warning: stray `,' treated as white space
tubular.y:24.45: warning: stray `,' treated as white space
tubular.y:24.58: warning: stray `,' treated as white space
tubular.y: conflicts: 35 shift/reduce
g++ -c tubular.tab.cc -o tubular.tab.o
tubular.tab.cc: In function 'int yyparse()':
tubular.tab.cc:1609:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
tubular.tab.cc:1751:35: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
g++ -o tubular tubular.tab.o tubular.yy.o -ll -ly
<360 adriatic:~/450files/proj02 >./tubular
Start!
int x = 3 
x+=3
Line Result = 6
x-=3
Line Result = 3
x*=3
Line Result = 9
x-9
Line Result = 0
x%=3
Line Result = 0
3%3
Line Result = 0
2%3
Line Result = 2
^C
<361 adriatic:~/450files/proj02 >vim tubular.lex
%{
#include <string.h>
#include <cstdlib>
#include "tubular.tab.hh"


%}

TYPE            int
COMMAND         print
ID              [a-zA-Z_]+[a-zA-Z0-9_]*
STATIC_INT      [0-9]+
OPERATOR        "+"|"-"|"*"|"/"|"%"|"("|")"|"*="|"/="|"%="|"="
SEPARATOR       ","
ENDLINE         ";"
WHITESPACE      [ \t]
COMMENT         #[^\n]*
CCOMMENT        "/*"[.|\n]+"*/"
PLUS_EQUAL      "+="
MINUS_EQUAL     "-="
MULTIPLY_EQUAL  "*="
DIVIDE_EQUAL    "/="
MODULO_EQUAL    "%="
UNKNOWN         .

%%

{TYPE}                  {return TYPE_NUM;}
{STATIC_INT}            {yylval.number = atoi(yytext); return NUMBER;}
{ID}                    {yylval.lexeme = strdup(yytext); return ID;}
{PLUS_EQUAL}            {return CASSIGN_ADD;}
{MINUS_EQUAL}           {return CASSIGN_SUB;}
{MULTIPLY_EQUAL}        {return CASSIGN_MUL;}
{DIVIDE_EQUAL}          {return CASSIGN_DIV;}
{MODULO_EQUAL}          {return CASSIGN_MOD;}
\n                      return ENDLINE;
{WHITESPACE}            { }
{UNKNOWN}               {return yytext[0];}

%%

"tubular.lex" 41L, 883Cc                                                                                                                                                    1,1           All

