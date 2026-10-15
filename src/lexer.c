#include "lexer.h"
#include "math_dispatch.h"
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static void push(TokenArray *t, Token tok) {
    if (t->count < MAX_TOKENS) {
        t->data[t->count++] = tok;
    }
}

static Token make_number(const char *input, int *pos) {
    Token t;
    char buffer[64];
    int start = *pos;

    while (isdigit(input[*pos]) || input[*pos] == '.') {
        (*pos)++;
    }

    int len = *pos - start;
    if (len > 63) len = 63;

    strncpy(buffer, input + start, len);
    buffer[len] = '\0';

    t.type = TOKEN_NUMBER;
    t.number = atof(buffer);
    t.arg_count = 0;
    t.is_function = 0;
    t.id = -1;

    return t;
}

static Token make_identifier(const char *input, int *pos) {
    Token t;
    char buffer[64];
    int start = *pos;

    while (isalnum(input[*pos]) || input[*pos] == '_') {
        (*pos)++;
    }

    int len = *pos - start;
    if (len > 63) len = 63;

    strncpy(buffer, input + start, len);
    buffer[len] = '\0';

    t.type = TOKEN_IDENTIFIER;

    if (strcmp(buffer, "quad_pos")    == 0) { t.id = FUNC_QUAD_POS;    t.is_function = 1; t.arg_count = 3; return t; }
    if (strcmp(buffer, "quad_neg")    == 0) { t.id = FUNC_QUAD_NEG;    t.is_function = 1; t.arg_count = 3; return t; }
    if (strcmp(buffer, "sin")         == 0) { t.id = FUNC_SIN;         t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "cos")         == 0) { t.id = FUNC_COS;         t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "tan")         == 0) { t.id = FUNC_TAN;         t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "asin")        == 0) { t.id = FUNC_ASIN;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "acos")        == 0) { t.id = FUNC_ACOS;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "atan")        == 0) { t.id = FUNC_ATAN;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "sinh")        == 0) { t.id = FUNC_SINH;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "cosh")        == 0) { t.id = FUNC_COSH;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "tanh")        == 0) { t.id = FUNC_TANH;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "asinh")       == 0) { t.id = FUNC_ASINH;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "acosh")       == 0) { t.id = FUNC_ACOSH;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "atanh")       == 0) { t.id = FUNC_ATANH;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "pow10")       == 0) { t.id = FUNC_POW10;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "nth_root")    == 0) { t.id = FUNC_ROOT;        t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "ln")          == 0) { t.id = FUNC_LN;          t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "log10")       == 0) { t.id = FUNC_LOG10;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "log_base")    == 0) { t.id = FUNC_LOG_BASE;    t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "exp")         == 0) { t.id = FUNC_EXP;         t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "sqrt")        == 0) { t.id = FUNC_SQRT;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "cbrt")        == 0) { t.id = FUNC_CBRT;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "square")      == 0) { t.id = FUNC_SQUARE;      t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "cube")        == 0) { t.id = FUNC_CUBE;        t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "reciprocal")  == 0) { t.id = FUNC_RECIPROCAL;  t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "abs")         == 0) { t.id = FUNC_ABS;         t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "factorial")   == 0) { t.id = FUNC_FACTORIAL;   t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "gamma")       == 0) { t.id = FUNC_GAMMA;       t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "nCr")         == 0) { t.id = FUNC_NCR;         t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "nPr")         == 0) { t.id = FUNC_NPR;         t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "percent_of")  == 0) { t.id = FUNC_PERCENT_OF;  t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "to_percent")  == 0) { t.id = FUNC_TO_PERCENT;  t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "rand")        == 0) { t.id = FUNC_RAND;        t.is_function = 1; t.arg_count = 0; return t; }
    if (strcmp(buffer, "rand_range")  == 0) { t.id = FUNC_RAND_RANGE;  t.is_function = 1; t.arg_count = 2; return t; }
    if (strcmp(buffer, "deg_to_rad")  == 0) { t.id = FUNC_DEG_TO_RAD;  t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "rad_to_deg")  == 0) { t.id = FUNC_RAD_TO_DEG;  t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "deg_to_grad") == 0) { t.id = FUNC_DEG_TO_GRAD; t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "grad_to_deg") == 0) { t.id = FUNC_GRAD_TO_DEG; t.is_function = 1; t.arg_count = 1; return t; }
    if (strcmp(buffer, "mixed_fraction") == 0) { t.id = FUNC_MIXED_FRACTION; t.is_function = 1; t.arg_count = 3; return t; }

    if (strcmp(buffer, "A")   == 0) { t.id = VAR_A;   t.is_function = 0; t.arg_count = 0; return t; }
    if (strcmp(buffer, "B")   == 0) { t.id = VAR_B;   t.is_function = 0; t.arg_count = 0; return t; }
    if (strcmp(buffer, "X")   == 0) { t.id = VAR_X;   t.is_function = 0; t.arg_count = 0; return t; }
    if (strcmp(buffer, "Y")   == 0) { t.id = VAR_Y;   t.is_function = 0; t.arg_count = 0; return t; }
    if (strcmp(buffer, "ANS") == 0) { t.id = VAR_ANS; t.is_function = 0; t.arg_count = 0; return t; }

    fprintf(stderr, "Lexer Error: Unknown identifier '%s'\n", buffer);
    exit(1);
}

TokenArray lexer(const char *input) {
    TokenArray out;
    out.count = 0;
    int pos = 0;

    while (input[pos] != '\0') {
        char c = input[pos];

        if (isspace(c)) {
            pos++;
            continue;
        }

        if (isdigit(c) || c == '.') {
            push(&out, make_number(input, &pos));
            continue;
        }

        if (isalpha(c)) {
            push(&out, make_identifier(input, &pos));
            continue;
        }

        if (strchr("+-*/%^=", c)) {
            Token t = {.type = TOKEN_OPERATOR, .op = c, .arg_count = 0, .is_function = 0, .id = -1};
            push(&out, t);
            pos++;
            continue;
        }

        if (c == '(') {
            Token t = {.type = TOKEN_LPAREN, .op = '(', .arg_count = 0, .is_function = 0, .id = -1};
            push(&out, t);
            pos++;
            continue;
        }

        if (c == ')') {
            Token t = {.type = TOKEN_RPAREN, .op = ')', .arg_count = 0, .is_function = 0, .id = -1};
            push(&out, t);
            pos++;
            continue;
        }

        if (c == ',') {
            Token t = {.type = TOKEN_COMMA, .op = ',', .arg_count = 0, .is_function = 0, .id = -1};
            push(&out, t);
            pos++;
            continue;
        }

        Token t = {.type = TOKEN_INVALID, .op = c, .arg_count = 0, .is_function = 0, .id = -1};
        push(&out, t);
        pos++;
    }

    Token end = {.type = TOKEN_END, .arg_count = 0, .is_function = 0, .id = -1};
    push(&out, end);

    return out;
}
