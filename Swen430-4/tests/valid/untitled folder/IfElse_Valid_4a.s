
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label360
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label358
	jmp label359
label360:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label359:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label358
label358:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label362
	movq $1, %rax
	jmp label363
label362:
	movq $0, %rax
label363:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label364
	movq $1, %rax
	jmp label365
label364:
	movq $0, %rax
label365:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label366
	movq $1, %rax
	jmp label367
label366:
	movq $0, %rax
label367:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label368
	movq $1, %rax
	jmp label369
label368:
	movq $0, %rax
label369:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label370
	movq $1, %rax
	jmp label371
label370:
	movq $0, %rax
label371:
	movq %rax, %rdi
	call _assertion
label361:
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
