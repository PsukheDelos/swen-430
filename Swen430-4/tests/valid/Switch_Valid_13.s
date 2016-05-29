
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label685
label683:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label689
label687:
	jmp label686
	jmp label688
label689:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label691
label688:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label681
	jmp label690
label691:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label693
label690:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label681
label693:
label686:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label681
	jmp label684
label685:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label696
label684:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label681
	jmp label695
label696:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label698
label695:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label681
label698:
label682:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label681
label681:
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
	leaq str2(%rip), %rax
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
	jnz label701
	movq $1, %rax
	jmp label702
label701:
	movq $0, %rax
label702:
	movq %rax, %rdi
	call _assertion
	leaq str0(%rip), %rax
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
	jnz label703
	movq $1, %rax
	jmp label704
label703:
	movq $0, %rax
label704:
	movq %rax, %rdi
	call _assertion
	leaq str1(%rip), %rax
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
	jnz label705
	movq $1, %rax
	jmp label706
label705:
	movq $0, %rax
label706:
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
	jnz label707
	movq $1, %rax
	jmp label708
label707:
	movq $0, %rax
label708:
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
	jnz label709
	movq $1, %rax
	jmp label710
label709:
	movq $0, %rax
label710:
	movq %rax, %rdi
	call _assertion
label700:
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
	.asciz "RED BLUE"
str1:
	.asciz "RED GREEN"
str2:
	.asciz "RED RED"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
