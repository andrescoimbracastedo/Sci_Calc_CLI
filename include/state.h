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

typedef enum {
    NO_ERROR = 0,
    ERROR_DIV_BY_ZERO,
    ERROR_DOMAIN,
    ERROR_OVERFLOW,
    ERROR_UNDERFLOW,
    ERROR_SYNTAX,
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
