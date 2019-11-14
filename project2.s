#Project 2

.data
	newline: .asciiz "\n"
	myMessage: .asciiz "Enter your string\n"
	buffer: .space 1000

.text

main:
	li $v0, 4
	la, $a0, myMessage # print Message
	syscall
