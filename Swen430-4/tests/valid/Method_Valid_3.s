
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label356:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label357
label357:
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
	jnz label359
	movq $1, %rax
	jmp label360
label359:
	movq $0, %rax
label360:
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
	jnz label361
	movq $1, %rax
	jmp label362
label361:
	movq $0, %rax
label362:
	movq %rax, %rdi
	call _assertion
label358:
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
