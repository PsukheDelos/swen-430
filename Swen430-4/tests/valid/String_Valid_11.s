
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str1(%rip), %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq -16(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label452
	jmp label450
label452:
	movq $1, %rax
	jmp label451
label450:
	movq $0, %rax
label451:
	movq %rax, %rdi
	call _assertion
label449:
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
	.asciz "Hello"
str1:
	.asciz "World"
