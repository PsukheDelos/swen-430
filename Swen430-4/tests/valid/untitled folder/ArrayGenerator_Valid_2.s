
	.text
wl_abs:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
label62:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label63
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label65
	jmp label64
label65:
label64:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label62
label63:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label61
label61:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	movq $112, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $13, %rax
	movq %rax, 8(%rsp)
	call wl_abs
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label67
	movq $1, %rax
	jmp label68
label67:
	movq $0, %rax
label68:
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
	call wl_abs
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label69
	movq $1, %rax
	jmp label70
label69:
	movq $0, %rax
label70:
	movq %rax, %rdi
	call _assertion
label66:
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
