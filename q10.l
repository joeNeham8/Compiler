// Write a Lex program to print out all numbers from the given file. 

%{
#include<stdio.h>
%}

%%

[0-9]+(\.[0-9]+)? {printf("Number found: %s\n", yytext);}
.|\n {}

%%

int main(int argc, char *argv[]){
if(argc > 1){
FILE *file= fopen(argv[1],"r");
 if(!file){
  perror("Cannot open file");
return 1;
}
yyin = file;

}
yylex();
return 0;
}

int yywrap(){
    return 1;
}