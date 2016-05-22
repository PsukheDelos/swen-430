
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
	jnz label336
	movq $1, %rax
	jmp label337
label336:
	movq $0, %rax
label337:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $8, %rbx
	cmpq %rax, %rbx
	jnz label338
	movq $1, %rax
	jmp label339
label338:
	movq $0, %rax
label339:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq -8(%rbp), %rbx
	imulq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label340
	movq $1, %rax
	jmp label341
label340:
	movq $0, %rax
label341:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	negq %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $-6, %rbx
	cmpq %rax, %rbx
	jnz label342
	movq $1, %rax
	jmp label343
label342:
	movq $0, %rax
label343:
	movq %rax, %rdi
	call _assertion
label335:
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
