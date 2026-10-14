	.file	"evaluator.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	"evaluate"
	.type	"evaluate", @function
"evaluate":
	sub	rsp, 8312
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8248[rsp], rax
	mov	eax, DWORD PTR 14464[rsp]
	test	eax, eax
	jle	.L40
	lea	rax, [rax+rax*2]
	mov	QWORD PTR 8264[rsp], rbx
	lea	rbx, 8320[rsp]
	mov	QWORD PTR 8272[rsp], rbp
	mov	ebp, -1
	mov	QWORD PTR 8280[rsp], r12
	lea	r12, .L31[rip]
	mov	QWORD PTR 8296[rsp], r14
	lea	r14, "state"[rip]
	mov	QWORD PTR 8304[rsp], r15
	lea	r15, 8320[rsp+rax*8]
	mov	QWORD PTR 8288[rsp], r13
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L48:
	cmp	ebp, 1022
	jg	.L28
	movsd	xmm0, QWORD PTR 32[rsp]
	add	ebp, 1
	movsxd	rax, ebp
	movsd	QWORD PTR 48[rsp+rax*8], xmm0
.L7:
	add	rbx, 24
	cmp	rbx, r15
	je	.L47
.L37:
	movdqu	xmm0, XMMWORD PTR [rbx]
	mov	rax, QWORD PTR 16[rbx]
	mov	edx, DWORD PTR 52[r14]
	mov	QWORD PTR 32[rsp], rax
	movaps	XMMWORD PTR 16[rsp], xmm0
	test	edx, edx
	jne	.L44
	mov	eax, DWORD PTR [rbx]
	test	eax, eax
	je	.L48
	cmp	eax, 2
	je	.L49
	cmp	eax, 1
	jne	.L7
	mov	eax, DWORD PTR 8[rbx]
	mov	edi, DWORD PTR 12[rbx]
	test	eax, eax
	jne	.L50
	cmp	ebp, 1022
	jg	.L28
	add	ebp, 1
	cmp	edi, 4
	ja	.L29
	movsxd	rax, DWORD PTR [r12+rdi*4]
	add	rax, r12
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L31:
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
	.p2align 4,,10
	.p2align 3
.L49:
	movzx	eax, BYTE PTR 32[rsp]
	cmp	al, 126
	je	.L51
	test	ebp, ebp
	jle	.L12
	lea	r13d, -1[rbp]
	mov	ebp, ebp
	movsd	xmm1, QWORD PTR 48[rsp+rbp*8]
	mov	ebp, r13d
	movsd	xmm0, QWORD PTR 48[rsp+rbp*8]
	cmp	al, 47
	jg	.L13
	cmp	al, 36
	jle	.L14
	sub	eax, 37
	cmp	al, 10
	ja	.L14
	lea	rsi, .L16[rip]
	movzx	eax, al
	movsxd	rax, DWORD PTR [rsi+rax*4]
	add	rax, rsi
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L16:
	.long	.L20-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L19-.L16
	.long	.L18-.L16
	.long	.L14-.L16
	.long	.L17-.L16
	.long	.L14-.L16
	.long	.L15-.L16
	.text
	.p2align 4,,10
	.p2align 3
.L51:
	test	ebp, ebp
	js	.L12
	mov	r13d, ebp
	pxor	xmm0, xmm0
	add	rbx, 24
	movsd	xmm1, QWORD PTR 48[rsp+r13*8]
	call	"calc_subtraction"@PLT
	movsd	QWORD PTR 48[rsp+r13*8], xmm0
	cmp	rbx, r15
	jne	.L37
	.p2align 4
	.p2align 3
.L47:
	test	ebp, ebp
	jne	.L45
	movsd	xmm0, QWORD PTR 48[rsp]
	mov	rbx, QWORD PTR 8264[rsp]
	mov	rbp, QWORD PTR 8272[rsp]
	mov	r12, QWORD PTR 8280[rsp]
	mov	r13, QWORD PTR 8288[rsp]
	mov	r14, QWORD PTR 8296[rsp]
	mov	r15, QWORD PTR 8304[rsp]
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L50:
	call	"find_function_by_id"@PLT
	mov	rdx, rax
	test	rax, rax
	je	.L52
	mov	eax, DWORD PTR 4[rax]
	lea	ecx, -1[rax]
	cmp	ebp, ecx
	jl	.L12
	test	eax, eax
	je	.L53
	cmp	eax, 1
	je	.L54
	cmp	eax, 2
	je	.L55
	cmp	eax, 3
	jne	.L7
	movsxd	rsi, ebp
	lea	eax, -1[rbp]
	sub	ebp, 2
	movsxd	rcx, ebp
	cdqe
	movsd	xmm2, QWORD PTR 48[rsp+rsi*8]
	mov	QWORD PTR 8[rsp], rcx
	movsd	xmm0, QWORD PTR 48[rsp+rcx*8]
	movsd	xmm1, QWORD PTR 48[rsp+rax*8]
	call	[QWORD PTR 8[rdx]]
	mov	rcx, QWORD PTR 8[rsp]
	movsd	QWORD PTR 48[rsp+rcx*8], xmm0
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L28:
	mov	DWORD PTR "state"[rip+52], 7
