
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $3, %rax
	movq %rax, -24(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label518
	movq $1, %rax
	jmp label519
label518:
	movq $0, %rax
label519:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label520
	movq $1, %rax
	jmp label521
label520:
	movq $0, %rax
label521:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label522
	movq $1, %rax
	jmp label523
label522:
	movq $0, %rax
label523:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label524
	movq $1, %rax
	jmp label525
label524:
	movq $0, %rax
label525:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label526
	movq $1, %rax
	jmp label527
label526:
	movq $0, %rax
label527:
	movq %rax, %rdi
	call _assertion
label517:
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
