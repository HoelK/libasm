BITS 64
extern _malloc
extern ft_strlen
extern ft_strcpy

section .text
global ft_strdup

ft_strdup:
			call ft_strlen
			inc rax
			call _malloc
			mov rsi, rdi
			mov rdi, rax
			call ft_strcpy
			ret
