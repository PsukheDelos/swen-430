
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1004
	movq $1, %rax
	jmp label1005
label1004:
	movq $0, %rax
label1005:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1006
	movq $1, %rax
	jmp label1007
label1006:
	movq $0, %rax
label1007:
	movq %rax, %rdi
	call _assertion
label1003:
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
