
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label272:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label273
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label275
	jmp label273
	jmp label275
label275:
	movq -8(%rbp), %rax
	movq $2, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
label274:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label272
label273:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label271
label271:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label277
	movq $1, %rax
	jmp label278
label277:
	movq $0, %rax
label278:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label279
	movq $1, %rax
	jmp label280
label279:
	movq $0, %rax
label280:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label281
	movq $1, %rax
	jmp label282
label281:
	movq $0, %rax
label282:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label283
	movq $1, %rax
	jmp label284
label283:
	movq $0, %rax
label284:
	movq %rax, %rdi
	call _assertion
label276:
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
