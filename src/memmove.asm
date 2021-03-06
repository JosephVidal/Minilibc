;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; memmove
;;

BITS 64

GLOBAL	memmove:function
SECTION	.text


memmove:	; void *memmove(void *, const void *, size_t);
	push		rbp
	mov			rbp, rsp

	xor			rcx, rcx
	xor			r8b, r8b
	xor			r9b, r9b

loop_memmove:
	mov			r8b, [rdi + rcx]
	mov			r9b, [rsi + rcx]
	cmp			rcx, rdx
	je			end_memmove
	mov			[rdi + rcx], r9b
	cmp         rcx, rdx
    je          reset
    inc			rcx
	jmp			loop_memmove

reset:
    xor         rcx, rcx
    jmp         loop_memmove

end_memmove:
	mov			rax, rdi

	mov			rsp, rbp
	pop			rbp
	ret