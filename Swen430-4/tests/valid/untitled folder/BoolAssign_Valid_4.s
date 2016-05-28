
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label48
	movq $0, %rax
	movq %rax, -8(%rbp)
	jmp label48
label48:
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label51
	jmp label50
label51:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label47
	jmp label49
label50:
	movq $123, %rax
	movq %rax, 16(%rbp)
	jmp label47
label49:
label47:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label53
	movq $1, %rax
	jmp label54
label53:
	movq $0, %rax
label54:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $11, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $11, %rbx
	cmpq %rax, %rbx
	jnz label55
	movq $1, %rax
	jmp label56
label55:
	movq $0, %rax
label56:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq $11, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label57
	movq $1, %rax
	jmp label58
label57:
	movq $0, %rax
label58:
	movq %rax, %rdi
	call _assertion
label52:
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
