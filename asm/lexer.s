	.file	"lexer.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"quad_pos"
.LC1:
	.string	"quad_neg"
.LC2:
	.string	"sin"
.LC3:
	.string	"cos"
.LC4:
	.string	"tan"
.LC5:
	.string	"asin"
.LC6:
	.string	"acos"
.LC7:
	.string	"atan"
.LC8:
	.string	"sinh"
.LC9:
	.string	"cosh"
.LC10:
	.string	"tanh"
.LC11:
	.string	"asinh"
.LC12:
	.string	"acosh"
.LC13:
	.string	"atanh"
.LC14:
	.string	"pow10"
.LC15:
	.string	"nth_root"
.LC16:
	.string	"ln"
.LC17:
	.string	"log10"
.LC18:
	.string	"log_base"
.LC19:
	.string	"exp"
.LC20:
	.string	"sqrt"
.LC21:
	.string	"cbrt"
.LC22:
	.string	"square"
.LC23:
	.string	"cube"
.LC24:
	.string	"reciprocal"
.LC25:
	.string	"abs"
.LC26:
	.string	"factorial"
.LC27:
	.string	"gamma"
.LC28:
	.string	"nCr"
.LC29:
	.string	"nPr"
.LC30:
	.string	"percent_of"
.LC31:
	.string	"to_percent"
.LC32:
	.string	"rand"
.LC33:
	.string	"rand_range"
.LC34:
	.string	"deg_to_rad"
.LC35:
	.string	"rad_to_deg"
.LC36:
	.string	"deg_to_grad"
.LC37:
	.string	"grad_to_deg"
.LC38:
	.string	"mixed_fraction"
.LC39:
	.string	"A"
.LC40:
	.string	"B"
.LC41:
	.string	"X"
.LC42:
	.string	"Y"
.LC43:
	.string	"ANS"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC44:
	.string	"Lexer Error: Unknown identifier '%s'\n"
	.section	.rodata.str1.1
.LC45:
	.string	"+-*/%^="
	.text
	.p2align 4
	.globl	"lexer"
	.type	"lexer", @function
