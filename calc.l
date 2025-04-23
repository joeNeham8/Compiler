%{
#include<stdio.h>
#include<stdlib.h>
#include "calc.tab.h"

void yyerror(const char *s);

%}

%%

[0-9]+(.[0-9]+)? {yylval.num atof(yytext); return NUMBER;}
[+\-*/()] {return yytext[0];}
\n {return '\n';}
[\t] {/* Ignore whitesppaces*/}
. {printf("Invalid character: %s\n", yytext);}

%%

int yywrap(){
    return 1;
}