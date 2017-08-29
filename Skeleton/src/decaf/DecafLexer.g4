/*
 * Skeleton code for your Lexer, provided by Emma Norling
 *
 * Please note that this code is far from complete.
 * It needs to be extended and the documentation updated to reflect your changes.
 *
 */
lexer grammar DecafLexer;
//KEWYORDS
CLASS : 'class';
BOOLEAN : 'boolean' ;
CALLOUT : 'callout' ;
ELSE : 'else' ;
IF : 'if' ;
INT : 'int' ;
RETURN : 'return' ;
BREAK : 'break' ;
CONTINUE : 'continue' ;
FOR : 'for' ;
WHILE : 'while' ;
TRUE : 'true' ;
FALSE : 'false' ;
VOID : 'void' ;
IDENTIFIER : ALPHA(ALPHANUM)* ;

LCURLY : '{' ;
RCURLY : '}' ;
LSQUARE : '[' ;
RSQUARE : ']' ;
LPAREN : '(' ;
RPAREN : ')' ;
COMMA : ',' ;
SEMICOLON : ';' ; 
COLON : ':';
// Assignment Operators
SET : '=' ;
INC : '+=' ;
DEC : '-=' ;
MUL : '*=' ;
DIV : '/=' ;
//Arithmetic
PLUS : '+' ;
MINUS : '-' ;
STAR : '*' ;
SLASH : '/' ;
PERC : '%' ;
//Relative
LT : '<' ;
GT : '>' ;
LTE : '<=' ;
GTE : '>=' ;
//Equality
EQ : '==' ;
NEQ : '!=' ;
//Conditional
AND : '&&' ;
OR : '||' ;
NOT : '!' ;

ID : (ALPHA | '_') (ALPHA | '_' | DIGIT)* ; 
fragment ALPHANUM : (ALPHA | DIGIT) ;
fragment ALPHA : [a-zA-z];
fragment DIGIT : [0-9];
fragment HEXDIGIT :[0-9a-fA-F];

INTLITERAL : DECLITERAL | HEXLITERAL ;
HEXLITERAL :'0x' HEXDIGIT+;
DECLITERAL : DIGIT | (('1'..'9')('0'..'9')+);
NUMBER : DIGIT+ |'0x' HEXDIGIT+;

//IDENTIFIER

WS_ : (' ' | '\n' | '\t') -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|NOTESC) '\'';
STRING : '"' (ESC|NOTESC)* '"';
CHARLITERAL : '\'' CHAR '\'' ;
STRINGLITERAL : '"' (CHAR)* '"' ;

fragment ESC :  '\\' ('\'' | '"' | '\\' | 'n' | 't');
NOTESC: ~('\n'|'\''|'"'|'\t'|'\\'); 
