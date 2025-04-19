// Create a Lexer to take input from text file and count no of characters, no. of lines & no. of words.  

%{

#include<stdio.h>

int char_count = 0;
int word_count = 0;
int line_count = 0;
FILE *fp;
%}

%%
[ \t]+ {char_count += yyleng;}
\n {char_count++; line_count++;}
[a-zA-Z0-9_]+ {char_count += yyleng; word_count++;}
. {char_count++;}
%%
int yywrap() {
    return 1; // Default implementation of yywrap
}
int main(int argc, char *argv[]){
    if(argc < 2){
        printf("Usage: %s q7.text\n", argv[0]);
        return 1;
    }
    FILE *fp= fopen(argv[1], "r");
    if(!fp){
        printf("Error opening file %s\n", argv[1]);
        return 1;
    }
    yyin = fp;
    yylex();
    fclose(fp);
    printf("Finale statistics: \n");
    printf("Characters: %d\n", char_count);
    printf("Words: %d\n", word_count);
    printf("Lines %d\n", line_count);
    return 0;
}