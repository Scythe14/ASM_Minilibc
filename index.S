[BITS 64]

global index
	;; char *index(const char *s, int c)

index:
	push rbp
	mov rbp, rsp

	push rdx
 
	mov rax, rdi
	mov rdx, rsi

index_loop:
	cmp dl, BYTE [rax]
	je index_end

	cmp [rax], BYTE 0
	je index_null

	inc rax
	jmp index_loop

index_end:
	pop rdx
	leave
	ret

index_null:
	xor rax, rax
	pop rdx
	leave
	ret
