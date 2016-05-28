
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
	jnz label313
	movq $1, %rax
	jmp label314
label313:
	movq $0, %rax
label314:
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
	jnz label315
	movq $1, %rax
	jmp label316
label315:
	movq $0, %rax
label316:
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
	jnz label317
	movq $1, %rax
	jmp label318
label317:
	movq $0, %rax
label318:
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
	jnz label319
	movq $1, %rax
	jmp label320
label319:
	movq $0, %rax
label320:
	movq %rax, %rdi
	call _assertion
label312:
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
