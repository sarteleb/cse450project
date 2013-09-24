%{
#include <iostream>
#include <fstream>
#include "tubular.tab.hh"
 
using namespace std;
 
unsigned line_count = 0;
%}
 
%option c++ noyywrap
 
/* Definitions for all regular expressions */
TYPE            int
COMMAND         print
ID              [a-zA-Z_]+[a-zA-Z0-9_]*
STATIC_INT      [0-9]+
OPERATOR        "+"|"-"|"*"|"/"|"%"|"("|")"|"="|"+="|"-="|"*="|"/="|"%="
SEPARATOR       ","
ENDLINE         ";"
WHITESPACE      [ \t\n]
COMMENT         #[^\n]*
CCOMMENT        "/*"[.|\n]+"*/"
UNKNOWN         .
%%
 
\n              { line_count++; }
{CCOMMENT}      { std::cout << "CCOMMENT detected" << std::endl;}
{TYPE}          { std::cout << "TYPE: " << yytext << std::endl; }
{COMMAND}       { std::cout << "COMMAND: " << yytext << std::endl; }
{ID}            { std::cout << "ID: " << yytext << std::endl; }
{STATIC_INT}    { std::cout << "STATIC_INT: " << yytext << std::endl; }
{OPERATOR}      { std::cout << "OPERATOR: " << yytext << std::endl; }
{SEPARATOR}     { std::cout << "SEPARATOR: " << yytext << std::endl; }
{ENDLINE}       { std::cout << "ENDLINE: " << yytext << std::endl; }
{WHITESPACE}    { }
{COMMENT}       { }
{UNKNOWN}       { std::cout << "UNKNOWN: " << yytext << std::endl; exit(3); }
%%
 
/*main(int argc, char * argv[])
{
  // Check for correct number of command line arguments
  if (argc != 2) {
    cerr << "ERROR: Need source file" << endl;
    exit(1);
  }
 
  ifstream inFile(argv[1]);
 
  // Check for bad file
  if (!inFile.good()) {
    cerr << "ERROR: Cannot open " << argv[1] << ". Try again" << endl;
    exit(2);
  }
 
  FlexLexer * lexer = new yyFlexLexer(&inFile);
  lexer->yylex();
  cout << "Line Count: " << line_count << endl;
}
 
*/
 
