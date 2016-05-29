
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
	jnz label441
	movq $1, %rax
	jmp label442
label441:
	movq $0, %rax
label442:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $8, %rbx
	cmpq %rax, %rbx
	jnz label443
	movq $1, %rax
	jmp label444
label443:
	movq $0, %rax
label444:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq -8(%rbp), %rbx
	imulq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label445
	movq $1, %rax
	jmp label446
label445:
	movq $0, %rax
label446:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	negq %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $-6, %rbx
	cmpq %rax, %rbx
	jnz label447
	movq $1, %rax
	jmp label448
label447:
	movq $0, %rax
label448:
	movq %rax, %rdi
	call _assertion
label440:
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
