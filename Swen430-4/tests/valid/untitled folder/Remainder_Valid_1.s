
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
	jmp label549
label549:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label551
	movq $1, %rax
	jmp label552
label551:
	movq $0, %rax
label552:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label553
	movq $1, %rax
	jmp label554
label553:
	movq $0, %rax
label554:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label555
	movq $1, %rax
	jmp label556
label555:
	movq $0, %rax
label556:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label557
	movq $1, %rax
	jmp label558
label557:
	movq $0, %rax
label558:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label559
	movq $1, %rax
	jmp label560
label559:
	movq $0, %rax
label560:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label561
	movq $1, %rax
	jmp label562
label561:
	movq $0, %rax
label562:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label563
	movq $1, %rax
	jmp label564
label563:
	movq $0, %rax
label564:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label565
	movq $1, %rax
	jmp label566
label565:
	movq $0, %rax
label566:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label567
	movq $1, %rax
	jmp label568
label567:
	movq $0, %rax
label568:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label569
	movq $1, %rax
	jmp label570
label569:
	movq $0, %rax
label570:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label571
	movq $1, %rax
	jmp label572
label571:
	movq $0, %rax
label572:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label573
	movq $1, %rax
	jmp label574
label573:
	movq $0, %rax
label574:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label575
	movq $1, %rax
	jmp label576
label575:
	movq $0, %rax
label576:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label577
	movq $1, %rax
	jmp label578
label577:
	movq $0, %rax
label578:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label579
	movq $1, %rax
	jmp label580
label579:
	movq $0, %rax
label580:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label581
	movq $1, %rax
	jmp label582
label581:
	movq $0, %rax
label582:
	movq %rax, %rdi
	call _assertion
label550:
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
