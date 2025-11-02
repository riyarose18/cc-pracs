%{
#include "y.tab.h"
%}

%%
[0-9]+       { strcpy(yylval.str, yytext); return NUM; }
[a-zA-Z]+    { strcpy(yylval.str, yytext); return ID; }
[\+\-\*/]    { return yytext[0]; }
[ \t\n]      ;
.            { return yytext[0]; }
%%

int yywrap() { return 1; }
