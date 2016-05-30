
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label964
label962:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label960
	jmp label963
label964:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label966
label963:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label960
	jmp label965
label966:
label965:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label960
label968:
label961:
label960:
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
	jnz label971
	movq $1, %rax
	jmp label972
label971:
	movq $0, %rax
label972:
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
	jnz label973
	movq $1, %rax
	jmp label974
label973:
	movq $0, %rax
label974:
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
	jnz label975
	movq $1, %rax
	jmp label976
label975:
	movq $0, %rax
label976:
	movq %rax, %rdi
	call _assertion
label970:
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
