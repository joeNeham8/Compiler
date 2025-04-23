%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void yyerror(const char *s);
int yylex();

%}          
%union {double num;}
%token <num> NUMBER
%right UMINUS
%left '+''-'
%left '*''/'
%left '('')'
%type <num> expr

%%
input: /* empty*/| input line;
line: expr'\n' {printf("Result: %f\n", $1);}
expr: expr '+' expr {$$ = $1 + $3;} 
     | expr '-' expr {$$ = $1 - $3;}
     | expr '*' expr {$$ = $1 * $3;}
     | expr '/' expr { if($3 == 0){ printf("Error: division by zero! \n");
     $$ = 0;}
     else{ $$=$1 / $3;}}
     | '-' expr % prec UMINUS {$$= -$2;}
     | '(' expr ')' {$$ = $2;}
     | NUMBER {$$ = $1;}
%%
void yyerror(const char *s){
    fprintf(stderr,"Error: %s\n", s);
}     

int main(){
    print("Simple calculator (Ctrl + d to exit)\n");
    yyparse();
    return 0;
}
     
