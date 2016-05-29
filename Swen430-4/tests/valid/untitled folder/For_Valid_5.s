
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label286:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label287
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label289
	jmp label288
	jmp label289
label289:
	movq -8(%rbp), %rax
	movq $2, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
label288:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label286
label287:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label285
label285:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label291
	movq $1, %rax
	jmp label292
label291:
	movq $0, %rax
label292:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label293
	movq $1, %rax
	jmp label294
label293:
	movq $0, %rax
label294:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label295
	movq $1, %rax
	jmp label296
label295:
	movq $0, %rax
label296:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label297
	movq $1, %rax
	jmp label298
label297:
	movq $0, %rax
label298:
	movq %rax, %rdi
	call _assertion
label290:
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
