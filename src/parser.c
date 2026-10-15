#include "parser.h"
#include "math_dispatch.h"
#include <stdlib.h>
#include <stdio.h>
#include "lexer.h"

static int precedence(char op) {
    switch (op) {
        case '~': return 5;
        case '^': return 4;
        case '*':
        case '/':
        case '%': return 3;
        case '+':
        case '-': return 2;
        default:  return 0;
    }
}

static int right_assoc(char op) {
    return (op == '^' || op == '~');
}

ParseResult parse_expression(const char *input) {
    ParseResult result;
    result.postfix.count = 0;
    result.is_assignment = 0;
    result.target_variable_id = -1;

    TokenArray tokens = lexer(input);

    int op_top = 0;
    Token op_stack[MAX_TOKENS];
    int expect_operand = 1;
    int start = 0;

    if (tokens.count >= 3 &&
        tokens.data[0].type == TOKEN_IDENTIFIER &&
        tokens.data[0].is_function == 0 &&
        tokens.data[1].type == TOKEN_OPERATOR &&
        tokens.data[1].op == '=')
    {
        result.is_assignment = 1;
        result.target_variable_id = tokens.data[0].id;
        start = 2;
    }

    for (int i = start; i < tokens.count; i++) {
        Token t = tokens.data[i];

        if (t.type == TOKEN_END) {
            break;
        }

        if (t.type == TOKEN_NUMBER) {
            result.postfix.data[result.postfix.count++] = t;
            expect_operand = 0;
        }
        else if (t.type == TOKEN_IDENTIFIER) {
            if (t.is_function) {
                op_stack[op_top++] = t;
            } else {
                result.postfix.data[result.postfix.count++] = t;
            }
            expect_operand = 0;
        }
        else if (t.type == TOKEN_OPERATOR) {
            if (t.op == '-' && expect_operand) {
                Token u = {
                    .type = TOKEN_OPERATOR,
                    .op = '~',
                    .arg_count = 0,
                    .is_function = 0,
                    .id = -1
                };
                op_stack[op_top++] = u;
            } else {
                while (op_top > 0) {
                    Token top = op_stack[op_top - 1];

                    if (top.type == TOKEN_LPAREN) {
                        break;
                    }

                    if (top.type == TOKEN_OPERATOR) {
                        int p1 = precedence(t.op);
                        int p2 = precedence(top.op);

                        if (p2 > p1 || (p2 == p1 && !right_assoc(t.op))) {
                            result.postfix.data[result.postfix.count++] = op_stack[--op_top];
                            continue;
                        }
                    }
                    break;
                }
                op_stack[op_top++] = t;
            }
            expect_operand = 1;
        }
        else if (t.type == TOKEN_LPAREN) {
            op_stack[op_top++] = t;
            expect_operand = 1;
        }
        else if (t.type == TOKEN_RPAREN) {
            while (op_top > 0 && op_stack[op_top - 1].type != TOKEN_LPAREN) {
                result.postfix.data[result.postfix.count++] = op_stack[--op_top];
            }

            if (op_top > 0) {
                op_top--;
            }

            if (op_top > 0 &&
                op_stack[op_top - 1].type == TOKEN_IDENTIFIER &&
                op_stack[op_top - 1].is_function)
            {
                result.postfix.data[result.postfix.count++] = op_stack[--op_top];
            }
            expect_operand = 0;
        }
        else if (t.type == TOKEN_COMMA) {
            while (op_top > 0 && op_stack[op_top - 1].type != TOKEN_LPAREN) {
                result.postfix.data[result.postfix.count++] = op_stack[--op_top];
            }
            expect_operand = 1;
        }
    }

    while (op_top > 0) {
        result.postfix.data[result.postfix.count++] = op_stack[--op_top];
    }

    return result;
}
