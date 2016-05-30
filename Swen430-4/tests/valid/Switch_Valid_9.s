
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label981
label979:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label977
	jmp label980
label981:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label983
label980:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label977
label983:
label978:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label977
label977:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label986
	movq $1, %rax
	jmp label987
label986:
	movq $0, %rax
label987:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label988
	movq $1, %rax
	jmp label989
label988:
	movq $0, %rax
label989:
	movq %rax, %rdi
	call _assertion
label985:
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
