#ifndef STATE_H
#define STATE_H

typedef enum {
    MODE_DEG,
    MODE_RAD,
    MODE_GRAD
} AngleMode;

typedef enum {
    DISPLAY_DECIMAL,
    DISPLAY_FRACTION
} DisplayMode;

typedef enum {
    PRECISE,
    FIXED_2,
    FIXED_4,
    SCIENTIFIC
} PrecisionMode;

// Clear, explicit error tracking definitions
typedef enum {
    NO_ERROR = 0,
    ERROR_DIV_BY_ZERO,
    ERROR_DOMAIN,          // Negative sqrt, ln(0), etc.
    ERROR_OVERFLOW,        // Numbers too large (e.g. huge factorials)
    ERROR_UNDERFLOW,
    ERROR_SYNTAX,          // Mismatched parentheses
    ERROR_UNKNOWN_TOKEN,
    ERROR_STACK_OVERFLOW,
    ERROR_STACK_UNDERFLOW
} CalcError;

typedef struct {
    double A;
    double B;
    double X;
    double Y;
    double ANS;

    AngleMode angleMode;
    DisplayMode resultDisplay;
    PrecisionMode precisionMode;
    CalcError error;
} CalcState;

extern CalcState state;

#endif
