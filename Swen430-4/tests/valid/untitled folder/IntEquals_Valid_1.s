
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label333
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label331
	jmp label332
label333:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label331
label332:
label331:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label335
	movq $1, %rax
	jmp label336
label335:
	movq $0, %rax
label336:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label337
	movq $1, %rax
	jmp label338
label337:
	movq $0, %rax
label338:
	movq %rax, %rdi
	call _assertion
	subq $32, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label339
	movq $1, %rax
	jmp label340
label339:
	movq $0, %rax
label340:
	movq %rax, %rdi
	call _assertion
label334:
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
str0:
	.asciz "EQUAL"
str1:
	.asciz "NOT EQUAL"
