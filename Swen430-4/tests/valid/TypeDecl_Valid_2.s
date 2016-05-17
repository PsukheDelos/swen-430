
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
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label646
	movq $1, %rax
	jmp label647
label646:
	movq $0, %rax
label647:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label648
	movq $1, %rax
	jmp label649
label648:
	movq $0, %rax
label649:
	movq %rax, %rdi
	call _assertion
label645:
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
