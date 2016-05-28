
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
	jnz label342
	movq $1, %rax
	jmp label343
label342:
	movq $0, %rax
label343:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $8, %rbx
	cmpq %rax, %rbx
	jnz label344
	movq $1, %rax
	jmp label345
label344:
	movq $0, %rax
label345:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	movq -8(%rbp), %rbx
	imulq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label346
	movq $1, %rax
	jmp label347
label346:
	movq $0, %rax
label347:
	movq %rax, %rdi
	call _assertion
	movq -8(%rbp), %rax
	negq %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $-6, %rbx
	cmpq %rax, %rbx
	jnz label348
	movq $1, %rax
	jmp label349
label348:
	movq $0, %rax
label349:
	movq %rax, %rdi
	call _assertion
label341:
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
