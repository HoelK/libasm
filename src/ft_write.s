BITS 64
extern __errno_location

section .text
global ft_write

ft_write:
			mov rax, 1
			syscall
			cmp rax, 0
			jl set_errno

ret:
			ret

set_errno:
			mov r8, rax
			call __errno_location
			mov [rax], r8
			mov rax, -1
			jmp ret
