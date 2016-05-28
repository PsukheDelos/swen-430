
	.text
wl_f1:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label350
label350:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f2:
	pushq %rbp
	movq %rsp, %rbp
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label351
label351:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f2
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label353
	movq $1, %rax
	jmp label354
label353:
	movq $0, %rax
label354:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f1
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label355
	movq $1, %rax
	jmp label356
label355:
	movq $0, %rax
label356:
	movq %rax, %rdi
	call _assertion
label352:
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
