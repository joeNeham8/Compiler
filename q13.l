


%{
#include <stdio.h>
int comment_lines = 0;
FILE *out;
%}

%%

"//".* {
    comment_lines++;
    // Don’t copy this to output
}

"/*"([^*]|\*+[^*/])*"*"+"/" {
    // Count newlines inside multiline comment
    for (int i = 0; yytext[i] != '\0'; i++) {
        if (yytext[i] == '\n') comment_lines++;
    }
    // Don't copy to output
}

.|\n {
    // Copy all other characters to output
    fputc(yytext[0], out);
}

%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s input.c output.c\n", argv[0]);
        return 1;
    }

    FILE *in = fopen(argv[1], "r");
    if (!in) {
        perror("Error opening input file");
        return 1;
    }

    out = fopen(argv[2], "w");
    if (!out) {
        perror("Error opening output file");
        fclose(in);
        return 1;
    }

    yyin = in;
    yylex();  // Start lexical analysis

    printf("Total comment lines removed: %d\n", comment_lines);

    fclose(in);
    fclose(out);
    return 0;
}

int yywrap() {
    return 1;
}







