
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label255:
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label256
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label259
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label254
	jmp label258
label259:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label258:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label254
label257:
	movq -16(%rbp), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label255
label256:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label254
label254:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label261
	movq $1, %rax
	jmp label262
label261:
	movq $0, %rax
label262:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label263
	movq $1, %rax
	jmp label264
label263:
	movq $0, %rax
label264:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label265
	movq $1, %rax
	jmp label266
label265:
	movq $0, %rax
label266:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label267
	movq $1, %rax
	jmp label268
label267:
	movq $0, %rax
label268:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label269
	movq $1, %rax
	jmp label270
label269:
	movq $0, %rax
label270:
	movq %rax, %rdi
	call _assertion
label260:
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
