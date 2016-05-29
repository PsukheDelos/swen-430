
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
	movq $2, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label412
	movq $1, %rax
	jmp label413
label412:
	movq $0, %rax
label413:
	movq %rax, %rdi
	call _assertion
	movq $10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label414
	movq $1, %rax
	jmp label415
label414:
	movq $0, %rax
label415:
	movq %rax, %rdi
	call _assertion
	movq $-10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label416
	movq $1, %rax
	jmp label417
label416:
	movq $0, %rax
label417:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $4, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label418
	movq $1, %rax
	jmp label419
label418:
	movq $0, %rax
label419:
	movq %rax, %rdi
	call _assertion
label411:
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
