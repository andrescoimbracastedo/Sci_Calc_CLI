	.file	"math_utils.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	"calc_addition"
	.type	"calc_addition", @function
"calc_addition":
	addsd	xmm0, xmm1
	ret
	.size	"calc_addition", .-"calc_addition"
	.p2align 4
	.globl	"calc_subtraction"
	.type	"calc_subtraction", @function
"calc_subtraction":
	subsd	xmm0, xmm1
	ret
	.size	"calc_subtraction", .-"calc_subtraction"
	.p2align 4
	.globl	"calc_multiplication"
	.type	"calc_multiplication", @function
"calc_multiplication":
	mulsd	xmm0, xmm1
	ret
	.size	"calc_multiplication", .-"calc_multiplication"
	.p2align 4
	.globl	"calc_division"
	.type	"calc_division", @function
"calc_division":
	pxor	xmm2, xmm2
	ucomisd	xmm1, xmm2
	jp	.L6
	jne	.L6
	mov	DWORD PTR "state"[rip+52], 1
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	divsd	xmm0, xmm1
	ret
	.size	"calc_division", .-"calc_division"
	.p2align 4
	.globl	"calc_modulus"
	.type	"calc_modulus", @function
"calc_modulus":
	pxor	xmm2, xmm2
	ucomisd	xmm1, xmm2
	jp	.L11
	jne	.L11
	movsd	xmm2, QWORD PTR .LC0[rip]
	mov	DWORD PTR "state"[rip+52], 1
	movapd	xmm0, xmm2
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm1
	fld	QWORD PTR 8[rsp]
	movsd	QWORD PTR 8[rsp], xmm0
	fld	QWORD PTR 8[rsp]
.L14:
	fprem
	fnstsw	ax
	test	ah, 4
	jne	.L14
	fstp	st(1)
	fstp	QWORD PTR 8[rsp]
	movsd	xmm2, QWORD PTR 8[rsp]
	ucomisd	xmm2, xmm2
	jp	.L21
.L10:
	movapd	xmm0, xmm2
	add	rsp, 24
	ret
.L21:
	call	"fmod"@PLT
	movsd	xmm2, QWORD PTR 8[rsp]
	jmp	.L10
	.size	"calc_modulus", .-"calc_modulus"
	.p2align 4
	.globl	"calc_exponent"
	.type	"calc_exponent", @function
"calc_exponent":
	movapd	xmm2, xmm0
	pxor	xmm0, xmm0
	sub	rsp, 24
	comisd	xmm0, xmm2
	ja	.L35
	ucomisd	xmm2, xmm0
	jp	.L25
	jne	.L25
	comisd	xmm0, xmm1
	jnb	.L29
.L25:
	movapd	xmm0, xmm2
	add	rsp, 24
	jmp	"pow"@PLT
	.p2align 4,,10
	.p2align 3
.L35:
	movapd	xmm0, xmm1
	movsd	QWORD PTR [rsp], xmm1
	movsd	QWORD PTR 8[rsp], xmm2
	call	"floor"@PLT
	movsd	xmm1, QWORD PTR [rsp]
	ucomisd	xmm0, xmm1
	jp	.L29
	movsd	xmm2, QWORD PTR 8[rsp]
	je	.L25
.L29:
	movsd	xmm0, QWORD PTR .LC0[rip]
	mov	DWORD PTR "state"[rip+52], 2
	add	rsp, 24
	ret
	.size	"calc_exponent", .-"calc_exponent"
	.p2align 4
	.globl	"calc_quadratic_formula_pos"
	.type	"calc_quadratic_formula_pos", @function
