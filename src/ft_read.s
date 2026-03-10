BITS 64
extern __errno_location

section .text
global ft_read

ft_read:
			mov rax, 0
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
