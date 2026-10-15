#ifndef MATH_UTILS_H
#define MATH_UTILS_H


double calc_addition(double x, double y);
double calc_subtraction(double x, double y);
double calc_multiplication(double x, double y);
double calc_division(double x, double y);
double calc_modulus(double x, double y);
double calc_exponent(double x, double y);


double calc_quadratic_formula_pos(double a, double b, double c);
double calc_quadratic_formula_neg(double a, double b, double c);

static double angle_to_radians(double angle);
static double radians_to_angle(double angle);


double calc_sin(double x);
double calc_cos(double x);
double calc_tan(double x);


double calc_asin(double x);
double calc_acos(double x);
double calc_atan(double x);


double calc_sinh(double x);
double calc_cosh(double x);
double calc_tanh(double x);

double calc_asinh(double x);
double calc_acosh(double x);
double calc_atanh(double x);

double calc_PowerTen(double x);
double calc_NthRoot(double x, double n);
double calc_ln(double x);
double calc_log10(double x);
double calc_log_base(double x, double base);
double calc_exp(double x);
double calc_sqrt(double x);
double calc_cbrt(double x);

double calc_SquarePower(double x);
double calc_CubePower(double x);
double calc_reciprocal(double x);
double calc_absolute(double x);
double calc_factorial(double x);

double calc_gamma(double x);
double calc_nCr(double n, double r);
double calc_nPr(double n, double r);
double calc_percent_of(double x, double y);
double calc_to_percent(double x);
double calc_rand(void);
double calc_rand_range(double min, double max);
double calc_deg_to_rad(double x);
double calc_rad_to_deg(double x);
double calc_deg_to_grad(double x);
double calc_grad_to_deg(double x);


typedef struct {
    int numerator;
    int denominator;
    int is_valid;
} FractionResult;

FractionResult calc_double_to_fraction(double val);
double calc_mixed_fraction(double whole, double num, double denom);

#endif
