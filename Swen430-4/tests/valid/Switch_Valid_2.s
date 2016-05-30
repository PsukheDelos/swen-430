
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label802
label800:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label798
	jmp label801
label802:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label804
label801:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label798
label804:
label799:
	movq $0, %rax
	movq %rax, %rdi
	call _assertion
label798:
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
