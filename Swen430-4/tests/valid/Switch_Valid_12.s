
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label655
label653:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label659
label657:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label651
	jmp label658
label659:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label661
label658:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label651
	jmp label660
label661:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label663
label660:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label651
label663:
label656:
	jmp label654
label655:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label666
label654:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label651
	jmp label665
label666:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label668
label665:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label651
label668:
label652:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label651
label651:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label671
	movq $1, %rax
	jmp label672
label671:
	movq $0, %rax
label672:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -16(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label673
	movq $1, %rax
	jmp label674
label673:
	movq $0, %rax
label674:
	movq %rax, %rdi
	call _assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -24(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label675
	movq $1, %rax
	jmp label676
label675:
	movq $0, %rax
label676:
	movq %rax, %rdi
	call _assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -16(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label677
	movq $1, %rax
	jmp label678
label677:
	movq $0, %rax
label678:
	movq %rax, %rdi
	call _assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -24(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label679
	movq $1, %rax
	jmp label680
label679:
	movq $0, %rax
label680:
	movq %rax, %rdi
	call _assertion
label670:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl _main
_main:
	pushq %rbp
	call wl_main
	popq %rbp
	movq $0, %rax
	ret

	.data
str0:
	.asciz "RED RED"
str1:
	.asciz "RED BLUE"
str2:
	.asciz "RED GREEN"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
