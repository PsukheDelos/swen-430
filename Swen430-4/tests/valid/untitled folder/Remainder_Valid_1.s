
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rdx, %rax
	movq %rax, 16(%rbp)
	jmp label419
label419:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $5, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label421
	movq $1, %rax
	jmp label422
label421:
	movq $0, %rax
label422:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label423
	movq $1, %rax
	jmp label424
label423:
	movq $0, %rax
label424:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label425
	movq $1, %rax
	jmp label426
label425:
	movq $0, %rax
label426:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	movq $103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label427
	movq $1, %rax
	jmp label428
label427:
	movq $0, %rax
label428:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $5, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label429
	movq $1, %rax
	jmp label430
label429:
	movq $0, %rax
label430:
	movq %rax, %rdi
	call _assertion
	movq $-2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label431
	movq $1, %rax
	jmp label432
label431:
	movq $0, %rax
label432:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $-1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label433
	movq $1, %rax
	jmp label434
label433:
	movq $0, %rax
label434:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	movq $-103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label435
	movq $1, %rax
	jmp label436
label435:
	movq $0, %rax
label436:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-5, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label437
	movq $1, %rax
	jmp label438
label437:
	movq $0, %rax
label438:
	movq %rax, %rdi
	call _assertion
	movq $-2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label439
	movq $1, %rax
	jmp label440
label439:
	movq $0, %rax
label440:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $-1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label441
	movq $1, %rax
	jmp label442
label441:
	movq $0, %rax
label442:
	movq %rax, %rdi
	call _assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-2, %rbx
	movq %rbx, 8(%rsp)
	movq $-103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label443
	movq $1, %rax
	jmp label444
label443:
	movq $0, %rax
label444:
	movq %rax, %rdi
	call _assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-5, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label445
	movq $1, %rax
	jmp label446
label445:
	movq $0, %rax
label446:
	movq %rax, %rdi
	call _assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label447
	movq $1, %rax
	jmp label448
label447:
	movq $0, %rax
label448:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label449
	movq $1, %rax
	jmp label450
label449:
	movq $0, %rax
label450:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-2, %rbx
	movq %rbx, 8(%rsp)
	movq $103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label451
	movq $1, %rax
	jmp label452
label451:
	movq $0, %rax
label452:
	movq %rax, %rdi
	call _assertion
label420:
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
