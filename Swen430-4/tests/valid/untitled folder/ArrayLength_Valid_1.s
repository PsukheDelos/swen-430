
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label11:
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
