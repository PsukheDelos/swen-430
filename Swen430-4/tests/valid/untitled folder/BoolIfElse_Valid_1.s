
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	cmpq $0, %rax
	jz label61
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label59
	jmp label60
label61:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label59
label60:
label59:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label63
	movq $1, %rax
	jmp label64
label63:
	movq $0, %rax
label64:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label65
	movq $1, %rax
	jmp label66
label65:
	movq $0, %rax
label66:
	movq %rax, %rdi
	call _assertion
label62:
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
	.asciz "TRUE"
str1:
	.asciz "FALSE"
