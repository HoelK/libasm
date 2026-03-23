BITS 64
extern __errno_location

section .text
global ft_write

ft_write:
			MOV rax, 1
			SYSCALL
			CMP rax, 0
			JL set_errno

ret:
			ret

set_errno:
			MOV r8, rax
			CALL __errno_location
			MOV [rax], r8
			MOV rax, -1
			JMP ret
