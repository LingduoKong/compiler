	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_init_matrix
	.align	4, 0x90
_init_matrix:                           ## @init_matrix
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
Ltmp3:
	.cfi_offset %rbx, -40
Ltmp4:
	.cfi_offset %r14, -32
Ltmp5:
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	xorl	%ebx, %ebx
	leaq	_.memset_pattern(%rip), %r14
	.align	4, 0x90
LBB0_1:                                 ## %.preheader
                                        ## =>This Inner Loop Header: Depth=1
	leaq	(%r15,%rbx), %rdi
	movl	$88000, %edx            ## imm = 0x157C0
	movq	%r14, %rsi
	callq	_memset_pattern16
	addq	$88000, %rbx            ## imm = 0x157C0
	cmpq	$1936000000, %rbx       ## imm = 0x73650400
	jne	LBB0_1
## BB#2:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_dot_product
	.align	4, 0x90
_dot_product:                           ## @dot_product
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	movslq	%ecx, %rax
	movslq	%r8d, %r8
	imulq	$88000, %rax, %r9       ## imm = 0x157C0
	addq	%r9, %rdx
	leaq	(%rdx,%r8,4), %r10
	movl	(%rdx,%r8,4), %ecx
	addq	%r9, %rdi
	leaq	(%rsi,%r8,4), %rdx
	movl	$1, %esi
	.align	4, 0x90
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rdx), %eax
	imull	-4(%rdi,%rsi,4), %eax
	addl	%ecx, %eax
	movl	%eax, (%r10)
	movl	88000(%rdx), %ecx
	imull	(%rdi,%rsi,4), %ecx
	addl	%eax, %ecx
	movl	%ecx, (%r10)
	addq	$2, %rsi
	addq	$176000, %rdx           ## imm = 0x2AF80
	cmpq	$22001, %rsi            ## imm = 0x55F1
	jne	LBB1_1
## BB#2:
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI2_0:
	.long	4294967294              ## 0xfffffffe
	.long	4294967294              ## 0xfffffffe
	.long	4294967294              ## 0xfffffffe
	.long	4294967294              ## 0xfffffffe
	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI2_1:
	.long	1232348160              ## float 1.0E+6
LCPI2_2:
	.long	1148846080              ## float 1000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
Ltmp12:
	.cfi_offset %rbx, -56
Ltmp13:
	.cfi_offset %r12, -48
Ltmp14:
	.cfi_offset %r13, -40
Ltmp15:
	.cfi_offset %r14, -32
Ltmp16:
	.cfi_offset %r15, -24
	callq	_clock
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movl	$484000000, %edi        ## imm = 0x1CD94100
	movl	$4, %esi
	callq	_calloc
	movq	%rax, %r15
	movl	$484000000, %edi        ## imm = 0x1CD94100
	movl	$4, %esi
	callq	_calloc
	movq	%rax, %r13
	movl	$484000000, %edi        ## imm = 0x1CD94100
	movl	$4, %esi
	callq	_calloc
	movq	%rax, %r12
	xorl	%r14d, %r14d
	callq	_clock
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	leaq	_.memset_pattern(%rip), %rbx
	.align	4, 0x90
LBB2_1:                                 ## %.preheader.i
                                        ## =>This Inner Loop Header: Depth=1
	leaq	(%r15,%r14), %rdi
	movl	$88000, %edx            ## imm = 0x157C0
	movq	%rbx, %rsi
	callq	_memset_pattern16
	addq	$88000, %r14            ## imm = 0x157C0
	cmpq	$1936000000, %r14       ## imm = 0x73650400
	jne	LBB2_1
## BB#2:                                ## %init_matrix.exit
	xorl	%ebx, %ebx
	callq	_clock
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	leaq	_.memset_pattern(%rip), %r14
	.align	4, 0x90
LBB2_3:                                 ## %.preheader.i6
                                        ## =>This Inner Loop Header: Depth=1
	leaq	(%r13,%rbx), %rdi
	movl	$88000, %edx            ## imm = 0x157C0
	movq	%r14, %rsi
	callq	_memset_pattern16
	addq	$88000, %rbx            ## imm = 0x157C0
	cmpq	$1936000000, %rbx       ## imm = 0x73650400
	jne	LBB2_3
