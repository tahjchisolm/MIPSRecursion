# Project 1

.data
	newline: .asciiz "\n"
	myMessage: .asciiz "Enter a 10 character string"
	buffer: .space 10
.text

main:
	li $v0, 4
	la $a0, myMessage
	syscall
	
	

