
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label115
	movq $1, %rax
	jmp label116
label115:
	movq $0, %rax
label116:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label117
	movq $1, %rax
	jmp label118
label117:
	movq $0, %rax
label118:
	movq %rax, %rdi
	call _assertion
label114:
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