"calc_quadratic_formula_pos":
	pxor	xmm3, xmm3
	ucomisd	xmm0, xmm3
	jp	.L37
	jne	.L37
	mov	DWORD PTR "state"[rip+52], 1
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	movsd	xmm4, QWORD PTR .LC3[rip]
	movapd	xmm3, xmm0
	movapd	xmm0, xmm1
	mulsd	xmm0, xmm1
	mulsd	xmm4, xmm3
	mulsd	xmm2, xmm4
	subsd	xmm0, xmm2
	pxor	xmm2, xmm2
	ucomisd	xmm2, xmm0
	ja	.L45
	sqrtsd	xmm0, xmm0
	addsd	xmm3, xmm3
	subsd	xmm0, xmm1
	divsd	xmm0, xmm3
	ret
.L45:
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm1
	movsd	QWORD PTR [rsp], xmm3
	call	"sqrt"@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	movsd	xmm3, QWORD PTR [rsp]
	add	rsp, 24
	subsd	xmm0, xmm1
	addsd	xmm3, xmm3
	divsd	xmm0, xmm3
	ret
	.size	"calc_quadratic_formula_pos", .-"calc_quadratic_formula_pos"
	.p2align 4
	.globl	"calc_quadratic_formula_neg"
	.type	"calc_quadratic_formula_neg", @function
"calc_quadratic_formula_neg":
	pxor	xmm3, xmm3
	ucomisd	xmm0, xmm3
	jp	.L51
	jne	.L51
	mov	DWORD PTR "state"[rip+52], 1
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	movsd	xmm4, QWORD PTR .LC3[rip]
	movapd	xmm3, xmm0
	movapd	xmm0, xmm1
	mulsd	xmm0, xmm1
	xorpd	xmm1, XMMWORD PTR .LC4[rip]
	mulsd	xmm4, xmm3
	mulsd	xmm2, xmm4
	subsd	xmm0, xmm2
	pxor	xmm2, xmm2
	ucomisd	xmm2, xmm0
	ja	.L59
	sqrtsd	xmm0, xmm0
	addsd	xmm3, xmm3
	subsd	xmm1, xmm0
	divsd	xmm1, xmm3
	movapd	xmm0, xmm1
	ret
.L59:
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm3
	movsd	QWORD PTR [rsp], xmm1
	call	"sqrt"@PLT
	movsd	xmm3, QWORD PTR 8[rsp]
	movsd	xmm1, QWORD PTR [rsp]
	add	rsp, 24
	subsd	xmm1, xmm0
	addsd	xmm3, xmm3
	divsd	xmm1, xmm3
	movapd	xmm0, xmm1
	ret
	.size	"calc_quadratic_formula_neg", .-"calc_quadratic_formula_neg"
	.p2align 4
	.globl	"calc_sin"
	.type	"calc_sin", @function
"calc_sin":
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L65
	cmp	eax, 2
	je	.L66
	jmp	"sin"@PLT
	.p2align 4,,10
	.p2align 3
.L66:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC7[rip]
	jmp	"sin"@PLT
	.p2align 4,,10
	.p2align 3
.L65:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC6[rip]
	jmp	"sin"@PLT
	.size	"calc_sin", .-"calc_sin"
	.p2align 4
	.globl	"calc_cos"
	.type	"calc_cos", @function
"calc_cos":
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L69
	cmp	eax, 2
	je	.L70
	jmp	"cos"@PLT
	.p2align 4,,10
	.p2align 3
.L70:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC7[rip]
	jmp	"cos"@PLT
	.p2align 4,,10
	.p2align 3
.L69:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC6[rip]
	jmp	"cos"@PLT
	.size	"calc_cos", .-"calc_cos"
	.p2align 4
	.globl	"calc_tan"
	.type	"calc_tan", @function
"calc_tan":
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L73
	cmp	eax, 2
	je	.L74
	jmp	"tan"@PLT
	.p2align 4,,10
	.p2align 3
.L74:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC7[rip]
	jmp	"tan"@PLT
	.p2align 4,,10
	.p2align 3
.L73:
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC6[rip]
	jmp	"tan"@PLT
	.size	"calc_tan", .-"calc_tan"
	.p2align 4
	.globl	"calc_asin"
	.type	"calc_asin", @function
