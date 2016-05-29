
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label766
label764:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label762
	jmp label765
label766:
label763:
	movq 24(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label762
label762:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label769
	movq $1, %rax
	jmp label770
label769:
	movq $0, %rax
label770:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label771
	movq $1, %rax
	jmp label772
label771:
	movq $0, %rax
label772:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label773
	movq $1, %rax
	jmp label774
label773:
	movq $0, %rax
label774:
	movq %rax, %rdi
	call _assertion
label768:
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
