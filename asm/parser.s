	.file	"parser.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	"parse_expression"
	.type	"parse_expression", @function
"parse_expression":
	sub	rsp, 18616
	mov	QWORD PTR 18600[rsp], r14
	mov	QWORD PTR 18608[rsp], r15
	mov	r15, QWORD PTR fs:40
	mov	QWORD PTR 18552[rsp], r15
	mov	r15, rdi
	lea	rdi, 6224[rsp]
	call	"lexer"@PLT
	mov	eax, DWORD PTR "state"[rip+52]
	test	eax, eax
	jne	.L9
	mov	QWORD PTR 18592[rsp], r13
	mov	r13d, DWORD PTR 12368[rsp]
	mov	QWORD PTR 18576[rsp], rbp
	cmp	r13d, 2
	jg	.L116
	test	r13d, r13d
	jle	.L117
	mov	QWORD PTR 18568[rsp], rbx
	mov	QWORD PTR 18584[rsp], r12
.L59:
	xor	esi, esi
	xor	ebp, ebp
	mov	r8d, -1
.L6:
	mov	eax, ebp
	xor	edx, edx
	mov	r9d, 1
	xor	ebx, ebx
	lea	rax, [rax+rax*2]
	lea	r12, .L12[rip]
	mov	r11d, r8d
	mov	r10d, esi
	lea	rax, 6224[rsp+rax*8]
	lea	r14, 12384[rsp]
	.p2align 4
	.p2align 3
.L40:
	movdqu	xmm0, XMMWORD PTR [rax]
	mov	rcx, QWORD PTR 16[rax]
	mov	edi, DWORD PTR 8[rax]
	movzx	esi, BYTE PTR 16[rax]
	mov	QWORD PTR 64[rsp], rcx
	movaps	XMMWORD PTR 48[rsp], xmm0
	cmp	DWORD PTR [rax], 6
	ja	.L10
	mov	ecx, DWORD PTR [rax]
	movsxd	rcx, DWORD PTR [r12+rcx*4]
	add	rcx, r12
	jmp	rcx
	.section	.rodata
	.align 4
	.align 4
.L12:
	.long	.L18-.L12
	.long	.L17-.L12
	.long	.L16-.L12
	.long	.L15-.L12
	.long	.L14-.L12
	.long	.L13-.L12
	.long	.L102-.L12
	.text
	.p2align 4,,10
	.p2align 3
.L15:
	movsxd	rcx, ebx
	mov	BYTE PTR 64[rsp], sil
	mov	rsi, QWORD PTR 64[rsp]
	add	ebx, 1
	lea	rcx, [rcx+rcx*2]
	mov	DWORD PTR 56[rsp], edi
	mov	r9d, 1
	mov	DWORD PTR 48[rsp], 3
	movdqa	xmm0, XMMWORD PTR 48[rsp]
	mov	QWORD PTR 96[rsp+rcx*8], rsi
	movups	XMMWORD PTR 80[rsp+rcx*8], xmm0
	.p2align 4
	.p2align 3
.L10:
	add	ebp, 1
	add	rax, 24
	cmp	r13d, ebp
	jg	.L40
.L102:
	mov	r8d, r11d
	mov	esi, r10d
	test	ebx, ebx
	jle	.L118
	movsxd	r9, edx
	lea	edi, -1[rbx]
	lea	rax, [rdi+rdi*2]
	add	rdi, r9
	lea	rcx, 80[rsp+rax*8]
	lea	rdi, [rdi+rdi*2]
	lea	rax, [r9+r9*2]
	lea	r9, 12408[rsp+rdi*8]
	lea	rax, [r14+rax*8]
	.p2align 5
	.p2align 4
	.p2align 3
