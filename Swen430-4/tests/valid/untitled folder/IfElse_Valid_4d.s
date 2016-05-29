
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label404
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	jmp label403
label404:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label406
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label402
	jmp label405
label406:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label402
label405:
label403:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label402
label402:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label408
	movq $1, %rax
	jmp label409
label408:
	movq $0, %rax
label409:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label410
	movq $1, %rax
	jmp label411
label410:
	movq $0, %rax
label411:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label412
	movq $1, %rax
	jmp label413
label412:
	movq $0, %rax
label413:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label414
	movq $1, %rax
	jmp label415
label414:
	movq $0, %rax
label415:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label416
	movq $1, %rax
	jmp label417
label416:
	movq $0, %rax
label417:
	movq %rax, %rdi
	call _assertion
label407:
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