"calc_asin":
	sub	rsp, 8
	call	"asin"@PLT
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L77
	cmp	eax, 2
	je	.L78
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	mulsd	xmm0, QWORD PTR .LC7[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	mulsd	xmm0, QWORD PTR .LC6[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.size	"calc_asin", .-"calc_asin"
	.p2align 4
	.globl	"calc_acos"
	.type	"calc_acos", @function
"calc_acos":
	sub	rsp, 8
	call	"acos"@PLT
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L82
	cmp	eax, 2
	je	.L83
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	mulsd	xmm0, QWORD PTR .LC7[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L82:
	mulsd	xmm0, QWORD PTR .LC6[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.size	"calc_acos", .-"calc_acos"
	.p2align 4
	.globl	"calc_atan"
	.type	"calc_atan", @function
"calc_atan":
	sub	rsp, 8
	call	"atan"@PLT
	mov	eax, DWORD PTR "state"[rip+40]
	test	eax, eax
	je	.L87
	cmp	eax, 2
	je	.L88
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	mulsd	xmm0, QWORD PTR .LC7[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	mulsd	xmm0, QWORD PTR .LC6[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	add	rsp, 8
	ret
	.size	"calc_atan", .-"calc_atan"
	.p2align 4
	.globl	"calc_sinh"
	.type	"calc_sinh", @function
"calc_sinh":
	jmp	"sinh"@PLT
	.size	"calc_sinh", .-"calc_sinh"
	.p2align 4
	.globl	"calc_cosh"
	.type	"calc_cosh", @function
"calc_cosh":
	jmp	"cosh"@PLT
	.size	"calc_cosh", .-"calc_cosh"
	.p2align 4
	.globl	"calc_tanh"
	.type	"calc_tanh", @function
"calc_tanh":
	jmp	"tanh"@PLT
	.size	"calc_tanh", .-"calc_tanh"
	.p2align 4
	.globl	"calc_asinh"
	.type	"calc_asinh", @function
"calc_asinh":
	jmp	"asinh"@PLT
	.size	"calc_asinh", .-"calc_asinh"
	.p2align 4
	.globl	"calc_acosh"
	.type	"calc_acosh", @function
"calc_acosh":
	jmp	"acosh"@PLT
	.size	"calc_acosh", .-"calc_acosh"
	.p2align 4
	.globl	"calc_atanh"
	.type	"calc_atanh", @function
"calc_atanh":
	jmp	"atanh"@PLT
	.size	"calc_atanh", .-"calc_atanh"
	.p2align 4
	.globl	"calc_PowerTen"
	.type	"calc_PowerTen", @function
"calc_PowerTen":
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC8[rip]
	jmp	"pow"@PLT
	.size	"calc_PowerTen", .-"calc_PowerTen"
	.p2align 4
	.globl	"calc_NthRoot"
	.type	"calc_NthRoot", @function
"calc_NthRoot":
	pxor	xmm2, xmm2
	ucomisd	xmm0, xmm2
	jp	.L101
	jne	.L101
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	movsd	xmm2, QWORD PTR .LC9[rip]
	divsd	xmm2, xmm1
	movapd	xmm1, xmm2
	jmp	"pow"@PLT
	.size	"calc_NthRoot", .-"calc_NthRoot"
	.p2align 4
	.globl	"calc_ln"
	.type	"calc_ln", @function
"calc_ln":
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	jnb	.L109
	jmp	"log"@PLT
	.p2align 4,,10
	.p2align 3
.L109:
	mov	DWORD PTR "state"[rip+52], 2
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.size	"calc_ln", .-"calc_ln"
	.p2align 4
	.globl	"calc_log10"
	.type	"calc_log10", @function
"calc_log10":
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	jnb	.L117
	jmp	"log10"@PLT
	.p2align 4,,10
	.p2align 3
.L117:
	mov	DWORD PTR "state"[rip+52], 2
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.size	"calc_log10", .-"calc_log10"
	.p2align 4
	.globl	"calc_log_base"
	.type	"calc_log_base", @function
"calc_log_base":
	pxor	xmm2, xmm2
	comisd	xmm2, xmm0
	jnb	.L119
	comisd	xmm2, xmm1
	jnb	.L119
	ucomisd	xmm1, QWORD PTR .LC9[rip]
	jp	.L120
	jne	.L120
.L119:
	mov	DWORD PTR "state"[rip+52], 2
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L120:
	push	r14
	movq	r14, xmm1
	push	rbx
	sub	rsp, 8
	call	"log"@PLT
	movq	rbx, xmm0
	movq	xmm0, r14
	call	"log"@PLT
	add	rsp, 8
	movapd	xmm1, xmm0
	movq	xmm0, rbx
	pop	rbx
	pop	r14
	divsd	xmm0, xmm1
	ret
	.size	"calc_log_base", .-"calc_log_base"
	.p2align 4
	.globl	"calc_exp"
	.type	"calc_exp", @function
"calc_exp":
	jmp	"exp"@PLT
	.size	"calc_exp", .-"calc_exp"
	.p2align 4
	.globl	"calc_sqrt"
	.type	"calc_sqrt", @function
"calc_sqrt":
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L133
	sqrtsd	xmm0, xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L133:
	mov	DWORD PTR "state"[rip+52], 2
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.size	"calc_sqrt", .-"calc_sqrt"
	.p2align 4
	.globl	"calc_cbrt"
	.type	"calc_cbrt", @function
"calc_cbrt":
	jmp	"cbrt"@PLT
	.size	"calc_cbrt", .-"calc_cbrt"
	.p2align 4
	.globl	"calc_SquarePower"
	.type	"calc_SquarePower", @function
"calc_SquarePower":
	mulsd	xmm0, xmm0
	ret
	.size	"calc_SquarePower", .-"calc_SquarePower"
	.p2align 4
	.globl	"calc_CubePower"
	.type	"calc_CubePower", @function
"calc_CubePower":
	movapd	xmm1, xmm0
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	ret
	.size	"calc_CubePower", .-"calc_CubePower"
	.p2align 4
	.globl	"calc_reciprocal"
	.type	"calc_reciprocal", @function
"calc_reciprocal":
	movapd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm1, xmm0
	ja	.L143
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	movsd	xmm0, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	ret
	.size	"calc_reciprocal", .-"calc_reciprocal"
	.p2align 4
	.globl	"calc_absolute"
	.type	"calc_absolute", @function
"calc_absolute":
	pxor	xmm2, xmm2
	movapd	xmm3, xmm0
	movapd	xmm1, xmm0
	cmpltsd	xmm0, xmm2
	xorpd	xmm1, XMMWORD PTR .LC4[rip]
	andpd	xmm1, xmm0
	andnpd	xmm0, xmm3
	orpd	xmm0, xmm1
	ret
	.size	"calc_absolute", .-"calc_absolute"
	.p2align 4
	.globl	"calc_factorial"
	.type	"calc_factorial", @function
"calc_factorial":
	ucomisd	xmm0, xmm0
	jp	.L171
	pxor	xmm1, xmm1
	comisd	xmm1, xmm0
	ja	.L171
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm0
	call	"floor"@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	movapd	xmm2, xmm0
	ucomisd	xmm0, xmm1
	jp	.L149
	jne	.L149
	comisd	xmm1, QWORD PTR .LC11[rip]
	ja	.L174
	movsd	xmm3, QWORD PTR .LC9[rip]
	comisd	xmm3, xmm1
	jnb	.L159
	movsd	xmm0, QWORD PTR .LC10[rip]
	movapd	xmm1, xmm3
	comisd	xmm2, xmm0
	jb	.L159
	.p2align 5
	.p2align 4
	.p2align 3
.L161:
	mulsd	xmm1, xmm0
	addsd	xmm0, xmm3
	comisd	xmm2, xmm0
	jb	.L148
	mulsd	xmm1, xmm0
	addsd	xmm0, xmm3
	comisd	xmm2, xmm0
	jnb	.L161
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L149:
	mov	DWORD PTR "state"[rip+52], 2
.L152:
	movsd	xmm1, QWORD PTR .LC0[rip]
.L148:
	movapd	xmm0, xmm1
	add	rsp, 24
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movsd	xmm1, QWORD PTR .LC0[rip]
	mov	DWORD PTR "state"[rip+52], 2
	movapd	xmm0, xmm1
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	movapd	xmm1, xmm3
	add	rsp, 24
	movapd	xmm0, xmm1
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	mov	DWORD PTR "state"[rip+52], 3
	jmp	.L152
	.size	"calc_factorial", .-"calc_factorial"
	.p2align 4
	.globl	"calc_gamma"
	.type	"calc_gamma", @function
"calc_gamma":
	jmp	"tgamma"@PLT
	.size	"calc_gamma", .-"calc_gamma"
	.p2align 4
	.globl	"calc_nCr"
	.type	"calc_nCr", @function
"calc_nCr":
	pxor	xmm2, xmm2
	comisd	xmm2, xmm1
	ja	.L180
	comisd	xmm2, xmm0
	ja	.L180
	comisd	xmm1, xmm0
	jbe	.L186
.L180:
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L186:
	push	rbx
	sub	rsp, 32
	movsd	QWORD PTR 8[rsp], xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC9[rip]
	movsd	QWORD PTR 24[rsp], xmm1
	addsd	xmm0, xmm1
	call	"tgamma"@PLT
	movq	rbx, xmm0
	movsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR 8[rsp]
	call	"tgamma"@PLT
	movsd	xmm1, QWORD PTR 24[rsp]
	subsd	xmm1, QWORD PTR 8[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	movsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, xmm1
	call	"tgamma"@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	add	rsp, 32
	mulsd	xmm1, xmm0
	movq	xmm0, rbx
	pop	rbx
	divsd	xmm0, xmm1
	ret
	.size	"calc_nCr", .-"calc_nCr"
	.p2align 4
	.globl	"calc_nPr"
	.type	"calc_nPr", @function
"calc_nPr":
	pxor	xmm2, xmm2
	comisd	xmm2, xmm1
	ja	.L191
	comisd	xmm2, xmm0
	ja	.L191
	comisd	xmm1, xmm0
	jbe	.L197
.L191:
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.p2align 4,,10
	.p2align 3
.L197:
	push	rbx
	sub	rsp, 16
	movsd	QWORD PTR [rsp], xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC9[rip]
	movsd	QWORD PTR 8[rsp], xmm1
	addsd	xmm0, xmm1
	call	"tgamma"@PLT
	movq	rbx, xmm0
	movsd	xmm0, QWORD PTR 8[rsp]
	subsd	xmm0, QWORD PTR [rsp]
	addsd	xmm0, QWORD PTR .LC9[rip]
	call	"tgamma"@PLT
	add	rsp, 16
	movapd	xmm1, xmm0
	movq	xmm0, rbx
	pop	rbx
	divsd	xmm0, xmm1
	ret
	.size	"calc_nPr", .-"calc_nPr"
	.p2align 4
	.globl	"calc_percent_of"
	.type	"calc_percent_of", @function
"calc_percent_of":
	divsd	xmm0, QWORD PTR .LC12[rip]
	mulsd	xmm0, xmm1
	ret
	.size	"calc_percent_of", .-"calc_percent_of"
	.p2align 4
	.globl	"calc_to_percent"
	.type	"calc_to_percent", @function
"calc_to_percent":
	mulsd	xmm0, QWORD PTR .LC12[rip]
	ret
	.size	"calc_to_percent", .-"calc_to_percent"
	.p2align 4
	.globl	"calc_rand"
	.type	"calc_rand", @function
"calc_rand":
	sub	rsp, 8
	call	"rand"@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC13[rip]
	add	rsp, 8
	ret
	.size	"calc_rand", .-"calc_rand"
	.p2align 4
	.globl	"calc_rand_range"
	.type	"calc_rand_range", @function
"calc_rand_range":
	subsd	xmm1, xmm0
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	QWORD PTR [rsp], xmm1
	call	"rand"@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC13[rip]
	mulsd	xmm0, QWORD PTR [rsp]
	addsd	xmm0, QWORD PTR 8[rsp]
	add	rsp, 24
	ret
	.size	"calc_rand_range", .-"calc_rand_range"
	.p2align 4
	.globl	"calc_deg_to_rad"
	.type	"calc_deg_to_rad", @function
"calc_deg_to_rad":
	mulsd	xmm0, QWORD PTR .LC5[rip]
	divsd	xmm0, QWORD PTR .LC6[rip]
	ret
	.size	"calc_deg_to_rad", .-"calc_deg_to_rad"
	.p2align 4
	.globl	"calc_rad_to_deg"
	.type	"calc_rad_to_deg", @function
"calc_rad_to_deg":
	mulsd	xmm0, QWORD PTR .LC6[rip]
	divsd	xmm0, QWORD PTR .LC5[rip]
	ret
	.size	"calc_rad_to_deg", .-"calc_rad_to_deg"
	.p2align 4
	.globl	"calc_deg_to_grad"
	.type	"calc_deg_to_grad", @function
"calc_deg_to_grad":
	mulsd	xmm0, QWORD PTR .LC14[rip]
	ret
	.size	"calc_deg_to_grad", .-"calc_deg_to_grad"
	.p2align 4
	.globl	"calc_grad_to_deg"
	.type	"calc_grad_to_deg", @function
"calc_grad_to_deg":
	mulsd	xmm0, QWORD PTR .LC15[rip]
	ret
	.size	"calc_grad_to_deg", .-"calc_grad_to_deg"
	.p2align 4
	.globl	"calc_double_to_fraction"
	.type	"calc_double_to_fraction", @function
"calc_double_to_fraction":
	sub	rsp, 104
	ucomisd	xmm0, xmm0
	jp	.L211
	movapd	xmm5, xmm0
	andpd	xmm5, XMMWORD PTR .LC17[rip]
	ucomisd	xmm5, QWORD PTR .LC18[rip]
	movsd	QWORD PTR 48[rsp], xmm5
	ja	.L211
	pxor	xmm1, xmm1
	movsd	xmm6, QWORD PTR .LC19[rip]
	movsd	xmm2, QWORD PTR .LC16[rip]
	cmpnltsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC9[rip]
	comisd	xmm6, xmm5
	andpd	xmm1, xmm0
	andnpd	xmm0, xmm2
	orpd	xmm0, xmm1
	movsd	QWORD PTR 56[rsp], xmm0
	ja	.L218
	mov	rax, QWORD PTR .LC9[rip]
	pxor	xmm6, xmm6
	mov	QWORD PTR 96[rsp], rbx
	movapd	xmm4, xmm5
	mov	ebx, 20
	movsd	QWORD PTR 16[rsp], xmm6
	mov	QWORD PTR 8[rsp], rax
	movq	xmm5, rax
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L219:
	movapd	xmm6, xmm0
	movapd	xmm5, xmm2
.L216:
	movapd	xmm0, xmm4
	movsd	QWORD PTR 32[rsp], xmm6
	movsd	QWORD PTR 24[rsp], xmm5
	movsd	QWORD PTR 40[rsp], xmm4
	call	"floor"@PLT
	movsd	xmm6, QWORD PTR 32[rsp]
	movsd	xmm5, QWORD PTR 24[rsp]
	movapd	xmm2, xmm0
	movapd	xmm3, xmm0
	mulsd	xmm0, xmm6
	addsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm0, QWORD PTR .LC20[rip]
	mulsd	xmm2, xmm5
	addsd	xmm2, QWORD PTR 16[rsp]
	ja	.L215
	movapd	xmm1, xmm2
	movsd	xmm7, QWORD PTR .LC21[rip]
	divsd	xmm1, xmm0
	subsd	xmm1, QWORD PTR 48[rsp]
	andpd	xmm1, XMMWORD PTR .LC17[rip]
	comisd	xmm7, xmm1
	ja	.L215
	movsd	xmm4, QWORD PTR 40[rsp]
	movsd	xmm7, QWORD PTR .LC19[rip]
	subsd	xmm4, xmm3
	movapd	xmm3, xmm4
	andpd	xmm3, XMMWORD PTR .LC17[rip]
	movapd	xmm1, xmm4
	comisd	xmm7, xmm3
	ja	.L215
	movsd	xmm4, QWORD PTR .LC9[rip]
	movsd	QWORD PTR 16[rsp], xmm5
	movsd	QWORD PTR 8[rsp], xmm6
	divsd	xmm4, xmm1
	sub	ebx, 1
	jne	.L219
.L215:
	mulsd	xmm2, QWORD PTR 56[rsp]
	cvttsd2si	eax, xmm0
	mov	rbx, QWORD PTR 96[rsp]
	mov	ecx, 1
	cvttsd2si	edx, xmm2
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L218:
	xor	edx, edx
	mov	eax, 1
	mov	ecx, 1
.L210:
	and	ecx, 1
	mov	DWORD PTR 84[rsp], edx
	mov	DWORD PTR 88[rsp], eax
	mov	rdx, rcx
	mov	rax, QWORD PTR 84[rsp]
	add	rsp, 104
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	xor	edx, edx
	mov	eax, 1
	xor	ecx, ecx
	jmp	.L210
	.size	"calc_double_to_fraction", .-"calc_double_to_fraction"
	.p2align 4
	.globl	"calc_mixed_fraction"
	.type	"calc_mixed_fraction", @function
"calc_mixed_fraction":
	pxor	xmm3, xmm3
	ucomisd	xmm2, xmm3
	jp	.L224
	je	.L232
.L224:
	divsd	xmm1, xmm2
	pxor	xmm4, xmm4
	movapd	xmm3, xmm0
	movsd	xmm5, QWORD PTR .LC16[rip]
	cmpnltsd	xmm3, xmm4
	andpd	xmm0, XMMWORD PTR .LC17[rip]
	movsd	xmm4, QWORD PTR .LC9[rip]
	andpd	xmm4, xmm3
	andnpd	xmm3, xmm5
	orpd	xmm3, xmm4
	addsd	xmm0, xmm1
	mulsd	xmm0, xmm3
	ret
	.p2align 4,,10
	.p2align 3
.L232:
	mov	DWORD PTR "state"[rip+52], 1
	movsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.size	"calc_mixed_fraction", .-"calc_mixed_fraction"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	2146959360
	.align 8
.LC3:
	.long	0
	.long	1074790400
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
	.align 8
.LC6:
	.long	0
	.long	1080459264
	.align 8
.LC7:
	.long	0
	.long	1080623104
	.align 8
.LC8:
	.long	0
	.long	1076101120
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.align 8
.LC10:
	.long	0
	.long	1073741824
	.align 8
.LC11:
	.long	0
	.long	1080377344
	.align 8
.LC12:
	.long	0
	.long	1079574528
	.align 8
.LC13:
	.long	-4194304
	.long	1105199103
	.align 8
.LC14:
	.long	1908874354
	.long	1072809756
	.align 8
.LC15:
	.long	-858993459
	.long	1072483532
	.align 8
.LC16:
	.long	0
	.long	-1074790400
	.section	.rodata.cst16
	.align 16
.LC17:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC18:
	.long	-1
	.long	2146435071
	.align 8
.LC19:
	.long	-400107883
	.long	1041313291
	.align 8
.LC20:
	.long	0
	.long	1093567616
	.align 8
.LC21:
	.long	-1698910392
	.long	1048238066
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
