
	.text
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label357
label357:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label358
label358:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_g
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label360
	movq $1, %rax
	jmp label361
label360:
	movq $0, %rax
label361:
	movq %rax, %rdi
	call _assertion
label359:
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
