	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error: Division by Zero!"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Error: Math Domain Error (Invalid Input Value)!"
	.align 8
.LC2:
	.string	"Error: Math Overflow Range Limit Exceeded!"
	.align 8
.LC3:
	.string	"Error: Math Underflow Range Limit Exceeded!"
	.align 8
.LC4:
	.string	"Error: Invalid Expression Syntax Format!"
	.align 8
.LC5:
	.string	"Error: Unrecognized Math Identifier Word!"
	.align 8
.LC6:
	.string	"Error: Evaluator Memory Stack Overflow Overflow!"
	.align 8
.LC7:
	.string	"Error: Mismatched Function Arguments (Stack Underflow)!"
	.align 8
.LC8:
	.string	"Error: An unhandled structural exception occurred."
	.text
	.p2align 4
	.globl	"print_calculator_error"
	.type	"print_calculator_error", @function
"print_calculator_error":
	cmp	edi, 8
	ja	.L2
	lea	rdx, .L4[rip]
	mov	edi, edi
	movsxd	rax, DWORD PTR [rdx+rdi*4]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L2-.L4
	.long	.L11-.L4
	.long	.L10-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
	.p2align 4,,10
	.p2align 3
.L3:
	lea	rdi, .LC7[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L11:
	lea	rdi, .LC0[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L10:
	lea	rdi, .LC1[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L9:
	lea	rdi, .LC2[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L8:
	lea	rdi, .LC3[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	lea	rdi, .LC4[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	lea	rdi, .LC5[rip]
	jmp	"puts"@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	lea	rdi, .LC6[rip]
	jmp	"puts"@PLT
.L2:
	lea	rdi, .LC8[rip]
	jmp	"puts"@PLT
	.size	"print_calculator_error", .-"print_calculator_error"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Execution Error: Unknown assignment destination ID.\n"
	.align 8
.LC10:
	.string	"Assigned value %g to variable.\n"
	.section	.rodata.str1.1
.LC11:
	.string	"Result: %g  [%d/%d]\n"
.LC12:
	.string	"Result: %g\n"
	.text
	.p2align 4
	.globl	"run_calculator_line"
	.type	"run_calculator_line", @function
"run_calculator_line":
	sub	rsp, 6216
	mov	rsi, QWORD PTR fs:40
	mov	QWORD PTR 6200[rsp], rsi
	mov	rsi, rdi
	lea	rdi, 32[rsp]
	mov	DWORD PTR "state"[rip+52], 0
	call	"parse_expression"@PLT
	mov	edi, DWORD PTR "state"[rip+52]
	test	edi, edi
	jne	.L41
	sub	rsp, 6160
	mov	edx, 6152
	mov	rdi, rsp
	lea	rsi, 6192[rsp]
	call	"memcpy"@PLT
	call	"evaluate"@PLT
	mov	edi, DWORD PTR "state"[rip+52]
	add	rsp, 6160
	test	edi, edi
	jne	.L41
	mov	eax, DWORD PTR 6184[rsp]
	test	eax, eax
	je	.L18
	cmp	DWORD PTR 6188[rsp], 4
	ja	.L19
	mov	eax, DWORD PTR 6188[rsp]
	lea	rdx, .L21[rip]
	movsxd	rax, DWORD PTR [rdx+rax*4]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L25-.L21
	.long	.L24-.L21
	.long	.L23-.L21
	.long	.L22-.L21
	.long	.L20-.L21
	.text
	.p2align 4,,10
	.p2align 3
.L41:
	mov	rax, QWORD PTR 6200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L40
	add	rsp, 6216
	jmp	"print_calculator_error"
	.p2align 4,,10
	.p2align 3
.L18:
	movsd	QWORD PTR "state"[rip+32], xmm0
	movsd	QWORD PTR 8[rsp], xmm0
	call	"calc_double_to_fraction"@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	mov	rcx, rdx
	mov	rdx, rax
	mov	QWORD PTR 20[rsp], rax
	shr	rdx, 32
	test	ecx, ecx
	setne	cl
	cmp	edx, 1
	setne	al
	test	cl, al
	je	.L29
	cmp	edx, 1000
	jle	.L42
.L29:
	mov	rax, QWORD PTR 6200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L40
	lea	rdi, .LC12[rip]
	mov	eax, 1
	add	rsp, 6216
	jmp	"printf"@PLT
	.p2align 4,,10
	.p2align 3
.L22:
	movsd	QWORD PTR "state"[rip+24], xmm0
.L26:
	mov	rax, QWORD PTR 6200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L40
	lea	rdi, .LC10[rip]
	mov	eax, 1
	add	rsp, 6216
	jmp	"printf"@PLT
	.p2align 4,,10
	.p2align 3
.L23:
	movsd	QWORD PTR "state"[rip+16], xmm0
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L24:
	movsd	QWORD PTR "state"[rip+8], xmm0
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L25:
	movsd	QWORD PTR "state"[rip], xmm0
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L20:
	movsd	QWORD PTR "state"[rip+32], xmm0
	jmp	.L26
.L19:
	mov	rax, QWORD PTR 6200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L40
	mov	rcx, QWORD PTR "stderr"[rip]
	mov	edx, 52
	mov	esi, 1
	lea	rdi, .LC9[rip]
	add	rsp, 6216
	jmp	"fwrite"@PLT
	.p2align 4,,10
	.p2align 3
.L42:
	mov	rax, QWORD PTR 6200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L40
	mov	esi, DWORD PTR 20[rsp]
	lea	rdi, .LC11[rip]
	mov	eax, 1
	add	rsp, 6216
	jmp	"printf"@PLT
.L40:
	call	"__stack_chk_fail"@PLT
	.size	"run_calculator_line", .-"run_calculator_line"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"===================================="
	.align 8
.LC14:
	.string	"           CLI Calculator           "
	.align 8
.LC15:
	.string	"  Type expressions or 'exit' to quit"
	.align 8
.LC16:
	.string	"====================================\n"
	.section	.rodata.str1.1
.LC17:
	.string	"calc > "
.LC18:
	.string	"\n"
.LC19:
	.string	"exit"
.LC20:
	.string	"Goodbye!"
.LC21:
	.string	"quit"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	"main"
	.type	"main", @function
"main":
	sub	rsp, 1048
	mov	rdi, QWORD PTR fs:40
	mov	QWORD PTR 1032[rsp], rdi
	lea	rdi, .LC13[rip]
	call	"puts"@PLT
	lea	rdi, .LC14[rip]
	call	"puts"@PLT
	lea	rdi, .LC15[rip]
	call	"puts"@PLT
	lea	rdi, .LC16[rip]
	call	"puts"@PLT
	.p2align 4
	.p2align 3
.L44:
	lea	rdi, .LC17[rip]
	xor	eax, eax
	call	"printf"@PLT
	mov	rdx, QWORD PTR "stdin"[rip]
	mov	esi, 1024
	mov	rdi, rsp
	call	"fgets"@PLT
	test	rax, rax
	je	.L45
	lea	rsi, .LC18[rip]
	mov	rdi, rsp
	call	"strcspn"@PLT
	mov	BYTE PTR [rsp+rax], 0
	cmp	DWORD PTR [rsp], 1953069157
	je	.L60
.L46:
	cmp	DWORD PTR [rsp], 1953068401
	je	.L61
.L49:
	cmp	BYTE PTR [rsp], 0
	je	.L44
	mov	rdi, rsp
	call	"run_calculator_line"
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L60:
	cmp	BYTE PTR 4[rsp], 0
	jne	.L46
.L51:
	lea	rdi, .LC20[rip]
	call	"puts"@PLT
.L45:
	mov	rax, QWORD PTR 1032[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L62
	xor	eax, eax
	add	rsp, 1048
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	cmp	BYTE PTR 4[rsp], 0
	je	.L51
	jmp	.L49
.L62:
	call	"__stack_chk_fail"@PLT
	.size	"main", .-"main"
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
