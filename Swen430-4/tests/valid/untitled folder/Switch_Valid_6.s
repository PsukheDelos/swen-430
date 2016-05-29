
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label927
label925:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label924
	jmp label926
label927:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label929
label926:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label924
	jmp label928
label929:
label928:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label931:
label924:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label923
label923:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label934
	movq $1, %rax
	jmp label935
label934:
	movq $0, %rax
label935:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label936
	movq $1, %rax
	jmp label937
label936:
	movq $0, %rax
label937:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label938
	movq $1, %rax
	jmp label939
label938:
	movq $0, %rax
label939:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label940
	movq $1, %rax
	jmp label941
label940:
	movq $0, %rax
label941:
	movq %rax, %rdi
	call _assertion
label933:
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
