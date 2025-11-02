%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%
input:
      /* empty */
    | input line
    ;

line:
      expr '\n'     { printf("Result = %d\n", $1); }
    | error '\n'    { printf("Invalid expression, try again!\n"); yyerrok; }
    ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { 
                          if ($3 == 0) { 
                              printf("Error: Division by zero!\n"); 
                              $$ = 0; 
                          } else { 
                              $$ = $1 / $3; 
                          }
                       }
    | '(' expr ')'    { $$ = $2; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | NUMBER
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter expressions (Ctrl+D to quit):\n");
    yyparse();
    return 0;
}
