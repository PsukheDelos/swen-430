
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
	movq %rax, 24(%rbp)
label543:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label544:
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
