
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str1(%rip), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label576
	jmp label574
label576:
	movq $1, %rax
	jmp label575
label574:
	movq $0, %rax
label575:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label577
	movq $1, %rax
	jmp label578
label577:
	movq $0, %rax
label578:
	movq %rax, %rdi
	call _assertion
label573:
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
	.asciz "Hello World"
str1:
	.asciz "blah"