"lexer":
	sub	rsp, 6344
	mov	QWORD PTR 6296[rsp], rbx
	mov	QWORD PTR 6336[rsp], r15
	movzx	ebx, BYTE PTR [rsi]
	mov	QWORD PTR 8[rsp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 6280[rsp], rax
	xor	eax, eax
	test	bl, bl
	je	.L2
	mov	QWORD PTR 6304[rsp], rbp
	mov	rbp, rsi
	xor	r15d, r15d
	mov	QWORD PTR 6312[rsp], r12
	mov	QWORD PTR 6328[rsp], r14
	xor	r14d, r14d
	mov	QWORD PTR 6320[rsp], r13
	call	"__ctype_b_loc"@PLT
	mov	r8, rbp
	mov	r12, rax
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L120:
	cmp	r15d, 255
	jg	.L55
	movabs	rdi, -4294967296
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 48[rsp+rax*8], 2
	mov	QWORD PTR 56[rsp+rax*8], rdi
	mov	BYTE PTR 64[rsp+rax*8], bl
	.p2align 6
	.p2align 4
	.p2align 3
.L55:
	add	r14d, 1
	movsxd	r8, r14d
	add	r8, rbp
.L4:
	movzx	ebx, BYTE PTR [r8]
	test	bl, bl
	je	.L118
.L56:
	mov	rdi, QWORD PTR [r12]
	movsx	rax, bl
	movzx	eax, WORD PTR [rdi+rax*2]
	test	ah, 32
	jne	.L55
	test	ah, 8
	jne	.L108
	cmp	bl, 46
	je	.L108
	test	ah, 4
	jne	.L119
	movsx	esi, bl
	lea	rdi, .LC45[rip]
	call	"strchr"@PLT
	test	rax, rax
	jne	.L120
	cmp	bl, 40
	je	.L121
	cmp	bl, 41
	je	.L122
	cmp	bl, 44
	je	.L123
	cmp	r15d, 255
	jg	.L55
	movabs	rdi, -4294967296
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 48[rsp+rax*8], 7
	mov	QWORD PTR 56[rsp+rax*8], rdi
	mov	BYTE PTR 64[rsp+rax*8], bl
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L108:
	movsxd	rax, r14d
	lea	rbx, 0[rbp+rax]
	movsx	rcx, BYTE PTR [rbx]
	test	BYTE PTR 1[rdi+rcx*2], 8
	jne	.L109
	cmp	cl, 46
	jne	.L61
.L109:
	lea	rcx, 1[rbp+rax]
	mov	edx, r14d
	.p2align 5
	.p2align 4
	.p2align 3
.L112:
	movsx	rsi, BYTE PTR [rcx]
	mov	rbx, rcx
	add	edx, 1
	lea	rcx, 1[rcx]
	test	BYTE PTR 1[rdi+rsi*2], 8
	jne	.L112
	cmp	sil, 46
	je	.L112
	mov	eax, edx
	mov	ecx, 63
	sub	eax, r14d
	mov	r14d, edx
	cmp	eax, ecx
	cmovg	eax, ecx
	movsxd	r13, eax
	mov	rax, r13
.L7:
	mov	rsi, r8
	mov	rdx, rax
	lea	rdi, 6208[rsp]
	call	"strncpy"@PLT
	xor	esi, esi
	lea	rdi, 6208[rsp]
	mov	BYTE PTR 6208[rsp+r13], 0
	call	"strtod"@PLT
	mov	r8, rbx
	cmp	r15d, 255
	jg	.L4
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 52[rsp+rax*8], 0
	movzx	ebx, BYTE PTR [r8]
	mov	DWORD PTR 48[rsp+rax*8], 0
	mov	DWORD PTR 60[rsp+rax*8], -1
	movsd	QWORD PTR 64[rsp+rax*8], xmm0
	test	bl, bl
	jne	.L56
	.p2align 4
	.p2align 3
.L118:
	pxor	xmm0, xmm0
	mov	DWORD PTR 36[rsp], 0
	movups	XMMWORD PTR 20[rsp], xmm0
	cmp	r15d, 255
	jle	.L124
	mov	rbp, QWORD PTR 6304[rsp]
	mov	r12, QWORD PTR 6312[rsp]
	mov	r13, QWORD PTR 6320[rsp]
	mov	r14, QWORD PTR 6328[rsp]
.L59:
	mov	rdi, QWORD PTR 8[rsp]
	lea	rsi, 48[rsp]
	mov	edx, 6152
	mov	DWORD PTR 6192[rsp], r15d
	call	"memcpy"@PLT
	mov	rax, QWORD PTR 6280[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L125
	mov	rax, QWORD PTR 8[rsp]
	mov	rbx, QWORD PTR 6296[rsp]
	mov	r15, QWORD PTR 6336[rsp]
	add	rsp, 6344
	ret
	.p2align 4,,10
	.p2align 3
.L119:
	movsxd	rdx, r14d
	movsx	rcx, BYTE PTR 0[rbp+rdx]
	test	BYTE PTR [rdi+rcx*2], 8
	jne	.L110
	cmp	cl, 95
	jne	.L63
.L110:
	lea	eax, 1[r14]
	lea	rsi, 0[rbp+rdx]
	cdqe
	sub	rsi, rax
	.p2align 5
	.p2align 4
	.p2align 3
.L113:
	movsx	rcx, BYTE PTR 1[rsi+rax]
	mov	r9, rax
	add	rax, 1
	test	BYTE PTR [rdi+rcx*2], 8
	jne	.L113
	cmp	cl, 95
	je	.L113
	mov	eax, r9d
	mov	edx, 63
	sub	eax, r14d
	mov	r14d, r9d
	cmp	eax, edx
	cmovg	eax, edx
	movsxd	rbx, eax
	mov	rdx, rbx
.L11:
	mov	rsi, r8
	lea	rdi, 6208[rsp]
	call	"strncpy"@PLT
	mov	BYTE PTR 6208[rsp+rbx], 0
	movabs	rax, 8317990591784908145
	cmp	QWORD PTR 6208[rsp], rax
	je	.L126
.L14:
	movabs	rax, 7450482514539410801
	cmp	QWORD PTR 6208[rsp], rax
	je	.L127
.L17:
	cmp	DWORD PTR 6208[rsp], 7235955
	je	.L128
	cmp	DWORD PTR 6208[rsp], 7565155
	je	.L129
	cmp	DWORD PTR 6208[rsp], 7233908
	je	.L130
	cmp	DWORD PTR 6208[rsp], 1852404577
	je	.L131
.L25:
	cmp	DWORD PTR 6208[rsp], 1936679777
	je	.L132
.L27:
	cmp	DWORD PTR 6208[rsp], 1851880545
	je	.L133
.L29:
	cmp	DWORD PTR 6208[rsp], 1752066419
	je	.L134
.L31:
	cmp	DWORD PTR 6208[rsp], 1752395619
	je	.L135
.L33:
	cmp	DWORD PTR 6208[rsp], 1752064372
	je	.L136
.L35:
	cmp	DWORD PTR 6208[rsp], 1852404577
	je	.L137
.L37:
	cmp	DWORD PTR 6208[rsp], 1936679777
	je	.L138
.L39:
	cmp	DWORD PTR 6208[rsp], 1851880545
	je	.L139
.L41:
	cmp	DWORD PTR 6208[rsp], 829910896
	je	.L140
.L43:
	movabs	rax, 8390047167832159342
	cmp	QWORD PTR 6208[rsp], rax
	je	.L141
.L45:
	lea	rsi, .LC16[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L80
	lea	rsi, .LC17[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L81
	lea	rsi, .LC18[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L82
	lea	rsi, .LC19[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L83
	lea	rsi, .LC20[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L84
	lea	rsi, .LC21[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L85
	lea	rsi, .LC22[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L86
	lea	rsi, .LC23[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L87
	lea	rsi, .LC24[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L88
	lea	rsi, .LC25[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L89
	lea	rsi, .LC26[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L90
	lea	rsi, .LC27[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L91
	lea	rsi, .LC28[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L92
	lea	rsi, .LC29[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L93
	lea	rsi, .LC30[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L94
	lea	rsi, .LC31[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L95
	lea	rsi, .LC32[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L96
	lea	rsi, .LC33[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L97
	lea	rsi, .LC34[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L98
	lea	rsi, .LC35[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L99
	lea	rsi, .LC36[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L100
	lea	rsi, .LC37[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L101
	lea	rsi, .LC38[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L102
	lea	rsi, .LC39[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L103
	lea	rsi, .LC40[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L104
	lea	rsi, .LC41[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L105
	lea	rsi, .LC42[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	je	.L106
	lea	rsi, .LC43[rip]
	lea	rdi, 6208[rsp]
	call	"strcmp"@PLT
	test	eax, eax
	jne	.L142
	xor	ecx, ecx
	mov	edx, 4
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L126:
	cmp	BYTE PTR 6216[rsp], 0
	jne	.L14
	xor	edx, edx
	mov	ecx, 1
	mov	eax, 3
.L16:
	movsxd	r8, r14d
	add	r8, rbp
	cmp	r15d, 255
	jg	.L4
	movsxd	rsi, r15d
	add	r15d, 1
	lea	rsi, [rsi+rsi*2]
	mov	DWORD PTR 48[rsp+rsi*8], 1
	mov	DWORD PTR 52[rsp+rsi*8], eax
	mov	DWORD PTR 56[rsp+rsi*8], ecx
	mov	DWORD PTR 60[rsp+rsi*8], edx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L124:
	mov	rbp, QWORD PTR 6304[rsp]
	mov	r12, QWORD PTR 6312[rsp]
	movsxd	rax, r15d
	add	r15d, 1
	mov	r13, QWORD PTR 6320[rsp]
	mov	r14, QWORD PTR 6328[rsp]
.L58:
	mov	DWORD PTR 16[rsp], 6
	mov	rdx, QWORD PTR 32[rsp]
	lea	rax, [rax+rax*2]
	mov	DWORD PTR 28[rsp], -1
	movdqa	xmm0, XMMWORD PTR 16[rsp]
	mov	QWORD PTR 64[rsp+rax*8], rdx
	movups	XMMWORD PTR 48[rsp+rax*8], xmm0
	jmp	.L59
.L121:
	cmp	r15d, 255
	jg	.L55
	movabs	rdx, -4294967296
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 48[rsp+rax*8], 3
	mov	QWORD PTR 56[rsp+rax*8], rdx
	mov	BYTE PTR 64[rsp+rax*8], 40
	jmp	.L55
.L122:
	cmp	r15d, 255
	jg	.L55
	movabs	rdi, -4294967296
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 48[rsp+rax*8], 4
	mov	QWORD PTR 56[rsp+rax*8], rdi
	mov	BYTE PTR 64[rsp+rax*8], 41
	jmp	.L55
.L127:
	cmp	BYTE PTR 6216[rsp], 0
	jne	.L17
	mov	edx, 1
	mov	ecx, 1
	mov	eax, 3
	jmp	.L16
.L129:
	mov	edx, 3
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L123:
	cmp	r15d, 255
	jg	.L55
	movabs	rdx, -4294967296
	movsxd	rax, r15d
	add	r15d, 1
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 48[rsp+rax*8], 5
	mov	QWORD PTR 56[rsp+rax*8], rdx
	mov	BYTE PTR 64[rsp+rax*8], 44
	jmp	.L55
.L2:
	pxor	xmm0, xmm0
	mov	DWORD PTR 36[rsp], 0
	mov	r15d, 1
	xor	eax, eax
	movups	XMMWORD PTR 20[rsp], xmm0
	jmp	.L58
.L61:
	xor	eax, eax
	xor	r13d, r13d
	jmp	.L7
.L128:
	mov	edx, 2
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L63:
	xor	edx, edx
	xor	ebx, ebx
	jmp	.L11
.L132:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L27
	mov	edx, 6
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L130:
	mov	edx, 4
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L131:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L25
	mov	edx, 5
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L133:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L29
	mov	edx, 7
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L134:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L31
	mov	edx, 8
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L135:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L33
	mov	edx, 9
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L136:
	cmp	BYTE PTR 6212[rsp], 0
	jne	.L35
	mov	edx, 10
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L137:
	cmp	WORD PTR 6212[rsp], 104
	jne	.L37
	mov	edx, 11
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L138:
	cmp	WORD PTR 6212[rsp], 104
	jne	.L39
	mov	edx, 12
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L125:
	mov	QWORD PTR 6304[rsp], rbp
	mov	QWORD PTR 6312[rsp], r12
	mov	QWORD PTR 6320[rsp], r13
	mov	QWORD PTR 6328[rsp], r14
	call	"__stack_chk_fail"@PLT
.L142:
	mov	rdi, QWORD PTR "stderr"[rip]
	lea	rdx, 6208[rsp]
	lea	rsi, .LC44[rip]
	xor	eax, eax
	call	"fprintf"@PLT
	mov	edi, 1
	call	"exit"@PLT
.L140:
	cmp	WORD PTR 6212[rsp], 48
	jne	.L43
	mov	edx, 14
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L139:
	cmp	WORD PTR 6212[rsp], 104
	jne	.L41
	mov	edx, 13
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L106:
	xor	ecx, ecx
	mov	edx, 3
	jmp	.L16
.L105:
	xor	ecx, ecx
	mov	edx, 2
	jmp	.L16
.L104:
	xor	ecx, ecx
	mov	edx, 1
	jmp	.L16
.L103:
	xor	edx, edx
	xor	ecx, ecx
	jmp	.L16
.L86:
	mov	edx, 22
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L85:
	mov	edx, 21
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L84:
	mov	edx, 20
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L83:
	mov	edx, 19
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L82:
	mov	edx, 18
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L81:
	mov	edx, 17
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L80:
	mov	edx, 16
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L141:
	cmp	BYTE PTR 6216[rsp], 0
	jne	.L45
	mov	edx, 15
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L102:
	mov	edx, 38
	mov	ecx, 1
	mov	eax, 3
	jmp	.L16
.L101:
	mov	edx, 37
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L100:
	mov	edx, 36
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L99:
	mov	edx, 35
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L98:
	mov	edx, 34
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L97:
	mov	edx, 33
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L96:
	mov	edx, 32
	mov	ecx, 1
	jmp	.L16
.L95:
	mov	edx, 31
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L94:
	mov	edx, 30
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L93:
	mov	edx, 29
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L92:
	mov	edx, 28
	mov	ecx, 1
	mov	eax, 2
	jmp	.L16
.L91:
	mov	edx, 27
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L90:
	mov	edx, 26
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L89:
	mov	edx, 25
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L88:
	mov	edx, 24
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
.L87:
	mov	edx, 23
	mov	ecx, 1
	mov	eax, 1
	jmp	.L16
	.size	"lexer", .-"lexer"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
