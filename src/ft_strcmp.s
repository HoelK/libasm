BITS 64
.intel_syntax noprefix

section .text
global ft_strcmp

ft_strcmp:
			xor rcx, rcx
			load_data:
			mov r8, [rsi + rcx]
			mov r9, [rdi + rcx]
			loop: cmp 
			done:
