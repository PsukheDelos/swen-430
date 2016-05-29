
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label444
	movq $1, %rax
	jmp label445
label444:
	movq $0, %rax
label445:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label446
	movq $1, %rax
	jmp label447
label446:
	movq $0, %rax
label447:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label448
	movq $1, %rax
	jmp label449
label448:
	movq $0, %rax
label449:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label450
	movq $1, %rax
	jmp label451
label450:
	movq $0, %rax
label451:
	movq %rax, %rdi
	call _assertion
label443:
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