## BB#4:                                ## %init_matrix.exit7
	xorl	%ebx, %ebx
	callq	_clock
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	leaq	_.memset_pattern(%rip), %r14
	.align	4, 0x90
LBB2_5:                                 ## %.preheader.i13
                                        ## =>This Inner Loop Header: Depth=1
	leaq	(%r12,%rbx), %rdi
	movl	$88000, %edx            ## imm = 0x157C0
	movq	%r14, %rsi
	callq	_memset_pattern16
	addq	$88000, %rbx            ## imm = 0x157C0
	cmpq	$1936000000, %rbx       ## imm = 0x73650400
	jne	LBB2_5
## BB#6:                                ## %init_matrix.exit14
	callq	_clock
	movq	%rax, %r14
	movl	880040(%r12), %eax
	addq	$40, %r13
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	.align	4, 0x90
LBB2_7:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	movl	%edx, %esi
	movl	%eax, %edi
	movl	(%r13), %eax
	movl	88000(%r13), %edx
	imull	880000(%r15,%rcx,4), %eax
	imull	880004(%r15,%rcx,4), %edx
	addl	%edi, %eax
	addl	%esi, %edx
	addq	$2, %rcx
	addq	$176000, %r13           ## imm = 0x2AF80
	cmpq	$22000, %rcx            ## imm = 0x55F0
	jne	LBB2_7
## BB#8:                                ## %middle.block
	addl	%eax, %edx
	movl	%edx, 880040(%r12)
	callq	_clock
	movq	%rax, %r15
	addq	$48, %r12
	xorl	%eax, %eax
	movdqa	LCPI2_0(%rip), %xmm0    ## xmm0 = [4294967294,4294967294,4294967294,4294967294]
	xorl	%ebx, %ebx
	.align	4, 0x90
LBB2_9:                                 ## %overflow.checked35
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_10 Depth 2
	movd	%ebx, %xmm2
	pxor	%xmm1, %xmm1
	movl	$22000, %ecx            ## imm = 0x55F0
	movq	%r12, %rdx
	.align	4, 0x90
LBB2_10:                                ## %vector.body31
                                        ##   Parent Loop BB2_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqu	-48(%rdx), %xmm4
	movdqu	-32(%rdx), %xmm3
	movdqa	%xmm4, %xmm5
	psrld	$31, %xmm5
	paddd	%xmm4, %xmm5
	pand	%xmm0, %xmm5
	psubd	%xmm5, %xmm4
	paddd	%xmm2, %xmm4
	movdqu	-16(%rdx), %xmm2
	movdqa	%xmm3, %xmm5
	psrld	$31, %xmm5
	paddd	%xmm3, %xmm5
	pand	%xmm0, %xmm5
	psubd	%xmm5, %xmm3
	paddd	%xmm1, %xmm3
	movdqu	(%rdx), %xmm1
	movdqa	%xmm2, %xmm5
	psrld	$31, %xmm5
	paddd	%xmm2, %xmm5
	pand	%xmm0, %xmm5
	psubd	%xmm5, %xmm2
	movdqa	%xmm1, %xmm5
	psrld	$31, %xmm5
	paddd	%xmm1, %xmm5
	pand	%xmm0, %xmm5
	psubd	%xmm5, %xmm1
	paddd	%xmm4, %xmm2
	paddd	%xmm3, %xmm1
	addq	$64, %rdx
	addq	$-16, %rcx
	jne	LBB2_10
## BB#11:                               ## %middle.block32
                                        ##   in Loop: Header=BB2_9 Depth=1
	paddd	%xmm2, %xmm1
	pshufd	$78, %xmm1, %xmm2       ## xmm2 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm2
	phaddd	%xmm2, %xmm2
	movd	%xmm2, %ebx
	incq	%rax
	addq	$88000, %r12            ## imm = 0x157C0
	cmpq	$22000, %rax            ## imm = 0x55F0
	jne	LBB2_9
