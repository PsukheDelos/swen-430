
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
	jnz label678
label676:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label674
	jmp label677
label678:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label680
label677:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call _assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label674
	jmp label679
label680:
label675:
	movq $0, %rax
	movq %rax, %rdi
	call _assertion
label674:
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
