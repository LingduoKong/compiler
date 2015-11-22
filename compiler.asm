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
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	cmpl	$22000, -16(%rbp)       ## imm = 0x55F0
	jge	LBB0_8
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -20(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$22000, -20(%rbp)       ## imm = 0x55F0
	jge	LBB0_6
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=2
	movslq	-20(%rbp), %rax
	movslq	-16(%rbp), %rcx
	imulq	$88000, %rcx, %rcx      ## imm = 0x157C0
	addq	-8(%rbp), %rcx
	movl	$1, (%rcx,%rax,4)
## BB#5:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_7
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB0_1
LBB0_8:
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_dot_product
	.align	4, 0x90
_dot_product:                           ## @dot_product
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	-28(%rbp), %ecx
	movl	%ecx, -36(%rbp)
	movl	-32(%rbp), %ecx
	movl	%ecx, -40(%rbp)
	movl	$0, -44(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$22000, -44(%rbp)       ## imm = 0x55F0
	jge	LBB1_4
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movslq	-44(%rbp), %rax
	movslq	-36(%rbp), %rcx
	imulq	$88000, %rcx, %rcx      ## imm = 0x157C0
	addq	-8(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	movslq	-40(%rbp), %rax
	movslq	-44(%rbp), %rcx
	imulq	$88000, %rcx, %rcx      ## imm = 0x157C0
	addq	-16(%rbp), %rcx
	imull	(%rcx,%rax,4), %edx
	movslq	-40(%rbp), %rax
	movslq	-36(%rbp), %rcx
	imulq	$88000, %rcx, %rcx      ## imm = 0x157C0
	addq	-24(%rbp), %rcx
	addl	(%rcx,%rax,4), %edx
	movl	%edx, (%rcx,%rax,4)
## BB#3:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB1_1
LBB1_4:
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI2_0:
	.long	1148846080              ## float 1000
LCPI2_1:
	.long	1232348160              ## float 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
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
	subq	$304, %rsp              ## imm = 0x130
	movl	$0, -4(%rbp)
	callq	_clock
	movl	$484000000, %ecx        ## imm = 0x1CD94100
	movl	%ecx, %edi
	movl	$4, %ecx
	movl	%ecx, %esi
	movq	%rax, -16(%rbp)
	movl	$0, -80(%rbp)
	callq	_calloc
	movl	$484000000, %ecx        ## imm = 0x1CD94100
	movl	%ecx, %edi
	movl	$4, %ecx
	movl	%ecx, %esi
	movq	%rax, -88(%rbp)
	callq	_calloc
	movl	$484000000, %ecx        ## imm = 0x1CD94100
	movl	%ecx, %edi
	movl	$4, %ecx
	movl	%ecx, %esi
	movq	%rax, -96(%rbp)
	callq	_calloc
	movq	%rax, -104(%rbp)
	callq	_clock
	movl	$1, %esi
	movq	%rax, -24(%rbp)
	movq	-88(%rbp), %rdi
	callq	_init_matrix
	callq	_clock
	movl	$2, %esi
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rdi
	callq	_init_matrix
	callq	_clock
	xorl	%esi, %esi
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rdi
	callq	_init_matrix
	callq	_clock
	movl	$10, %ecx
	movq	%rax, -48(%rbp)
	movq	-88(%rbp), %rdi
	movq	-96(%rbp), %rsi
	movq	-104(%rbp), %rdx
	movl	%ecx, -132(%rbp)        ## 4-byte Spill
	movl	-132(%rbp), %r8d        ## 4-byte Reload
	callq	_dot_product
	callq	_clock
	movq	%rax, -56(%rbp)
	movl	$0, -68(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	cmpl	$22000, -68(%rbp)       ## imm = 0x55F0
	jge	LBB2_8
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	$0, -72(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$22000, -72(%rbp)       ## imm = 0x55F0
	jge	LBB2_6
## BB#4:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	$2, %eax
	movslq	-72(%rbp), %rcx
	movslq	-68(%rbp), %rdx
	imulq	$88000, %rdx, %rdx      ## imm = 0x157C0
	addq	-104(%rbp), %rdx
	movl	(%rdx,%rcx,4), %esi
	movl	%eax, -136(%rbp)        ## 4-byte Spill
	movl	%esi, %eax
	cltd
	movl	-136(%rbp), %esi        ## 4-byte Reload
	idivl	%esi
	addl	-80(%rbp), %edx
	movl	%edx, -80(%rbp)
## BB#5:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	LBB2_3
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_7
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB2_1
LBB2_8:
	leaq	L_.str(%rip), %rdi
	movss	LCPI2_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movss	LCPI2_1(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movq	%rdi, -144(%rbp)        ## 8-byte Spill
	movss	%xmm0, -148(%rbp)       ## 4-byte Spill
	movss	%xmm1, -152(%rbp)       ## 4-byte Spill
	callq	_clock
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	shrq	%rdi
	movq	%rax, %rcx
	andq	$1, %rcx
	orq	%rdi, %rcx
	cvtsi2ssq	%rcx, %xmm0
	addss	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm1
	testq	%rax, %rax
	movss	%xmm1, -156(%rbp)       ## 4-byte Spill
	movss	%xmm0, -160(%rbp)       ## 4-byte Spill
	js	LBB2_10
## BB#9:
	movss	-156(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -160(%rbp)       ## 4-byte Spill
LBB2_10:
	movss	-160(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -164(%rbp)       ## 4-byte Spill
	movss	%xmm2, -168(%rbp)       ## 4-byte Spill
	movss	%xmm1, -172(%rbp)       ## 4-byte Spill
	js	LBB2_12
## BB#11:
	movss	-168(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -172(%rbp)       ## 4-byte Spill
LBB2_12:
	movss	-172(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-164(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	LCPI2_1(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	LCPI2_0(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -108(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm3
	testq	%rax, %rax
	movss	%xmm0, -176(%rbp)       ## 4-byte Spill
	movss	%xmm2, -180(%rbp)       ## 4-byte Spill
	movss	%xmm3, -184(%rbp)       ## 4-byte Spill
	movss	%xmm1, -188(%rbp)       ## 4-byte Spill
	js	LBB2_14
## BB#13:
	movss	-184(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -188(%rbp)       ## 4-byte Spill
LBB2_14:
	movss	-188(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -192(%rbp)       ## 4-byte Spill
	movss	%xmm2, -196(%rbp)       ## 4-byte Spill
	movss	%xmm1, -200(%rbp)       ## 4-byte Spill
	js	LBB2_16
## BB#15:
	movss	-196(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -200(%rbp)       ## 4-byte Spill
LBB2_16:
	movss	-200(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-192(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	-176(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	-180(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -112(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm3
	testq	%rax, %rax
	movss	%xmm3, -204(%rbp)       ## 4-byte Spill
	movss	%xmm1, -208(%rbp)       ## 4-byte Spill
	js	LBB2_18
## BB#17:
	movss	-204(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -208(%rbp)       ## 4-byte Spill
LBB2_18:
	movss	-208(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -212(%rbp)       ## 4-byte Spill
	movss	%xmm2, -216(%rbp)       ## 4-byte Spill
	movss	%xmm1, -220(%rbp)       ## 4-byte Spill
	js	LBB2_20
## BB#19:
	movss	-216(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -220(%rbp)       ## 4-byte Spill
LBB2_20:
	movss	-220(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-212(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	-176(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	-180(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -116(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm3
	testq	%rax, %rax
	movss	%xmm3, -224(%rbp)       ## 4-byte Spill
	movss	%xmm1, -228(%rbp)       ## 4-byte Spill
	js	LBB2_22
## BB#21:
	movss	-224(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -228(%rbp)       ## 4-byte Spill
LBB2_22:
	movss	-228(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -232(%rbp)       ## 4-byte Spill
	movss	%xmm2, -236(%rbp)       ## 4-byte Spill
	movss	%xmm1, -240(%rbp)       ## 4-byte Spill
	js	LBB2_24
## BB#23:
	movss	-236(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -240(%rbp)       ## 4-byte Spill
LBB2_24:
	movss	-240(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-232(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	-176(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	-180(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -120(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm3
	testq	%rax, %rax
	movss	%xmm3, -244(%rbp)       ## 4-byte Spill
	movss	%xmm1, -248(%rbp)       ## 4-byte Spill
	js	LBB2_26
## BB#25:
	movss	-244(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -248(%rbp)       ## 4-byte Spill
LBB2_26:
	movss	-248(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -252(%rbp)       ## 4-byte Spill
	movss	%xmm2, -256(%rbp)       ## 4-byte Spill
	movss	%xmm1, -260(%rbp)       ## 4-byte Spill
	js	LBB2_28
## BB#27:
	movss	-256(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -260(%rbp)       ## 4-byte Spill
LBB2_28:
	movss	-260(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-252(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	-176(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	-180(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -124(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm3
	testq	%rax, %rax
	movss	%xmm3, -264(%rbp)       ## 4-byte Spill
	movss	%xmm1, -268(%rbp)       ## 4-byte Spill
	js	LBB2_30
## BB#29:
	movss	-264(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -268(%rbp)       ## 4-byte Spill
LBB2_30:
	movss	-268(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	shrq	%rcx
	movq	%rax, %rdx
	andq	$1, %rdx
	orq	%rcx, %rdx
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm2
	testq	%rax, %rax
	movss	%xmm0, -272(%rbp)       ## 4-byte Spill
	movss	%xmm2, -276(%rbp)       ## 4-byte Spill
	movss	%xmm1, -280(%rbp)       ## 4-byte Spill
	js	LBB2_32
## BB#31:
	movss	-276(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -280(%rbp)       ## 4-byte Spill
LBB2_32:
	movss	-280(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	movss	-272(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm1
	movss	-152(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	divss	%xmm0, %xmm1
	movss	-148(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm1
	movss	%xmm1, -128(%rbp)
	cvtss2sd	-108(%rbp), %xmm0
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	cvtss2sd	-112(%rbp), %xmm0
	movl	%eax, -284(%rbp)        ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	cvtss2sd	-116(%rbp), %xmm0
	movl	%eax, -288(%rbp)        ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	cvtss2sd	-120(%rbp), %xmm0
	movl	%eax, -292(%rbp)        ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	cvtss2sd	-124(%rbp), %xmm0
	movl	%eax, -296(%rbp)        ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	cvtss2sd	-128(%rbp), %xmm0
	movl	%eax, -300(%rbp)        ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	movl	-80(%rbp), %ecx
	movl	%eax, -304(%rbp)        ## 4-byte Spill
	movl	%ecx, %eax
	addq	$304, %rsp              ## imm = 0x130
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%f\n"


.subsections_via_symbols
