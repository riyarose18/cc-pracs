%{
#include <stdio.h>
%}
%%
.*com$   { printf("Line ends with 'com': %s", yytext); }
.*       { /* Ignore other lines */ }
%%
int main() {
    yylex();
    return 0;
}
