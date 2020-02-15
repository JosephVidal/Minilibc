;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; strstr
;;

BITS 64

SECTION	.text

GLOBAL	strstr

strstr:	; char *strstr(const char *, const char *);
	push		rbp
	mov			rbp, rsp

	xor			r8, r8
	xor			r9, r9
	xor			r10, r10
	xor			rcx, rcx
	mov			r9, [rsi + r10]

loop_strstr:
	mov			r8, [rdi + rcx]
	cmp			r8, 0
	je			end_strstr_null
	cmp			r8, r9
	je			loop_cmp
	inc			rcx
	jmp 		loop_strstr

loop_cmp:
	cmp			r8, r9
	jne			loop_strstr
	cmp			r9, 0
	je			end_strstr
	inc			r10
	mov			r9, [rsi + r10]
	jmp			loop_cmp

end_strstr_null:
	xor			rax, rax

	mov			rsp, rbp
	pop			rbp
	ret

end_strstr:
	mov			rax, [rdi + rcx]

	mov			rsp, rbp
	pop			rbp
	ret