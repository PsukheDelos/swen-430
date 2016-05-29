
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label317
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label315
	jmp label316
label317:
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jle label318
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label315
	jmp label318
label318:
label316:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label315
label315:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label320
	movq $1, %rax
	jmp label321
label320:
	movq $0, %rax
label321:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label322
	movq $1, %rax
	jmp label323
label322:
	movq $0, %rax
label323:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label324
	movq $1, %rax
	jmp label325
label324:
	movq $0, %rax
label325:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label326
	movq $1, %rax
	jmp label327
label326:
	movq $0, %rax
label327:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label328
	movq $1, %rax
	jmp label329
label328:
	movq $0, %rax
label329:
	movq %rax, %rdi
	call _assertion
label319:
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
