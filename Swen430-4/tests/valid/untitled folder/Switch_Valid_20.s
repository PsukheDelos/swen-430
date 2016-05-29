
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label823
label821:
	jmp label822
label823:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label825
label822:
	jmp label824
label825:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label827
label824:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label828
	jmp label820
	jmp label828
label828:
	jmp label826
label827:
label826:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
label830:
label820:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label819
label819:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label833
	movq $1, %rax
	jmp label834
label833:
	movq $0, %rax
label834:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label835
	movq $1, %rax
	jmp label836
label835:
	movq $0, %rax
label836:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label837
	movq $1, %rax
	jmp label838
label837:
	movq $0, %rax
label838:
	movq %rax, %rdi
	call _assertion
label832:
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
