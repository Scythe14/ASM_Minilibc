[BITS 64]

global memcpy
	;; void *memcpy(void *dest, const void *src, size_t n);

memcpy:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	push rcx
	
memcpy_loop:
	cmp rdx, BYTE 0
	je memcpy_end
	mov cl, [rsi]
	mov [rdi], cl
	dec rdx
	inc rdi
	inc rsi
	jmp memcpy_loop

memcpy_end:
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rdi
	leave
	ret
