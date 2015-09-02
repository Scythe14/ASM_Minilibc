[BITS 64]

global memset
	;; void *memset(void *s, int c, size_t n)

memset:
	push rbp
	mov rbp, rsp

	push rdi
	push rdx

	cmp rdi, BYTE 0
	je memset_end

memset_loop:
	cmp rdx, BYTE 0
	je memset_end
	mov [rdi], sil
	inc rdi
	dec rdx
	jmp memset_loop

memset_end:
	pop rdx
	pop rdi
	mov rax, rdi
	leave
	ret
