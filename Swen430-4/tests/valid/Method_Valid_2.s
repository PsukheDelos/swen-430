
	.text
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label329
label329:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label330
label330:
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
	jnz label332
	movq $1, %rax
	jmp label333
label332:
	movq $0, %rax
label333:
	movq %rax, %rdi
	call _assertion
label331:
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
