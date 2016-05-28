
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label362:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label363
label363:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_test:
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
	jnz label365
	movq $1, %rax
	jmp label366
label365:
	movq $0, %rax
label366:
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
	jnz label367
	movq $1, %rax
	jmp label368
label367:
	movq $0, %rax
label368:
	movq %rax, %rdi
	call _assertion
label364:
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