## BB#12:
	callq	_clock
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB2_13
## BB#14:
	cvtsi2ssq	%rdx, %xmm0
	jmp	LBB2_15
LBB2_13:
	movq	%rdx, %rcx
	shrq	%rcx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
LBB2_15:
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB2_16
## BB#17:
	xorps	%xmm2, %xmm2
	cvtsi2ssq	%rdx, %xmm2
	jmp	LBB2_18
LBB2_16:
	movq	%rdx, %rcx
	shrq	%rcx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm2
	addss	%xmm2, %xmm2
LBB2_18:
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB2_19
## BB#20:
	cvtsi2ssq	%rdx, %xmm5
	jmp	LBB2_21
LBB2_19:
	movq	%rdx, %rcx
	shrq	%rcx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm5
	addss	%xmm5, %xmm5
LBB2_21:
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB2_22
## BB#23:
	cvtsi2ssq	%rdx, %xmm4
	jmp	LBB2_24
LBB2_22:
	movq	%rdx, %rcx
	shrq	%rcx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm4
	addss	%xmm4, %xmm4
LBB2_24:
	movss	LCPI2_1(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm4, %xmm6
	subss	%xmm5, %xmm6
	subss	%xmm0, %xmm5
	subss	%xmm2, %xmm0
	testq	%r14, %r14
	js	LBB2_25
## BB#26:
	cvtsi2ssq	%r14, %xmm3
	jmp	LBB2_27
LBB2_25:
	movq	%r14, %rcx
	shrq	%rcx
	andq	$1, %r14
	orq	%rcx, %r14
	cvtsi2ssq	%r14, %xmm3
	addss	%xmm3, %xmm3
LBB2_27:
	divss	%xmm1, %xmm0
	movss	LCPI2_2(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm5
	divss	%xmm1, %xmm6
	movaps	%xmm3, %xmm7
	subss	%xmm4, %xmm7
	divss	%xmm1, %xmm7
	testq	%r15, %r15
	js	LBB2_28
## BB#29:
	cvtsi2ssq	%r15, %xmm4
	jmp	LBB2_30
LBB2_28:
	movq	%r15, %rcx
	shrq	%rcx
	andq	$1, %r15
	orq	%rcx, %r15
	cvtsi2ssq	%r15, %xmm4
	addss	%xmm4, %xmm4
LBB2_30:
	mulss	%xmm2, %xmm0
	mulss	%xmm2, %xmm5
	movss	%xmm5, -48(%rbp)        ## 4-byte Spill
	mulss	%xmm2, %xmm6
	movss	%xmm6, -56(%rbp)        ## 4-byte Spill
	mulss	%xmm2, %xmm7
	movss	%xmm7, -64(%rbp)        ## 4-byte Spill
	movaps	%xmm4, %xmm5
	subss	%xmm3, %xmm5
	divss	%xmm1, %xmm5
	mulss	%xmm2, %xmm5
	movss	%xmm5, -72(%rbp)        ## 4-byte Spill
	testq	%rax, %rax
	js	LBB2_31
## BB#32:
	cvtsi2ssq	%rax, %xmm3
	jmp	LBB2_33
LBB2_31:
	movq	%rax, %rcx
	shrq	%rcx
	andq	$1, %rax
	orq	%rcx, %rax
	cvtsi2ssq	%rax, %xmm3
	addss	%xmm3, %xmm3
LBB2_33:
	subss	%xmm4, %xmm3
	divss	%xmm1, %xmm3
	mulss	%xmm2, %xmm3
	movss	%xmm3, -76(%rbp)        ## 4-byte Spill
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str(%rip), %r14
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movss	-48(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movss	-56(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movss	-64(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movss	-72(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movss	-76(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r14, %rdi
	callq	_printf
	movl	%ebx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%f\n"

	.section	__TEXT,__const
	.align	4                       ## @.memset_pattern
_.memset_pattern:
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	1                       ## 0x1
	.long	1                       ## 0x1


.subsections_via_symbols
