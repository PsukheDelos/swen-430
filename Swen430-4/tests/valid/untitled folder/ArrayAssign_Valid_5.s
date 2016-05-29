
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $24, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 16(%rbp)
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label16
label16:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label18
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label20
	movq $1, %rax
	jmp label21
label20:
	movq $0, %rax
label21:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label22
	movq $1, %rax
	jmp label23
label22:
	movq $0, %rax
label23:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label24
	movq $1, %rax
	jmp label25
label24:
	movq $0, %rax
label25:
	movq %rax, %rdi
	call _assertion
label17:
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
