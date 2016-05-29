
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label601
label601:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label603
	movq $1, %rax
	jmp label604
label603:
	movq $0, %rax
label604:
	movq %rax, %rdi
	call _assertion
label602:
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
