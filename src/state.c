#include "state.h"

CalcState state =
{
    .A = 0,
    .B = 0,
    .X = 0,
    .Y = 0,
    .ANS = 0,

    .angleMode = MODE_DEG,
    .resultDisplay = DISPLAY_DECIMAL,
    .precisionMode = PRECISE,
    .error = NO_ERROR
};
