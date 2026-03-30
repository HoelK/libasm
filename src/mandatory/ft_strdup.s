BITS 64
extern _malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy

section .text
global ft_strdup

ft_strdup:
			CALL ft_strlen
			INC rax
			CALL _malloc
			CMP rax, 0
			JL set_errno
			MOV rsi, rdi
			MOV rdi, rax
			CALL ft_strcpy

ret:
			RET

set_errno:
			MOV r8, rax
			CALL __errno_location
			MOV [rax], r8
			MOV rax, -1
			JMP ret
