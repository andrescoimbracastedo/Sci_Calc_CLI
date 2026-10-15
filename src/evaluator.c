#include "evaluator.h"
#include "state.h"
#include "math_dispatch.h"
#include "math_utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static double apply_operator(char op, double a, double b) {
    switch (op) {
        case '+': return calc_addition(a, b);
        case '-': return calc_subtraction(a, b);
        case '*': return calc_multiplication(a, b);
        case '/': return calc_division(a, b);
        case '^': return calc_exponent(a, b);
        case '%': return calc_modulus(a, b);
        default:  state.error = ERROR_SYNTAX; return NAN;
    }
}

static double resolve_variable(int var_id) {
    switch (var_id) {
        case VAR_A:   return state.A;
        case VAR_B:   return state.B;
        case VAR_X:   return state.X;
        case VAR_Y:   return state.Y;
        case VAR_ANS: return state.ANS;
        default:      state.error = ERROR_SYNTAX; return NAN;
    }
}

double evaluate(TokenArray postfix) {
    double stack[1024];
    int top = -1;

    for (int i = 0; i < postfix.count; i++) {
        Token t = postfix.data[i];

        if (state.error != NO_ERROR) return NAN;

        if (t.type == TOKEN_NUMBER) {
            if (top >= 1023) { state.error = ERROR_STACK_OVERFLOW; return NAN; }
            stack[++top] = t.number;
        }
        else if (t.type == TOKEN_OPERATOR) {
            if (t.op == '~') {
                if (top < 0) { state.error = ERROR_STACK_UNDERFLOW; return NAN; }

                double a = stack[top--];
                stack[++top] = calc_subtraction(0.0, a);
            } else {
                if (top < 1) { state.error = ERROR_STACK_UNDERFLOW; return NAN; }
                double b = stack[top--];
                double a = stack[top--];
                stack[++top] = apply_operator(t.op, a, b);
            }
        }
        else if (t.type == TOKEN_IDENTIFIER) {
            if (t.is_function) {
                const FunctionEntry *fn = find_function_by_id(t.id);
                if (!fn) { state.error = ERROR_UNKNOWN_TOKEN; return NAN;}
                if (top < fn->arg_count - 1) { state.error = ERROR_STACK_UNDERFLOW; return NAN; }

                if (fn->arg_count == 0) {
                    stack[++top] = fn->f0();
                }
                else if (fn->arg_count == 1) {
                    double a = stack[top--];
                    stack[++top] = fn->f1(a);
                }
                else if (fn->arg_count == 2) {
                    double b = stack[top--];
                    double a = stack[top--];
                    stack[++top] = fn->f2(a, b);
                }
                else if (fn->arg_count == 3) {
                    double c = stack[top--];
                    double b = stack[top--];
                    double a = stack[top--];
                    stack[++top] = fn->f3(a, b, c);
                }
            } else {
                if (top >= 1023) { state.error = ERROR_STACK_OVERFLOW; return NAN; }
                stack[++top] = resolve_variable(t.id);
            }
        }
    }

    if (top != 0) {
        state.error = ERROR_SYNTAX;
        return NAN;
    }

    return stack[top];
}
