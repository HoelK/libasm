BITS 64
extern _malloc
extern ft_strlen
extern ft_strcpy

section .text
global ft_strdup

ft_strdup:
			CALL ft_strlen
			INC rax
			CALL _malloc
			MOV rsi, rdi
			MOV rdi, rax
			CALL ft_strcpy
			RET
