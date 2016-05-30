
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label690
label688:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label694
label692:
	jmp label691
	jmp label693
label694:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label696
label693:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label686
	jmp label695
label696:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label698
label695:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label686
label698:
label691:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label686
	jmp label689
label690:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label701
label689:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label686
	jmp label700
label701:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label703
label700:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label686
label703:
label687:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label686
label686:
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
	jnz label706
	movq $1, %rax
	jmp label707
label706:
	movq $0, %rax
label707:
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
	jnz label708
	movq $1, %rax
	jmp label709
label708:
	movq $0, %rax
label709:
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
	jnz label710
	movq $1, %rax
	jmp label711
label710:
	movq $0, %rax
label711:
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
	jnz label712
	movq $1, %rax
	jmp label713
label712:
	movq $0, %rax
label713:
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
	jnz label714
	movq $1, %rax
	jmp label715
label714:
	movq $0, %rax
label715:
	movq %rax, %rdi
	call _assertion
label705:
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
