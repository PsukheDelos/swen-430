
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label461:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label462
label462:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_id
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label464
	movq $1, %rax
	jmp label465
label464:
	movq $0, %rax
label465:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $-1, %rax
	movq %rax, 8(%rsp)
	call wl_id
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $-1, %rbx
	cmpq %rax, %rbx
	jnz label466
	movq $1, %rax
	jmp label467
label466:
	movq $0, %rax
label467:
	movq %rax, %rdi
	call _assertion
label463:
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
