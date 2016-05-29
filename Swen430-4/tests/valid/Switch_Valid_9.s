
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label976
label974:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label972
	jmp label975
label976:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label978
label975:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label972
label978:
label973:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label972
label972:
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
	jnz label981
	movq $1, %rax
	jmp label982
label981:
	movq $0, %rax
label982:
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
	jnz label983
	movq $1, %rax
	jmp label984
label983:
	movq $0, %rax
label984:
	movq %rax, %rdi
	call _assertion
label980:
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
