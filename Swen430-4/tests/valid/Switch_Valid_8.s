
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label959
label957:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label955
	jmp label958
label959:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label961
label958:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label955
	jmp label960
label961:
label960:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label955
label963:
label956:
label955:
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
	jnz label966
	movq $1, %rax
	jmp label967
label966:
	movq $0, %rax
label967:
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
	jnz label968
	movq $1, %rax
	jmp label969
label968:
	movq $0, %rax
label969:
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
	jnz label970
	movq $1, %rax
	jmp label971
label970:
	movq $0, %rax
label971:
	movq %rax, %rdi
	call _assertion
label965:
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
