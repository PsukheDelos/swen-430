
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label473
	movq $1, %rax
	jmp label474
label473:
	movq $0, %rax
label474:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label475
	movq $1, %rax
	jmp label476
label475:
	movq $0, %rax
label476:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label477
	movq $1, %rax
	jmp label478
label477:
	movq $0, %rax
label478:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label479
	movq $1, %rax
	jmp label480
label479:
	movq $0, %rax
label480:
	movq %rax, %rdi
	call _assertion
label472:
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
