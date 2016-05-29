
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label697
label695:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label701
label699:
	jmp label698
	jmp label700
label701:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label703
label700:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label693
	jmp label702
label703:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label705
label702:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label693
	jmp label704
label705:
label698:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label693
	jmp label696
label697:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label708
label696:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label693
	jmp label707
label708:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label710
label707:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label693
	jmp label709
label710:
label694:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label693
label693:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label713
	movq $1, %rax
	jmp label714
label713:
	movq $0, %rax
label714:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label715
	movq $1, %rax
	jmp label716
label715:
	movq $0, %rax
label716:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label717
	movq $1, %rax
	jmp label718
label717:
	movq $0, %rax
label718:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label719
	movq $1, %rax
	jmp label720
label719:
	movq $0, %rax
label720:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label721
	movq $1, %rax
	jmp label722
label721:
	movq $0, %rax
label722:
	movq %rax, %rdi
	call _assertion
label712:
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
	.asciz "RED BLUE"
str1:
	.asciz "RED GREEN"
str2:
	.asciz "RED RED"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
