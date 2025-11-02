%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}
%token FOR ID NUM
%token LE GE EQ
%token INC DEC   /* tokens for ++ and -- */
%%
stmt: FOR '(' init ';' cond ';' step ')' 
        { printf("Valid FOR loop statement\n"); }
    ;
init: ID '=' NUM
    | ID '=' ID
    ;
cond: ID '<' NUM
    | ID '>' NUM
    | ID LE NUM
    | ID GE NUM
    | ID EQ NUM
    ;
step: ID INC
    | ID DEC
    | ID '=' ID '+' NUM
    | ID '=' ID '-' NUM
    ;
%%
int main() {
    printf("Enter a FOR loop statement:\n");
    yyparse();
    return 0;
}
int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
