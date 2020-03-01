;;
;; EPITECH PROJECT, 2019
;; minilibc
;; File description:
;; rindex
;;

BITS 64

GLOBAL rindex:function
SECTION .text

rindex:
    push    rbp
    mov     rbp, rsp

    xor		r8, r8

loop_rindex:    ;char *rindex(const char *, int);
    mov     r8b, [rdi + rcx]
    cmp     r8b, 0
    je      end_rindex
    cmp     r8b, rsi
    je      save_index
    inc     rcx
    jmp     loop_rindex

save_index:
    push    rcx
    inc     rcx
    jmp     loop_rindex

end_rindex:
    pop     rcx
    mov     rax, [rdi + rcx]
    mov     rsp, rbp
    pop     rbp
    ret