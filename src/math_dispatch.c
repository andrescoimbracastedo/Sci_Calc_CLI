#include "math_dispatch.h"
#include "math_utils.h"
#include <stdlib.h>

static const FunctionEntry table[FUNC_TOTAL_COUNT] = {
    [FUNC_QUAD_POS]    = { .id = FUNC_QUAD_POS,    .arg_count = 3, .f3 = calc_quadratic_formula_pos },
    [FUNC_QUAD_NEG]    = { .id = FUNC_QUAD_NEG,    .arg_count = 3, .f3 = calc_quadratic_formula_neg },
    [FUNC_SIN]         = { .id = FUNC_SIN,         .arg_count = 1, .f1 = calc_sin },
    [FUNC_COS]         = { .id = FUNC_COS,         .arg_count = 1, .f1 = calc_cos },
    [FUNC_TAN]         = { .id = FUNC_TAN,         .arg_count = 1, .f1 = calc_tan },
    [FUNC_ASIN]        = { .id = FUNC_ASIN,        .arg_count = 1, .f1 = calc_asin },
    [FUNC_ACOS]        = { .id = FUNC_ACOS,        .arg_count = 1, .f1 = calc_acos },
    [FUNC_ATAN]        = { .id = FUNC_ATAN,        .arg_count = 1, .f1 = calc_atan },
    [FUNC_SINH]        = { .id = FUNC_SINH,        .arg_count = 1, .f1 = calc_sinh },
    [FUNC_COSH]        = { .id = FUNC_COSH,        .arg_count = 1, .f1 = calc_cosh },
    [FUNC_TANH]        = { .id = FUNC_TANH,        .arg_count = 1, .f1 = calc_tanh },
    [FUNC_ASINH]       = { .id = FUNC_ASINH,       .arg_count = 1, .f1 = calc_asinh },
    [FUNC_ACOSH]       = { .id = FUNC_ACOSH,       .arg_count = 1, .f1 = calc_acosh },
    [FUNC_ATANH]       = { .id = FUNC_ATANH,       .arg_count = 1, .f1 = calc_atanh },
    [FUNC_POW10]       = { .id = FUNC_POW10,       .arg_count = 1, .f1 = calc_PowerTen },
    [FUNC_ROOT]        = { .id = FUNC_ROOT,        .arg_count = 2, .f2 = calc_NthRoot },
    [FUNC_LN]          = { .id = FUNC_LN,          .arg_count = 1, .f1 = calc_ln },
    [FUNC_LOG10]       = { .id = FUNC_LOG10,       .arg_count = 1, .f1 = calc_log10 },
    [FUNC_LOG_BASE]    = { .id = FUNC_LOG_BASE,    .arg_count = 2, .f2 = calc_log_base },
    [FUNC_EXP]         = { .id = FUNC_EXP,         .arg_count = 1, .f1 = calc_exp },
    [FUNC_SQRT]        = { .id = FUNC_SQRT,        .arg_count = 1, .f1 = calc_sqrt },
    [FUNC_CBRT]        = { .id = FUNC_CBRT,        .arg_count = 1, .f1 = calc_cbrt },
    [FUNC_SQUARE]      = { .id = FUNC_SQUARE,      .arg_count = 1, .f1 = calc_SquarePower },
    [FUNC_CUBE]        = { .id = FUNC_CUBE,        .arg_count = 1, .f1 = calc_CubePower },
    [FUNC_RECIPROCAL]  = { .id = FUNC_RECIPROCAL,  .arg_count = 1, .f1 = calc_reciprocal },
    [FUNC_ABS]         = { .id = FUNC_ABS,         .arg_count = 1, .f1 = calc_absolute },
    [FUNC_FACTORIAL]   = { .id = FUNC_FACTORIAL,   .arg_count = 1, .f1 = calc_factorial },
    [FUNC_GAMMA]       = { .id = FUNC_GAMMA,       .arg_count = 1, .f1 = calc_gamma },
    [FUNC_NCR]         = { .id = FUNC_NCR,         .arg_count = 2, .f2 = calc_nCr },
    [FUNC_NPR]         = { .id = FUNC_NPR,         .arg_count = 2, .f2 = calc_nPr },
    [FUNC_PERCENT_OF]  = { .id = FUNC_PERCENT_OF,  .arg_count = 2, .f2 = calc_percent_of },
    [FUNC_TO_PERCENT]  = { .id = FUNC_TO_PERCENT,  .arg_count = 1, .f1 = calc_to_percent },
    [FUNC_RAND]        = { .id = FUNC_RAND,        .arg_count = 0, .f0 = calc_rand },
    [FUNC_RAND_RANGE]  = { .id = FUNC_RAND_RANGE,  .arg_count = 2, .f2 = calc_rand_range },
    [FUNC_DEG_TO_RAD]  = { .id = FUNC_DEG_TO_RAD,  .arg_count = 1, .f1 = calc_deg_to_rad },
    [FUNC_RAD_TO_DEG]  = { .id = FUNC_RAD_TO_DEG,  .arg_count = 1, .f1 = calc_rad_to_deg },
    [FUNC_DEG_TO_GRAD] = { .id = FUNC_DEG_TO_GRAD, .arg_count = 1, .f1 = calc_deg_to_grad },
    [FUNC_MIXED_FRACTION] = { .id = FUNC_MIXED_FRACTION, .arg_count = 3, .f3 = calc_mixed_fraction },
    [FUNC_GRAD_TO_DEG] = { .id = FUNC_GRAD_TO_DEG, .arg_count = 1, .f1 = calc_grad_to_deg }
};

const FunctionEntry* find_function_by_id(int func_id) {
    if (func_id >= 0 && func_id < FUNC_TOTAL_COUNT) {
        return &table[func_id];
    }
    return NULL;
}
