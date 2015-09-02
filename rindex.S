[BITS 64]

global rindex
	;; char *rindex(const char *s, int c)

rindex:
	push rbp
	mov rbp, rsp

	push rdi

	xor rax, rax

	cmp rdi, BYTE 0
	je rindex_end
	jmp rindex_loop

rindex_store:
	mov rax, rdi
	inc rdi

rindex_loop:
	cmp BYTE [rdi], BYTE 0
	je rindex_end

	cmp BYTE [rdi], sil
	je rindex_store

	inc rdi
	jmp rindex_loop

rindex_end:
	pop rdi
	leave
	ret
