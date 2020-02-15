;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; strcmp
;;

BITS 64

SECTION	.text

GLOBAL	strcmp

strcmp: ; int strcmp(char *, char *);
	push		rbp
	mov			rbp, rsp

	xor			r8, r8
	xor			r9, r9
	xor			rcx, rcx

loop_strcmp:
	mov			r8b, byte [rdi + rcx]
	mov			r9b, byte [rsi + rcx]
	cmp			r8b, 0
	je			end_strcmp
	cmp			r9b, 0
	je			end_strcmp
	cmp			r9b, r8b
	jne			end_strcmp
	inc			rcx
	jmp			loop_strcmp

great:
	mov			rax, 1

	mov			rsp, rbp
	pop			rbp
	ret

less:
	mov			rax, -1

	mov			rsp, rbp
	pop			rbp
	ret

end_strcmp:
	sub			r8b, r9b
	movsx		rax, r8b

	cmp			rax, 0
	jg			great
	cmp			rax, 0
	jl			less

	mov			rsp, rbp
	pop			rbp
	ret