
	.text
wl_f1:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label481
label481:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f2:
	pushq %rbp
	movq %rsp, %rbp
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label482
label482:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label484
	movq $1, %rax
	jmp label485
label484:
	movq $0, %rax
label485:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label486
	movq $1, %rax
	jmp label487
label486:
	movq $0, %rax
label487:
	movq %rax, %rdi
	call _assertion
label483:
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
	.asciz "GOT BOOL"
str1:
	.asciz "GOT INT"
