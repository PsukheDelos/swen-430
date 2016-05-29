
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label120
	movq -16(%rbp), %rax
	cmpq $0, %rax
	jz label120
	movq $1, %rax
	jmp label121
label120:
	movq $0, %rax
label121:
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label122
	movq $1, %rax
	jmp label123
label122:
	movq $0, %rax
label123:
	movq %rax, %rdi
	call _assertion
label119:
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
