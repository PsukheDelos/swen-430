
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label749
label747:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label745
	jmp label748
label749:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label751
label748:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label745
	jmp label750
label751:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label753
label750:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label745
	jmp label752
label753:
label746:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label745
label745:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label756
	movq $1, %rax
	jmp label757
label756:
	movq $0, %rax
label757:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label758
	movq $1, %rax
	jmp label759
label758:
	movq $0, %rax
label759:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label760
	movq $1, %rax
	jmp label761
label760:
	movq $0, %rax
label761:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label762
	movq $1, %rax
	jmp label763
label762:
	movq $0, %rax
label763:
	movq %rax, %rdi
	call _assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str4(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label764
	movq $1, %rax
	jmp label765
label764:
	movq $0, %rax
label765:
	movq %rax, %rdi
	call _assertion
label755:
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
	.asciz "ZERO"
str1:
	.asciz "ONE"
str2:
	.asciz "TWO"
str3:
	.asciz "SOMETHING"
str4:
	.asciz "THREE"
