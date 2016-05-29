
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label667
label665:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label671
label669:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label663
	jmp label670
label671:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label673
label670:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label663
	jmp label672
label673:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label675
label672:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label663
	jmp label674
label675:
label668:
	jmp label666
label667:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label678
label666:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label663
	jmp label677
label678:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label680
label677:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label663
	jmp label679
label680:
label664:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label663
label663:
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
	jnz label683
	movq $1, %rax
	jmp label684
label683:
	movq $0, %rax
label684:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label685
	movq $1, %rax
	jmp label686
label685:
	movq $0, %rax
label686:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label687
	movq $1, %rax
	jmp label688
label687:
	movq $0, %rax
label688:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label689
	movq $1, %rax
	jmp label690
label689:
	movq $0, %rax
label690:
	movq %rax, %rdi
	call _assertion
	movq $1, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label691
	movq $1, %rax
	jmp label692
label691:
	movq $0, %rax
label692:
	movq %rax, %rdi
	call _assertion
label682:
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
	.asciz "RED RED"
str1:
	.asciz "RED BLUE"
str2:
	.asciz "RED GREEN"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
