
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label332
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label330
	jmp label331
label332:
	movq $2, %rax
	movq %rax, 16(%rbp)
	jmp label330
label331:
label330:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label334
	movq $1, %rax
	jmp label335
label334:
	movq $0, %rax
label335:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label336
	movq $1, %rax
	jmp label337
label336:
	movq $0, %rax
label337:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label338
	movq $1, %rax
	jmp label339
label338:
	movq $0, %rax
label339:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label340
	movq $1, %rax
	jmp label341
label340:
	movq $0, %rax
label341:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label342
	movq $1, %rax
	jmp label343
label342:
	movq $0, %rax
label343:
	movq %rax, %rdi
	call _assertion
label333:
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
