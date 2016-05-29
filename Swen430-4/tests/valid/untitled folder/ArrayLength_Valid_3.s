
	.text
wl_len:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label19
label19:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -8(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_len
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label21
	movq $1, %rax
	jmp label22
label21:
	movq $0, %rax
label22:
	movq %rax, %rdi
	call _assertion
	movq $56, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, -8(%rbp)
	movq $6, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_len
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label23
	movq $1, %rax
	jmp label24
label23:
	movq $0, %rax
label24:
	movq %rax, %rdi
	call _assertion
label20:
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
