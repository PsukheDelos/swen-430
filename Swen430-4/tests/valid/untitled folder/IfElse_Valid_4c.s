
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label388
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label390
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	jmp label389
label390:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label386
label389:
	jmp label387
label388:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label386
label387:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label386
label386:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label392
	movq $1, %rax
	jmp label393
label392:
	movq $0, %rax
label393:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label394
	movq $1, %rax
	jmp label395
label394:
	movq $0, %rax
label395:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label396
	movq $1, %rax
	jmp label397
label396:
	movq $0, %rax
label397:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label398
	movq $1, %rax
	jmp label399
label398:
	movq $0, %rax
label399:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label400
	movq $1, %rax
	jmp label401
label400:
	movq $0, %rax
label401:
	movq %rax, %rdi
	call _assertion
label391:
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
