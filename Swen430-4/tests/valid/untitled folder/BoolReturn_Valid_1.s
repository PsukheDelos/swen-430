
	.text
wl_pred:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label91
label91:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	call wl_pred
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label93
	movq $1, %rax
	jmp label94
label93:
	movq $0, %rax
label94:
	movq %rax, %rdi
	call _assertion
label92:
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
