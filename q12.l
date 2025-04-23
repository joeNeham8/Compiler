%{
#include<stdio.h>

int line_count=0;
%}

%%

^.* {Printf("%d: %s\n",line_count++, yytext);}

%%

int main(int argc, char *argv[]){

  if(argc > 1){
  FILE *file = fopen(argv[1], "r");
  if(!file){
  perror("File connot be opened!"); 
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