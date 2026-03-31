BITS 64

section .text
global ft_isspace

%define true 1
%define false 0

ft_isspace:
			CMP dil, 9
			JL ret_false
			CMP dil, 13
			JL ret_true
			CMP dil, ' '
			JL ret_false
			CMP dil, ' '
			JG ret_false

ret_true:
			MOV rax, true
			RET
			
ret_false:
			MOV rax, false
			RET
