
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label853
label851:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label849
	jmp label852
label853:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label855
label852:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label849
	jmp label854
label855:
label850:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label849
label849:
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
	jnz label858
	movq $1, %rax
	jmp label859
label858:
	movq $0, %rax
label859:
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
	jnz label860
	movq $1, %rax
	jmp label861
label860:
	movq $0, %rax
label861:
	movq %rax, %rdi
	call _assertion
label857:
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
