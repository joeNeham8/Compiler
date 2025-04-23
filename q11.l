%{
#include<stdio.h>
%}

%%
\<[^>]+\ > {printf("HTML Tags: %s \n ", yytext);}
.|\n {}

%%

int main(int argc, char *argv[]){
   if(argc > 1){
  FILE *file = fopen(argv[1],"r");
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




///





%{
#include<stdio.h>
int comment_line =0;
FILE *outfile;

%}

%%

"//".* {comment_line++;}
"/\*".*"*/" {comment_line++;}
.|\n {fputc(yytext[0], outfile);}
%%

int main(int argc, char *argv[]){
  if(argc < 3){
printf("Usage: %s <input c file><output c file>\n", argv[0]);
return 1;
}
FILE *file = fopen(argv[1],"r");
if(!file){
perror("Error opening input file..");
return 1;
}

outfile = fopen(argv[2],"w");
  if(!outfile){
perror("Error opening output file..");
return 1;
}

yyin = file;
yylex();

fclose(file);
fclose(outfile);

printf("Total commented lines removed: %d \n", comment_line);
return 0;
}

int yywrap(){
return 1;
}