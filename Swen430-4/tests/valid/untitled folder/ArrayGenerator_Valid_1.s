
	.text
wl_inc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
label52:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label55
	jmp label53
label55:
label54:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label52
label53:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label51
label51:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rax
	movq %rax, 8(%rsp)
	call wl_inc
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label57
	movq $1, %rax
	jmp label58
label57:
	movq $0, %rax
label58:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_inc
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label59
	movq $1, %rax
	jmp label60
label59:
	movq $0, %rax
label60:
	movq %rax, %rdi
	call _assertion
label56:
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
