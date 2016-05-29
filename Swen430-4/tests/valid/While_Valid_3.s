
	.text
wl_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label1020:
	movq -8(%rbp), %rax
	movq 24(%rbp), %rbx
	movq 0(%rbx), %rcx
	incq %rcx
	movq %rcx, %rdx
	imulq $8, %rdx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, %rdi
	call _malloc
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdx, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	movq %rdx, %rbx
	movq 0(%rbx), %rbx
	cmpq %rbx, %rax
	jge label1021
	movq -8(%rbp), %rax
	incq %rax
	movq 24(%rbp), %rbx
	movq 0(%rbx), %rcx
	incq %rcx
	movq %rcx, %rdx
	imulq $8, %rdx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, %rdi
	call _malloc
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdx, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	movq %rdx, %rbx
	movq (%rbx,%rax,8), %rcx
	movq %rcx, %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label1022
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1020
	jmp label1022
label1022:
	movq -16(%rbp), %rax
	movq -8(%rbp), %rbx
	incq %rbx
	movq 24(%rbp), %rcx
	movq 0(%rcx), %rdx
	incq %rdx
	movq %rdx, %rdi
	imulq $8, %rdi
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	call _malloc
	movq %rax, %rdi
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	subq $48, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdi, 32(%rsp)
	movq %rcx, %rsi
	call _intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	movq 32(%rsp), %rdi
	addq $48, %rsp
	movq %rdi, %rcx
	movq (%rcx,%rbx,8), %rdx
	movq %rdx, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1020
label1021:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1019
label1019:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 0(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1024
	movq $1, %rax
	jmp label1025
label1024:
	movq $0, %rax
label1025:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label1026
	movq $1, %rax
	jmp label1027
label1026:
	movq $0, %rax
label1027:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $48, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $-1, %rbx
	movq %rbx, 16(%rax)
	movq $2, %rbx
	movq %rbx, 24(%rax)
	movq $-2, %rbx
	movq %rbx, 32(%rax)
	movq $3, %rbx
	movq %rbx, 40(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label1028
	movq $1, %rax
	jmp label1029
label1028:
	movq $0, %rax
label1029:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $48, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 0(%rax)
	movq $123, %rbx
	movq %rbx, 8(%rax)
	movq $981, %rbx
	movq %rbx, 16(%rax)
	movq $1, %rbx
	movq %rbx, 24(%rax)
	movq $3, %rbx
	movq %rbx, 32(%rax)
	movq $0, %rbx
	movq %rbx, 40(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1108, %rbx
	cmpq %rax, %rbx
	jnz label1030
	movq $1, %rax
	jmp label1031
label1030:
	movq $0, %rax
label1031:
	movq %rax, %rdi
	call _assertion
	subq $16, %rsp
	movq $64, %rax
	movq %rax, %rdi
	call _malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $7, %rbx
	movq %rbx, 0(%rax)
	movq $123, %rbx
	movq %rbx, 8(%rax)
	movq $-1, %rbx
	movq %rbx, 16(%rax)
	movq $981, %rbx
	movq %rbx, 24(%rax)
	movq $1, %rbx
	movq %rbx, 32(%rax)
	movq $-1, %rbx
	movq %rbx, 40(%rax)
	movq $3, %rbx
	movq %rbx, 48(%rax)
	movq $0, %rbx
	movq %rbx, 56(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1108, %rbx
	cmpq %rax, %rbx
	jnz label1032
	movq $1, %rax
	jmp label1033
label1032:
	movq $0, %rax
label1033:
	movq %rax, %rdi
	call _assertion
label1023:
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
