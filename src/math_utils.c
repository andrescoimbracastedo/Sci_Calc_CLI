#include "math_utils.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>
#include "state.h"

double calc_addition(double x, double y){
    return x + y;
}

double calc_subtraction(double x, double y){
    return x - y;
}

double calc_multiplication(double x, double y){
    return x * y;
}

double calc_division(double x, double y){
    if(y == 0.0){
        state.error = ERROR_DIV_BY_ZERO;
        return NAN;
    }
    else{
        return x / y;
    }
}

double calc_modulus (double x, double y){
    if(y == 0.0){
        state.error = ERROR_DIV_BY_ZERO;
        return NAN;
    }
    else{
        return fmod(x,y);
    }
}

double calc_exponent(double x, double y){
    if (x < 0.0 && floor(y) != y) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    if (x == 0.0 && y <= 0.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    return pow(x, y);
}

double calc_quadratic_formula_pos(double a, double b, double c){
    if(a == 0.0){
        state.error = ERROR_DIV_BY_ZERO;
        return NAN;
    }

    double insideSquareRoot = (b * b) - (4.0 * a * c);
    double numerator = (-1.0 * b) + sqrt(insideSquareRoot);
    double denominator = 2.0 * a;

    return numerator / denominator;
}

double calc_quadratic_formula_neg(double a, double b, double c){
    if(a == 0.0){
        state.error = ERROR_DIV_BY_ZERO;
        return NAN;
    }

    double insideSquareRoot = (b * b) - (4.0 * a * c);
    double numerator = (-1.0 * b) - sqrt(insideSquareRoot);
    double denominator = 2.0 * a;

    return numerator / denominator;
}

static double angle_to_radians(double angle)
{
    switch (state.angleMode) {
        case MODE_DEG:
            return calc_deg_to_rad(angle);

        case MODE_GRAD:
            return angle * M_PI / 200.0;

        case MODE_RAD:
        default:
            return angle;
    }
}

static double radians_to_angle(double angle)
{
    switch (state.angleMode) {
        case MODE_DEG:
            return calc_rad_to_deg(angle);

        case MODE_GRAD:
            return angle * 200.0 / M_PI;

        case MODE_RAD:
        default:
            return angle;
    }
}



double calc_sin(double x) {
    return sin(angle_to_radians(x));

}

double calc_cos(double x) {
    return cos(angle_to_radians(x));

}

double calc_tan(double x) {
    return tan(angle_to_radians(x));
}

double calc_asin(double x) {
    return radians_to_angle(asin(x));
}

double calc_acos(double x) {
    return radians_to_angle(acos(x));
}

double calc_atan(double x) {
    return radians_to_angle(atan(x));
}

double calc_sinh(double x) {
    return sinh(x);
}

double calc_cosh(double x) {
    return cosh(x);
}

double calc_tanh(double x) {
    return tanh(x);
}

//  inverse
double calc_asinh(double x) {
    return asinh(x);
}

double calc_acosh(double x) {
    return acosh(x);
}

double calc_atanh(double x) {
    return atanh(x);
}

double calc_PowerTen(double x){
    return calc_exponent(10, x);
}

double calc_NthRoot(double x, double n){
    if(x != 0.0){
        return pow(x, 1.0 / n);
    }

    return NAN;
}

double calc_ln(double x){
    if (x <= 0.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    return log(x);
}

double calc_log10(double x){
    if (x <= 0.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    return log10(x);
}

double calc_log_base(double x, double base) {
    if (x <= 0.0 || base <= 0.0 || base == 1.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    return log(x) / log(base);
}

double calc_exp(double x) {
    return exp(x);
}

double calc_sqrt(double x) {
    if (x < 0.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    return sqrt(x);
}

double calc_cbrt(double x) {
    return cbrt(x);
}

double calc_SquarePower(double x){
    return x * x;
}

double calc_CubePower(double x){
    return x * x * x;
}

double calc_reciprocal(double x){
    if(x > 0.0){
        return 1.0/x;
    }
    return NAN;
}

double calc_absolute(double x){
    if(x < 0.0){
        return x * -1;
    }

    return x;
}

double calc_factorial(double x) {
    if (isnan(x) || x < 0.0) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    if (floor(x) != x) {
        state.error = ERROR_DOMAIN;
        return NAN;
    }
    if (x > 170.0) {
        state.error = ERROR_OVERFLOW;
        return NAN;
    }
    if (x <= 1.0) return 1.0;

    double result = 1.0;
    double limit = floor(x);
    for (double i = 2.0; i <= limit; i += 1.0) {
        result *= i;
    }
    return result;
}


double calc_gamma(double x) {
    return tgamma(x);
}

double calc_nCr(double n, double r) {
    if (r < 0 || n < 0 || r > n) return NAN;

    return tgamma(n + 1) / (tgamma(r + 1) * tgamma(n - r + 1));
}

double calc_nPr(double n, double r) {
    if (r < 0 || n < 0 || r > n) return NAN;

    return tgamma(n + 1) / tgamma(n - r + 1);
}

double calc_percent_of(double x, double y) {
    return (x / 100.0) * y;
}

double calc_to_percent(double x) {
    return x * 100.0;
}

double calc_rand() {
    return (double)rand() / (double)RAND_MAX;
}

double calc_rand_range(double min, double max) {
    return min + (max - min) * ((double)rand() / RAND_MAX);
}

double calc_deg_to_rad(double x) {
    return x * M_PI / 180.0;
}

double calc_rad_to_deg(double x) {
    return x * 180.0 / M_PI;
}

double calc_deg_to_grad(double x) {
    return x * (10.0 / 9.0);
}

double calc_grad_to_deg(double x) {
    return x * (9.0 / 10.0);
}


FractionResult calc_double_to_fraction(double val) {
    FractionResult res = { .numerator = 0, .denominator = 1, .is_valid = 0 };

    if (isnan(val) || isinf(val)) {
        return res;
    }

    double sign = (val < 0.0) ? -1.0 : 1.0;
    double x = fabs(val);

    if (x < 1e-9) {
        res.is_valid = 1;
        return res;
    }

    const int MAX_DENOMINATOR = 1000000;
    const double TOLERANCE = 1e-7;

    double m00 = 1.0, m01 = 0.0;
    double m10 = 0.0, m11 = 1.0;

    double current_x = x;


    for (int i = 0; i < 20; i++) {
        double a = floor(current_x);

        double t = m00;
        m00 = a * m00 + m01;
        m01 = t;

        t = m10;
        m10 = a * m10 + m11;
        m11 = t;

        if (m10 > MAX_DENOMINATOR) {
            break;
        }

        double estimated_val = m00 / m10;
        if (fabs(estimated_val - x) < TOLERANCE) {
            break;
        }

        if (fabs(current_x - a) < 1e-9) {
            break;
        }

        current_x = 1.0 / (current_x - a);
    }

    res.numerator = (int)(m00 * sign);
    res.denominator = (int)m10;
    res.is_valid = 1;

    return res;
}

double calc_mixed_fraction(double whole, double num, double denom) {
    if (denom == 0.0) {
        state.error = ERROR_DIV_BY_ZERO;
        return NAN;
    }

    double sign = (whole < 0.0) ? -1.0 : 1.0;
    double absolute_whole = fabs(whole);
    double fractional_part = num / denom;

    return sign * (absolute_whole + fractional_part);
}
