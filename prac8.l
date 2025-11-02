.%{
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]   { return yytext[0]; }
\n          { return '\n'; }
[ \t]       { /* ignore whitespace */ }
.           { return yytext[0]; }   /* return other characters */
%%
