	.file	"math_dispatch.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	"find_function_by_id"
	.type	"find_function_by_id", @function
"find_function_by_id":
	mov	eax, edi
	lea	rdx, "table"[rip]
	sal	rax, 4
	add	rax, rdx
	xor	edx, edx
	cmp	edi, 39
	cmovnb	rax, rdx
	ret
	.size	"find_function_by_id", .-"find_function_by_id"
	.section	.data.rel.ro,"aw"
	.align 32
	.type	"table", @object
	.size	"table", 624
"table":
	.long	0
	.long	3
	.quad	"calc_quadratic_formula_pos"
	.long	1
	.long	3
	.quad	"calc_quadratic_formula_neg"
	.long	2
	.long	1
	.quad	"calc_sin"
	.long	3
	.long	1
	.quad	"calc_cos"
	.long	4
	.long	1
	.quad	"calc_tan"
	.long	5
	.long	1
	.quad	"calc_asin"
	.long	6
	.long	1
	.quad	"calc_acos"
	.long	7
	.long	1
	.quad	"calc_atan"
	.long	8
	.long	1
	.quad	"calc_sinh"
	.long	9
	.long	1
	.quad	"calc_cosh"
	.long	10
	.long	1
	.quad	"calc_tanh"
	.long	11
	.long	1
	.quad	"calc_asinh"
	.long	12
	.long	1
	.quad	"calc_acosh"
	.long	13
	.long	1
	.quad	"calc_atanh"
	.long	14
	.long	1
	.quad	"calc_PowerTen"
	.long	15
	.long	2
	.quad	"calc_NthRoot"
	.long	16
	.long	1
	.quad	"calc_ln"
	.long	17
	.long	1
	.quad	"calc_log10"
	.long	18
	.long	2
	.quad	"calc_log_base"
	.long	19
	.long	1
	.quad	"calc_exp"
	.long	20
	.long	1
	.quad	"calc_sqrt"
	.long	21
	.long	1
	.quad	"calc_cbrt"
	.long	22
	.long	1
	.quad	"calc_SquarePower"
	.long	23
	.long	1
	.quad	"calc_CubePower"
	.long	24
	.long	1
	.quad	"calc_reciprocal"
	.long	25
	.long	1
	.quad	"calc_absolute"
	.long	26
	.long	1
	.quad	"calc_factorial"
	.long	27
	.long	1
	.quad	"calc_gamma"
	.long	28
	.long	2
	.quad	"calc_nCr"
	.long	29
	.long	2
	.quad	"calc_nPr"
	.long	30
	.long	2
	.quad	"calc_percent_of"
	.long	31
	.long	1
	.quad	"calc_to_percent"
	.long	32
	.long	0
	.quad	"calc_rand"
	.long	33
	.long	2
	.quad	"calc_rand_range"
	.long	34
	.long	1
	.quad	"calc_deg_to_rad"
	.long	35
	.long	1
	.quad	"calc_rad_to_deg"
	.long	36
	.long	1
	.quad	"calc_deg_to_grad"
	.long	37
	.long	1
	.quad	"calc_grad_to_deg"
	.long	38
	.long	3
	.quad	"calc_mixed_fraction"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
