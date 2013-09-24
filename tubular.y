/******* tubular.y *******/
 
%{
#include <iostream>
using namespace std;
void yyerror(char * err_string)
  { cerr << "Input match failed!" << endl; }
extern int yylex();
%}
 
%union {
  char * lexeme;
}
 
%token <lexeme> NUMBER ID
 
%%
 
statement: num_entry
           | char_entry
           | { cout << "This is our empty program." << endl; };
 
num_entry: num_entry NUMBER {cout << "NUMBER: " << $2 << endl;}
           | NUMBER {cout << "SOLO NUMBER: " << $1 << endl;};
 
char_entry: ID char_entry { cout << "ID!!" << endl; }
            | ID { cout << "SOLO ID!!" << endl; };
 
%%
 
main() { yyparse(); }
 
