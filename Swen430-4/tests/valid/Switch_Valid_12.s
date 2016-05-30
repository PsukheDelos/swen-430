
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label660
label658:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label664
label662:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label656
	jmp label663
label664:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label666
label663:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label656
	jmp label665
label666:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label668
label665:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label656
label668:
label661:
	jmp label659
label660:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label671
label659:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label656
	jmp label670
label671:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label673
label670:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label656
label673:
label657:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label656
label656:
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
	jnz label676
	movq $1, %rax
	jmp label677
label676:
	movq $0, %rax
label677:
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
	jnz label678
	movq $1, %rax
	jmp label679
label678:
	movq $0, %rax
label679:
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
	jnz label680
	movq $1, %rax
	jmp label681
label680:
	movq $0, %rax
label681:
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
	jnz label682
	movq $1, %rax
	jmp label683
label682:
	movq $0, %rax
label683:
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
	jnz label684
	movq $1, %rax
	jmp label685
label684:
	movq $0, %rax
label685:
	movq %rax, %rdi
	call _assertion
label675:
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
