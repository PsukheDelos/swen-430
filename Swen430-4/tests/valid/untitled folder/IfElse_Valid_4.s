
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label346
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label344
	jmp label345
label346:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label345:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label344
label344:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label348
	movq $1, %rax
	jmp label349
label348:
	movq $0, %rax
label349:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label350
	movq $1, %rax
	jmp label351
label350:
	movq $0, %rax
label351:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label352
	movq $1, %rax
	jmp label353
label352:
	movq $0, %rax
label353:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label354
	movq $1, %rax
	jmp label355
label354:
	movq $0, %rax
label355:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label356
	movq $1, %rax
	jmp label357
label356:
	movq $0, %rax
label357:
	movq %rax, %rdi
	call _assertion
label347:
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
