[BITS 64]

global strchr
	;; char *strchr(const char *s, int c)

strchr:
	push rbp
	mov rbp, rsp

	push rdx
 
	mov rax, rdi
	mov rdx, rsi

strchr_loop:
	cmp dl, BYTE [rax]
	je strchr_end

	cmp [rax], BYTE 0
	je strchr_null

	inc rax
	jmp strchr_loop

strchr_null:
	xor rax, rax
	pop rdx
	leave
	ret

strchr_end:
	pop rdx
	leave
	ret
