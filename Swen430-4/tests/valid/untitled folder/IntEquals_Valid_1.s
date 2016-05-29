
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label464
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label462
	jmp label463
label464:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label462
label463:
label462:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label466
	movq $1, %rax
	jmp label467
label466:
	movq $0, %rax
label467:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label468
	movq $1, %rax
	jmp label469
label468:
	movq $0, %rax
label469:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label470
	movq $1, %rax
	jmp label471
label470:
	movq $0, %rax
label471:
	movq %rax, %rdi
	call _assertion
label465:
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
