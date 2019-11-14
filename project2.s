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

	li $v0, 8 # take in input
	la $a0, buffer # load byte space
	li $a1, 11 # create space for string
	move $t0, $a0 # save string to t0
	syscall

	li $v0, 4
	la $a0, newline # start new line
	syscall
