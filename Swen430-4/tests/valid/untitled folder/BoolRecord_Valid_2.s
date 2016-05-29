
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
	movq 0(%rsp), %rax
	addq $16, %rsp
	cmpq $0, %rax
	jz label191
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label192
	movq $1, %rax
	jmp label193
label192:
	movq $0, %rax
label193:
	movq %rax, %rdi
	call _assertion
	jmp label190
label191:
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label194
	movq $1, %rax
	jmp label195
label194:
	movq $0, %rax
label195:
	movq %rax, %rdi
	call _assertion
label190:
label189:
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
