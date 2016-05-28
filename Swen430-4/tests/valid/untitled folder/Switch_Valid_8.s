
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label836
label834:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label832
	jmp label835
label836:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label838
label835:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label832
	jmp label837
label838:
label837:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label832
label840:
label833:
label832:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label843
	movq $1, %rax
	jmp label844
label843:
	movq $0, %rax
label844:
	movq %rax, %rdi
	call _assertion
	movq $234, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label845
	movq $1, %rax
	jmp label846
label845:
	movq $0, %rax
label846:
	movq %rax, %rdi
	call _assertion
	movq $456, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label847
	movq $1, %rax
	jmp label848
label847:
	movq $0, %rax
label848:
	movq %rax, %rdi
	call _assertion
label842:
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
