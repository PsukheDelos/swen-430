
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
	jnz label668
label666:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label664
	jmp label667
label668:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label670
label667:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label664
	jmp label669
label670:
label665:
	movq $0, %rax
	movq %rax, %rdi
	call _assertion
label664:
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
