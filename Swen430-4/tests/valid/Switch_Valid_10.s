
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label466
	movq 24(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
label466:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label467
	movq 24(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label464
label467:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label464
label468:
label465:
label464:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
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
	jnz label470
	movq $1, %rax
	jmp label471
label470:
	movq $0, %rax
label471:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
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
	jnz label472
	movq $1, %rax
	jmp label473
label472:
	movq $0, %rax
label473:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
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
	jnz label474
	movq $1, %rax
	jmp label475
label474:
	movq $0, %rax
label475:
	movq %rax, %rdi
	call _assertion
label469:
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
