// Design a lexical analyzer for given language and the lexical analyzer should ignore redundant spaces, 
// tabs and new lines. It should also ignore comments. Although the syntax specification states that 
// identifiers can be arbitrarily long, you may restrict the length to some reasonable value. 

%{
#include <stdio.h>
%}

%%
"if"            { printf("KEYWORD: if\n"); }
"else"          { printf("KEYWORD: else\n"); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+          { printf("NUMBER: %s\n", yytext); }
"="             { printf("ASSIGNMENT OPERATOR: =\n"); }
"+"             { printf("PLUS OPERATOR: +\n"); }
"-"             { printf("MINUS OPERATOR: -\n"); }
[ \t\n]+        ; // Ignore whitespace
.               { printf("UNKNOWN CHARACTER: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
