
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $0, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	cmpq $0, %rax
	jz label189
	movq $1, %rax
	movq %rax, %rdi
	call _assertion
	jmp label188
label189:
	movq $0, %rax
	movq %rax, %rdi
	call _assertion
label188:
label187:
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
