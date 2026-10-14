#ifndef MATH_UTILS_H
#define MATH_UTILS_H

// Ensure M_PI is available if not defined by standard headers
//#ifndef M_PI
//#define M_PI 3.14159265358979323846
//#endif

//==========================================================
//  BASIC ARITHMETIC
//==========================================================
double calc_addition(double x, double y);
double calc_subtraction(double x, double y);
double calc_multiplication(double x, double y);
double calc_division(double x, double y);
double calc_modulus(double x, double y);
double calc_exponent(double x, double y);

//==========================================================
//  TRIGONOMETRY
//==========================================================
double calc_quadratic_formula_pos(double a, double b, double c);
double calc_quadratic_formula_neg(double a, double b, double c);

// SIN COS TAN
double calc_sin(double x);
double calc_cos(double x);
double calc_tan(double x);

// Inverse Trigonometry
double calc_asin(double x);
double calc_acos(double x);
double calc_atan(double x);

// Hyperbolic Trigonometry
double calc_sinh(double x);
double calc_cosh(double x);
double calc_tanh(double x);

// Inverse Hyperbolic Trigonometry
double calc_asinh(double x);
double calc_acosh(double x);
double calc_atanh(double x);

//==========================================================
//  LOGARITHMS AND EXTRA EXPONENTS
//==========================================================
double calc_PowerTen(double x);
double calc_NthRoot(double x, double n);
double calc_ln(double x);
double calc_log10(double x);
double calc_log_base(double x, double base);
double calc_exp(double x);
double calc_sqrt(double x);
double calc_cbrt(double x);

//==========================================================
//  POWERS
//==========================================================
double calc_SquarePower(double x);
double calc_CubePower(double x);
double calc_reciprocal(double x);
double calc_absolute(double x);
double calc_factorial(double x);

//==========================================================
//  ADVANCED FUNCTIONS
//==========================================================
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

//==========================================================
//  DECIMAL TO FRACTION LOGIC
//==========================================================

typedef struct {
    int numerator;
    int denominator;
    int is_valid;
} FractionResult;

FractionResult calc_double_to_fraction(double val);
double calc_mixed_fraction(double whole, double num, double denom);

#endif /* MATH_UTILS_H */
