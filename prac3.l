%{
#include <stdio.h>
int wc = 0;
%}

%%
([Aa][a-zA-Z]*)[ \t\n]   { wc++; }
[A-Za-z]+[ \t\n]         {}
[ \t\n]+                 {}
.                        {}
%%

int main() {
    printf("Enter text:\n");
    yylex();
    printf("\nTotal number of words starting with A or a: %d\n", wc);
    return 0;
}

int yywrap() {
    return 1;
}
