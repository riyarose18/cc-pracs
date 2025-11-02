%{
#include <stdio.h>
#include <ctype.h>
%}
%%
[a-z]   { printf("%c", toupper(yytext[0])); }
[A-Z]   { printf("%c", tolower(yytext[0])); }
.|\n    { printf("%s", yytext); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