.L42:
	movdqu	xmm0, XMMWORD PTR [rcx]
	mov	rdi, QWORD PTR 16[rcx]
	add	rax, 24
	sub	rcx, 24
	movups	XMMWORD PTR -24[rax], xmm0
	mov	QWORD PTR -8[rax], rdi
	cmp	rax, r9
	jne	.L42
	add	edx, ebx
	mov	rbp, QWORD PTR 18576[rsp]
	mov	rbx, QWORD PTR 18568[rsp]
	mov	r12, QWORD PTR 18584[rsp]
	mov	r13, QWORD PTR 18592[rsp]
.L3:
	mov	DWORD PTR 18528[rsp], edx
	mov	rdi, r15
	mov	edx, 6160
	mov	DWORD PTR 18536[rsp], esi
	mov	rsi, r14
	mov	DWORD PTR 18540[rsp], r8d
	call	"memcpy"@PLT
	mov	rax, QWORD PTR 18552[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L119
	mov	rax, r15
	mov	r14, QWORD PTR 18600[rsp]
	mov	r15, QWORD PTR 18608[rsp]
	add	rsp, 18616
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	test	ebx, ebx
	jle	.L66
	lea	ecx, -1[rbx]
	movsxd	rsi, edx
	lea	rcx, [rcx+rcx*2]
	lea	rsi, [rsi+rsi*2]
	lea	rcx, 80[rsp+rcx*8]
	lea	rsi, [r14+rsi*8]
	jmp	.L19
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L39:
	movdqu	xmm0, XMMWORD PTR [rcx]
	mov	rdi, QWORD PTR 16[rcx]
	add	edx, 1
	sub	rcx, 24
	add	rsi, 24
	movups	XMMWORD PTR -24[rsi], xmm0
	mov	QWORD PTR -8[rsi], rdi
	sub	ebx, 1
	je	.L66
.L19:
	cmp	DWORD PTR [rcx], 3
	jne	.L39
.L66:
	mov	r9d, 1
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L14:
	test	ebx, ebx
	jle	.L112
	lea	ecx, -1[rbx]
	movsxd	rsi, edx
	mov	r9d, ebx
	lea	rcx, [rcx+rcx*2]
	lea	rsi, [rsi+rsi*2]
	lea	rcx, 80[rsp+rcx*8]
	lea	rsi, [r14+rsi*8]
	jmp	.L20
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L37:
	movdqu	xmm0, XMMWORD PTR [rcx]
	mov	rdi, QWORD PTR 16[rcx]
	add	edx, 1
	sub	rcx, 24
	add	rsi, 24
	movups	XMMWORD PTR -24[rsi], xmm0
	mov	QWORD PTR -8[rsi], rdi
	sub	r9d, 1
	je	.L64
.L20:
	cmp	DWORD PTR [rcx], 3
	jne	.L37
	mov	ebx, r9d
	sub	ebx, 1
	je	.L112
	lea	ecx, -2[r9]
	xor	r9d, r9d
	mov	rsi, rcx
	lea	rcx, [rcx+rcx*2]
	cmp	DWORD PTR 80[rsp+rcx*8], 1
	jne	.L10
	mov	r9d, DWORD PTR 88[rsp+rcx*8]
	test	r9d, r9d
	je	.L10
	movdqu	xmm0, XMMWORD PTR 80[rsp+rcx*8]
	movsxd	r8, edx
	mov	rcx, QWORD PTR 96[rsp+rcx*8]
	mov	ebx, esi
	lea	r8, [r8+r8*2]
	add	edx, 1
	xor	r9d, r9d
	mov	QWORD PTR 12400[rsp+r8*8], rcx
	movups	XMMWORD PTR 12384[rsp+r8*8], xmm0
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L17:
	mov	DWORD PTR 48[rsp], 1
	test	edi, edi
	je	.L21
	movsxd	rcx, ebx
	mov	DWORD PTR 56[rsp], edi
	movdqa	xmm0, XMMWORD PTR 48[rsp]
	add	ebx, 1
	mov	BYTE PTR 64[rsp], sil
	mov	rsi, QWORD PTR 64[rsp]
	lea	rcx, [rcx+rcx*2]
	xor	r9d, r9d
	movups	XMMWORD PTR 80[rsp+rcx*8], xmm0
	mov	QWORD PTR 96[rsp+rcx*8], rsi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L18:
	mov	DWORD PTR 48[rsp], 0
	mov	DWORD PTR 56[rsp], edi
.L111:
	movsxd	rcx, edx
	mov	BYTE PTR 64[rsp], sil
	mov	rsi, QWORD PTR 64[rsp]
	add	edx, 1
	lea	rcx, [rcx+rcx*2]
	movdqa	xmm0, XMMWORD PTR 48[rsp]
	mov	QWORD PTR 12400[rsp+rcx*8], rsi
	movups	XMMWORD PTR 12384[rsp+rcx*8], xmm0
.L112:
	xor	r9d, r9d
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L16:
	cmp	sil, 45
	jne	.L24
	and	r9d, 1
	je	.L24
	movsxd	rcx, ebx
	mov	r9d, 1
	add	ebx, 1
	lea	rcx, [rcx+rcx*2]
	mov	DWORD PTR 80[rsp+rcx*8], 2
	mov	QWORD PTR 84[rsp+rcx*8], 0
	mov	DWORD PTR 92[rsp+rcx*8], -1
	mov	BYTE PTR 96[rsp+rcx*8], 126
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L116:
	mov	QWORD PTR 18568[rsp], rbx
	mov	QWORD PTR 18584[rsp], r12
	cmp	DWORD PTR 6224[rsp], 1
	jne	.L59
	mov	ebp, DWORD PTR 6232[rsp]
	test	ebp, ebp
	jne	.L59
	cmp	DWORD PTR 6248[rsp], 2
	je	.L120
.L7:
	xor	esi, esi
	mov	r8d, -1
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L24:
	test	ebx, ebx
	jle	.L96
	lea	ecx, -1[rbx]
	mov	r9d, 1
	mov	DWORD PTR 28[rsp], edi
	lea	rcx, [rcx+rcx*2]
	sal	rcx, 3
	mov	QWORD PTR 8[rsp], rcx
	lea	r8, 80[rsp+rcx]
	movsxd	rcx, edx
	lea	rcx, [rcx+rcx*2]
	lea	rcx, [r14+rcx*8]
	mov	QWORD PTR [rsp], rcx
	mov	ecx, ebx
	lea	rcx, [rcx+rcx*2]
	mov	QWORD PTR 16[rsp], rcx
	mov	ecx, esi
	and	ecx, -33
	mov	BYTE PTR 43[rsp], cl
	lea	ecx, -37[rsi]
	sal	r9, cl
	mov	QWORD PTR 32[rsp], r9
.L36:
	mov	rdi, QWORD PTR 16[rsp]
	mov	rcx, r8
	sub	rcx, QWORD PTR 8[rsp]
	cmp	DWORD PTR -24[rcx+rdi*8], 2
	jne	.L105
	movzx	r9d, BYTE PTR 16[r8]
	cmp	sil, 94
	jg	.L26
	cmp	sil, 36
	jle	.L27
	mov	rdi, QWORD PTR 32[rsp]
	test	edi, 1057
	jne	.L28
	test	edi, 320
	jne	.L62
	mov	DWORD PTR 44[rsp], 4
	cmp	sil, 94
	jne	.L31
.L29:
	cmp	r9b, 94
	jg	.L51
	cmp	r9b, 36
	jle	.L105
	lea	ecx, -37[r9]
	mov	edi, 1
	sal	rdi, cl
	test	edi, 1057
	jne	.L53
	test	edi, 320
	jne	.L67
	cmp	r9b, 94
	jne	.L105
	cmp	DWORD PTR 44[rsp], 4
	jne	.L33
.L34:
	cmp	BYTE PTR 43[rsp], 94
	je	.L105
.L33:
	mov	rdi, QWORD PTR [rsp]
	movdqu	xmm0, XMMWORD PTR [r8]
	add	edx, 1
	sub	r8, 24
	mov	rcx, QWORD PTR 40[r8]
	movups	XMMWORD PTR [rdi], xmm0
	add	rdi, 24
	mov	QWORD PTR -8[rdi], rcx
	mov	QWORD PTR [rsp], rdi
	sub	ebx, 1
	jne	.L36
	mov	edi, DWORD PTR 28[rsp]
	xor	ecx, ecx
	mov	ebx, 1
	jmp	.L35
.L117:
	mov	rbp, QWORD PTR 18576[rsp]
	mov	r13, QWORD PTR 18592[rsp]
	.p2align 4
	.p2align 3
.L9:
	xor	edx, edx
	xor	esi, esi
	mov	r8d, -1
	lea	r14, 12384[rsp]
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L51:
	cmp	r9b, 126
	je	.L33
	.p2align 4
	.p2align 3
.L105:
	mov	edi, DWORD PTR 28[rsp]
.L96:
	movsxd	rcx, ebx
	add	ebx, 1
.L35:
	mov	DWORD PTR 56[rsp], edi
	lea	rcx, [rcx+rcx*2]
	mov	r9d, 1
	mov	DWORD PTR 48[rsp], 2
	movdqa	xmm0, XMMWORD PTR 48[rsp]
	mov	BYTE PTR 64[rsp], sil
	mov	rsi, QWORD PTR 64[rsp]
	movups	XMMWORD PTR 80[rsp+rcx*8], xmm0
	mov	QWORD PTR 96[rsp+rcx*8], rsi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L21:
	mov	DWORD PTR 56[rsp], 0
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L64:
	xor	ebx, ebx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L62:
	mov	DWORD PTR 44[rsp], 2
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L26:
	cmp	sil, 126
	jne	.L31
	mov	edi, DWORD PTR 28[rsp]
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L28:
	cmp	r9b, 94
	jg	.L51
	cmp	r9b, 36
	jle	.L105
	lea	ecx, -37[r9]
	mov	edi, 1
	sal	rdi, cl
	test	edi, 1057
	jne	.L34
	test	edi, 320
	jne	.L105
	mov	DWORD PTR 44[rsp], 3
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L31:
	cmp	r9b, 94
	jg	.L48
	cmp	r9b, 36
	jle	.L34
.L44:
	lea	ecx, -37[r9]
	mov	edi, 1
	sal	rdi, cl
	test	edi, 1057
	jne	.L33
	test	edi, 320
	jne	.L33
	mov	DWORD PTR 44[rsp], 0
.L49:
	xor	ecx, ecx
	bt	rdi, 57
	jc	.L33
.L50:
	cmp	ecx, DWORD PTR 44[rsp]
	je	.L34
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L120:
	cmp	BYTE PTR 6264[rsp], 61
	jne	.L7
	mov	r8d, DWORD PTR 6236[rsp]
	mov	esi, 1
	mov	ebp, 2
	jmp	.L6
.L48:
	cmp	r9b, 126
	je	.L33
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L67:
	mov	ecx, 2
	jmp	.L50
.L53:
	cmp	DWORD PTR 44[rsp], 2
	jle	.L33
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L27:
	cmp	r9b, 94
	jg	.L33
	cmp	r9b, 36
	jg	.L44
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L118:
	mov	rbx, QWORD PTR 18568[rsp]
	mov	rbp, QWORD PTR 18576[rsp]
	mov	r12, QWORD PTR 18584[rsp]
	mov	r13, QWORD PTR 18592[rsp]
	jmp	.L3
.L119:
	mov	QWORD PTR 18568[rsp], rbx
	mov	QWORD PTR 18576[rsp], rbp
	mov	QWORD PTR 18584[rsp], r12
	mov	QWORD PTR 18592[rsp], r13
	call	"__stack_chk_fail"@PLT
	.size	"parse_expression", .-"parse_expression"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
