
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $2, %rbx
	cmpq %rbx, %rax
	jle label276
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label275
	jmp label276
label276:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label275
label275:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label278
	movq $1, %rax
	jmp label279
label278:
	movq $0, %rax
label279:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label280
	movq $1, %rax
	jmp label281
label280:
	movq $0, %rax
label281:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label282
	movq $1, %rax
	jmp label283
label282:
	movq $0, %rax
label283:
	movq %rax, %rdi
	call _assertion
label277:
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
