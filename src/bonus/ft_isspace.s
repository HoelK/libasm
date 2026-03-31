BITS 64

section .text
global ft_isspace

ft_isspace:
			MOV al, byte [rdi]
			CMP al, 9
			JL ret_false
			CMP al, 13
			JL ret_true
			CMP al, ' '
			JL ret_false
			CMP al, ' '
			JG ret_false

ret_true:
			MOV rax, 1
			RET
			
ret_false:
			MOV rax, 0
			RET
