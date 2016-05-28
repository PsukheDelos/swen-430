
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	leaq str0(%rip), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label478
	addq $16, %rsp
	movq $1, %rax
	jmp label479
label478:
	movq $0, %rax
label479:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	leaq str1(%rip), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label482
	jmp label480
label482:
	addq $16, %rsp
	movq $1, %rax
	jmp label481
label480:
	movq $0, %rax
label481:
	movq %rax, %rdi
	call _assertion
label477:
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
	.asciz "Blah"
