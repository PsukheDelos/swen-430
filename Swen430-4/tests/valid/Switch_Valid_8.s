
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label826
label824:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label822
	jmp label825
label826:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label828
label825:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label822
	jmp label827
label828:
label827:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label822
label830:
label823:
label822:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label833
	movq $1, %rax
	jmp label834
label833:
	movq $0, %rax
label834:
	movq %rax, %rdi
	call _assertion
	movq $234, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label835
	movq $1, %rax
	jmp label836
label835:
	movq $0, %rax
label836:
	movq %rax, %rdi
	call _assertion
	movq $456, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label837
	movq $1, %rax
	jmp label838
label837:
	movq $0, %rax
label838:
	movq %rax, %rdi
	call _assertion
label832:
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
