
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label493:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label494
label494:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_test:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label496
	movq $1, %rax
	jmp label497
label496:
	movq $0, %rax
label497:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label498
	movq $1, %rax
	jmp label499
label498:
	movq $0, %rax
label499:
	movq %rax, %rdi
	call _assertion
label495:
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
