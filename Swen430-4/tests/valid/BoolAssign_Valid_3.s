
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label24
	movq $1, %rax
	jmp label25
label24:
	movq $0, %rax
label25:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label27
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label23
	jmp label26
label27:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label23
label26:
label23:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jl label29
	movq $1, %rax
	jmp label30
label29:
	movq $0, %rax
label30:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label33
	jmp label32
label33:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label28
	jmp label31
label32:
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label28
label31:
label28:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label35
	movq $1, %rax
	jmp label36
label35:
	movq $0, %rax
label36:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label37
	movq $1, %rax
	jmp label38
label37:
	movq $0, %rax
label38:
	movq %rax, %rdi
	call _assertion
	movq $349, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $345, %rbx
	movq %rbx, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label39
	movq $1, %rax
	jmp label40
label39:
	movq $0, %rax
label40:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label41
	movq $1, %rax
	jmp label42
label41:
	movq $0, %rax
label42:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label43
	movq $1, %rax
	jmp label44
label43:
	movq $0, %rax
label44:
	movq %rax, %rdi
	call _assertion
	movq $349, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $345, %rbx
	movq %rbx, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label45
	movq $1, %rax
	jmp label46
label45:
	movq $0, %rax
label46:
	movq %rax, %rdi
	call _assertion
label34:
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
