
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
	movq $2, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label285
	movq $1, %rax
	jmp label286
label285:
	movq $0, %rax
label286:
	movq %rax, %rdi
	call _assertion
	movq $10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label287
	movq $1, %rax
	jmp label288
label287:
	movq $0, %rax
label288:
	movq %rax, %rdi
	call _assertion
	movq $-10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label289
	movq $1, %rax
	jmp label290
label289:
	movq $0, %rax
label290:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $4, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label291
	movq $1, %rax
	jmp label292
label291:
	movq $0, %rax
label292:
	movq %rax, %rdi
	call _assertion
label284:
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
