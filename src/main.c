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
    // CRITICAL STEP: Clear any historic errors before processing new line expressions
    state.error = NO_ERROR;

    // 1. Convert the raw text math string into a numerical Postfix array
    ParseResult result = parse_expression(input_expression);
    if (state.error != NO_ERROR) {
        print_calculator_error(state.error);
        return;
    }

    // 2. Evaluate the calculation terms via the pure integer stack engine
    double evaluated_value = evaluate(result.postfix);

    // Check if an error occurred during evaluation
    if (state.error != NO_ERROR) {
        print_calculator_error(state.error);
        return;
    }

    // 3. APPLY ASSIGNMENTS HERE!
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
        // Just a standard math evaluation line
        state.ANS = evaluated_value;

        // Call our new conversion helper:
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

    printf("====================================\n");
    printf("           CLI Calculator           \n");
    printf("  Type expressions or 'exit' to quit\n");
    printf("====================================\n\n");

    while (1) {
        printf("calc > ");

        // Read a line of text from standard input
        if (fgets(input_buffer, sizeof(input_buffer), stdin) == NULL) {
            break;
        }

        // Remove trailing newline character added by fgets
        input_buffer[strcspn(input_buffer, "\n")] = '\0';

        // Check for exit commands
        if (strcmp(input_buffer, "exit") == 0 || strcmp(input_buffer, "quit") == 0) {
            printf("Goodbye!\n");
            break;
        }

        // Skip empty lines safely
        if (strlen(input_buffer) == 0) {
            continue;
        }

        // Execute the calculation pipeline
        run_calculator_line(input_buffer);
    }

    return 0;
}
