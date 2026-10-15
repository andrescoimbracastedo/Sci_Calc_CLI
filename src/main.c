#include "parser.h"
#include "evaluator.h"
#include "state.h"
#include "math_dispatch.h"
#include "math_utils.h"
#include <stdio.h>
#include <string.h>

void print_calculator_error(CalcError err) {
    switch (err) {
        case ERROR_DIV_BY_ZERO:     printf("Error: Division by Zero!\n"); break;
        case ERROR_DOMAIN:          printf("Error: Math Domain Error (Invalid Input Value)!\n"); break;
        case ERROR_OVERFLOW:        printf("Error: Math Overflow Range Limit Exceeded!\n"); break;
        case ERROR_UNDERFLOW:       printf("Error: Math Underflow Range Limit Exceeded!\n"); break;
        case ERROR_SYNTAX:          printf("Error: Invalid Expression Syntax Format!\n"); break;
        case ERROR_UNKNOWN_TOKEN:   printf("Error: Unrecognized Math Identifier Word!\n"); break;
        case ERROR_STACK_OVERFLOW:  printf("Error: Evaluator Memory Stack Overflow Overflow!\n"); break;
        case ERROR_STACK_UNDERFLOW: printf("Error: Mismatched Function Arguments (Stack Underflow)!\n"); break;
        default:                    printf("Error: An unhandled structural exception occurred.\n"); break;
    }
}

void run_calculator_line(const char *input_expression) {

    state.error = NO_ERROR;

    ParseResult result = parse_expression(input_expression);
    if (state.error != NO_ERROR) {
        print_calculator_error(state.error);
        return;
    }

    double evaluated_value = evaluate(result.postfix);

    if (state.error != NO_ERROR) {
        print_calculator_error(state.error);
        return;
    }

    if (result.is_assignment) {
        switch (result.target_variable_id) {
            case VAR_A:   state.A   = evaluated_value; break;
            case VAR_B:   state.B   = evaluated_value; break;
            case VAR_X:   state.X   = evaluated_value; break;
            case VAR_Y:   state.Y   = evaluated_value; break;
            case VAR_ANS: state.ANS = evaluated_value; break;
            default:
                fprintf(stderr, "Execution Error: Unknown assignment destination ID.\n");
                return;
        }
        printf("Assigned value %g to variable.\n", evaluated_value);
    } else {

        state.ANS = evaluated_value;

        FractionResult frac = calc_double_to_fraction(evaluated_value);

        if (frac.is_valid && frac.denominator != 1 && frac.denominator <= 1000) {
            printf("Result: %g  [%d/%d]\n", evaluated_value, frac.numerator, frac.denominator);
        } else {
            printf("Result: %g\n", evaluated_value);
        }
    }
}

int main(void) {
    char input_buffer[1024];

    printf("type 'exit' to quit\n");

    while (1) {
        printf("calc >> ");

        if (fgets(input_buffer, sizeof(input_buffer), stdin) == NULL) {
            break;
        }

        input_buffer[strcspn(input_buffer, "\n")] = '\0';

        if (strcmp(input_buffer, "exit") == 0 || strcmp(input_buffer, "quit") == 0) {
            printf("Adios!\n");
            break;
        }


        if (strlen(input_buffer) == 0) {
            continue;
        }

        run_calculator_line(input_buffer);
    }

    return 0;
}
