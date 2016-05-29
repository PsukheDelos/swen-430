
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label240:
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label241
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label239
label242:
	movq -16(%rbp), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label240
label241:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label239
label239:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label244
	movq $1, %rax
	jmp label245
label244:
	movq $0, %rax
label245:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label246
	movq $1, %rax
	jmp label247
label246:
	movq $0, %rax
label247:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label248
	movq $1, %rax
	jmp label249
label248:
	movq $0, %rax
label249:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label250
	movq $1, %rax
	jmp label251
label250:
	movq $0, %rax
label251:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label252
	movq $1, %rax
	jmp label253
label252:
	movq $0, %rax
label253:
	movq %rax, %rdi
	call _assertion
label243:
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
