#ifndef TOKEN_H
#define TOKEN_H

#define MAX_TOKENS 256

typedef enum {
    TOKEN_NUMBER,
    TOKEN_IDENTIFIER,
    TOKEN_OPERATOR,
    TOKEN_LPAREN,
    TOKEN_RPAREN,
    TOKEN_COMMA,
    TOKEN_END,
    TOKEN_INVALID
} TokenType;

typedef struct {
    TokenType type;
    int arg_count;
    int is_function;
    int id;

    union {
        double number;
        char op;
    };
} Token;

typedef struct {
    Token data[MAX_TOKENS];
    int count;
} TokenArray;

typedef struct {
    TokenArray postfix;
    int is_assignment;
    int target_variable_id;
} ParseResult;

#endif
