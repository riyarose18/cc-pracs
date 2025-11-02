%{
#include <stdio.h>
#include <string.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int word_count = 0;
int line_count = 0;
int space_count = 0;

char *keywords[] = {
    "int", "float", "if", "else", "while", "for", "return", "void", "char", "double", "do", "switch", "case", "break", "continue", NULL
};

int is_keyword(const char *str) {
    for (int i = 0; keywords[i] != NULL; i++) {
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

"/*"([^*]*|\*+[^*/])*"*"+"/"    { comment_count++; }

[a-zA-Z_][a-zA-Z0-9_]*          {
                                  if (is_keyword(yytext))
                                    keyword_count++;
                                  else
                                    identifier_count++;
                                  word_count++;
                                }

[ \t]+                          { space_count += yyleng; }

\n                              { line_count++; }

.                               { word_count++; }

%%

int main() {
    yylex();
    printf("\n--- Code Statistics ---\n");
    printf("Lines: %d\n", line_count);
    printf("Comments: %d\n", comment_count);
    printf("Keywords: %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Words: %d\n", word_count);
    printf("Spaces: %d\n", space_count);
    return 0;
}

int yywrap() { return 1; }
