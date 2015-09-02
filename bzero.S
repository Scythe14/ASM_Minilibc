[BITS 64]

global bzero
	;; void bzero(void *s, size_t n)

bzero:
	push rbp
	mov rbp, rsp

	push rdi
	push rdx

	cmp rdi, BYTE 0
	je bzero_end

bzero_loop:
	cmp rdx, BYTE 0
	je bzero_end

	mov [rdi], BYTE 0
	inc rdi
	dec rdx
	jmp bzero_loop

bzero_end:
	pop rdx
	pop rdi
	mov rax, rdi
	leave
	ret
