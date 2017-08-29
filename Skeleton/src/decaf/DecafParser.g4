/*
 * A VERY minimal skeleton for your parser, provided by Emma Norling.
 *
 * Your parser should use the tokens provided by your lexer in rules.
 * Even if your lexer appeared to be working perfectly for stage 1,
 * you might need to adjust some of those rules when you implement
 * your parser.
 *
 * Remember to provide documentation too (including replacing this
 * documentation).
 *
 */
parser grammar DecafParser;
options { tokenVocab = DecafLexer; }

// This rule says that a program consists of the tokens CLASS ID LCURLY RCURLY EOF nothing more nothing less,
// in exactly that order. However obviously something (quite a lot of something) needs to go between the curly
// brackets. You need to write the rules (based on the provided grammar) to capture this.
program: CLASS ID LCURLY RCURLY EOF;
callout_decls : callout_decl* ;
field_decls : field_decl* ;
method_decls : method_decl* ;
statements : statement* ;

callout_decl : CALLOUT SEMICOLON ;
field_decl : type field_decl_right (COMMA field_decl_right)* SEMICOLON ;
field_decl_right : IDENTIFIER (LSQUARE INTLITERAL RSQUARE)? ;

method_decl : (type | VOID) IDENTIFIER LPAREN method_decl_args RPAREN block ;
method_decl_args : (method_decl_arg (COMMA method_decl_arg)*)? ;
method_decl_arg : type IDENTIFIER ;

block : LCURLY field_decls statements RCURLY ;
type : INT | BOOLEAN ;
statement : assignment SEMICOLON
          | method_call SEMICOLON
          | IF LPAREN expr RPAREN block (ELSE block)?
          | FOR LPAREN IDENTIFIER SET expr COMMA expr RPAREN block
          | WHILE LPAREN expr RPAREN (COLON INTLITERAL)? block
          | RETURN (expr)? SEMICOLON
          | BREAK SEMICOLON
          | CONTINUE SEMICOLON 
          | block;
assignment : location assign_op expr ;
assign_op : SET | INC | DEC ;
expr : eB ;
eB : eC (eB COLON eB)? ; // 
eC : eD (OR eD)* ; // ||
eD : eE (AND eE)* ; // &&
eE : eF ((EQ | NEQ) eF)* ; // == !=
eF : eG ((LT | GT | LTE | GTE) eG)* ; // < <= > >=
eG : eH ((PLUS | MINUS) eH)* ; // + -
eH : eI ((STAR | SLASH | PERC) eI)* ; // * / %
eI : ((MINUS ) eI) | eZ ; // - !
eZ : eJ | (LPAREN RPAREN) ; // ()
eJ : location | method_call | literal ;
location : IDENTIFIER LSQUARE expr RSQUARE | IDENTIFIER ;
method_call : method_name LPAREN method_call_args RPAREN ;
method_call_args : (method_call_arg (COMMA method_call_arg)*)? ;
method_call_arg : str_literal | expr ;
method_name : IDENTIFIER ;
literal : int_literal | char_literal ;
int_literal : INTLITERAL ;
char_literal : CHARLITERAL ;
str_literal : STRINGLITERAL ;