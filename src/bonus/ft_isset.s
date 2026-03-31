BITS 64

section .text
global ft_isset

%define true 1
%define false 0

%define i rcx
%define c rdi
%define set rsi

ft_isset:
			XOR i, i

loop_set:
			MOV al, byte [set + i]
			CMP al, dil
			JE ret_true
			CMP al, 0
			JE ret_false
			INC i
			JMP loop_set

ret_true:
			MOV rax, true
			RET

ret_false:
			MOV rax, false
			RET
