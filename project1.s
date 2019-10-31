# Project 1

.data
	newline: .asciiz "\n"
	myMessage: .asciiz "Enter a 10 character string"
	buffer: .space 10
.text

main:
	li $v0, 4
	la $a0, myMessage # print myMessage
	syscall
	
	li $v0, 8 # take in input
	la $a0, buffer # load byte space
	li $a1, 11 # create space for string
	move $t0, $a0 # save string to t0
	syscall

	li $v0, 4
	la $a0, newline # start new line
	syscall

	li $s7, 0 # set sum to 0

looping:

	lb $a0, 0($t0) # load each char
	beq $a0, exit # loop ends if char is null

	li $v0, 1 # print char val
	syscall

	blt $a0, 87, upper # uppercase
	bgt $a0, 96, lower # lowercase

	j sum

back:

	li $v0, 4
	la $a0, newline
	syscall
