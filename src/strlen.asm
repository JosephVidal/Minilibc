;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; strlen
;;

BITS 64

SECTION .text

GLOBAL	strlen

strlen:	; size_t strlen(char *);
	push	rbp
	mov		rbp, rsp

	xor		rcx, rcx
	xor		r8b, r8b

strlen_loop:
	mov		r8b, [rdi + rcx]
	cmp		byte r8b, 0
	jz		strlen_end
	inc		rcx
	jmp		strlen_loop

strlen_end:
	mov		rax, rcx

	mov		rsp, rbp
	pop		rbp
	ret
