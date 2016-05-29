
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label12
	movq $1, %rax
	jmp label13
label12:
	movq $0, %rax
label13:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label14
	movq $1, %rax
	jmp label15
label14:
	movq $0, %rax
label15:
	movq %rax, %rdi
	call _assertion
label11:
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
