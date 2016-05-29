
	.text
wl_pred:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label190
label190:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	call wl_pred
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label192
	movq $1, %rax
	jmp label193
label192:
	movq $0, %rax
label193:
	movq %rax, %rdi
	call _assertion
label191:
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
