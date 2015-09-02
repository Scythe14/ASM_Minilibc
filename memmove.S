[BITS 64]

global memmove
	;; void *memmove(void *dest, const void *src, size_t n)

memmove:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi

	mov rcx, rdx

	cmp rdx, 0x0
	je memmove_end

	cmp rdi, rsi
	jl memmove_loop_begin

memmove_loop_end:
	mov dl, [rsi + rcx - 1]
	mov [rdi + rcx - 1], dl
	loop memmove_loop_end
	jmp memmove_end

memmove_loop_begin:
	mov dl, [rsi]
	mov [rdi], dl
	inc rsi
	inc rdi
	loop memmove_loop_begin

memmove_end:
	pop rsi
	pop rdi
	mov rax, rdi
	leave
	ret
