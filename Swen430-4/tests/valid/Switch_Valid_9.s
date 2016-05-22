
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label843
label841:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label839
	jmp label842
label843:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label845
label842:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label839
	jmp label844
label845:
label840:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label839
label839:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label848
	movq $1, %rax
	jmp label849
label848:
	movq $0, %rax
label849:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label850
	movq $1, %rax
	jmp label851
label850:
	movq $0, %rax
label851:
	movq %rax, %rdi
	call _assertion
label847:
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
