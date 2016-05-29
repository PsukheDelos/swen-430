
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label977
label975:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label973
	jmp label976
label977:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label979
label976:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label973
	jmp label978
label979:
label978:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label973
label981:
label974:
label973:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label984
	movq $1, %rax
	jmp label985
label984:
	movq $0, %rax
label985:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
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
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label988
	movq $1, %rax
	jmp label989
label988:
	movq $0, %rax
label989:
	movq %rax, %rdi
	call _assertion
label983:
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
