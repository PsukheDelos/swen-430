
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
	jnz label797
label795:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label793
	jmp label796
label797:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label799
label796:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label793
label799:
label794:
	movq $0, %rax
	movq %rax, %rdi
	call _assertion
label793:
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
