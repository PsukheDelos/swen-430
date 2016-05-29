
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label301
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label299
	jmp label300
label301:
	movq 24(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jle label303
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label299
	jmp label302
label303:
	leaq str2(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label299
label302:
label300:
label299:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label305
	movq $1, %rax
	jmp label306
label305:
	movq $0, %rax
label306:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label307
	movq $1, %rax
	jmp label308
label307:
	movq $0, %rax
label308:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label309
	movq $1, %rax
	jmp label310
label309:
	movq $0, %rax
label310:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
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
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label313
	movq $1, %rax
	jmp label314
label313:
	movq $0, %rax
label314:
	movq %rax, %rdi
	call _assertion
label304:
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
str0:
	.asciz "LESS THAN"
str1:
	.asciz "GREATER THAN"
str2:
	.asciz "EQUALS"
