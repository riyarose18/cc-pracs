%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int tempCount = 0;

void generate(char op, char *a1, char *a2, char *res) {
    char temp[5];
    sprintf(temp, "t%d", tempCount++);
    printf("%s = %s %c %s\n", temp, a1, op, a2);
    strcpy(res, temp);
}

int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }
%}

%union {
    char str[20];
}

%token <str> ID NUM
%type <str> E

%%
S : E { printf("\nFinal result stored in: %s\n", $1); }
  ;

E : E '+' E { generate('+', $1, $3, $$); }
  | E '-' E { generate('-', $1, $3, $$); }
  | E '*' E { generate('*', $1, $3, $$); }
  | E '/' E { generate('/', $1, $3, $$); }
  | ID      { strcpy($$, $1); }
  | NUM     { strcpy($$, $1); }
  ;
%%

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}
