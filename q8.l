// Write a Lex program to count number of vowels and consonants in a given input string. 

%{
#include<stdio.h>

int vowels = 0;
int consonants = 0;
%}
%%
[aeiouAEIOU] {vowels++;}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {consonants++;}
.|\n { }

%%

int main(){
    printf("Enter the sentence: \n");
    yylex();

    printf("Ananlysis Results: \n");
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n",consonants);

    return 0;
}
int yywrap(){
    return 1;
}

