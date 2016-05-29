
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label420
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label418
	jmp label419
label420:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jle label422
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label418
	jmp label421
label422:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label421:
label419:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label418
label418:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label424
	movq $1, %rax
	jmp label425
label424:
	movq $0, %rax
label425:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label426
	movq $1, %rax
	jmp label427
label426:
	movq $0, %rax
label427:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label428
	movq $1, %rax
	jmp label429
label428:
	movq $0, %rax
label429:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label430
	movq $1, %rax
	jmp label431
label430:
	movq $0, %rax
label431:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label432
	movq $1, %rax
	jmp label433
label432:
	movq $0, %rax
label433:
	movq %rax, %rdi
	call _assertion
label423:
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
