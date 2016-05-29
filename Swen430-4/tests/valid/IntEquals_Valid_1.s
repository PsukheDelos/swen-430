
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label432
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label430
	jmp label431
label432:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label430
label431:
label430:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label434
	movq $1, %rax
	jmp label435
label434:
	movq $0, %rax
label435:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label436
	movq $1, %rax
	jmp label437
label436:
	movq $0, %rax
label437:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label438
	movq $1, %rax
	jmp label439
label438:
	movq $0, %rax
label439:
	movq %rax, %rdi
	call _assertion
label433:
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
str0:
	.asciz "EQUAL"
str1:
	.asciz "NOT EQUAL"
