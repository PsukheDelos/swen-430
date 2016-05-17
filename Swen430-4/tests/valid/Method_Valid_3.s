
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label334:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label335
label335:
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
	jnz label337
	movq $1, %rax
	jmp label338
label337:
	movq $0, %rax
label338:
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
	jnz label339
	movq $1, %rax
	jmp label340
label339:
	movq $0, %rax
label340:
	movq %rax, %rdi
	call _assertion
label336:
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
