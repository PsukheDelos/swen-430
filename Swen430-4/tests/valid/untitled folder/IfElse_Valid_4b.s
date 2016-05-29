
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label374
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	jmp label373
label374:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label372
label373:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label372
label372:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label376
	movq $1, %rax
	jmp label377
label376:
	movq $0, %rax
label377:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label378
	movq $1, %rax
	jmp label379
label378:
	movq $0, %rax
label379:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label380
	movq $1, %rax
	jmp label381
label380:
	movq $0, %rax
label381:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label382
	movq $1, %rax
	jmp label383
label382:
	movq $0, %rax
label383:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label384
	movq $1, %rax
	jmp label385
label384:
	movq $0, %rax
label385:
	movq %rax, %rdi
	call _assertion
label375:
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
