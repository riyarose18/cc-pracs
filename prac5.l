%{
#include <stdio.h>
#include <stdlib.h> // for atoi()
%}
%%
[0-9]+    {
             int num = atoi(yytext);       // Convert string to integer
             printf("%X ", num);           // Print in hexadecimal (uppercase)
          }
[ \t\n]+  ;
.         ;
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