.L44:
	mov	rbx, QWORD PTR 8264[rsp]
	mov	rbp, QWORD PTR 8272[rsp]
	mov	r12, QWORD PTR 8280[rsp]
	mov	r13, QWORD PTR 8288[rsp]
	mov	r14, QWORD PTR 8296[rsp]
	mov	r15, QWORD PTR 8304[rsp]
.L39:
	movsd	xmm0, QWORD PTR .LC0[rip]
.L1:
	mov	rax, QWORD PTR 8248[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L56
	add	rsp, 8312
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	mov	DWORD PTR "state"[rip+52], 5
	movsd	xmm0, QWORD PTR .LC0[rip]
	.p2align 4
	.p2align 3
.L22:
	movsd	QWORD PTR 48[rsp+rbp*8], xmm0
	mov	ebp, r13d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L53:
	call	[QWORD PTR 8[rdx]]
	add	ebp, 1
	movsxd	rax, ebp
	movsd	QWORD PTR 48[rsp+rax*8], xmm0
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L32:
	movsd	xmm0, QWORD PTR 24[r14]
	.p2align 4
	.p2align 3
.L36:
	movsxd	rax, ebp
	movsd	QWORD PTR 48[rsp+rax*8], xmm0
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L33:
	movsd	xmm0, QWORD PTR 16[r14]
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L34:
	movsd	xmm0, QWORD PTR 8[r14]
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L35:
	movsd	xmm0, QWORD PTR [r14]
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L30:
	movsd	xmm0, QWORD PTR 32[r14]
	jmp	.L36
.L15:
	call	"calc_division"@PLT
	jmp	.L22
.L17:
	call	"calc_subtraction"@PLT
	jmp	.L22
.L18:
	call	"calc_addition"@PLT
	jmp	.L22
.L19:
	call	"calc_multiplication"@PLT
	jmp	.L22
.L20:
	call	"calc_modulus"@PLT
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L13:
	cmp	al, 94
	jne	.L14
	call	"calc_exponent"@PLT
	jmp	.L22
.L29:
	mov	DWORD PTR "state"[rip+52], 5
	movsd	xmm0, QWORD PTR .LC0[rip]
	jmp	.L36
.L55:
	lea	eax, -1[rbp]
	movsxd	rcx, ebp
	movsxd	rbp, eax
	mov	DWORD PTR 8[rsp], eax
	movsd	xmm1, QWORD PTR 48[rsp+rcx*8]
	movsd	xmm0, QWORD PTR 48[rsp+rbp*8]
	call	[QWORD PTR 8[rdx]]
	movsd	QWORD PTR 48[rsp+rbp*8], xmm0
	mov	ebp, DWORD PTR 8[rsp]
	jmp	.L7
.L45:
	mov	rbx, QWORD PTR 8264[rsp]
	mov	rbp, QWORD PTR 8272[rsp]
	mov	r12, QWORD PTR 8280[rsp]
	mov	r13, QWORD PTR 8288[rsp]
	mov	r14, QWORD PTR 8296[rsp]
	mov	r15, QWORD PTR 8304[rsp]
.L40:
	mov	DWORD PTR "state"[rip+52], 5
	jmp	.L39
.L54:
	movsxd	rax, ebp
	mov	QWORD PTR 8[rsp], rax
	movsd	xmm0, QWORD PTR 48[rsp+rax*8]
	call	[QWORD PTR 8[rdx]]
	mov	rax, QWORD PTR 8[rsp]
	movsd	QWORD PTR 48[rsp+rax*8], xmm0
	jmp	.L7
.L12:
	mov	DWORD PTR "state"[rip+52], 8
	jmp	.L44
.L52:
	mov	DWORD PTR "state"[rip+52], 6
	jmp	.L44
.L56:
	mov	QWORD PTR 8264[rsp], rbx
	mov	QWORD PTR 8272[rsp], rbp
	mov	QWORD PTR 8280[rsp], r12
	mov	QWORD PTR 8288[rsp], r13
	mov	QWORD PTR 8296[rsp], r14
	mov	QWORD PTR 8304[rsp], r15
	call	"__stack_chk_fail"@PLT
	.size	"evaluate", .-"evaluate"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	2146959360
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
