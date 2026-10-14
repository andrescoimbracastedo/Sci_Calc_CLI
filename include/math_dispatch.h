#ifndef MATH_DISPATCH_H
#define MATH_DISPATCH_H

// Numeric IDs for all explicit mathematical functions
typedef enum {
    FUNC_QUAD_POS,
    FUNC_QUAD_NEG,
    FUNC_SIN,
    FUNC_COS,
    FUNC_TAN,
    FUNC_ASIN,
    FUNC_ACOS,
    FUNC_ATAN,
    FUNC_SINH,
    FUNC_COSH,
    FUNC_TANH,
    FUNC_ASINH,
    FUNC_ACOSH,
    FUNC_ATANH,
    FUNC_POW10,
    FUNC_ROOT,
    FUNC_LN,
    FUNC_LOG10,
    FUNC_LOG_BASE,
    FUNC_EXP,
    FUNC_SQRT,
    FUNC_CBRT,
    FUNC_SQUARE,
    FUNC_CUBE,
    FUNC_RECIPROCAL,
    FUNC_ABS,
    FUNC_FACTORIAL,
    FUNC_GAMMA,
    FUNC_NCR,
    FUNC_NPR,
    FUNC_PERCENT_OF,
    FUNC_TO_PERCENT,
    FUNC_RAND,
    FUNC_RAND_RANGE,
    FUNC_DEG_TO_RAD,
    FUNC_RAD_TO_DEG,
    FUNC_DEG_TO_GRAD,
    FUNC_GRAD_TO_DEG,
    FUNC_MIXED_FRACTION,
    FUNC_TOTAL_COUNT // Keeps track of table size dynamically
} FuncID;

typedef enum {
    VAR_A,
    VAR_B,
    VAR_X,
    VAR_Y,
    VAR_ANS
} VarID;

// Function pointer signature types
typedef double (*Func0)(void);
typedef double (*Func1)(double);
typedef double (*Func2)(double, double);
typedef double (*Func3)(double, double, double);

typedef struct {
    int id;
    int arg_count;
    union {
        Func0 f0;
        Func1 f1;
        Func2 f2;
        Func3 f3;
    };
} FunctionEntry;

const FunctionEntry* find_function_by_id(int func_id);

#endif // MATH_DISPATCH_H
