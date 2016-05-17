
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $2, %rax
	movq $3, %rbx
	imulq %rbx, %rax
	movq -8(%rbp), %rbx
	addq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label314
	movq $1, %rax
	jmp label315
label314:
	movq $0, %rax
label315:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $8, %rbx
	cmpq %rax, %rbx
	jnz label316
	movq $1, %rax
	jmp label317
label316:
	movq $0, %rax
label317:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq -8(%rbp), %rbx
	imulq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label318
	movq $1, %rax
	jmp label319
label318:
	movq $0, %rax
label319:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	negq %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $-6, %rbx
	cmpq %rax, %rbx
	jnz label320
	movq $1, %rax
	jmp label321
label320:
	movq $0, %rax
label321:
	movq %rax, %rdi
	call _assertion
label313:
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
