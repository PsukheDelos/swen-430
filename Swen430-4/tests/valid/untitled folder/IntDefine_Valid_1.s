
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $2, %rbx
	cmpq %rbx, %rax
	jle label435
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label434
	jmp label435
label435:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label434
label434:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label437
	movq $1, %rax
	jmp label438
label437:
	movq $0, %rax
label438:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label439
	movq $1, %rax
	jmp label440
label439:
	movq $0, %rax
label440:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label441
	movq $1, %rax
	jmp label442
label441:
	movq $0, %rax
label442:
	movq %rax, %rdi
	call _assertion
label436:
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
