
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, -16(%rbp)
	movq 32(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 24(%rbp)
	jmp label534
label534:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label536
	movq $1, %rax
	jmp label537
label536:
	movq $0, %rax
label537:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label538
	movq $1, %rax
	jmp label539
label538:
	movq $0, %rax
label539:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label540
	movq $1, %rax
	jmp label541
label540:
	movq $0, %rax
label541:
	movq %rax, %rdi
	call _assertion
label535:
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
