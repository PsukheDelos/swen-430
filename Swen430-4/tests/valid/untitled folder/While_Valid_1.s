
	.text
wl_reverse:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
	movq $0, %rax
	movq %rax, -24(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label1022:
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jle label1023
	movq -16(%rbp), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -24(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -24(%rbp)
	jmp label1022
label1023:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1021
label1021:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1025
	movq $1, %rax
	jmp label1026
label1025:
	movq $0, %rax
label1026:
	movq %rax, %rdi
	call _assertion
label1024:
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
