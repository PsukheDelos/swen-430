
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
	jnz label307
	movq $1, %rax
	jmp label308
label307:
	movq $0, %rax
label308:
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
	jnz label309
	movq $1, %rax
	jmp label310
label309:
	movq $0, %rax
label310:
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
	jnz label311
	movq $1, %rax
	jmp label312
label311:
	movq $0, %rax
label312:
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
	jnz label313
	movq $1, %rax
	jmp label314
label313:
	movq $0, %rax
label314:
	movq %rax, %rdi
	call _assertion
label306:
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
